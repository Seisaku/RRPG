require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmAtalhosAcoes()
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
    obj:setName("frmAtalhosAcoes");
    obj:setFormType("tablesDock");
    obj:setDataType("RRPG.DataTypeUnico.atalhosAcoes");
    obj:setTitle("Atalhos");

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj);
    obj.flowLayout1:setAlign("client");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(2);
    obj.flowLayout1:setName("flowLayout1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.flowLayout1);
    obj.button1:setText("ATQ");
    obj.button1:setWidth(50);
    obj.button1:setHeight(20);
    obj.button1:setMargins({left = 5, top = 5});
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.flowLayout1);
    obj.button2:setText("DEF");
    obj.button2:setWidth(50);
    obj.button2:setHeight(20);
    obj.button2:setMargins({left = 5, top = 5});
    obj.button2:setName("button2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.flowLayout1);
    obj.button3:setText("AGI");
    obj.button3:setWidth(50);
    obj.button3:setHeight(20);
    obj.button3:setMargins({left = 5, top = 5});
    obj.button3:setName("button3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.flowLayout1);
    obj.button4:setText("SOR");
    obj.button4:setWidth(50);
    obj.button4:setHeight(20);
    obj.button4:setMargins({left = 5, top = 5});
    obj.button4:setName("button4");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.flowLayout1);
    obj.button5:setText("MAG");
    obj.button5:setWidth(50);
    obj.button5:setHeight(20);
    obj.button5:setMargins({left = 5, top = 5});
    obj.button5:setName("button5");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.flowLayout1);
    obj.button6:setText("RMAG");
    obj.button6:setWidth(50);
    obj.button6:setHeight(20);
    obj.button6:setMargins({left = 5, top = 5});
    obj.button6:setName("button6");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.flowLayout1);
    obj.button7:setText("VID");
    obj.button7:setWidth(50);
    obj.button7:setHeight(20);
    obj.button7:setMargins({left = 5, top = 5});
    obj.button7:setName("button7");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.flowLayout1);
    obj.button8:setText("INI");
    obj.button8:setWidth(50);
    obj.button8:setHeight(20);
    obj.button8:setMargins({left = 5, top = 5});
    obj.button8:setName("button8");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (self)
            initializeActions(sheet)
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (self)
            atalhoAtaque(sheet);
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (self)
            atalhoDefesa(sheet);
        end, obj);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (self)
            atalhoAgilidade(sheet);
        end, obj);

    obj._e_event4 = obj.button4:addEventListener("onClick",
        function (self)
            atalhoSorte(sheet);
        end, obj);

    obj._e_event5 = obj.button5:addEventListener("onClick",
        function (self)
            atalhoMagia(sheet);
        end, obj);

    obj._e_event6 = obj.button6:addEventListener("onClick",
        function (self)
            atalhoRMagia(sheet);
        end, obj);

    obj._e_event7 = obj.button7:addEventListener("onClick",
        function (self)
            atalhoVida(sheet);
        end, obj);

    obj._e_event8 = obj.button8:addEventListener("onClick",
        function (self)
            atalhoIniciativa(sheet);
        end, obj);

    function obj:_releaseEvents()
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmAtalhosAcoes = {
    newEditor = newfrmAtalhosAcoes, 
    new = newfrmAtalhosAcoes, 
    name = "frmAtalhosAcoes", 
    dataType = "RRPG.DataTypeUnico.atalhosAcoes", 
    formType = "tablesDock", 
    formComponentName = "form", 
    title = "Atalhos", 
    description=""};

frmAtalhosAcoes = _frmAtalhosAcoes;
rrpg.registrarForm(_frmAtalhosAcoes);
rrpg.registrarDataType(_frmAtalhosAcoes);
rrpg.registrarSpecialForm(_frmAtalhosAcoes);

return _frmAtalhosAcoes;
