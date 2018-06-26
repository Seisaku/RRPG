require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmNPC()
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
    obj:setName("frmNPC");
    obj:setHeight(20);
    obj:setMargins({top=2});

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj);
    obj.flowLayout1:setAlign("client");
    obj.flowLayout1:setName("flowLayout1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowLayout1);
    obj.edit1:setField("nome");
    obj.edit1:setHeight(20);
    obj.edit1:setWidth(30);
    obj.edit1:setType("number");
    obj.edit1:setMin(1);
    obj.edit1:setMax(20);
    obj.edit1:setTextPrompt("1");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowLayout1);
    obj.edit2:setField("avatar");
    obj.edit2:setHeight(20);
    obj.edit2:setWidth(30);
    obj.edit2:setType("number");
    obj.edit2:setMin(1);
    obj.edit2:setMax(20);
    obj.edit2:setTextPrompt("1");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowLayout1);
    obj.edit3:setField("atributos.ataque");
    obj.edit3:setHeight(20);
    obj.edit3:setWidth(30);
    obj.edit3:setType("number");
    obj.edit3:setMin(1);
    obj.edit3:setMax(20);
    obj.edit3:setTextPrompt("1");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowLayout1);
    obj.edit4:setField("atributos.defesa");
    obj.edit4:setHeight(20);
    obj.edit4:setWidth(30);
    obj.edit4:setType("number");
    obj.edit4:setMin(1);
    obj.edit4:setMax(20);
    obj.edit4:setTextPrompt("1");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowLayout1);
    obj.edit5:setField("atributos.agilidade");
    obj.edit5:setHeight(20);
    obj.edit5:setWidth(30);
    obj.edit5:setType("number");
    obj.edit5:setMin(1);
    obj.edit5:setMax(20);
    obj.edit5:setTextPrompt("1");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowLayout1);
    obj.edit6:setField("atributos.magia");
    obj.edit6:setHeight(20);
    obj.edit6:setWidth(30);
    obj.edit6:setType("number");
    obj.edit6:setMin(1);
    obj.edit6:setMax(20);
    obj.edit6:setTextPrompt("1");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowLayout1);
    obj.edit7:setField("atributos.sorte");
    obj.edit7:setHeight(20);
    obj.edit7:setWidth(30);
    obj.edit7:setType("number");
    obj.edit7:setMin(1);
    obj.edit7:setMax(20);
    obj.edit7:setTextPrompt("1");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowLayout1);
    obj.edit8:setField("atributos.resistenciaMagica");
    obj.edit8:setHeight(20);
    obj.edit8:setWidth(30);
    obj.edit8:setType("number");
    obj.edit8:setMin(1);
    obj.edit8:setMax(20);
    obj.edit8:setTextPrompt("1");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.flowLayout1);
    obj.edit9:setField("atributos.recurso");
    obj.edit9:setHeight(20);
    obj.edit9:setWidth(30);
    obj.edit9:setType("number");
    obj.edit9:setMin(1);
    obj.edit9:setMax(20);
    obj.edit9:setTextPrompt("1");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'equipado','bonus','proficiente'});
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            updateBonus(sheet);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmNPC = {
    newEditor = newfrmNPC, 
    new = newfrmNPC, 
    name = "frmNPC", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmNPC = _frmNPC;
rrpg.registrarForm(_frmNPC);

return _frmNPC;
