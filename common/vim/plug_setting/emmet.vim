if empty(globpath(&rtp, 'autoload/emmet.vim'))
  finish
endif
let g:user_emmet_leader_key = '<C-y>'
let g:user_emmet_settings = {
\    'variables' : {
\        'lang' : 'ja',
\    },
\    'html' : {
\        'filters' : 'html',
\        'indentation' : ' ',
\        'expandos' : {
\            'ol': 'ol>li',
\            'list': 'ul>li*3',
\        },
\        'default_attributes': {
\            'a': {'href': ''},
\            'link': [{'rel': 'stylesheet'}, {'href': ''}],
\        },
\        'aliases': {
\            'bq': 'blockquote',
\            'obj': 'object',
\            'src': 'source',
\        },
\        'empty_elements': 'area,base,basefont,...,isindex,link,meta,...',
\        'block_elements': 'address,applet,blockquote,...,li,link,map,...',
\        'inline_elements': 'a,abbr,acronym,...',
\        'empty_element_suffix': ' />',
\    },
\    'perl' : {
\        'indentation' : '  ',
\        'aliases' : {
\            'req' : "require '|'"
\        },
\        'snippets' : {
\            'use' : "use strict\nuse warnings\n\n",
\            'w' : "warn \"${cursor}\";",
\        },
\    },
\    'php' : {
\        'extends' : 'html',
\        'filters' : 'html,c',
\    },
\    'css' : {
\        'filters' : 'fc',
\    },
\    'javascript' : {
\        'snippets' : {
\            'jq' : "\\$(function() {\n\t${cursor}${child}\n});",
\            'jq:each' : "\\$.each(arr, function(index, item)\n\t${child}\n});",
\            'fn' : "(function() {\n\t${cursor}\n})();",
\            'tm' : "setTimeout(function() {\n\t${cursor}\n}, 100);",
\        },
\    },
\    'java' : {
\        'indentation' : '    ',
\        'snippets' : {
\            'main': "public static void main(String[] args) {\n\t|\n}",
\            'println': "System.out.println(\"|\");",
\            'class': "public class | {\n}\n",
\        },
\    },
\}
