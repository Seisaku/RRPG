require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmArma()
    local obj = GUI.fromHandle(_obj_newObject("form"));
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
    obj:setName("frmArma");
    obj:setHeight(20);
    obj:setMargins({top=2});

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj);
    obj.flowLayout1:setAlign("client");
    obj.flowLayout1:setName("flowLayout1");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.flowLayout1);
    obj.checkBox1:setWidth(20);
    obj.checkBox1:setField("equipado");
    obj.checkBox1:setName("checkBox1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowLayout1);
    obj.edit1:setWidth(150);
    obj.edit1:setHeight(20);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.flowLayout1);
    obj.checkBox2:setWidth(20);
    obj.checkBox2:setHeight(20);
    obj.checkBox2:setField("proficiente");
    obj.checkBox2:setName("checkBox2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowLayout1);
    obj.edit2:setWidth(30);
    obj.edit2:setHeight(20);
    obj.edit2:setField("bonus");
    obj.edit2:setType("number");
    obj.edit2:setMin(0);
    obj.edit2:setMax(999);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.flowLayout1);
    obj.button1:setWidth(60);
    obj.button1:setHeight(20);
    obj.button1:setText("Ataque");
    obj.button1:setMargins({left=2});
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.flowLayout1);
    obj.button2:setWidth(20);
    obj.button2:setHeight(20);
    obj.button2:setText("X");
    obj.button2:setMargins({left=2});
    obj.button2:setName("button2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'equipado','bonus','proficiente'});
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            ataqueComArma(sheet)
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            deleteEquip(sheet)
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateBonus(sheet);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmArma()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmArma();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmArma = {
    newEditor = newfrmArma, 
    new = newfrmArma, 
    name = "frmArma", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmArma = _frmArma;
Firecast.registrarForm(_frmArma);

return _frmArma;
