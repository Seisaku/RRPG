require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_Kitsune()
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
    obj:setDataType("br.com.sigma.kitsune.ficha1");
    obj:setFormType("sheetTemplate");
    obj:setName("Kitsune");
    obj:setTitle("Kitsune's System");

    obj.templates = GUI.fromHandle(_obj_newObject("form"));
    obj.templates:setParent(obj);
    obj.templates:setName("templates");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Principal");
    obj.tab1:setName("tab1");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.tab1);
    obj.flowLayout1:setAlign("client");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(2);
    obj.flowLayout1:setName("flowLayout1");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.flowLayout1);
    obj.flowLayout2:setWidth(400);
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setName("flowLayout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowLayout2);
    obj.label1:setText("Nome");
    obj.label1:setHeight(20);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowLayout2);
    obj.edit1:setField("nome");
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(20);
    obj.edit1:setType("text");
    obj.edit1:setName("edit1");

    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout2);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowLayout2);
    obj.label2:setText("Jogador");
    obj.label2:setHeight(20);
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowLayout2);
    obj.edit2:setField("jogador");
    obj.edit2:setHeight(20);
    obj.edit2:setType("text");
    obj.edit2:setName("edit2");

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flowLayout2);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowLayout2);
    obj.label3:setText("Raça");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowLayout2);
    obj.edit3:setField("raca");
    obj.edit3:setWidth(100);
    obj.edit3:setHeight(20);
    obj.edit3:setType("text");
    obj.edit3:setName("edit3");

    obj.flowLineBreak3 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.flowLayout2);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowLayout2);
    obj.label4:setText("Classe");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowLayout2);
    obj.edit4:setField("classe");
    obj.edit4:setWidth(100);
    obj.edit4:setHeight(20);
    obj.edit4:setType("text");
    obj.edit4:setName("edit4");

    obj.flowLineBreak4 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.flowLayout2);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowLayout2);
    obj.label5:setText("Tendencia");
    obj.label5:setName("label5");

    obj.flowLineBreak5 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.flowLayout2);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowLayout2);
    obj.label6:setText("Moralidade");
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowLayout2);
    obj.label7:setField("moralidade");
    obj.label7:setWidth(60);
    obj.label7:setName("label7");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowLayout2);
    obj.edit5:setField("tendencia.moralidade");
    obj.edit5:setHeight(20);
    obj.edit5:setWidth(30);
    obj.edit5:setType("number");
    obj.edit5:setTextPrompt("1");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.flowLineBreak6 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak6:setParent(obj.flowLayout2);
    obj.flowLineBreak6:setName("flowLineBreak6");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowLayout2);
    obj.label8:setText("Lealdade");
    obj.label8:setName("label8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowLayout2);
    obj.label9:setField("lealdade");
    obj.label9:setWidth(60);
    obj.label9:setName("label9");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowLayout2);
    obj.edit6:setField("tendencia.lealdade");
    obj.edit6:setHeight(20);
    obj.edit6:setWidth(30);
    obj.edit6:setType("number");
    obj.edit6:setTextPrompt("1");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.flowLineBreak7 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak7:setParent(obj.flowLayout2);
    obj.flowLineBreak7:setName("flowLineBreak7");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowLayout2);
    obj.label10:setText("Experiência");
    obj.label10:setName("label10");

    obj.progressBar1 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar1:setParent(obj.flowLayout2);
    obj.progressBar1:setAlign("client");
    obj.progressBar1:setWidth(200);
    obj.progressBar1:setHeight(13);
    obj.progressBar1:setColor("Gold ");
    obj.progressBar1:setField("experienciaAtual");
    obj.progressBar1:setFieldMax("proximoNivel");
    obj.progressBar1:setHitTest(true);
    obj.progressBar1:setName("progressBar1");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.progressBar1);
    obj.label11:setField("experienciaAtualxProx");
    obj.label11:setAlign("client");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setFontColor("Black");
    obj.label11:setName("label11");

    obj.setExperienciaPopup = GUI.fromHandle(_obj_newObject("popup"));
    obj.setExperienciaPopup:setParent(obj.progressBar1);
    obj.setExperienciaPopup:setName("setExperienciaPopup");
    obj.setExperienciaPopup:setWidth(150);
    obj.setExperienciaPopup:setHeight(80);
    obj.setExperienciaPopup:setNodeObject({sheet});

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.setExperienciaPopup);
    obj.flowLayout3:setAlign("client");
    obj.flowLayout3:setName("flowLayout3");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowLayout3);
    obj.label12:setText("Experiência");
    obj.label12:setAutoSize(true);
    obj.label12:setName("label12");

    obj.flowLineBreak8 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak8:setParent(obj.flowLayout3);
    obj.flowLineBreak8:setName("flowLineBreak8");

    obj.experienciaOp = GUI.fromHandle(_obj_newObject("edit"));
    obj.experienciaOp:setParent(obj.flowLayout3);
    obj.experienciaOp:setName("experienciaOp");
    obj.experienciaOp:setField("experienciaOp");
    obj.experienciaOp:setHorzTextAlign("center");
    obj.experienciaOp:setWidth(100);

    obj.endExpOp = GUI.fromHandle(_obj_newObject("button"));
    obj.endExpOp:setParent(obj.flowLayout3);
    obj.endExpOp:setName("endExpOp");
    obj.endExpOp:setText("X");
    obj.endExpOp:setWidth(30);

    obj.flowLineBreak9 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak9:setParent(obj.flowLayout2);
    obj.flowLineBreak9:setName("flowLineBreak9");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowLayout2);
    obj.label13:setText("Nível");
    obj.label13:setName("label13");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowLayout2);
    obj.edit7:setField("nivel");
    obj.edit7:setMin(1);
    obj.edit7:setMax(20);
    obj.edit7:setHeight(20);
    obj.edit7:setType("number");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.flowLineBreak10 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak10:setParent(obj.flowLayout2);
    obj.flowLineBreak10:setName("flowLineBreak10");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowLayout2);
    obj.label14:setText("Proficiência");
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.flowLayout2);
    obj.label15:setField("proficiencia");
    obj.label15:setWidth(15);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.flowLineBreak11 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak11:setParent(obj.flowLayout2);
    obj.flowLineBreak11:setName("flowLineBreak11");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.flowLayout2);
    obj.label16:setText("Percepção Passiva");
    obj.label16:setName("label16");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowLayout2);
    obj.edit8:setField("PercepcaoPassiva");
    obj.edit8:setHeight(20);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.flowLineBreak12 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak12:setParent(obj.flowLayout2);
    obj.flowLineBreak12:setName("flowLineBreak12");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowLayout2);
    obj.label17:setText("Deslocamento");
    obj.label17:setName("label17");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.flowLayout2);
    obj.edit9:setField("Deslocamento");
    obj.edit9:setHeight(20);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.flowLayout2);
    obj.button1:setText("Iniciativa");
    obj.button1:setHeight(20);
    obj.button1:setName("button1");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.flowLayout1);
    obj.flowLayout4:setWidth(200);
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setAlign("right");
    obj.flowLayout4:setName("flowLayout4");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.flowLayout4);
    obj.rectangle1:setColor("Transparent");
    obj.rectangle1:setHeight(200);
    obj.rectangle1:setMargins({left = 2, right = 2, top = 2, bottom = 2});
    obj.rectangle1:setStrokeColor("black");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setWidth(200);
    obj.rectangle1:setName("rectangle1");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle1);
    obj.label18:setAlign("client");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setText("Avatar");
    obj.label18:setVertTextAlign("center");
    obj.label18:setName("label18");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setCenter(false);
    obj.image1:setEditable(true);
    obj.image1:setField("imagemDoPersonagem");
    obj.image1:setHeight(200);
    obj.image1:setStyle("proportional");
    obj.image1:setWidth(200);
    obj.image1:setName("image1");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.flowLayout4);
    obj.label19:setText("Vida");
    obj.label19:setName("label19");

    obj.progressBar2 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar2:setParent(obj.flowLayout4);
    obj.progressBar2:setWidth(200);
    obj.progressBar2:setHeight(15);
    obj.progressBar2:setColor("Green");
    obj.progressBar2:setField("atributos.vidaAtual");
    obj.progressBar2:setFieldMax("atributos.vidaMax");
    obj.progressBar2:setHitTest(true);
    obj.progressBar2:setName("progressBar2");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.progressBar2);
    obj.label20:setField("atributos.vidaAtualxTotal");
    obj.label20:setAlign("client");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.setVidaPopup = GUI.fromHandle(_obj_newObject("popup"));
    obj.setVidaPopup:setParent(obj.progressBar2);
    obj.setVidaPopup:setName("setVidaPopup");
    obj.setVidaPopup:setWidth(150);
    obj.setVidaPopup:setHeight(80);
    obj.setVidaPopup:setNodeObject({sheet});

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.setVidaPopup);
    obj.flowLayout5:setAlign("client");
    obj.flowLayout5:setName("flowLayout5");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.flowLayout5);
    obj.label21:setText("Vida");
    obj.label21:setAutoSize(true);
    obj.label21:setName("label21");

    obj.flowLineBreak13 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak13:setParent(obj.flowLayout5);
    obj.flowLineBreak13:setName("flowLineBreak13");

    obj.vidaOp = GUI.fromHandle(_obj_newObject("edit"));
    obj.vidaOp:setParent(obj.flowLayout5);
    obj.vidaOp:setName("vidaOp");
    obj.vidaOp:setField("vidaOp");
    obj.vidaOp:setHorzTextAlign("center");
    obj.vidaOp:setWidth(100);

    obj.endVidaOp = GUI.fromHandle(_obj_newObject("button"));
    obj.endVidaOp:setParent(obj.flowLayout5);
    obj.endVidaOp:setName("endVidaOp");
    obj.endVidaOp:setText("X");
    obj.endVidaOp:setWidth(30);
    obj.endVidaOp:setMargins({left = 5});

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.flowLayout4);
    obj.label22:setText("Recurso");
    obj.label22:setName("label22");

    obj.progressBar3 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar3:setParent(obj.flowLayout4);
    obj.progressBar3:setWidth(200);
    obj.progressBar3:setHeight(15);
    obj.progressBar3:setColor("DodgerBlue");
    obj.progressBar3:setField("atributos.recursoAtual");
    obj.progressBar3:setFieldMax("atributos.recursoMax");
    obj.progressBar3:setHitTest(true);
    obj.progressBar3:setName("progressBar3");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.progressBar3);
    obj.label23:setField("atributos.recursoAtualxTotal");
    obj.label23:setAlign("client");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.setRecursoPopup = GUI.fromHandle(_obj_newObject("popup"));
    obj.setRecursoPopup:setParent(obj.progressBar3);
    obj.setRecursoPopup:setName("setRecursoPopup");
    obj.setRecursoPopup:setWidth(150);
    obj.setRecursoPopup:setHeight(80);
    obj.setRecursoPopup:setNodeObject({sheet});

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.setRecursoPopup);
    obj.flowLayout6:setAlign("client");
    obj.flowLayout6:setName("flowLayout6");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowLayout6);
    obj.label24:setText("Recurso");
    obj.label24:setAutoSize(true);
    obj.label24:setName("label24");

    obj.flowLineBreak14 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak14:setParent(obj.flowLayout6);
    obj.flowLineBreak14:setName("flowLineBreak14");

    obj.recursoOp = GUI.fromHandle(_obj_newObject("edit"));
    obj.recursoOp:setParent(obj.flowLayout6);
    obj.recursoOp:setName("recursoOp");
    obj.recursoOp:setField("recursoOp");
    obj.recursoOp:setHorzTextAlign("center");
    obj.recursoOp:setWidth(100);

    obj.endRecursoOp = GUI.fromHandle(_obj_newObject("button"));
    obj.endRecursoOp:setParent(obj.flowLayout6);
    obj.endRecursoOp:setName("endRecursoOp");
    obj.endRecursoOp:setText("X");
    obj.endRecursoOp:setWidth(30);
    obj.endRecursoOp:setMargins({left = 5});

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.flowLayout4);
    obj.label25:setText("Desejo");
    obj.label25:setName("label25");

    obj.progressBar4 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar4:setParent(obj.flowLayout4);
    obj.progressBar4:setWidth(200);
    obj.progressBar4:setHeight(15);
    obj.progressBar4:setColor("darkorchid");
    obj.progressBar4:setField("desejo");
    obj.progressBar4:setFieldMax("desejoMax");
    obj.progressBar4:setHitTest(true);
    obj.progressBar4:setName("progressBar4");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.progressBar4);
    obj.label26:setField("desejoMsg");
    obj.label26:setAlign("client");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.setDesejoPopup = GUI.fromHandle(_obj_newObject("popup"));
    obj.setDesejoPopup:setParent(obj.progressBar4);
    obj.setDesejoPopup:setName("setDesejoPopup");
    obj.setDesejoPopup:setWidth(150);
    obj.setDesejoPopup:setHeight(80);
    obj.setDesejoPopup:setNodeObject({sheet});

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.setDesejoPopup);
    obj.flowLayout7:setAlign("client");
    obj.flowLayout7:setName("flowLayout7");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowLayout7);
    obj.label27:setText("Desejo");
    obj.label27:setAutoSize(true);
    obj.label27:setName("label27");

    obj.flowLineBreak15 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak15:setParent(obj.flowLayout7);
    obj.flowLineBreak15:setName("flowLineBreak15");

    obj.desejoOp = GUI.fromHandle(_obj_newObject("edit"));
    obj.desejoOp:setParent(obj.flowLayout7);
    obj.desejoOp:setName("desejoOp");
    obj.desejoOp:setField("desejoOp");
    obj.desejoOp:setHorzTextAlign("center");
    obj.desejoOp:setWidth(100);

    obj.endDesejoOp = GUI.fromHandle(_obj_newObject("button"));
    obj.endDesejoOp:setParent(obj.flowLayout7);
    obj.endDesejoOp:setName("endDesejoOp");
    obj.endDesejoOp:setText("X");
    obj.endDesejoOp:setWidth(30);
    obj.endDesejoOp:setMargins({left = 5});

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowLayout4);
    obj.label28:setText("Desejo");
    obj.label28:setName("label28");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowLayout4);
    obj.edit10:setField("desejoUso");
    obj.edit10:setType("number");
    obj.edit10:setMin(0);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setHeight(20);
    obj.edit10:setWidth(30);
    obj.edit10:setName("edit10");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.flowLayout4);
    obj.label29:setText("Falhas Oponente");
    obj.label29:setName("label29");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowLayout4);
    obj.edit11:setField("falhas.oponente");
    obj.edit11:setType("number");
    obj.edit11:setMin(0);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setHeight(20);
    obj.edit11:setWidth(30);
    obj.edit11:setName("edit11");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.flowLayout4);
    obj.label30:setText("Dinheiro");
    obj.label30:setName("label30");

    obj.flowLineBreak16 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak16:setParent(obj.flowLayout4);
    obj.flowLineBreak16:setName("flowLineBreak16");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.flowLayout4);
    obj.image2:setURL("/images/goldCoin.png");
    obj.image2:setHeight(16);
    obj.image2:setWidth(16);
    obj.image2:setName("image2");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowLayout4);
    obj.edit12:setField("ouro");
    obj.edit12:setType("number");
    obj.edit12:setMin(0);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setHeight(20);
    obj.edit12:setWidth(30);
    obj.edit12:setName("edit12");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.flowLayout4);
    obj.image3:setURL("/images/silverCoin.png");
    obj.image3:setHeight(16);
    obj.image3:setWidth(16);
    obj.image3:setName("image3");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.flowLayout4);
    obj.edit13:setField("prata");
    obj.edit13:setType("number");
    obj.edit13:setMin(0);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setHeight(20);
    obj.edit13:setWidth(30);
    obj.edit13:setName("edit13");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.flowLayout4);
    obj.image4:setURL("/images/copperCoin.png");
    obj.image4:setHeight(16);
    obj.image4:setWidth(16);
    obj.image4:setName("image4");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.flowLayout4);
    obj.edit14:setField("cobre");
    obj.edit14:setType("number");
    obj.edit14:setMin(0);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setHeight(20);
    obj.edit14:setWidth(30);
    obj.edit14:setName("edit14");

    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.flowLayout1);
    obj.flowLayout8:setWidth(400);
    obj.flowLayout8:setAutoHeight(true);
    obj.flowLayout8:setName("flowLayout8");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowLayout8);
    obj.label31:setText("Atributos");
    obj.label31:setWidth(300);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setMargins({top = 5});
    obj.label31:setName("label31");

    obj.flowLineBreak17 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak17:setParent(obj.flowLayout8);
    obj.flowLineBreak17:setName("flowLineBreak17");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.flowLayout8);
    obj.label32:setText("Valor");
    obj.label32:setWidth(30);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setMargins({left = 70});
    obj.label32:setName("label32");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.flowLayout8);
    obj.label33:setText("+");
    obj.label33:setWidth(10);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setMargins({left = 5});
    obj.label33:setName("label33");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.flowLayout8);
    obj.label34:setText("Mod");
    obj.label34:setWidth(30);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setMargins({left = 5});
    obj.label34:setName("label34");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowLayout8);
    obj.label35:setText("Fórmula");
    obj.label35:setWidth(100);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.flowLineBreak18 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak18:setParent(obj.flowLayout8);
    obj.flowLineBreak18:setName("flowLineBreak18");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.flowLayout8);
    obj.label36:setText("Ataque");
    obj.label36:setWidth(70);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setHeight(20);
    obj.label36:setMargins({top = 5});
    obj.label36:setName("label36");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.flowLayout8);
    obj.edit15:setField("atributos.ataque");
    obj.edit15:setHeight(20);
    obj.edit15:setWidth(30);
    obj.edit15:setType("number");
    obj.edit15:setMin(1);
    obj.edit15:setMax(20);
    obj.edit15:setTextPrompt("1");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.flowLayout8);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setVertTextAlign("center");
    obj.label37:setWidth(10);
    obj.label37:setText("+");
    obj.label37:setMargins({left = 5});
    obj.label37:setName("label37");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.flowLayout8);
    obj.edit16:setField("atributos.ataqueMod");
    obj.edit16:setType("number");
    obj.edit16:setMin(0);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setHeight(20);
    obj.edit16:setWidth(30);
    obj.edit16:setMargins({left = 5});
    obj.edit16:setName("edit16");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.flowLayout8);
    obj.label38:setWidth(100);
    obj.label38:setField("atributos.ataqueFormula");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.flowLayout8);
    obj.label39:setField("equipamento.ataqueProficiencia");
    obj.label39:setVisible(false);
    obj.label39:setName("label39");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.flowLayout8);
    obj.label40:setField("equipamento.ataqueEquipBonus");
    obj.label40:setVisible(false);
    obj.label40:setName("label40");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.flowLayout8);
    obj.button2:setText("ATQ");
    obj.button2:setWidth(50);
    obj.button2:setHeight(20);
    obj.button2:setName("button2");

    obj.flowLineBreak19 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak19:setParent(obj.flowLayout8);
    obj.flowLineBreak19:setName("flowLineBreak19");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.flowLayout8);
    obj.label41:setText("Defesa");
    obj.label41:setWidth(70);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setHeight(20);
    obj.label41:setMargins({top = 5});
    obj.label41:setName("label41");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.flowLayout8);
    obj.edit17:setField("atributos.defesa");
    obj.edit17:setType("number");
    obj.edit17:setMin(1);
    obj.edit17:setMax(20);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setHeight(20);
    obj.edit17:setWidth(30);
    obj.edit17:setName("edit17");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.flowLayout8);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setVertTextAlign("center");
    obj.label42:setWidth(10);
    obj.label42:setText("+");
    obj.label42:setMargins({left = 5});
    obj.label42:setName("label42");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.flowLayout8);
    obj.edit18:setField("atributos.defesaMod");
    obj.edit18:setType("number");
    obj.edit18:setMin(0);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setHeight(20);
    obj.edit18:setWidth(30);
    obj.edit18:setMargins({left = 5});
    obj.edit18:setName("edit18");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.flowLayout8);
    obj.label43:setWidth(100);
    obj.label43:setField("atributos.defesaFormula");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.flowLayout8);
    obj.label44:setField("equipamento.defesaProficiencia");
    obj.label44:setVisible(false);
    obj.label44:setName("label44");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.flowLayout8);
    obj.label45:setField("equipamento.defesaEquipBonus");
    obj.label45:setVisible(false);
    obj.label45:setName("label45");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.flowLayout8);
    obj.button3:setText("DEF");
    obj.button3:setWidth(50);
    obj.button3:setHeight(20);
    obj.button3:setName("button3");

    obj.flowLineBreak20 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak20:setParent(obj.flowLayout8);
    obj.flowLineBreak20:setName("flowLineBreak20");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.flowLayout8);
    obj.label46:setText("Agilidade");
    obj.label46:setWidth(70);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setHeight(20);
    obj.label46:setMargins({top = 5});
    obj.label46:setName("label46");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.flowLayout8);
    obj.edit19:setField("atributos.agilidade");
    obj.edit19:setType("number");
    obj.edit19:setMin(1);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setHeight(20);
    obj.edit19:setWidth(30);
    obj.edit19:setName("edit19");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.flowLayout8);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setVertTextAlign("center");
    obj.label47:setWidth(10);
    obj.label47:setText("+");
    obj.label47:setMargins({left = 5});
    obj.label47:setName("label47");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.flowLayout8);
    obj.edit20:setField("atributos.agilidadeMod");
    obj.edit20:setType("number");
    obj.edit20:setMin(0);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setHeight(20);
    obj.edit20:setWidth(30);
    obj.edit20:setMargins({left = 5});
    obj.edit20:setName("edit20");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.flowLayout8);
    obj.label48:setWidth(100);
    obj.label48:setField("atributos.iniciativaFormula");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.flowLayout8);
    obj.button4:setText("AGI");
    obj.button4:setWidth(50);
    obj.button4:setHeight(20);
    obj.button4:setName("button4");

    obj.flowLineBreak21 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak21:setParent(obj.flowLayout8);
    obj.flowLineBreak21:setName("flowLineBreak21");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.flowLayout8);
    obj.label49:setText("Sorte");
    obj.label49:setWidth(70);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setHeight(20);
    obj.label49:setMargins({top = 5});
    obj.label49:setName("label49");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.flowLayout8);
    obj.edit21:setField("atributos.sorte");
    obj.edit21:setType("number");
    obj.edit21:setMin(1);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setHeight(20);
    obj.edit21:setWidth(30);
    obj.edit21:setName("edit21");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.flowLayout8);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setVertTextAlign("center");
    obj.label50:setWidth(10);
    obj.label50:setText("+");
    obj.label50:setMargins({left = 5});
    obj.label50:setName("label50");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.flowLayout8);
    obj.edit22:setField("atributos.sorteMod");
    obj.edit22:setType("number");
    obj.edit22:setMin(-20);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setHeight(20);
    obj.edit22:setWidth(30);
    obj.edit22:setMargins({left = 5});
    obj.edit22:setName("edit22");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.flowLayout8);
    obj.label51:setWidth(100);
    obj.label51:setField("atributos.critRange");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.flowLayout8);
    obj.button5:setText("SOR");
    obj.button5:setWidth(50);
    obj.button5:setHeight(20);
    obj.button5:setName("button5");

    obj.flowLineBreak22 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak22:setParent(obj.flowLayout8);
    obj.flowLineBreak22:setName("flowLineBreak22");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.flowLayout8);
    obj.label52:setText("Magia");
    obj.label52:setWidth(70);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setHeight(20);
    obj.label52:setMargins({top = 5});
    obj.label52:setName("label52");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.flowLayout8);
    obj.edit23:setField("atributos.magia");
    obj.edit23:setType("number");
    obj.edit23:setMin(1);
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setHeight(20);
    obj.edit23:setWidth(30);
    obj.edit23:setName("edit23");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.flowLayout8);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setVertTextAlign("center");
    obj.label53:setWidth(10);
    obj.label53:setText("+");
    obj.label53:setMargins({left = 5});
    obj.label53:setName("label53");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.flowLayout8);
    obj.edit24:setField("atributos.MagiaMod");
    obj.edit24:setType("number");
    obj.edit24:setMin(0);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setHeight(20);
    obj.edit24:setWidth(30);
    obj.edit24:setMargins({left = 5});
    obj.edit24:setName("edit24");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.flowLayout8);
    obj.label54:setWidth(100);
    obj.label54:setField("atributos.magiaFormula");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.flowLayout8);
    obj.button6:setText("MAG");
    obj.button6:setWidth(50);
    obj.button6:setHeight(20);
    obj.button6:setName("button6");

    obj.flowLineBreak23 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak23:setParent(obj.flowLayout8);
    obj.flowLineBreak23:setName("flowLineBreak23");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.flowLayout8);
    obj.label55:setText("Resistencia Mágica");
    obj.label55:setWidth(70);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setHeight(20);
    obj.label55:setMargins({top = 5});
    obj.label55:setName("label55");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.flowLayout8);
    obj.edit25:setField("atributos.resistenciaMagica");
    obj.edit25:setMin(1);
    obj.edit25:setType("number");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setHeight(20);
    obj.edit25:setWidth(30);
    obj.edit25:setName("edit25");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.flowLayout8);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setVertTextAlign("center");
    obj.label56:setWidth(10);
    obj.label56:setText("+");
    obj.label56:setMargins({left = 5});
    obj.label56:setName("label56");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.flowLayout8);
    obj.edit26:setField("atributos.resistenciaMagicaMod");
    obj.edit26:setType("number");
    obj.edit26:setMin(0);
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setHeight(20);
    obj.edit26:setWidth(30);
    obj.edit26:setMargins({left = 5});
    obj.edit26:setName("edit26");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.flowLayout8);
    obj.label57:setWidth(100);
    obj.label57:setField("atributos.resistenciaMagicaFormula");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.flowLayout8);
    obj.button7:setText("RMAG");
    obj.button7:setWidth(50);
    obj.button7:setHeight(20);
    obj.button7:setName("button7");

    obj.flowLineBreak24 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak24:setParent(obj.flowLayout8);
    obj.flowLineBreak24:setName("flowLineBreak24");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.flowLayout8);
    obj.label58:setText("Recurso");
    obj.label58:setWidth(70);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setHeight(20);
    obj.label58:setMargins({top = 5});
    obj.label58:setName("label58");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.flowLayout8);
    obj.edit27:setField("atributos.recurso");
    obj.edit27:setType("number");
    obj.edit27:setMin(1);
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setHeight(20);
    obj.edit27:setWidth(30);
    obj.edit27:setName("edit27");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.flowLayout8);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setVertTextAlign("center");
    obj.label59:setWidth(10);
    obj.label59:setText("X");
    obj.label59:setMargins({left = 5});
    obj.label59:setName("label59");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.flowLayout8);
    obj.edit28:setField("atributos.recursoMod");
    obj.edit28:setType("number");
    obj.edit28:setMin(0);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setHeight(20);
    obj.edit28:setWidth(30);
    obj.edit28:setMargins({left = 5});
    obj.edit28:setName("edit28");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.flowLayout8);
    obj.label60:setWidth(100);
    obj.label60:setField("atributos.recursoMax");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.flowLineBreak25 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak25:setParent(obj.flowLayout8);
    obj.flowLineBreak25:setName("flowLineBreak25");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.flowLayout8);
    obj.label61:setText("Vida");
    obj.label61:setWidth(70);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setHeight(20);
    obj.label61:setMargins({top = 5});
    obj.label61:setName("label61");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.flowLayout8);
    obj.edit29:setField("atributos.vida");
    obj.edit29:setType("number");
    obj.edit29:setMin(1);
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setHeight(20);
    obj.edit29:setWidth(30);
    obj.edit29:setName("edit29");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.flowLayout8);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setVertTextAlign("center");
    obj.label62:setWidth(10);
    obj.label62:setText("X");
    obj.label62:setMargins({left = 5});
    obj.label62:setName("label62");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.flowLayout8);
    obj.edit30:setField("atributos.vidaMod");
    obj.edit30:setType("number");
    obj.edit30:setMin(0);
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setHeight(20);
    obj.edit30:setWidth(30);
    obj.edit30:setMargins({left = 5});
    obj.edit30:setName("edit30");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.flowLayout8);
    obj.label63:setWidth(100);
    obj.label63:setField("atributos.vidaMax");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.flowLayout8);
    obj.label64:setField("atributos.vidaFormula");
    obj.label64:setVisible(false);
    obj.label64:setName("label64");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.flowLayout8);
    obj.button8:setText("VID");
    obj.button8:setWidth(50);
    obj.button8:setHeight(20);
    obj.button8:setName("button8");

    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.flowLayout1);
    obj.flowLayout9:setWidth(400);
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setName("flowLayout9");

    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.flowLayout9);
    obj.flowLayout10:setWidth(320);
    obj.flowLayout10:setAutoHeight(true);
    obj.flowLayout10:setName("flowLayout10");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.flowLayout10);
    obj.label65:setText("Armas");
    obj.label65:setAlign("client");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.flowLineBreak26 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak26:setParent(obj.flowLayout10);
    obj.flowLineBreak26:setName("flowLineBreak26");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.flowLayout10);
    obj.label66:setText("Ataque Total");
    obj.label66:setAlign("right");
    obj.label66:setName("label66");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.flowLayout10);
    obj.label67:setField("equipamento.ataqueTotal");
    obj.label67:setAlign("right");
    obj.label67:setName("label67");

    obj.flowLineBreak27 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak27:setParent(obj.flowLayout10);
    obj.flowLineBreak27:setName("flowLineBreak27");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.flowLayout10);
    obj.button9:setWidth(20);
    obj.button9:setHeight(20);
    obj.button9:setText("+");
    obj.button9:setName("button9");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.flowLayout10);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setWidth(150);
    obj.label68:setText("Nome");
    obj.label68:setName("label68");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.flowLayout10);
    obj.label69:setHorzTextAlign("center");
    obj.label69:setWidth(30);
    obj.label69:setText("P");
    obj.label69:setName("label69");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.flowLayout10);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setWidth(30);
    obj.label70:setText("Bônus");
    obj.label70:setName("label70");

    obj.flowLineBreak28 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak28:setParent(obj.flowLayout10);
    obj.flowLineBreak28:setName("flowLineBreak28");

    obj.rclArmas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclArmas:setParent(obj.flowLayout10);
    obj.rclArmas:setWidth(500);
    obj.rclArmas:setAutoHeight(true);
    obj.rclArmas:setName("rclArmas");
    obj.rclArmas:setField("equipamento.armas");
    obj.rclArmas:setTemplateForm("frmArma");

    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.flowLayout9);
    obj.flowLayout11:setLeft(320);
    obj.flowLayout11:setWidth(250);
    obj.flowLayout11:setAutoHeight(true);
    obj.flowLayout11:setName("flowLayout11");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.flowLayout11);
    obj.label71:setText("Armaduras");
    obj.label71:setAlign("client");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.flowLineBreak29 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak29:setParent(obj.flowLayout11);
    obj.flowLineBreak29:setName("flowLineBreak29");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.flowLayout11);
    obj.label72:setText("Defesa Total");
    obj.label72:setAlign("right");
    obj.label72:setName("label72");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.flowLayout11);
    obj.label73:setField("equipamento.defesaTotal");
    obj.label73:setAlign("right");
    obj.label73:setName("label73");

    obj.flowLineBreak30 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak30:setParent(obj.flowLayout11);
    obj.flowLineBreak30:setName("flowLineBreak30");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.flowLayout11);
    obj.button10:setWidth(20);
    obj.button10:setHeight(20);
    obj.button10:setText("+");
    obj.button10:setName("button10");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.flowLayout11);
    obj.label74:setHorzTextAlign("center");
    obj.label74:setWidth(150);
    obj.label74:setText("Nome");
    obj.label74:setName("label74");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.flowLayout11);
    obj.label75:setHorzTextAlign("center");
    obj.label75:setWidth(30);
    obj.label75:setText("Bônus");
    obj.label75:setName("label75");

    obj.flowLineBreak31 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak31:setParent(obj.flowLayout11);
    obj.flowLineBreak31:setName("flowLineBreak31");

    obj.rclArmaduras = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclArmaduras:setParent(obj.flowLayout11);
    obj.rclArmaduras:setWidth(320);
    obj.rclArmaduras:setAutoHeight(true);
    obj.rclArmaduras:setName("rclArmaduras");
    obj.rclArmaduras:setField("equipamento.armaduras");
    obj.rclArmaduras:setTemplateForm("frmArmadura");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Inventário");
    obj.tab2:setName("tab2");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.tab2);
    obj.richEdit1:setAlign("client");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setField("inventario");
    obj.richEdit1:setName("richEdit1");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("História");
    obj.tab3:setName("tab3");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.tab3);
    obj.richEdit2:setAlign("client");
    lfm_setPropAsString(obj.richEdit2, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit2, "defaultFontColor",  "white");
    obj.richEdit2:setField("historia");
    obj.richEdit2:setName("richEdit2");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Anotações");
    obj.tab4:setName("tab4");

    obj.richEdit3 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.tab4);
    obj.richEdit3:setAlign("client");
    lfm_setPropAsString(obj.richEdit3, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit3, "defaultFontColor",  "white");
    obj.richEdit3:setField("anotacoes");
    obj.richEdit3:setName("richEdit3");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Magias");
    obj.tab5:setName("tab5");

    obj.richEdit4 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit4:setParent(obj.tab5);
    obj.richEdit4:setAlign("client");
    lfm_setPropAsString(obj.richEdit4, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit4, "defaultFontColor",  "white");
    obj.richEdit4:setField("magias");
    obj.richEdit4:setName("richEdit4");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Habilidades");
    obj.tab6:setName("tab6");

    obj.tabControl2 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl2:setParent(obj.tab6);
    obj.tabControl2:setAlign("client");
    obj.tabControl2:setName("tabControl2");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl2);
    obj.tab7:setTitle("Habilidades");
    obj.tab7:setName("tab7");

    obj.flowLayout12 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.tab7);
    obj.flowLayout12:setAlign("client");
    obj.flowLayout12:setAutoHeight(true);
    obj.flowLayout12:setName("flowLayout12");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.flowLayout12);
    obj.button11:setHeight(20);
    obj.button11:setText("+");
    obj.button11:setWidth(20);
    obj.button11:setName("button11");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.flowLayout12);
    obj.label76:setHeight(20);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setText("Habilidades");
    obj.label76:setWidth(310);
    obj.label76:setName("label76");

    obj.flowLineBreak32 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak32:setParent(obj.flowLayout12);
    obj.flowLineBreak32:setName("flowLineBreak32");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.flowLayout12);
    obj.label77:setHeight(20);
    obj.label77:setHorzTextAlign("center");
    obj.label77:setMargins({left=5});
    obj.label77:setText("Nome");
    obj.label77:setWidth(200);
    obj.label77:setName("label77");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.flowLayout12);
    obj.label78:setHeight(20);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setMargins({left=5});
    obj.label78:setText("Dado");
    obj.label78:setWidth(70);
    obj.label78:setName("label78");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.flowLayout12);
    obj.label79:setHeight(20);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setMargins({left=5});
    obj.label79:setText("Mod");
    obj.label79:setWidth(30);
    obj.label79:setName("label79");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.flowLayout12);
    obj.label80:setHeight(20);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setMargins({left=5});
    obj.label80:setText("Custo");
    obj.label80:setWidth(30);
    obj.label80:setName("label80");

    obj.flowLineBreak33 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak33:setParent(obj.flowLayout12);
    obj.flowLineBreak33:setName("flowLineBreak33");

    obj.frmHabilidade = GUI.fromHandle(_obj_newObject("recordList"));
    obj.frmHabilidade:setParent(obj.flowLayout12);
    obj.frmHabilidade:setAutoHeight(true);
    obj.frmHabilidade:setField("habilidades");
    obj.frmHabilidade:setName("frmHabilidade");
    obj.frmHabilidade:setTemplateForm("frmHabilidade");
    obj.frmHabilidade:setWidth(500);

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl2);
    obj.tab8:setTitle("Perícias");
    obj.tab8:setName("tab8");

    obj.flowLayout13 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.tab8);
    obj.flowLayout13:setAlign("client");
    obj.flowLayout13:setAutoHeight(true);
    obj.flowLayout13:setMaxControlsPerLine(3);
    obj.flowLayout13:setName("flowLayout13");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.flowLayout13);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setText("Perícias");
    obj.label81:setAlign("top");
    obj.label81:setMargins({top=15});
    obj.label81:setName("label81");

    obj.flowLineBreak34 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak34:setParent(obj.flowLayout13);
    obj.flowLineBreak34:setName("flowLineBreak34");

    obj.flowLayout14 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout14:setParent(obj.flowLayout13);
    obj.flowLayout14:setHeight(20);
    obj.flowLayout14:setWidth(140);
    obj.flowLayout14:setName("flowLayout14");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.flowLayout14);
    obj.label82:setHeight(20);
    obj.label82:setHorzTextAlign("center");
    obj.label82:setText("Atletismo");
    obj.label82:setVertTextAlign("center");
    obj.label82:setWidth(100);
    obj.label82:setName("label82");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.flowLayout14);
    obj.edit31:setField("pericias.Atletismo");
    obj.edit31:setHeight(20);
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setMax(20);
    obj.edit31:setMin(0);
    obj.edit31:setType("number");
    obj.edit31:setWidth(20);
    obj.edit31:setName("edit31");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.flowLayout14);
    obj.button12:setHeight(20);
    obj.button12:setText("*");
    obj.button12:setWidth(20);
    obj.button12:setName("button12");

    obj.flowLayout15 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout15:setParent(obj.flowLayout13);
    obj.flowLayout15:setHeight(20);
    obj.flowLayout15:setWidth(140);
    obj.flowLayout15:setName("flowLayout15");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.flowLayout15);
    obj.label83:setHeight(20);
    obj.label83:setHorzTextAlign("center");
    obj.label83:setText("Acrobacia");
    obj.label83:setVertTextAlign("center");
    obj.label83:setWidth(100);
    obj.label83:setName("label83");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.flowLayout15);
    obj.edit32:setField("pericias.Acrobacia");
    obj.edit32:setHeight(20);
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setMax(20);
    obj.edit32:setMin(0);
    obj.edit32:setType("number");
    obj.edit32:setWidth(20);
    obj.edit32:setName("edit32");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.flowLayout15);
    obj.button13:setHeight(20);
    obj.button13:setText("*");
    obj.button13:setWidth(20);
    obj.button13:setName("button13");

    obj.flowLayout16 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout16:setParent(obj.flowLayout13);
    obj.flowLayout16:setHeight(20);
    obj.flowLayout16:setWidth(140);
    obj.flowLayout16:setName("flowLayout16");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.flowLayout16);
    obj.label84:setHeight(20);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setText("Arcanismo");
    obj.label84:setVertTextAlign("center");
    obj.label84:setWidth(100);
    obj.label84:setName("label84");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.flowLayout16);
    obj.edit33:setField("pericias.Arcanismo");
    obj.edit33:setHeight(20);
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setMax(20);
    obj.edit33:setMin(0);
    obj.edit33:setType("number");
    obj.edit33:setWidth(20);
    obj.edit33:setName("edit33");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.flowLayout16);
    obj.button14:setHeight(20);
    obj.button14:setText("*");
    obj.button14:setWidth(20);
    obj.button14:setName("button14");

    obj.flowLayout17 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout17:setParent(obj.flowLayout13);
    obj.flowLayout17:setHeight(20);
    obj.flowLayout17:setWidth(140);
    obj.flowLayout17:setName("flowLayout17");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.flowLayout17);
    obj.label85:setHeight(20);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setText("História");
    obj.label85:setVertTextAlign("center");
    obj.label85:setWidth(100);
    obj.label85:setName("label85");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.flowLayout17);
    obj.edit34:setField("pericias.Historia");
    obj.edit34:setHeight(20);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setMax(20);
    obj.edit34:setMin(0);
    obj.edit34:setType("number");
    obj.edit34:setWidth(20);
    obj.edit34:setName("edit34");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.flowLayout17);
    obj.button15:setHeight(20);
    obj.button15:setText("*");
    obj.button15:setWidth(20);
    obj.button15:setName("button15");

    obj.flowLayout18 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout18:setParent(obj.flowLayout13);
    obj.flowLayout18:setHeight(20);
    obj.flowLayout18:setWidth(140);
    obj.flowLayout18:setName("flowLayout18");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.flowLayout18);
    obj.label86:setHeight(20);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setText("Investigação");
    obj.label86:setVertTextAlign("center");
    obj.label86:setWidth(100);
    obj.label86:setName("label86");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.flowLayout18);
    obj.edit35:setField("pericias.Investigacao");
    obj.edit35:setHeight(20);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setMax(20);
    obj.edit35:setMin(0);
    obj.edit35:setType("number");
    obj.edit35:setWidth(20);
    obj.edit35:setName("edit35");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.flowLayout18);
    obj.button16:setHeight(20);
    obj.button16:setText("*");
    obj.button16:setWidth(20);
    obj.button16:setName("button16");

    obj.flowLayout19 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout19:setParent(obj.flowLayout13);
    obj.flowLayout19:setHeight(20);
    obj.flowLayout19:setWidth(140);
    obj.flowLayout19:setName("flowLayout19");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.flowLayout19);
    obj.label87:setHeight(20);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setText("Natureza");
    obj.label87:setVertTextAlign("center");
    obj.label87:setWidth(100);
    obj.label87:setName("label87");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.flowLayout19);
    obj.edit36:setField("pericias.Natureza");
    obj.edit36:setHeight(20);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setMax(20);
    obj.edit36:setMin(0);
    obj.edit36:setType("number");
    obj.edit36:setWidth(20);
    obj.edit36:setName("edit36");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.flowLayout19);
    obj.button17:setHeight(20);
    obj.button17:setText("*");
    obj.button17:setWidth(20);
    obj.button17:setName("button17");

    obj.flowLayout20 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout20:setParent(obj.flowLayout13);
    obj.flowLayout20:setHeight(20);
    obj.flowLayout20:setWidth(140);
    obj.flowLayout20:setName("flowLayout20");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.flowLayout20);
    obj.label88:setHeight(20);
    obj.label88:setHorzTextAlign("center");
    obj.label88:setText("Religião");
    obj.label88:setVertTextAlign("center");
    obj.label88:setWidth(100);
    obj.label88:setName("label88");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.flowLayout20);
    obj.edit37:setField("pericias.Religiao");
    obj.edit37:setHeight(20);
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setMax(20);
    obj.edit37:setMin(0);
    obj.edit37:setType("number");
    obj.edit37:setWidth(20);
    obj.edit37:setName("edit37");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.flowLayout20);
    obj.button18:setHeight(20);
    obj.button18:setText("*");
    obj.button18:setWidth(20);
    obj.button18:setName("button18");

    obj.flowLayout21 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout21:setParent(obj.flowLayout13);
    obj.flowLayout21:setHeight(20);
    obj.flowLayout21:setWidth(140);
    obj.flowLayout21:setName("flowLayout21");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.flowLayout21);
    obj.label89:setHeight(20);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setText("Adestrar Animais");
    obj.label89:setVertTextAlign("center");
    obj.label89:setWidth(100);
    obj.label89:setName("label89");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.flowLayout21);
    obj.edit38:setField("pericias.AdestrarAnimais");
    obj.edit38:setHeight(20);
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setMax(20);
    obj.edit38:setMin(0);
    obj.edit38:setType("number");
    obj.edit38:setWidth(20);
    obj.edit38:setName("edit38");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.flowLayout21);
    obj.button19:setHeight(20);
    obj.button19:setText("*");
    obj.button19:setWidth(20);
    obj.button19:setName("button19");

    obj.flowLayout22 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout22:setParent(obj.flowLayout13);
    obj.flowLayout22:setHeight(20);
    obj.flowLayout22:setWidth(140);
    obj.flowLayout22:setName("flowLayout22");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.flowLayout22);
    obj.label90:setHeight(20);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setText("Medicina");
    obj.label90:setVertTextAlign("center");
    obj.label90:setWidth(100);
    obj.label90:setName("label90");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.flowLayout22);
    obj.edit39:setField("pericias.Medicina");
    obj.edit39:setHeight(20);
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setMax(20);
    obj.edit39:setMin(0);
    obj.edit39:setType("number");
    obj.edit39:setWidth(20);
    obj.edit39:setName("edit39");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.flowLayout22);
    obj.button20:setHeight(20);
    obj.button20:setText("*");
    obj.button20:setWidth(20);
    obj.button20:setName("button20");

    obj.flowLayout23 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout23:setParent(obj.flowLayout13);
    obj.flowLayout23:setHeight(20);
    obj.flowLayout23:setWidth(140);
    obj.flowLayout23:setName("flowLayout23");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.flowLayout23);
    obj.label91:setHeight(20);
    obj.label91:setHorzTextAlign("center");
    obj.label91:setText("Atuação");
    obj.label91:setVertTextAlign("center");
    obj.label91:setWidth(100);
    obj.label91:setName("label91");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.flowLayout23);
    obj.edit40:setField("pericias.Atuacao");
    obj.edit40:setHeight(20);
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setMax(20);
    obj.edit40:setMin(0);
    obj.edit40:setType("number");
    obj.edit40:setWidth(20);
    obj.edit40:setName("edit40");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.flowLayout23);
    obj.button21:setHeight(20);
    obj.button21:setText("*");
    obj.button21:setWidth(20);
    obj.button21:setName("button21");

    obj.flowLayout24 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout24:setParent(obj.flowLayout13);
    obj.flowLayout24:setHeight(20);
    obj.flowLayout24:setWidth(140);
    obj.flowLayout24:setName("flowLayout24");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.flowLayout24);
    obj.label92:setHeight(20);
    obj.label92:setHorzTextAlign("center");
    obj.label92:setText("Sobrevivência");
    obj.label92:setVertTextAlign("center");
    obj.label92:setWidth(100);
    obj.label92:setName("label92");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.flowLayout24);
    obj.edit41:setField("pericias.Sobrevivencia");
    obj.edit41:setHeight(20);
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setMax(20);
    obj.edit41:setMin(0);
    obj.edit41:setType("number");
    obj.edit41:setWidth(20);
    obj.edit41:setName("edit41");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.flowLayout24);
    obj.button22:setHeight(20);
    obj.button22:setText("*");
    obj.button22:setWidth(20);
    obj.button22:setName("button22");

    obj.flowLayout25 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout25:setParent(obj.flowLayout13);
    obj.flowLayout25:setHeight(20);
    obj.flowLayout25:setWidth(140);
    obj.flowLayout25:setName("flowLayout25");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.flowLayout25);
    obj.label93:setHeight(20);
    obj.label93:setHorzTextAlign("center");
    obj.label93:setText("Percepção");
    obj.label93:setVertTextAlign("center");
    obj.label93:setWidth(100);
    obj.label93:setName("label93");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.flowLayout25);
    obj.edit42:setField("pericias.Percepcao");
    obj.edit42:setHeight(20);
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setMax(20);
    obj.edit42:setMin(0);
    obj.edit42:setType("number");
    obj.edit42:setWidth(20);
    obj.edit42:setName("edit42");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.flowLayout25);
    obj.button23:setHeight(20);
    obj.button23:setText("*");
    obj.button23:setWidth(20);
    obj.button23:setName("button23");

    obj.flowLayout26 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout26:setParent(obj.flowLayout13);
    obj.flowLayout26:setHeight(20);
    obj.flowLayout26:setWidth(140);
    obj.flowLayout26:setName("flowLayout26");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.flowLayout26);
    obj.label94:setHeight(20);
    obj.label94:setHorzTextAlign("center");
    obj.label94:setText("Furtividade");
    obj.label94:setVertTextAlign("center");
    obj.label94:setWidth(100);
    obj.label94:setName("label94");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.flowLayout26);
    obj.edit43:setField("pericias.Furtividade");
    obj.edit43:setHeight(20);
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setMax(20);
    obj.edit43:setMin(0);
    obj.edit43:setType("number");
    obj.edit43:setWidth(20);
    obj.edit43:setName("edit43");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.flowLayout26);
    obj.button24:setHeight(20);
    obj.button24:setText("*");
    obj.button24:setWidth(20);
    obj.button24:setName("button24");

    obj.flowLayout27 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout27:setParent(obj.flowLayout13);
    obj.flowLayout27:setHeight(20);
    obj.flowLayout27:setWidth(140);
    obj.flowLayout27:setName("flowLayout27");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.flowLayout27);
    obj.label95:setHeight(20);
    obj.label95:setHorzTextAlign("center");
    obj.label95:setText("Prestidigitação");
    obj.label95:setVertTextAlign("center");
    obj.label95:setWidth(100);
    obj.label95:setName("label95");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.flowLayout27);
    obj.edit44:setField("pericias.Prestidigitacao");
    obj.edit44:setHeight(20);
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setMax(20);
    obj.edit44:setMin(0);
    obj.edit44:setType("number");
    obj.edit44:setWidth(20);
    obj.edit44:setName("edit44");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.flowLayout27);
    obj.button25:setHeight(20);
    obj.button25:setText("*");
    obj.button25:setWidth(20);
    obj.button25:setName("button25");

    obj.flowLayout28 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout28:setParent(obj.flowLayout13);
    obj.flowLayout28:setHeight(20);
    obj.flowLayout28:setWidth(140);
    obj.flowLayout28:setName("flowLayout28");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.flowLayout28);
    obj.label96:setHeight(20);
    obj.label96:setHorzTextAlign("center");
    obj.label96:setText("Intuição");
    obj.label96:setVertTextAlign("center");
    obj.label96:setWidth(100);
    obj.label96:setName("label96");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.flowLayout28);
    obj.edit45:setField("pericias.Intuicao");
    obj.edit45:setHeight(20);
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setMax(20);
    obj.edit45:setMin(0);
    obj.edit45:setType("number");
    obj.edit45:setWidth(20);
    obj.edit45:setName("edit45");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.flowLayout28);
    obj.button26:setHeight(20);
    obj.button26:setText("*");
    obj.button26:setWidth(20);
    obj.button26:setName("button26");

    obj.flowLayout29 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout29:setParent(obj.flowLayout13);
    obj.flowLayout29:setHeight(20);
    obj.flowLayout29:setWidth(140);
    obj.flowLayout29:setName("flowLayout29");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.flowLayout29);
    obj.label97:setHeight(20);
    obj.label97:setHorzTextAlign("center");
    obj.label97:setText("Intimidação");
    obj.label97:setVertTextAlign("center");
    obj.label97:setWidth(100);
    obj.label97:setName("label97");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.flowLayout29);
    obj.edit46:setField("pericias.Intimidacao");
    obj.edit46:setHeight(20);
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setMax(20);
    obj.edit46:setMin(0);
    obj.edit46:setType("number");
    obj.edit46:setWidth(20);
    obj.edit46:setName("edit46");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.flowLayout29);
    obj.button27:setHeight(20);
    obj.button27:setText("*");
    obj.button27:setWidth(20);
    obj.button27:setName("button27");

    obj.flowLayout30 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout30:setParent(obj.flowLayout13);
    obj.flowLayout30:setHeight(20);
    obj.flowLayout30:setWidth(140);
    obj.flowLayout30:setName("flowLayout30");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.flowLayout30);
    obj.label98:setHeight(20);
    obj.label98:setHorzTextAlign("center");
    obj.label98:setText("Persuasão");
    obj.label98:setVertTextAlign("center");
    obj.label98:setWidth(100);
    obj.label98:setName("label98");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.flowLayout30);
    obj.edit47:setField("pericias.Persuasao");
    obj.edit47:setHeight(20);
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setMax(20);
    obj.edit47:setMin(0);
    obj.edit47:setType("number");
    obj.edit47:setWidth(20);
    obj.edit47:setName("edit47");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.flowLayout30);
    obj.button28:setHeight(20);
    obj.button28:setText("*");
    obj.button28:setWidth(20);
    obj.button28:setName("button28");

    obj.flowLayout31 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout31:setParent(obj.flowLayout13);
    obj.flowLayout31:setHeight(20);
    obj.flowLayout31:setWidth(140);
    obj.flowLayout31:setName("flowLayout31");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.flowLayout31);
    obj.label99:setHeight(20);
    obj.label99:setHorzTextAlign("center");
    obj.label99:setText("Enganação");
    obj.label99:setVertTextAlign("center");
    obj.label99:setWidth(100);
    obj.label99:setName("label99");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.flowLayout31);
    obj.edit48:setField("pericias.Enganacao");
    obj.edit48:setHeight(20);
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setMax(20);
    obj.edit48:setMin(0);
    obj.edit48:setType("number");
    obj.edit48:setWidth(20);
    obj.edit48:setName("edit48");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.flowLayout31);
    obj.button29:setHeight(20);
    obj.button29:setText("*");
    obj.button29:setWidth(20);
    obj.button29:setName("button29");

    obj.flowLineBreak35 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak35:setParent(obj.flowLayout13);
    obj.flowLineBreak35:setName("flowLineBreak35");

    obj.tab9 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl2);
    obj.tab9:setTitle("Idiomas");
    obj.tab9:setName("tab9");

    obj.flowLayout32 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout32:setParent(obj.tab9);
    obj.flowLayout32:setWidth(300);
    obj.flowLayout32:setAutoHeight(true);
    obj.flowLayout32:setName("flowLayout32");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.flowLayout32);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setText("Idiomas Conhecidos");
    obj.label100:setWidth(300);
    obj.label100:setName("label100");

    obj.flowLineBreak36 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak36:setParent(obj.flowLayout32);
    obj.flowLineBreak36:setName("flowLineBreak36");

    obj.flowLayout33 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout33:setParent(obj.flowLayout32);
    obj.flowLayout33:setHeight(20);
    obj.flowLayout33:setWidth(140);
    obj.flowLayout33:setName("flowLayout33");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.flowLayout33);
    obj.checkBox1:setField("anao");
    obj.checkBox1:setWidth(20);
    obj.checkBox1:setName("checkBox1");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.flowLayout33);
    obj.label101:setHeight(20);
    obj.label101:setHorzTextAlign("center");
    obj.label101:setText("Anão");
    obj.label101:setVertTextAlign("center");
    obj.label101:setWidth(100);
    obj.label101:setName("label101");

    obj.flowLayout34 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout34:setParent(obj.flowLayout32);
    obj.flowLayout34:setHeight(20);
    obj.flowLayout34:setWidth(140);
    obj.flowLayout34:setName("flowLayout34");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.flowLayout34);
    obj.checkBox2:setField("comum");
    obj.checkBox2:setWidth(20);
    obj.checkBox2:setName("checkBox2");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.flowLayout34);
    obj.label102:setHeight(20);
    obj.label102:setHorzTextAlign("center");
    obj.label102:setText("Comum");
    obj.label102:setVertTextAlign("center");
    obj.label102:setWidth(100);
    obj.label102:setName("label102");

    obj.flowLayout35 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout35:setParent(obj.flowLayout32);
    obj.flowLayout35:setHeight(20);
    obj.flowLayout35:setWidth(140);
    obj.flowLayout35:setName("flowLayout35");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.flowLayout35);
    obj.checkBox3:setField("elfico");
    obj.checkBox3:setWidth(20);
    obj.checkBox3:setName("checkBox3");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.flowLayout35);
    obj.label103:setHeight(20);
    obj.label103:setHorzTextAlign("center");
    obj.label103:setText("Elfico");
    obj.label103:setVertTextAlign("center");
    obj.label103:setWidth(100);
    obj.label103:setName("label103");

    obj.flowLayout36 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout36:setParent(obj.flowLayout32);
    obj.flowLayout36:setHeight(20);
    obj.flowLayout36:setWidth(140);
    obj.flowLayout36:setName("flowLayout36");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.flowLayout36);
    obj.checkBox4:setField("gigante");
    obj.checkBox4:setWidth(20);
    obj.checkBox4:setName("checkBox4");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.flowLayout36);
    obj.label104:setHeight(20);
    obj.label104:setHorzTextAlign("center");
    obj.label104:setText("Gigante");
    obj.label104:setVertTextAlign("center");
    obj.label104:setWidth(100);
    obj.label104:setName("label104");

    obj.flowLayout37 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout37:setParent(obj.flowLayout32);
    obj.flowLayout37:setHeight(20);
    obj.flowLayout37:setWidth(140);
    obj.flowLayout37:setName("flowLayout37");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.flowLayout37);
    obj.checkBox5:setField("gnomico");
    obj.checkBox5:setWidth(20);
    obj.checkBox5:setName("checkBox5");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.flowLayout37);
    obj.label105:setHeight(20);
    obj.label105:setHorzTextAlign("center");
    obj.label105:setText("Gnômico");
    obj.label105:setVertTextAlign("center");
    obj.label105:setWidth(100);
    obj.label105:setName("label105");

    obj.flowLayout38 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout38:setParent(obj.flowLayout32);
    obj.flowLayout38:setHeight(20);
    obj.flowLayout38:setWidth(140);
    obj.flowLayout38:setName("flowLayout38");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.flowLayout38);
    obj.checkBox6:setField("goblin");
    obj.checkBox6:setWidth(20);
    obj.checkBox6:setName("checkBox6");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.flowLayout38);
    obj.label106:setHeight(20);
    obj.label106:setHorzTextAlign("center");
    obj.label106:setText("Goblin");
    obj.label106:setVertTextAlign("center");
    obj.label106:setWidth(100);
    obj.label106:setName("label106");

    obj.flowLayout39 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout39:setParent(obj.flowLayout32);
    obj.flowLayout39:setHeight(20);
    obj.flowLayout39:setWidth(140);
    obj.flowLayout39:setName("flowLayout39");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.flowLayout39);
    obj.checkBox7:setField("halfling");
    obj.checkBox7:setWidth(20);
    obj.checkBox7:setName("checkBox7");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.flowLayout39);
    obj.label107:setHeight(20);
    obj.label107:setHorzTextAlign("center");
    obj.label107:setText("Halfling");
    obj.label107:setVertTextAlign("center");
    obj.label107:setWidth(100);
    obj.label107:setName("label107");

    obj.flowLayout40 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout40:setParent(obj.flowLayout32);
    obj.flowLayout40:setHeight(20);
    obj.flowLayout40:setWidth(140);
    obj.flowLayout40:setName("flowLayout40");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.flowLayout40);
    obj.checkBox8:setField("orc");
    obj.checkBox8:setWidth(20);
    obj.checkBox8:setName("checkBox8");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.flowLayout40);
    obj.label108:setHeight(20);
    obj.label108:setHorzTextAlign("center");
    obj.label108:setText("Orc");
    obj.label108:setVertTextAlign("center");
    obj.label108:setWidth(100);
    obj.label108:setName("label108");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.flowLayout32);
    obj.label109:setHorzTextAlign("center");
    obj.label109:setText("Idiomas Exóticos");
    obj.label109:setWidth(300);
    obj.label109:setName("label109");

    obj.flowLayout41 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout41:setParent(obj.flowLayout32);
    obj.flowLayout41:setHeight(20);
    obj.flowLayout41:setWidth(140);
    obj.flowLayout41:setName("flowLayout41");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.flowLayout41);
    obj.checkBox9:setField("abissal");
    obj.checkBox9:setWidth(20);
    obj.checkBox9:setName("checkBox9");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.flowLayout41);
    obj.label110:setHeight(20);
    obj.label110:setHorzTextAlign("center");
    obj.label110:setText("Abissal");
    obj.label110:setVertTextAlign("center");
    obj.label110:setWidth(100);
    obj.label110:setName("label110");

    obj.flowLayout42 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout42:setParent(obj.flowLayout32);
    obj.flowLayout42:setHeight(20);
    obj.flowLayout42:setWidth(140);
    obj.flowLayout42:setName("flowLayout42");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.flowLayout42);
    obj.checkBox10:setField("Celestial");
    obj.checkBox10:setWidth(20);
    obj.checkBox10:setName("checkBox10");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.flowLayout42);
    obj.label111:setHeight(20);
    obj.label111:setHorzTextAlign("center");
    obj.label111:setText("Celestial");
    obj.label111:setVertTextAlign("center");
    obj.label111:setWidth(100);
    obj.label111:setName("label111");

    obj.flowLayout43 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout43:setParent(obj.flowLayout32);
    obj.flowLayout43:setHeight(20);
    obj.flowLayout43:setWidth(140);
    obj.flowLayout43:setName("flowLayout43");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.flowLayout43);
    obj.checkBox11:setField("draconico");
    obj.checkBox11:setWidth(20);
    obj.checkBox11:setName("checkBox11");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.flowLayout43);
    obj.label112:setHeight(20);
    obj.label112:setHorzTextAlign("center");
    obj.label112:setText("Dracônico");
    obj.label112:setVertTextAlign("center");
    obj.label112:setWidth(100);
    obj.label112:setName("label112");

    obj.flowLayout44 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout44:setParent(obj.flowLayout32);
    obj.flowLayout44:setHeight(20);
    obj.flowLayout44:setWidth(140);
    obj.flowLayout44:setName("flowLayout44");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.flowLayout44);
    obj.checkBox12:setField("infernal");
    obj.checkBox12:setWidth(20);
    obj.checkBox12:setName("checkBox12");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.flowLayout44);
    obj.label113:setHeight(20);
    obj.label113:setHorzTextAlign("center");
    obj.label113:setText("Infernal");
    obj.label113:setVertTextAlign("center");
    obj.label113:setWidth(100);
    obj.label113:setName("label113");

    obj.flowLayout45 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout45:setParent(obj.flowLayout32);
    obj.flowLayout45:setHeight(20);
    obj.flowLayout45:setWidth(140);
    obj.flowLayout45:setName("flowLayout45");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.flowLayout45);
    obj.checkBox13:setField("primordial");
    obj.checkBox13:setWidth(20);
    obj.checkBox13:setName("checkBox13");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.flowLayout45);
    obj.label114:setHeight(20);
    obj.label114:setHorzTextAlign("center");
    obj.label114:setText("Primordial");
    obj.label114:setVertTextAlign("center");
    obj.label114:setWidth(100);
    obj.label114:setName("label114");

    obj.flowLayout46 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout46:setParent(obj.flowLayout32);
    obj.flowLayout46:setHeight(20);
    obj.flowLayout46:setWidth(140);
    obj.flowLayout46:setName("flowLayout46");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.flowLayout46);
    obj.checkBox14:setField("silvestre");
    obj.checkBox14:setWidth(20);
    obj.checkBox14:setName("checkBox14");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.flowLayout46);
    obj.label115:setHeight(20);
    obj.label115:setHorzTextAlign("center");
    obj.label115:setText("Silvestre");
    obj.label115:setVertTextAlign("center");
    obj.label115:setWidth(100);
    obj.label115:setName("label115");

    obj.flowLayout47 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout47:setParent(obj.flowLayout32);
    obj.flowLayout47:setHeight(20);
    obj.flowLayout47:setWidth(140);
    obj.flowLayout47:setName("flowLayout47");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.flowLayout47);
    obj.checkBox15:setField("subcomum");
    obj.checkBox15:setWidth(20);
    obj.checkBox15:setName("checkBox15");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.flowLayout47);
    obj.label116:setHeight(20);
    obj.label116:setHorzTextAlign("center");
    obj.label116:setText("Subcomum");
    obj.label116:setVertTextAlign("center");
    obj.label116:setWidth(100);
    obj.label116:setName("label116");

    obj.flowLayout48 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout48:setParent(obj.flowLayout32);
    obj.flowLayout48:setHeight(20);
    obj.flowLayout48:setWidth(140);
    obj.flowLayout48:setName("flowLayout48");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.flowLayout48);
    obj.checkBox16:setField("subterrâneo");
    obj.checkBox16:setWidth(20);
    obj.checkBox16:setName("checkBox16");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.flowLayout48);
    obj.label117:setHeight(20);
    obj.label117:setHorzTextAlign("center");
    obj.label117:setText("Subterrâneo");
    obj.label117:setVertTextAlign("center");
    obj.label117:setWidth(100);
    obj.label117:setName("label117");

    obj.flowLineBreak37 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak37:setParent(obj.flowLayout32);
    obj.flowLineBreak37:setName("flowLineBreak37");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.flowLayout32);
    obj.label118:setHorzTextAlign("center");
    obj.label118:setText("Idiomas Adicionais");
    obj.label118:setWidth(300);
    obj.label118:setName("label118");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.flowLayout32);
    obj.button30:setWidth(20);
    obj.button30:setHeight(20);
    obj.button30:setText("+");
    obj.button30:setName("button30");

    obj.flowLineBreak38 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak38:setParent(obj.flowLayout32);
    obj.flowLineBreak38:setName("flowLineBreak38");

    obj.rclIdiomasAdicionais = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclIdiomasAdicionais:setParent(obj.flowLayout32);
    obj.rclIdiomasAdicionais:setAutoHeight(true);
    obj.rclIdiomasAdicionais:setField("idomas.adicionais");
    obj.rclIdiomasAdicionais:setName("rclIdiomasAdicionais");
    obj.rclIdiomasAdicionais:setTemplateForm("frmIdioma");
    obj.rclIdiomasAdicionais:setWidth(500);

    obj.tab10 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab10:setParent(obj.tabControl1);
    obj.tab10:setTitle("Profissão");
    obj.tab10:setName("tab10");

    obj.richEdit5 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit5:setParent(obj.tab10);
    obj.richEdit5:setAlign("client");
    lfm_setPropAsString(obj.richEdit5, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit5, "defaultFontColor",  "white");
    obj.richEdit5:setField("profissao");
    obj.richEdit5:setName("richEdit5");

    obj.tab11 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab11:setParent(obj.tabControl1);
    obj.tab11:setTitle("Raça");
    obj.tab11:setName("tab11");

    obj.richEdit6 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit6:setParent(obj.tab11);
    obj.richEdit6:setAlign("client");
    lfm_setPropAsString(obj.richEdit6, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit6, "defaultFontColor",  "white");
    obj.richEdit6:setField("racaTxt");
    obj.richEdit6:setName("richEdit6");

    obj.tab12 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab12:setParent(obj.tabControl1);
    obj.tab12:setTitle("Caracteristicas");
    obj.tab12:setName("tab12");

    obj.flowLayout49 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout49:setParent(obj.tab12);
    obj.flowLayout49:setAlign("client");
    obj.flowLayout49:setMargins({left=10, top=15});
    obj.flowLayout49:setName("flowLayout49");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.flowLayout49);
    obj.rectangle2:setColor("Transparent");
    obj.rectangle2:setHeight(600);
    obj.rectangle2:setMargins({left = 2, right = 2, top = 2, bottom = 2});
    obj.rectangle2:setStrokeColor("black");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setWidth(400);
    obj.rectangle2:setName("rectangle2");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.rectangle2);
    obj.label119:setAlign("client");
    obj.label119:setHorzTextAlign("center");
    obj.label119:setText("Personagem Completo");
    obj.label119:setVertTextAlign("center");
    obj.label119:setName("label119");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.rectangle2);
    obj.image5:setCenter(false);
    obj.image5:setEditable(true);
    obj.image5:setField("imagemDoPersonagemCorpo");
    obj.image5:setHeight(600);
    obj.image5:setStyle("proportional");
    obj.image5:setWidth(400);
    obj.image5:setName("image5");

    obj.flowLayout50 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout50:setParent(obj.flowLayout49);
    obj.flowLayout50:setHeight(600);
    obj.flowLayout50:setWidth(400);
    obj.flowLayout50:setName("flowLayout50");

    obj.flowLayout51 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout51:setParent(obj.flowLayout50);
    obj.flowLayout51:setHeight(20);
    obj.flowLayout51:setWidth(200);
    obj.flowLayout51:setName("flowLayout51");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.flowLayout51);
    obj.label120:setAutoSize(true);
    obj.label120:setHeight(20);
    obj.label120:setHorzTextAlign("center");
    obj.label120:setText("Idade");
    obj.label120:setWidth(95);
    obj.label120:setName("label120");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.flowLayout51);
    obj.edit49:setField("idade");
    obj.edit49:setHeight(20);
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setMargins({left=5});
    obj.edit49:setWidth(100);
    obj.edit49:setName("edit49");

    obj.flowLayout52 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout52:setParent(obj.flowLayout50);
    obj.flowLayout52:setHeight(20);
    obj.flowLayout52:setWidth(200);
    obj.flowLayout52:setName("flowLayout52");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.flowLayout52);
    obj.label121:setAutoSize(true);
    obj.label121:setHeight(20);
    obj.label121:setHorzTextAlign("center");
    obj.label121:setText("Altura");
    obj.label121:setWidth(95);
    obj.label121:setName("label121");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.flowLayout52);
    obj.edit50:setField("altura");
    obj.edit50:setHeight(20);
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setMargins({left=5});
    obj.edit50:setWidth(100);
    obj.edit50:setName("edit50");

    obj.flowLayout53 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout53:setParent(obj.flowLayout50);
    obj.flowLayout53:setHeight(20);
    obj.flowLayout53:setWidth(200);
    obj.flowLayout53:setName("flowLayout53");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.flowLayout53);
    obj.label122:setAutoSize(true);
    obj.label122:setHeight(20);
    obj.label122:setHorzTextAlign("center");
    obj.label122:setText("Cor dos Olhos");
    obj.label122:setWidth(95);
    obj.label122:setName("label122");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.flowLayout53);
    obj.edit51:setField("corOlhos");
    obj.edit51:setHeight(20);
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setMargins({left=5});
    obj.edit51:setWidth(100);
    obj.edit51:setName("edit51");

    obj.flowLayout54 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout54:setParent(obj.flowLayout50);
    obj.flowLayout54:setHeight(20);
    obj.flowLayout54:setWidth(200);
    obj.flowLayout54:setName("flowLayout54");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.flowLayout54);
    obj.label123:setAutoSize(true);
    obj.label123:setHeight(20);
    obj.label123:setHorzTextAlign("center");
    obj.label123:setText("Cor da Pele");
    obj.label123:setWidth(95);
    obj.label123:setName("label123");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.flowLayout54);
    obj.edit52:setField("CorPele");
    obj.edit52:setHeight(20);
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setMargins({left=5});
    obj.edit52:setWidth(100);
    obj.edit52:setName("edit52");

    obj.flowLayout55 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout55:setParent(obj.flowLayout50);
    obj.flowLayout55:setHeight(20);
    obj.flowLayout55:setWidth(200);
    obj.flowLayout55:setName("flowLayout55");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.flowLayout55);
    obj.label124:setAutoSize(true);
    obj.label124:setHeight(20);
    obj.label124:setHorzTextAlign("center");
    obj.label124:setText("Cor dos Cabelos");
    obj.label124:setWidth(95);
    obj.label124:setName("label124");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.flowLayout55);
    obj.edit53:setField("corCabelos");
    obj.edit53:setHeight(20);
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setMargins({left=5});
    obj.edit53:setWidth(100);
    obj.edit53:setName("edit53");

    obj.flowLayout56 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout56:setParent(obj.flowLayout50);
    obj.flowLayout56:setHeight(20);
    obj.flowLayout56:setWidth(200);
    obj.flowLayout56:setName("flowLayout56");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.flowLayout56);
    obj.label125:setAutoSize(true);
    obj.label125:setHeight(20);
    obj.label125:setHorzTextAlign("center");
    obj.label125:setText("Peso");
    obj.label125:setWidth(95);
    obj.label125:setName("label125");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.flowLayout56);
    obj.edit54:setField("peso");
    obj.edit54:setHeight(20);
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setMargins({left=5});
    obj.edit54:setWidth(100);
    obj.edit54:setName("edit54");

    obj.flowLineBreak39 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak39:setParent(obj.flowLayout50);
    obj.flowLineBreak39:setName("flowLineBreak39");

    obj.flowLayout57 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout57:setParent(obj.flowLayout50);
    obj.flowLayout57:setHeight(320);
    obj.flowLayout57:setMargins({left=10, top=5});
    obj.flowLayout57:setWidth(390);
    obj.flowLayout57:setName("flowLayout57");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.flowLayout57);
    obj.label126:setAutoSize(true);
    obj.label126:setHeight(20);
    obj.label126:setHorzTextAlign("center");
    obj.label126:setText("Descrição");
    obj.label126:setWidth(390);
    obj.label126:setName("label126");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.flowLayout57);
    obj.textEditor1:setField("descricao");
    obj.textEditor1:setHeight(300);
    obj.textEditor1:setMargins({left = 2, right = 2, top = 2, bottom = 2});
    obj.textEditor1:setWidth(390);
    obj.textEditor1:setName("textEditor1");

    obj.tab13 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab13:setParent(obj.tabControl1);
    obj.tab13:setTitle("Personalidade");
    obj.tab13:setName("tab13");

    obj.tabControl3 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl3:setParent(obj.tab13);
    obj.tabControl3:setAlign("client");
    obj.tabControl3:setName("tabControl3");

    obj.tab14 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab14:setParent(obj.tabControl3);
    obj.tab14:setTitle("Antecedente");
    obj.tab14:setName("tab14");

    obj.richEdit7 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit7:setParent(obj.tab14);
    obj.richEdit7:setAlign("client");
    lfm_setPropAsString(obj.richEdit7, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit7, "defaultFontColor",  "white");
    obj.richEdit7:setField("antecedente");
    obj.richEdit7:setName("richEdit7");

    obj.tab15 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab15:setParent(obj.tabControl3);
    obj.tab15:setTitle("Personalidade");
    obj.tab15:setName("tab15");

    obj.richEdit8 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit8:setParent(obj.tab15);
    obj.richEdit8:setAlign("client");
    lfm_setPropAsString(obj.richEdit8, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit8, "defaultFontColor",  "white");
    obj.richEdit8:setField("personalidades");
    obj.richEdit8:setName("richEdit8");

    obj.tab16 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab16:setParent(obj.tabControl3);
    obj.tab16:setTitle("Ideais");
    obj.tab16:setName("tab16");

    obj.richEdit9 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit9:setParent(obj.tab16);
    obj.richEdit9:setAlign("client");
    lfm_setPropAsString(obj.richEdit9, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit9, "defaultFontColor",  "white");
    obj.richEdit9:setField("ideais");
    obj.richEdit9:setName("richEdit9");

    obj.tab17 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab17:setParent(obj.tabControl3);
    obj.tab17:setTitle("Fraquezas");
    obj.tab17:setName("tab17");

    obj.richEdit10 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit10:setParent(obj.tab17);
    obj.richEdit10:setAlign("client");
    lfm_setPropAsString(obj.richEdit10, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit10, "defaultFontColor",  "white");
    obj.richEdit10:setField("fraquezas");
    obj.richEdit10:setName("richEdit10");

    obj.tab18 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab18:setParent(obj.tabControl3);
    obj.tab18:setTitle("Vínculos");
    obj.tab18:setName("tab18");

    obj.richEdit11 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit11:setParent(obj.tab18);
    obj.richEdit11:setAlign("client");
    lfm_setPropAsString(obj.richEdit11, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit11, "defaultFontColor",  "white");
    obj.richEdit11:setField("vinculos");
    obj.richEdit11:setName("richEdit11");

    obj.tab19 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab19:setParent(obj.tabControl3);
    obj.tab19:setTitle("Divindade");
    obj.tab19:setName("tab19");

    obj.richEdit12 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit12:setParent(obj.tab19);
    obj.richEdit12:setAlign("client");
    lfm_setPropAsString(obj.richEdit12, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit12, "defaultFontColor",  "white");
    obj.richEdit12:setField("divindade");
    obj.richEdit12:setName("richEdit12");

    obj.tab20 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab20:setParent(obj.tabControl1);
    obj.tab20:setTitle("Classe");
    obj.tab20:setName("tab20");

    obj.richEdit13 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit13:setParent(obj.tab20);
    obj.richEdit13:setAlign("client");
    lfm_setPropAsString(obj.richEdit13, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit13, "defaultFontColor",  "white");
    obj.richEdit13:setField("classeTxt");
    obj.richEdit13:setName("richEdit13");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'nivel', 'experienciaAtual','desejo'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'atributos.ataque', 'atributos.ataqueMod'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setFields({'atributos.defesa', 'atributos.defesaMod'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setFields({'atributos.magia', 'atributos.magiaMod'});
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setFields({'atributos.resistenciaMagica', 'atributos.resistenciaMagicaMod'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setField("atributos.sorte");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setFields({'atributos.agilidade', 'atributos.agilidadeMod'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj);
    obj.dataLink8:setField("atributos.vida");
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj);
    obj.dataLink9:setField("atributos.recurso");
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj);
    obj.dataLink10:setField("tendencia.moralidade");
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj);
    obj.dataLink11:setField("tendencia.lealdade");
    obj.dataLink11:setName("dataLink11");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            initialize(sheet)
        end, obj);

    obj._e_event1 = obj.progressBar1:addEventListener("onDblClick",
        function (_)
            self.setExperienciaPopup:setNodeObject(sheet); self.setExperienciaPopup:show(); setExpPopup(sheet); self.experienciaOp:setFocus();
        end, obj);

    obj._e_event2 = obj.setExperienciaPopup:addEventListener("onClose",
        function (_, canceled)
            expChange(sheet);
        end, obj);

    obj._e_event3 = obj.experienciaOp:addEventListener("onKeyDown",
        function (_, event)
            
            							if(event.keyCode==13) then
            								self.endExpOp:setFocus();
            								self.setExperienciaPopup:closePopup();
            							end;
        end, obj);

    obj._e_event4 = obj.endExpOp:addEventListener("onClick",
        function (_)
            self.setExperienciaPopup:closePopup();
        end, obj);

    obj._e_event5 = obj.button1:addEventListener("onClick",
        function (_)
            rolarIniciativa(sheet);
        end, obj);

    obj._e_event6 = obj.progressBar2:addEventListener("onDblClick",
        function (_)
            self.setVidaPopup:setNodeObject(sheet); self.setVidaPopup:show(); setVidaPopup(sheet); self.vidaOp:setFocus();
        end, obj);

    obj._e_event7 = obj.setVidaPopup:addEventListener("onClose",
        function (_, canceled)
            changeBarraVida(sheet);
        end, obj);

    obj._e_event8 = obj.vidaOp:addEventListener("onKeyDown",
        function (_, event)
            
            						if(event.keyCode==13) then
            							self.endVidaOp:setFocus();
            							self.setVidaPopup:closePopup();
            						end;
        end, obj);

    obj._e_event9 = obj.endVidaOp:addEventListener("onClick",
        function (_)
            self.setVidaPopup:closePopup();
        end, obj);

    obj._e_event10 = obj.progressBar3:addEventListener("onDblClick",
        function (_)
            self.setRecursoPopup:setNodeObject(sheet); self.setRecursoPopup:show(); setRecursoPopup(sheet); self.recursoOp:setFocus();
        end, obj);

    obj._e_event11 = obj.setRecursoPopup:addEventListener("onClose",
        function (_, canceled)
            changeBarraRecurso(sheet);
        end, obj);

    obj._e_event12 = obj.recursoOp:addEventListener("onKeyDown",
        function (_, event)
            
            						if(event.keyCode==13) then
            							self.endRecursoOp:setFocus();
            							self.setRecursoPopup:closePopup();
            						end;
        end, obj);

    obj._e_event13 = obj.endRecursoOp:addEventListener("onClick",
        function (_)
            self.setRecursoPopup:closePopup();
        end, obj);

    obj._e_event14 = obj.progressBar4:addEventListener("onDblClick",
        function (_)
            self.setDesejoPopup:setNodeObject(sheet); self.setDesejoPopup:show(); setDesejoPopup(sheet); self.desejoOp:setFocus();
        end, obj);

    obj._e_event15 = obj.setDesejoPopup:addEventListener("onClose",
        function (_, canceled)
            changeBarraDesejo(sheet);
        end, obj);

    obj._e_event16 = obj.desejoOp:addEventListener("onKeyDown",
        function (_, event)
            
            						if(event.keyCode==13) then
            							self.endDesejoOp:setFocus();
            							self.setDesejoPopup:closePopup();
            						end;
        end, obj);

    obj._e_event17 = obj.endDesejoOp:addEventListener("onClick",
        function (_)
            self.setDesejoPopup:closePopup();
        end, obj);

    obj._e_event18 = obj.button2:addEventListener("onClick",
        function (_)
            rolarAtaque(sheet);
        end, obj);

    obj._e_event19 = obj.button3:addEventListener("onClick",
        function (_)
            rolarDefesa(sheet);
        end, obj);

    obj._e_event20 = obj.button4:addEventListener("onClick",
        function (_)
            rolarAgilidade(sheet);
        end, obj);

    obj._e_event21 = obj.button5:addEventListener("onClick",
        function (_)
            rolarSorte(sheet);
        end, obj);

    obj._e_event22 = obj.button6:addEventListener("onClick",
        function (_)
            rolarMagia(sheet);
        end, obj);

    obj._e_event23 = obj.button7:addEventListener("onClick",
        function (_)
            rolarResistenciaMagica(sheet);
        end, obj);

    obj._e_event24 = obj.button8:addEventListener("onClick",
        function (_)
            rolarVida(sheet);
        end, obj);

    obj._e_event25 = obj.button9:addEventListener("onClick",
        function (_)
            self.rclArmas:append();
        end, obj);

    obj._e_event26 = obj.button10:addEventListener("onClick",
        function (_)
            self.rclArmaduras:append();
        end, obj);

    obj._e_event27 = obj.button11:addEventListener("onClick",
        function (_)
            self.frmHabilidade:append();
        end, obj);

    obj._e_event28 = obj.button12:addEventListener("onClick",
        function (_)
            rolarPericia(sheet, 'Atletismo');
        end, obj);

    obj._e_event29 = obj.button13:addEventListener("onClick",
        function (_)
            rolarPericia(sheet, 'Acrobacia');
        end, obj);

    obj._e_event30 = obj.button14:addEventListener("onClick",
        function (_)
            rolarPericia(sheet, 'Arcanismo');
        end, obj);

    obj._e_event31 = obj.button15:addEventListener("onClick",
        function (_)
            rolarPericia(sheet, 'História');
        end, obj);

    obj._e_event32 = obj.button16:addEventListener("onClick",
        function (_)
            rolarPericia(sheet, 'Investigação');
        end, obj);

    obj._e_event33 = obj.button17:addEventListener("onClick",
        function (_)
            rolarPericia(sheet, 'Natureza');
        end, obj);

    obj._e_event34 = obj.button18:addEventListener("onClick",
        function (_)
            rolarPericia(sheet, 'Religião');
        end, obj);

    obj._e_event35 = obj.button19:addEventListener("onClick",
        function (_)
            rolarPericia(sheet, 'Adestrar Animais');
        end, obj);

    obj._e_event36 = obj.button20:addEventListener("onClick",
        function (_)
            rolarPericia(sheet, 'Medicina');
        end, obj);

    obj._e_event37 = obj.button21:addEventListener("onClick",
        function (_)
            rolarPericia(sheet, 'Atuação');
        end, obj);

    obj._e_event38 = obj.button22:addEventListener("onClick",
        function (_)
            rolarPericia(sheet, 'Sobrevivência');
        end, obj);

    obj._e_event39 = obj.button23:addEventListener("onClick",
        function (_)
            rolarPericia(sheet, 'Percepção');
        end, obj);

    obj._e_event40 = obj.button24:addEventListener("onClick",
        function (_)
            rolarPericia(sheet, 'Furtividade');
        end, obj);

    obj._e_event41 = obj.button25:addEventListener("onClick",
        function (_)
            rolarPericia(sheet, 'Prestidigitação');
        end, obj);

    obj._e_event42 = obj.button26:addEventListener("onClick",
        function (_)
            rolarPericia(sheet, 'Intuição');
        end, obj);

    obj._e_event43 = obj.button27:addEventListener("onClick",
        function (_)
            rolarPericia(sheet, 'Intimidação');
        end, obj);

    obj._e_event44 = obj.button28:addEventListener("onClick",
        function (_)
            rolarPericia(sheet, 'Persuasão');
        end, obj);

    obj._e_event45 = obj.button29:addEventListener("onClick",
        function (_)
            rolarPericia(sheet, 'Enganação');
        end, obj);

    obj._e_event46 = obj.button30:addEventListener("onClick",
        function (_)
            self.rclIdiomasAdicionais:append();
        end, obj);

    obj._e_event47 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateBase(sheet);
        end, obj);

    obj._e_event48 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateAtaque(sheet);
        end, obj);

    obj._e_event49 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateDefesa(sheet);
        end, obj);

    obj._e_event50 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateMagia(sheet);
        end, obj);

    obj._e_event51 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateResistenciaMagica(sheet);
        end, obj);

    obj._e_event52 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateSorte(sheet);
        end, obj);

    obj._e_event53 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateAgilidade(sheet);
        end, obj);

    obj._e_event54 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateVida(sheet);
        end, obj);

    obj._e_event55 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateRecurso(sheet);
        end, obj);

    obj._e_event56 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateMoralidade(sheet);
        end, obj);

    obj._e_event57 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            updateLealdade(sheet);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event57);
        __o_rrpgObjs.removeEventListenerById(self._e_event56);
        __o_rrpgObjs.removeEventListenerById(self._e_event55);
        __o_rrpgObjs.removeEventListenerById(self._e_event54);
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.flowLayout24 ~= nil then self.flowLayout24:destroy(); self.flowLayout24 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.flowLayout47 ~= nil then self.flowLayout47:destroy(); self.flowLayout47 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.flowLineBreak19 ~= nil then self.flowLineBreak19:destroy(); self.flowLineBreak19 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.flowLayout19 ~= nil then self.flowLayout19:destroy(); self.flowLayout19 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.tab16 ~= nil then self.tab16:destroy(); self.tab16 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.richEdit10 ~= nil then self.richEdit10:destroy(); self.richEdit10 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.flowLayout43 ~= nil then self.flowLayout43:destroy(); self.flowLayout43 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.richEdit12 ~= nil then self.richEdit12:destroy(); self.richEdit12 = nil; end;
        if self.flowLineBreak18 ~= nil then self.flowLineBreak18:destroy(); self.flowLineBreak18 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.flowLayout16 ~= nil then self.flowLayout16:destroy(); self.flowLayout16 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.tab13 ~= nil then self.tab13:destroy(); self.tab13 = nil; end;
        if self.flowLayout44 ~= nil then self.flowLayout44:destroy(); self.flowLayout44 = nil; end;
        if self.flowLayout30 ~= nil then self.flowLayout30:destroy(); self.flowLayout30 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.vidaOp ~= nil then self.vidaOp:destroy(); self.vidaOp = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.setVidaPopup ~= nil then self.setVidaPopup:destroy(); self.setVidaPopup = nil; end;
        if self.flowLineBreak6 ~= nil then self.flowLineBreak6:destroy(); self.flowLineBreak6 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rclIdiomasAdicionais ~= nil then self.rclIdiomasAdicionais:destroy(); self.rclIdiomasAdicionais = nil; end;
        if self.flowLayout23 ~= nil then self.flowLayout23:destroy(); self.flowLayout23 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.flowLineBreak27 ~= nil then self.flowLineBreak27:destroy(); self.flowLineBreak27 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.flowLayout33 ~= nil then self.flowLayout33:destroy(); self.flowLayout33 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.flowLineBreak37 ~= nil then self.flowLineBreak37:destroy(); self.flowLineBreak37 = nil; end;
        if self.flowLineBreak35 ~= nil then self.flowLineBreak35:destroy(); self.flowLineBreak35 = nil; end;
        if self.tab17 ~= nil then self.tab17:destroy(); self.tab17 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.tab15 ~= nil then self.tab15:destroy(); self.tab15 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.flowLayout14 ~= nil then self.flowLayout14:destroy(); self.flowLayout14 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.flowLayout31 ~= nil then self.flowLayout31:destroy(); self.flowLayout31 = nil; end;
        if self.tab10 ~= nil then self.tab10:destroy(); self.tab10 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.richEdit3 ~= nil then self.richEdit3:destroy(); self.richEdit3 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.tab18 ~= nil then self.tab18:destroy(); self.tab18 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.richEdit8 ~= nil then self.richEdit8:destroy(); self.richEdit8 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.flowLayout32 ~= nil then self.flowLayout32:destroy(); self.flowLayout32 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.flowLayout18 ~= nil then self.flowLayout18:destroy(); self.flowLayout18 = nil; end;
        if self.flowLayout51 ~= nil then self.flowLayout51:destroy(); self.flowLayout51 = nil; end;
        if self.flowLayout15 ~= nil then self.flowLayout15:destroy(); self.flowLayout15 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.richEdit4 ~= nil then self.richEdit4:destroy(); self.richEdit4 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.flowLineBreak20 ~= nil then self.flowLineBreak20:destroy(); self.flowLineBreak20 = nil; end;
        if self.tab20 ~= nil then self.tab20:destroy(); self.tab20 = nil; end;
        if self.tab12 ~= nil then self.tab12:destroy(); self.tab12 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.flowLayout20 ~= nil then self.flowLayout20:destroy(); self.flowLayout20 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.flowLineBreak38 ~= nil then self.flowLineBreak38:destroy(); self.flowLineBreak38 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.flowLayout25 ~= nil then self.flowLayout25:destroy(); self.flowLayout25 = nil; end;
        if self.flowLayout26 ~= nil then self.flowLayout26:destroy(); self.flowLayout26 = nil; end;
        if self.flowLayout54 ~= nil then self.flowLayout54:destroy(); self.flowLayout54 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.flowLineBreak16 ~= nil then self.flowLineBreak16:destroy(); self.flowLineBreak16 = nil; end;
        if self.flowLineBreak25 ~= nil then self.flowLineBreak25:destroy(); self.flowLineBreak25 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.flowLayout53 ~= nil then self.flowLayout53:destroy(); self.flowLayout53 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.flowLineBreak13 ~= nil then self.flowLineBreak13:destroy(); self.flowLineBreak13 = nil; end;
        if self.flowLineBreak14 ~= nil then self.flowLineBreak14:destroy(); self.flowLineBreak14 = nil; end;
        if self.tab11 ~= nil then self.tab11:destroy(); self.tab11 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.rclArmas ~= nil then self.rclArmas:destroy(); self.rclArmas = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.flowLayout27 ~= nil then self.flowLayout27:destroy(); self.flowLayout27 = nil; end;
        if self.flowLineBreak33 ~= nil then self.flowLineBreak33:destroy(); self.flowLineBreak33 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.flowLineBreak36 ~= nil then self.flowLineBreak36:destroy(); self.flowLineBreak36 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.flowLayout45 ~= nil then self.flowLayout45:destroy(); self.flowLayout45 = nil; end;
        if self.flowLayout56 ~= nil then self.flowLayout56:destroy(); self.flowLayout56 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.richEdit7 ~= nil then self.richEdit7:destroy(); self.richEdit7 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.flowLineBreak30 ~= nil then self.flowLineBreak30:destroy(); self.flowLineBreak30 = nil; end;
        if self.flowLayout36 ~= nil then self.flowLayout36:destroy(); self.flowLayout36 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.flowLayout38 ~= nil then self.flowLayout38:destroy(); self.flowLayout38 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.recursoOp ~= nil then self.recursoOp:destroy(); self.recursoOp = nil; end;
        if self.flowLayout37 ~= nil then self.flowLayout37:destroy(); self.flowLayout37 = nil; end;
        if self.flowLayout22 ~= nil then self.flowLayout22:destroy(); self.flowLayout22 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.flowLineBreak23 ~= nil then self.flowLineBreak23:destroy(); self.flowLineBreak23 = nil; end;
        if self.richEdit13 ~= nil then self.richEdit13:destroy(); self.richEdit13 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.flowLineBreak22 ~= nil then self.flowLineBreak22:destroy(); self.flowLineBreak22 = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.flowLineBreak7 ~= nil then self.flowLineBreak7:destroy(); self.flowLineBreak7 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.endRecursoOp ~= nil then self.endRecursoOp:destroy(); self.endRecursoOp = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.setRecursoPopup ~= nil then self.setRecursoPopup:destroy(); self.setRecursoPopup = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.flowLayout52 ~= nil then self.flowLayout52:destroy(); self.flowLayout52 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rclArmaduras ~= nil then self.rclArmaduras:destroy(); self.rclArmaduras = nil; end;
        if self.flowLineBreak29 ~= nil then self.flowLineBreak29:destroy(); self.flowLineBreak29 = nil; end;
        if self.flowLayout39 ~= nil then self.flowLayout39:destroy(); self.flowLayout39 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.flowLineBreak17 ~= nil then self.flowLineBreak17:destroy(); self.flowLineBreak17 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.frmHabilidade ~= nil then self.frmHabilidade:destroy(); self.frmHabilidade = nil; end;
        if self.flowLayout29 ~= nil then self.flowLayout29:destroy(); self.flowLayout29 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.flowLayout46 ~= nil then self.flowLayout46:destroy(); self.flowLayout46 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.flowLayout35 ~= nil then self.flowLayout35:destroy(); self.flowLayout35 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.flowLineBreak28 ~= nil then self.flowLineBreak28:destroy(); self.flowLineBreak28 = nil; end;
        if self.flowLineBreak32 ~= nil then self.flowLineBreak32:destroy(); self.flowLineBreak32 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.flowLayout49 ~= nil then self.flowLayout49:destroy(); self.flowLayout49 = nil; end;
        if self.tab19 ~= nil then self.tab19:destroy(); self.tab19 = nil; end;
        if self.flowLineBreak15 ~= nil then self.flowLineBreak15:destroy(); self.flowLineBreak15 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.flowLayout40 ~= nil then self.flowLayout40:destroy(); self.flowLayout40 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.flowLineBreak26 ~= nil then self.flowLineBreak26:destroy(); self.flowLineBreak26 = nil; end;
        if self.flowLineBreak11 ~= nil then self.flowLineBreak11:destroy(); self.flowLineBreak11 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.flowLineBreak24 ~= nil then self.flowLineBreak24:destroy(); self.flowLineBreak24 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.experienciaOp ~= nil then self.experienciaOp:destroy(); self.experienciaOp = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.progressBar2 ~= nil then self.progressBar2:destroy(); self.progressBar2 = nil; end;
        if self.richEdit11 ~= nil then self.richEdit11:destroy(); self.richEdit11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.flowLineBreak12 ~= nil then self.flowLineBreak12:destroy(); self.flowLineBreak12 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.templates ~= nil then self.templates:destroy(); self.templates = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.endDesejoOp ~= nil then self.endDesejoOp:destroy(); self.endDesejoOp = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.flowLayout48 ~= nil then self.flowLayout48:destroy(); self.flowLayout48 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.flowLineBreak9 ~= nil then self.flowLineBreak9:destroy(); self.flowLineBreak9 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.tabControl3 ~= nil then self.tabControl3:destroy(); self.tabControl3 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.flowLayout57 ~= nil then self.flowLayout57:destroy(); self.flowLayout57 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.setDesejoPopup ~= nil then self.setDesejoPopup:destroy(); self.setDesejoPopup = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.flowLineBreak31 ~= nil then self.flowLineBreak31:destroy(); self.flowLineBreak31 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.flowLayout41 ~= nil then self.flowLayout41:destroy(); self.flowLayout41 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.flowLineBreak21 ~= nil then self.flowLineBreak21:destroy(); self.flowLineBreak21 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.endVidaOp ~= nil then self.endVidaOp:destroy(); self.endVidaOp = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.flowLayout55 ~= nil then self.flowLayout55:destroy(); self.flowLayout55 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.tabControl2 ~= nil then self.tabControl2:destroy(); self.tabControl2 = nil; end;
        if self.progressBar4 ~= nil then self.progressBar4:destroy(); self.progressBar4 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.flowLayout50 ~= nil then self.flowLayout50:destroy(); self.flowLayout50 = nil; end;
        if self.endExpOp ~= nil then self.endExpOp:destroy(); self.endExpOp = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.flowLayout17 ~= nil then self.flowLayout17:destroy(); self.flowLayout17 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.flowLayout42 ~= nil then self.flowLayout42:destroy(); self.flowLayout42 = nil; end;
        if self.flowLayout21 ~= nil then self.flowLayout21:destroy(); self.flowLayout21 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.flowLayout34 ~= nil then self.flowLayout34:destroy(); self.flowLayout34 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.flowLineBreak10 ~= nil then self.flowLineBreak10:destroy(); self.flowLineBreak10 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.flowLineBreak8 ~= nil then self.flowLineBreak8:destroy(); self.flowLineBreak8 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.desejoOp ~= nil then self.desejoOp:destroy(); self.desejoOp = nil; end;
        if self.richEdit6 ~= nil then self.richEdit6:destroy(); self.richEdit6 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.richEdit5 ~= nil then self.richEdit5:destroy(); self.richEdit5 = nil; end;
        if self.flowLayout28 ~= nil then self.flowLayout28:destroy(); self.flowLayout28 = nil; end;
        if self.flowLineBreak39 ~= nil then self.flowLineBreak39:destroy(); self.flowLineBreak39 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.progressBar3 ~= nil then self.progressBar3:destroy(); self.progressBar3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.flowLineBreak34 ~= nil then self.flowLineBreak34:destroy(); self.flowLineBreak34 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.setExperienciaPopup ~= nil then self.setExperienciaPopup:destroy(); self.setExperienciaPopup = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.richEdit9 ~= nil then self.richEdit9:destroy(); self.richEdit9 = nil; end;
        if self.tab14 ~= nil then self.tab14:destroy(); self.tab14 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newKitsune()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_Kitsune();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _Kitsune = {
    newEditor = newKitsune, 
    new = newKitsune, 
    name = "Kitsune", 
    dataType = "br.com.sigma.kitsune.ficha1", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Kitsune's System", 
    description=""};

Kitsune = _Kitsune;
Firecast.registrarForm(_Kitsune);
Firecast.registrarDataType(_Kitsune);

return _Kitsune;
