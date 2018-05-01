require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newmasakiform()
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
    obj:setDataType("br.com.sigma.kitsune.fichaTest");
    obj:setTitle("Masaki's DEV tests");
    obj:setName("masakiform");

    obj.templates = gui.fromHandle(_obj_newObject("form"));
    obj.templates:setParent(obj);
    obj.templates:setName("templates");

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj);
    obj.flowLayout1:setAlign("client");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setName("flowLayout1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.flowLayout1);
    obj.button1:setHeight(30);
    obj.button1:setWidth(150);
    obj.button1:setText("TEST: Chat");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.flowLayout1);
    obj.button2:setHeight(30);
    obj.button2:setWidth(150);
    obj.button2:setText("TEST: Node Sheet");
    obj.button2:setName("button2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.flowLayout1);
    obj.button3:setHeight(30);
    obj.button3:setWidth(150);
    obj.button3:setText("TEST: Node Self");
    obj.button3:setName("button3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.flowLayout1);
    obj.button4:setHeight(30);
    obj.button4:setWidth(150);
    obj.button4:setText("TEST: set Node");
    obj.button4:setName("button4");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.flowLayout1);
    obj.button5:setHeight(30);
    obj.button5:setWidth(150);
    obj.button5:setText("TEST: set Node");
    obj.button5:setName("button5");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.flowLayout1);
    obj.button6:setHeight(30);
    obj.button6:setWidth(150);
    obj.button6:setText("TEST: find");
    obj.button6:setName("button6");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.flowLayout1);
    obj.button7:setHeight(30);
    obj.button7:setWidth(150);
    obj.button7:setText("TEST: change node");
    obj.button7:setName("button7");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.flowLayout1);
    obj.button8:setHeight(30);
    obj.button8:setWidth(150);
    obj.button8:setText("TEST: ler biblioteca");
    obj.button8:setName("button8");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.flowLayout1);
    obj.button9:setHeight(30);
    obj.button9:setWidth(150);
    obj.button9:setText("TEST: init Table");
    obj.button9:setName("button9");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.flowLayout1);
    obj.button10:setHeight(30);
    obj.button10:setWidth(150);
    obj.button10:setText("TEST: test Table");
    obj.button10:setName("button10");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.flowLayout1);
    obj.button11:setHeight(30);
    obj.button11:setWidth(150);
    obj.button11:setText("TEST: init Races");
    obj.button11:setName("button11");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.flowLayout1);
    obj.button12:setHeight(30);
    obj.button12:setWidth(150);
    obj.button12:setText("TEST: check Races");
    obj.button12:setName("button12");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowLayout1);
    obj.edit1:setField("sheet.atributos.nome");
    obj.edit1:setWidth(800);
    obj.edit1:setType("text");
    obj.edit1:setName("edit1");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowLayout1);
    obj.edit2:setField("sheet.atributos.jogador");
    obj.edit2:setWidth(800);
    obj.edit2:setType("text");
    obj.edit2:setName("edit2");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowLayout1);
    obj.edit3:setField("sheet.atributos.nivel");
    obj.edit3:setWidth(800);
    obj.edit3:setType("text");
    obj.edit3:setName("edit3");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowLayout1);
    obj.edit4:setField("sheet.atributos.raca");
    obj.edit4:setWidth(800);
    obj.edit4:setType("text");
    obj.edit4:setName("edit4");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowLayout1);
    obj.edit5:setField("sheet.test1.A");
    obj.edit5:setWidth(800);
    obj.edit5:setType("text");
    obj.edit5:setName("edit5");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowLayout1);
    obj.edit6:setField("sheet.test1.B");
    obj.edit6:setWidth(800);
    obj.edit6:setType("text");
    obj.edit6:setName("edit6");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowLayout1);
    obj.edit7:setField("sheet.test1.C");
    obj.edit7:setWidth(800);
    obj.edit7:setType("text");
    obj.edit7:setName("edit7");

    obj.flowLineBreak1 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout1);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.flowLayout1);
    obj.layout1:setAlign("client");
    obj.layout1:setHeight(30);
    obj.layout1:setWidth(500);
    obj.layout1:setMargins({top = 2,left=2, right=2});
    obj.layout1:setName("layout1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("left");
    obj.label1:setText("A");
    obj.label1:setWidth(50);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setVertTextAlign("center");
    obj.label1:setName("label1");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout1);
    obj.edit8:setAlign("left");
    obj.edit8:setLeft(50);
    obj.edit8:setField("test2.A.valor");
    obj.edit8:setType("number");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setWidth(50);
    obj.edit8:setName("edit8");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setAlign("left");
    obj.label2:setLeft(100);
    obj.label2:setWidth(100);
    obj.label2:setField("test2.A.formula");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setAlign("left");
    obj.label3:setField("test2.A.bonustotal");
    obj.label3:setVisible(false);
    obj.label3:setName("label3");

    obj.flowLineBreak2 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flowLayout1);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.flowLayout1);
    obj.layout2:setAlign("client");
    obj.layout2:setHeight(30);
    obj.layout2:setWidth(500);
    obj.layout2:setMargins({top = 2,left=2, right=2});
    obj.layout2:setName("layout2");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setAlign("left");
    obj.label4:setText("B");
    obj.label4:setWidth(50);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setVertTextAlign("center");
    obj.label4:setName("label4");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout2);
    obj.edit9:setAlign("left");
    obj.edit9:setLeft(50);
    obj.edit9:setField("test2.B.valor");
    obj.edit9:setType("number");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setWidth(50);
    obj.edit9:setName("edit9");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setAlign("left");
    obj.label5:setLeft(100);
    obj.label5:setWidth(100);
    obj.label5:setField("test2.B.formula");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setAlign("left");
    obj.label6:setField("test2.B.bonustotal");
    obj.label6:setVisible(false);
    obj.label6:setName("label6");

    obj.flowLineBreak3 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.flowLayout1);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.flowLayout1);
    obj.layout3:setAlign("client");
    obj.layout3:setHeight(30);
    obj.layout3:setWidth(500);
    obj.layout3:setMargins({top = 2,left=2, right=2});
    obj.layout3:setName("layout3");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout3);
    obj.label7:setAlign("left");
    obj.label7:setText("C");
    obj.label7:setWidth(50);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setVertTextAlign("center");
    obj.label7:setName("label7");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout3);
    obj.edit10:setAlign("left");
    obj.edit10:setLeft(50);
    obj.edit10:setField("test2.C.valor");
    obj.edit10:setType("number");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setWidth(50);
    obj.edit10:setName("edit10");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout3);
    obj.label8:setAlign("left");
    obj.label8:setLeft(100);
    obj.label8:setWidth(100);
    obj.label8:setField("test2.C.formula");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout3);
    obj.label9:setAlign("left");
    obj.label9:setField("test2.C.bonustotal");
    obj.label9:setVisible(false);
    obj.label9:setName("label9");

    obj._e_event0 = obj:addEventListener("onScopeNodeChanged",
        function (self)
            if sheet ~= nil then
            			setInterval(
            				function()
            				if sheet ~= nil then
            				local state = ndb.getState(sheet) ;
            					if state == "open" then
            						-- showMessage("TEST HERE");	
            					end;
            					if state ~= "opening" then
            						return false; -- parar de chamar o timer. 
            					end;
            				else
            					return false; -- Isso vai fazer a função timer parar de ser chamada
            				end;
            			end, 500);
            		end;
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (self)
            testChat(sheet);
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (self)
            testNodes(sheet);
        end, obj);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (self)
            testNodes(self);
        end, obj);

    obj._e_event4 = obj.button4:addEventListener("onClick",
        function (self)
            testSetDatabase(self);
        end, obj);

    obj._e_event5 = obj.button5:addEventListener("onClick",
        function (self)
            testMsg();
        end, obj);

    obj._e_event6 = obj.button6:addEventListener("onClick",
        function (self)
            getNodeFromPath('sheet.atributos.nivel', sheet);
        end, obj);

    obj._e_event7 = obj.button7:addEventListener("onClick",
        function (self)
            updateAtributoA(sheet, sheet.test2.A.formula);
        end, obj);

    obj._e_event8 = obj.button8:addEventListener("onClick",
        function (self)
            lerBiblioteca(sheet);
        end, obj);

    obj._e_event9 = obj.button9:addEventListener("onClick",
        function (self)
            initTipoClasse(sheet);
        end, obj);

    obj._e_event10 = obj.button10:addEventListener("onClick",
        function (self)
            testTable2(sheet);
        end, obj);

    obj._e_event11 = obj.button11:addEventListener("onClick",
        function (self)
            initRaces(sheet);
        end, obj);

    obj._e_event12 = obj.button12:addEventListener("onClick",
        function (self)
            testaRaces();
        end, obj);

    obj._e_event13 = obj.edit8:addEventListener("onChange",
        function (self)
            updateAtributo(sheet, 'A', 'test2.A');
        end, obj);

    obj._e_event14 = obj.edit9:addEventListener("onChange",
        function (self)
            updateAtributo(sheet, 'B', 'test2.B');
        end, obj);

    obj._e_event15 = obj.edit10:addEventListener("onChange",
        function (self)
            updateAtributo(sheet, 'C', 'test2.C');
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.templates ~= nil then self.templates:destroy(); self.templates = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _masakiform = {
    newEditor = newmasakiform, 
    new = newmasakiform, 
    name = "masakiform", 
    dataType = "br.com.sigma.kitsune.fichaTest", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Masaki's DEV tests", 
    description=""};

masakiform = _masakiform;
rrpg.registrarForm(_masakiform);
rrpg.registrarDataType(_masakiform);

return _masakiform;
