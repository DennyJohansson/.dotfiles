require("dempad.set")
require("dempad.remap")
-- needs to be after remap else leader will not be correct
require("dempad.plugins")
-- require("dempad.packer")

function R(name)
    require("plenary.reload").reload_module(name)
end
