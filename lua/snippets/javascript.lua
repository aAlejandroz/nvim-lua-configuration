local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("infoLog", {
    t('global.brl.log("info", __filename, "", `'),
    i(1),
    t('`)')
  }),
  s("bic", {
    t('global.brl.inspc( '),
    i(1),
    t(')')
  }),
  s("infoVarLog", {
    t('global.brl.log("info", __filename, "", `${global.brl.inspc()}`'),
    i(1),
    t(')')
  }),
}
