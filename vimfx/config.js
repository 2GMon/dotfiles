// vim: set tabstop=2 foldmethod=marker :
const {classes: Cc, interfaces: Ci, utils: Cu} = Components
const {require} = Cu.import("resource://devtools/shared/Loader.jsm", {});
// resource://devtools/shared/gcli/source/lib/gcli/index.js
const gcli = require('gcli/index');
console.log(gcli);

vimfx.set("prevent_autofocus", true);
vimfx.set("config_file_directory", "~/.vimfx");
vimfx.set("mode.normal.history_back", "<");
vimfx.set("mode.normal.history_forward", ">");
vimfx.set("mode.normal.history_list", "");
vimfx.set("mode.normal.scroll_half_page_down", "J <c-d>");
vimfx.set("mode.normal.scroll_half_page_up", "K <c-u>");
vimfx.set("mode.normal.tab_select_previous", "H gT");
vimfx.set("mode.normal.tab_select_next", "L gt");
vimfx.set("mode.normal.tab_close", "d");
vimfx.set("mode.normal.tab_restore", "u");

vimfx.addKeyOverrides(
  [ location => location.hostname === 'mail.google.com',
    [
      '!', '#', '*', '.', '/', ':', ';', '?',
      'A', 'F', 'I', 'N', 'R', 'U', '_',
      '[', ']', '{', '}',
      'a', 'b', 'c', 'd', 'e', 'g', 'i', 'j', 'k', 'l', 'm',
      'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'x', 'y', 'z'
    ]
  ],
  [ location => location.hostname === 'www.inoreader.com',
    [
      'g', 'a', 'j', 'k', 's', 'l', 'n', 'p', 'm', 'b', 'v', 'f', 'J', 'K', '.'
    ]
  ],
  [ location => location.hostname === 'kcw.kddi.ne.jp',
    [
      'j', 'k'
    ]
  ]
);

// custom command {{{
function add_quickmark(name, url, key) { // {{{
  vimfx.addCommand({
    name: 'goto_' + name,
    description: 'open ' + name,
  }, ({vim}) => {
    vim.window.gBrowser.loadURI(url)
  })
  vimfx.addCommand({
    name: 'goto_' + name + '_newtab',
    description: 'open ' + name + ' in new tab',
  }, ({vim}) => {
    vim.window.gBrowser.loadOneTab(url)
  })
  vimfx.set('custom.mode.normal.goto_' + name, 'go' + key)
  vimfx.set('custom.mode.normal.goto_' + name + '_newtab', 'gn' + key)
} // }}}
add_quickmark('inoreader', 'www.inoreader.com', 'r');
add_quickmark('instapaper', 'instapaper.com', 'i');
// }}}
