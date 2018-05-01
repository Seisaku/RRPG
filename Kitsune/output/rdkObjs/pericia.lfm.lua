require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmPericia()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setName("frmPericia");
    obj:setHeight(20);
    obj:setMargins({top=2});

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj);
    obj.flowLayout1:setAlign("client");
    obj.flowLayout1:setWidth(250);
    obj.flowLayout1:setName("flowLayout1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowLayout1);
    obj.edit1:setWidth(150);
    obj.edit1:setHeight(20);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowLayout1);
    obj.edit2:setWidth(30);
    obj.edit2:setHeight(20);
    obj.edit2:setField("valor");
    obj.edit2:setType("number");
    obj.edit2:setMin(0);
    obj.edit2:setMax(100);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setMargins({left=2});
    obj.edit2:setName("edit2");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.flowLayout1);
    obj.button1:setWidth(20);
    obj.button1:setHeight(20);
    obj.button1:setText("*");
    obj.button1:setMargins({left=2});
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.flowLayout1);
    obj.button2:setWidth(20);
    obj.button2:setHeight(20);
    obj.button2:setText("X");
    obj.button2:setMargins({left=2});
    obj.button2:setName("button2");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            rolarPericia2(sheet)
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            deletePericia(sheet)
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmPericia = {
    newEditor = newfrmPericia, 
    new = newfrmPericia, 
    name = "frmPericia", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmPericia = _frmPericia;
rrpg.registrarForm(_frmPericia);

return _frmPericia;
