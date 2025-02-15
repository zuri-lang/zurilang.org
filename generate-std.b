import os
import ast
import json
import colors
import args

def error(message) {
  echo colors.text(message, colors.text_color.red)
  os.exit(1)
}

def success(message, final) {
  if final {
    echo colors.text(colors.text(message, colors.text_color.green), colors.style.bold)
  } else {
    echo colors.text(message, colors.text_color.green)
  }
}

def inform(message) {
  echo colors.text(message, colors.text_color.blue)
}

def warn(message) {
  echo colors.text(message, colors.text_color.orange)
}

def notify(message) {
  echo colors.text(message, colors.style.italic)
}

class ParsedFile {
  var classes = []
  var functions  = []
  var variables = []
  var doc = ''
}

class ParsedClass {
  var methods = []
  var properties = []
  var doc = ''
}

def cite(str, module) {
  var indenting = []
  var cite_root = '\n'.join(str.trim().split('/\n/', false).map(@(line) {
    var has_indent_level = line.trim().match('/^>{3,}/')
    var has_outdent_level = line.trim().match('/^<{3,}/')
    if has_indent_level {
      indenting.append(has_indent_level[0].length() - 2)
      return line.replace('/^${has_indent_level[0]}/', '') + '\n'
    } else if has_outdent_level {
      var outdent_level = has_outdent_level[0].length() - 2

      if indenting.length() > 0 and indenting.last() == outdent_level {
        indenting.pop()
      }

      return line.replace('/^${has_outdent_level[0]}/', '') + '\n'
    } else if indenting {
      return ('  ' * indenting.last()) + line
    }

    return line
  }))

  var local_refs = cite_root.matches('/(?<!(\\\\))\[\[(.*)\]\]/')
  if local_refs {
    for local_ref in local_refs[0] {
      var ref_name = local_ref[2,-2].trim()
      if ref_name.starts_with('${module}.') {
        var ref_value = ref_name[module.length() + 1,]
        cite_root = cite_root.replace(local_ref, '[${ref_value}](#${ref_name})', false)
      } else if(ref_name.starts_with('#')) {
        var ref_value = ref_name.split('.').last()
        if ref_value.ends_with('()') {
          ref_name = ref_name[,-2]
        }

        cite_root = cite_root.replace(local_ref, '[${ref_value}](#${ref_name})', false)
      } else {
        var ref_root = ref_name.split('.').first()
        cite_root = cite_root.replace(local_ref, '[${ref_name}](/standard/${ref_root}#${ref_name})', false)
      }
    }
  }
  
  # TODO: handle non-local reference processing here...

  return cite_root
}

var ident_level = 0

def get_class_docs(module, klass, depth) {
  var class_name = klass.name.replace("_", "\_")
  var result = "_class_ **${class_name}**"
  if klass.superclass and !klass.superclass.starts_with('_') {
    result += ' < _${klass.superclass.replace("_", "\_")}_'
  }

  var is_printable = klass.doc.match('/^@printable\s*$/m')
  var is_serializable = klass.doc.match('/^@serializable\s*$/m')
  var is_iterable = klass.doc.match('/^@iterable\s*$/m')
  var is_internal = klass.doc.match('/^@internal\s*$/m')

  # skip classes marked as internal in the documentation.
  if is_internal return ''

  var doc = klass.doc.replace('/^@(printable|serializable|internal|iterable|number).*\\n?/m', '').trim()

  
  result += ' {#${module}.${klass.name} .class}\n\n'
  if doc.trim() {
    result += prefix(depth) + ': '
    result += ident(cite(doc, module), depth) + '\n\n'
  }

  if is_printable or is_serializable or is_iterable {
    var tmp_result = []
    if is_printable tmp_result.append('__@printable__')
    if is_serializable tmp_result.append('__@serializable__')
    if is_iterable tmp_result.append('__@iterable__')
    result += prefix(depth + 2) + ', '.join(tmp_result) + '\n'
    result += prefix(depth + 2) + '{.class-props}\n\n'
  }

  if klass.properties {
    if klass.properties {
      for index, prop in klass.properties {
        if prop.doc {
          var doc_line = get_var_docs(module, '${module}.${class_name}', depth + 1, prop, prop.is_static, true)

          if doc {
            result += doc_line + '\n'
          } else if index == 0 {
            result += doc_line.trim() + '\n'
          } else {
            result += doc_line + '\n'
          }
        }
      }
      result += '\n'
    }
  }

  if klass.methods {
    for index, method in klass.methods {
      if method.doc {
        var doc_line = get_function_docs(module, '${module}.${class_name}', depth + 1, method, method.is_static, true)

        if doc {
          result += doc_line + '\n'
        } else if index == 0 and !klass.properties {
          result += doc_line.trim() + '\n'
        } else {
          result += doc_line + '\n'
        }
      }
    }
  }

  return result
}

def get_function_docs(module, root_name, depth, function, is_static, from_class) {

  var function_name = function.name.replace("_", "\_")
  var decl_line = (is_static ? (!from_class ? '_static_ ' : '_static_ .') : (from_class ? '.' : '_${root_name}_.')) + '${function_name}' + '(' + ', '.join(function.params.map(@(x){ return '_${x}_' })) + ')'
  
  var param_lines = function.doc.matches('/^@params?[ ]+(?P<type>[^ :\\n]+)([ ]+(?P<name>[^ :\\n]+)([ ]*(?P<description>[^\\n]*))?)?$/m')
  var return_line = function.doc.match('/^@returns?[ ]+(?P<type>.*?)$/m')
  var example_line = function.doc.match('/^@example[ ]+(?P<sample>.*)$/m')
  var note_lines = function.doc.matches('/^@note[ ]+(?P<note>.*)$/m')
  var throw_lines = function.doc.matches('/^@raises?[ ]+(?P<type>[^ ]+)[ ]+(?P<exception>.*)$/m')

  var is_constructor = function.doc.match('/^@constructor\s*$/m')
  var is_default = function.doc.match('/^@default\s*$/m')
  var is_internal = function.doc.match('/^@internal\s*$/m')
  var deprecated = function.doc.match('/^@deprecated?([ ]+(?P<info>.*?))?$/m')

  # skip functions marked as internal in the documentation.
  if is_internal return ''

  var doc = function.doc.replace('/^@(params?|returns?|example|note|constructor|default|internal|raises?|deprecated).*$/m', '').trim()
  
  var result = prefix(depth) + decl_line
  if is_constructor {
    result += ' &#x279D; _Constructor_'
  } else if is_default {
    result += ' &#x279D; _Exported_'
  }

  if !doc {
    if is_constructor {
      doc = '${root_name} constructor\n\n'
    } else if is_default {
      doc = '${root_name} default export function\n\n'
    }
  }

  result += ' {#${root_name}.${function.name}}\n\n'
  result += prefix(depth) + ': '
  if doc {
    result += ident(cite(doc, module), depth) + '\n\n'
  }

  if note_lines {
    result += (doc ? prefix(depth + 1) : '') + '> **@notes**:\n'
    result += prefix(depth + 1) + '> \n'
    iter var i = 0; i < note_lines[0].length(); i++ {
      result += prefix(depth + 1) + '> - ${ident(cite(note_lines.note[i], module), depth + 2)}\n'
    }
  }

  if deprecated {
    result += (doc or note_lines ? prefix(depth + 1) : '') + '- **@depreciated**: '
    if deprecated.info {
      result += cite(deprecated.info, module)
    } else {
      result += 'This function has been depreciated'
    }
    result += '\n'
  }

  if param_lines {
    result += (doc or note_lines or deprecated ? prefix(depth + 1) : '') + '- **@params**:\n'

    iter var i = 0; i < param_lines[0].length(); i++ {
      result += prefix(depth + 2) + '-'
      if param_lines.type[i] result += ' _${cite(param_lines.type[i], module)}_'
      if param_lines.name[i] result += ' **${param_lines.name[i]}**'
      if param_lines.description[i] result += ' ${ident(cite(param_lines.description[i], module), depth + 2)}'
      result += '\n'
    }

    result += '\n'
    result += prefix(depth + 1) + '{.params}'
    result += '\n'
  }

  if return_line {
    result += (doc or note_lines or deprecated or param_lines ?
        prefix(depth + 1) : '') + '- **@returns**: _${cite(return_line.type, module)}_\n'
    result += prefix(depth + 1) + '{.returns}'
    result += '\n'
  }

  if throw_lines {
    result += (doc or note_lines or deprecated or param_lines or return_line ?
      prefix(depth + 1) : '') + '- **@raises**:\n'

    iter var i = 0; i < throw_lines[0].length(); i++ {
      result += prefix(depth + 2) + '- ${cite(throw_lines.type[i], module)}\n'
    }
    result += prefix(depth + 1) + '{.raises}'
    result += '\n'
  }

  return result + '\n'
}

def get_var_docs(module, root_name, depth, var_data, is_static, from_class) {
  var doc = var_data.doc, type = '', readonly = false

  var is_internal = doc.match('/^@internal\s*$/m')

  # skip variables marked as internal in the documentation.
  if is_internal return ''

  var type_declared = doc.match('/^@type (\{?)(?P<type>[^ }\\n]+)\1/m')
  if type_declared {
    type = type_declared.type
    doc = (doc + '\n').replace('/^@type[^\\n]+\\n?/m', '\n').trim()
  }

  var readonly_declared = doc.match('/^@readonly/m')
  if readonly_declared {
    readonly = true
    doc = (doc + '\n').replace('/^@readonly[^\\n]*\\n?/m', '\n').trim()
  }

  doc = doc.replace('/^@(readonly|type|static|note).*$/', '').trim()

  var line = prefix(depth) + (is_static ? (from_class ? '_static_ .' : '_static_ ') : (!from_class ? '_${root_name}_.' : '')) + '**${from_class ? "." : ""}${var_data.name.replace("_", "\_")}**'
  if is_static or readonly or type 
    line += ' &#x279D;'
  if readonly line += ' _readonly_'
  if type line += ' _${cite(type, module)}_'

  line += '\n' + prefix(depth) + ': ' 
  line += ident(cite(doc, module), depth)

  return line
}

def prefix(depth) {
  return ('  ' * depth)
}

def ident(data, level) {
  return ('\n' + prefix(level + 1)).join(data.split('\n')) + '\n'
} 

def create_module_doc(sitemap, base_endpoint, module_name, docs) {

  var permalink = '${base_endpoint.rtrim("/")}/${module_name}'
  sitemap[base_endpoint]['children'].set(
    permalink, 
    {
      source: permalink,
      title: module_name,
    }
  )

  var module_description = docs.doc.replace('/^@module/m', '#').
      replace('/^([ ]*[*][ ]*)?@[a-z_][a-z0-9_]*.*$/m', '').trim()
  
  var content = '${module_description}\n\n'

  if docs.variables {
    content += '## Fields\n\n'
    content += '\n'.join(docs.variables.compact()) + '\n\n'
  }

  if docs.functions {
    content += '## Functions\n\n'
    content += '\n\n'.join(docs.functions.compact()) + '\n\n'
  }

  if docs.classes {
    content += '## Classes\n\n'
    content += '\n\n'.join(docs.classes.compact()) + '\n\n'
  }

  file(os.join_paths(
    os.dir_name(__file__), 'src', 'standard', '${module_name}.md'
  ), 'w').write(content)
}

def process_line(source) {
  notify('Processing ${source}')
}

def get_docs(module, parse_list) {
  var result = ParsedFile()

  for i, parse_item in parse_list {
    # we are only interested in declarations
    if instance_of(parse_item, ast.DocDefn) and parse_item.file and
      (parse_item.file.ends_with('/index.b') or parse_item.file.ends_with('/${module}.b')) and 
      !result.doc {
      result.doc = parse_item.data
    } else if instance_of(parse_item, ast.Decl) {

      if parse_item.doc {
        if instance_of(parse_item, ast.VarDecl) {
          if !parse_item.name.starts_with('_') and parse_item.doc
            result.variables.append(get_var_docs(module, module, 0, parse_item))
        } else if instance_of(parse_item, ast.FunctionDecl) {
          if !parse_item.name.starts_with('_') and !parse_item.name.starts_with('@') and parse_item.doc
            result.functions.append(get_function_docs(module, module, 0, parse_item))
        } else if instance_of(parse_item, ast.ClassDecl) { 
          if !parse_item.name.starts_with('_') and parse_item.doc
            result.classes.append(get_class_docs(module, parse_item, 0))
        }
      }
    }
  }

  return result
}

def run(root_dir, submodule, max_nesting) {
  if !max_nesting max_nesting = -1

  if !root_dir {
    error('Please specify source path')
  } else if !os.dir_exists(root_dir) {
    error('Source path not found')
  } else {

    var base_endpoint = '/standard'

    var sitemap_file = os.join_paths(os.dir_name(__file__), '_data', 'sitemap.json')
    var sitemap = json.decode(file(sitemap_file).read())

    var index_file = os.join_paths(os.dir_name(__file__), 'src', 'standard', 'index.md')
    var index_file_content = '# Standard Library\n\n'+
      'This section contains the documentation for the '+
      'Blade standard library.'

    if !sitemap.contains(base_endpoint) {
      sitemap[base_endpoint] = {
        source: 'standard/index',
        title: 'Standard Library',
        children: {}
      }
    }

    if !file(index_file).exists() {
      file(index_file, 'w').write(index_file_content)
    }
  
    inform('Backing up the sitemap to `${sitemap_file}.backup`...')
    file(sitemap_file).copy(sitemap_file + '.backup')
    success('Successfully backed up sitemap file!')
  
    var sources = os.read_dir(root_dir)
    sources.sort()
  
    if submodule {
      inform('Started generating Blade standard library documentation for module ${submodule}...')
    } else {
      inform('Started generating Blade standard library documentation...')
    }
  
    iter var i = 0; i < sources.length(); i++ {
      var source = sources[i], module_name = source.replace('/\\.b/', '')
  
      # ignore the other modules if single module is selected.
      if submodule and !source.starts_with(submodule)
        continue

      # skip drafts
      if module_name.ends_with('.draft')
        continue
  
      var working_source = '${root_dir.rtrim("/")}/${source}'
  
      if source.ends_with('.b') and !source.starts_with('_') { # it's a file
        process_line(working_source)
  
        var parse_list = ast.parse(file(working_source).read(), working_source)
        create_module_doc(sitemap, base_endpoint, module_name, get_docs(module_name, parse_list))
      } else {  
        # it's a directory
        if !source.starts_with('.') and !source.starts_with('_') {
          process_line(working_source)
  
          var parsed = []
  
          var nested_times = 1
          def process_depth(depth_root) {
            if os.dir_exists(depth_root) {
              for f in os.read_dir(depth_root) {
                if !f.starts_with('.') and !f.starts_with('_') {
                  var ff = '${depth_root.rtrim("/")}/${f}'
                  
                  if !os.is_dir(ff) and ff.ends_with('.b') {
                    process_line(ff)
                    parsed.append(ast.parse(file(ff).read(), ff))
                  } else if os.is_dir(ff) and (nested_times < max_nesting or max_nesting == -1) {
                    nested_times++
                    process_depth(ff)
                  }
                } 
              }
            }
          }
  
          # begin processing depth.
          process_depth(working_source)
  
          var parse_list = []
  
          for p in parsed {
            for j in p {
              parse_list.append(j)
            }
          }
  
          create_module_doc(sitemap, base_endpoint, module_name, get_docs(module_name, parse_list))
        }
      }
    }
  
    file(sitemap_file, 'w').write(json.encode(sitemap, false))
  
    echo success('- Successfully generated Blade standard library documentation!', true)
  }
}


var parser = args.Parser('generate-std.b')
parser.add_option('root', 'The root to your Blade installation.', {
  short_name: 'r',
  type: args.STRING,
  value: '',
})
parser.add_option('module', 'A specific module to generate documentation for.', {
  short_name: 'm',
  type: args.STRING,
  value: '',
})
parser.add_option('nesting', 'Maximum nesting level', {
  short_name: 'n',
  type: args.NUMBER,
  value: 1,
})
var parsed = parser.parse()

if parsed.options.root {
  run(parsed.options.root.rtrim('/') + '/libs', parsed.options.module, parsed.options.nesting)
} else {
  parser.help()
}
