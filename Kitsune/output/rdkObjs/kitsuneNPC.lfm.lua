require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newKitsuneNPC()
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
    obj:setFormType("sheetTemplate");
    obj:setDataType("br.com.sigma.kitsune.fichaNPC");
    obj:setTitle("Kitsune's System: NPC");
    obj:setName("KitsuneNPC");

    obj.templates = gui.fromHandle(_obj_newObject("form"));
    obj.templates:setParent(obj);
    obj.templates:setName("templates");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setWidth(20);
    obj.button1:setHeight(20);
    obj.button1:setText("+");
    obj.button1:setName("button1");

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj);
    obj.flowLayout1:setAlign("client");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(2);
    obj.flowLayout1:setName("flowLayout1");

    obj.rclNPC = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclNPC:setParent(obj.flowLayout1);
    obj.rclNPC:setWidth(320);
    obj.rclNPC:setAutoHeight(true);
    obj.rclNPC:setName("rclNPC");
    obj.rclNPC:setField("npcs");
    obj.rclNPC:setTemplateForm("frmNPC");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'nivel', 'experienciaAtual','desejo'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'atributos.ataque', 'atributos.ataqueMod'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setFields({'atributos.defesa', 'atributos.defesaMod'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setFields({'atributos.magia', 'atributos.magiaMod'});
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setFields({'atributos.resistenciaMagica', 'atributos.resistenciaMagicaMod'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setField("atributos.sorte");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setFields({'atributos.agilidade', 'atributos.agilidadeMod'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj);
    obj.dataLink8:setField("atributos.vida");
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj);
    obj.dataLink9:setField("atributos.recurso");
    obj.dataLink9:setName("dataLink9");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclNPC:append();
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            updateBase(sheet);
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            updateAtaque(sheet);
        end, obj);

    obj._e_event3 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            updateDefesa(sheet);
        end, obj);

    obj._e_event4 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            updateMagia(sheet);
        end, obj);

    obj._e_event5 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            updateResistenciaMagica(sheet);
        end, obj);

    obj._e_event6 = obj.dataLink6:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            updateSorte(sheet);
        end, obj);

    obj._e_event7 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            updateAgilidade(sheet);
        end, obj);

    obj._e_event8 = obj.dataLink8:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            updateVida(sheet);
        end, obj);

    obj._e_event9 = obj.dataLink9:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            updateRecurso(sheet);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
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

        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.templates ~= nil then self.templates:destroy(); self.templates = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.rclNPC ~= nil then self.rclNPC:destroy(); self.rclNPC = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _KitsuneNPC = {
    newEditor = newKitsuneNPC, 
    new = newKitsuneNPC, 
    name = "KitsuneNPC", 
    dataType = "br.com.sigma.kitsune.fichaNPC", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Kitsune's System: NPC", 
    description=""};

KitsuneNPC = _KitsuneNPC;
rrpg.registrarForm(_KitsuneNPC);
rrpg.registrarDataType(_KitsuneNPC);

return _KitsuneNPC;
