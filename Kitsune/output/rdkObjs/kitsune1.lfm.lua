require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newKitsune()
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
    obj:setDataType("br.com.sigma.kitsune.ficha1");
    obj:setTitle("Kitsune's System");
    obj:setName("Kitsune");

    obj.templates = gui.fromHandle(_obj_newObject("form"));
    obj.templates:setParent(obj);
    obj.templates:setName("templates");

    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Principal");
    obj.tab1:setName("tab1");

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.tab1);
    obj.flowLayout1:setAlign("client");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(2);
    obj.flowLayout1:setName("flowLayout1");

    obj.flowLayout2 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.flowLayout1);
    obj.flowLayout2:setWidth(400);
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setName("flowLayout2");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowLayout2);
    obj.label1:setText("Nome");
    obj.label1:setHeight(20);
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowLayout2);
    obj.edit1:setField("nome");
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(20);
    obj.edit1:setType("text");
    obj.edit1:setName("edit1");

    obj.flowLineBreak1 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout2);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowLayout2);
    obj.label2:setText("Jogador");
    obj.label2:setHeight(20);
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowLayout2);
    obj.edit2:setField("jogador");
    obj.edit2:setHeight(20);
    obj.edit2:setType("text");
    obj.edit2:setName("edit2");

    obj.flowLineBreak2 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flowLayout2);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowLayout2);
    obj.label3:setText("Raça");
    obj.label3:setName("label3");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.flowLayout2);
    obj.comboBox1:setWidth(100);
    obj.comboBox1:setField("raca");
    obj.comboBox1:setItems({'Anão', 'Draconato', 'Elfo', 'Gnomo', 'Halfling','Humano','Meio-Elfo','Meio-Orc','Tiefling','Neko','Kitsune','Olhos Negros'});
    obj.comboBox1:setValues({'A', 'D', 'E', 'G', 'Ha','Hu','ME','MO','T','N','K','O'});
    obj.comboBox1:setName("comboBox1");

    obj.flowLineBreak3 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.flowLayout2);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowLayout2);
    obj.label4:setText("Classe");
    obj.label4:setName("label4");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.flowLayout2);
    obj.comboBox2:setWidth(100);
    obj.comboBox2:setField("classe");
    obj.comboBox2:setItems({'Bárbaro', 'Bardo', 'Bruxo', 'Clérigo', 'Druida','Feiticeiro','Guerreiro','Ladino','Mago','Monge','Paladino','Patrulheiro'});
    obj.comboBox2:setValues({'Barbaro', 'Bardo', 'Bruxo', 'Clerigo', 'Druida','Feiticeiro','Guerreiro','Ladino','Mago','Monge','Paladino','Patrulheiro'});
    obj.comboBox2:setName("comboBox2");

    obj.flowLineBreak4 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.flowLayout2);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowLayout2);
    obj.label5:setText("Tendencia");
    obj.label5:setName("label5");

    obj.comboBox3 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.flowLayout2);
    obj.comboBox3:setWidth(100);
    obj.comboBox3:setField("tendencia");
    obj.comboBox3:setItems({'Bom Leal', 'Bom Neutro', 'Bom Caótico', 'Neutro Leal', 'Neutro','Neutro Caótico','Mal Leal','Mal Neutro','Mal Caótico'});
    obj.comboBox3:setValues({'BL', 'BN', 'BC', 'NL', 'N','NC','ML','MN','MC'});
    obj.comboBox3:setName("comboBox3");

    obj.flowLineBreak5 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.flowLayout2);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowLayout2);
    obj.label6:setText("Experiência");
    obj.label6:setName("label6");

    obj.progressBar1 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar1:setParent(obj.flowLayout2);
    obj.progressBar1:setAlign("client");
    obj.progressBar1:setWidth(200);
    obj.progressBar1:setHeight(13);
    obj.progressBar1:setColor("Gold ");
    obj.progressBar1:setField("experienciaAtual");
    obj.progressBar1:setFieldMax("proximoNivel");
    obj.progressBar1:setHitTest(true);
    obj.progressBar1:setName("progressBar1");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.progressBar1);
    obj.label7:setField("experienciaAtualxProx");
    obj.label7:setAlign("client");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setFontColor("Black");
    obj.label7:setName("label7");

    obj.setExperienciaPopup = gui.fromHandle(_obj_newObject("popup"));
    obj.setExperienciaPopup:setParent(obj.progressBar1);
    obj.setExperienciaPopup:setName("setExperienciaPopup");
    obj.setExperienciaPopup:setWidth(150);
    obj.setExperienciaPopup:setHeight(80);
    obj.setExperienciaPopup:setNodeObject({sheet});

    obj.flowLayout3 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.setExperienciaPopup);
    obj.flowLayout3:setAlign("client");
    obj.flowLayout3:setName("flowLayout3");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowLayout3);
    obj.label8:setText("Experiência");
    obj.label8:setAutoSize(true);
    obj.label8:setName("label8");

    obj.flowLineBreak6 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak6:setParent(obj.flowLayout3);
    obj.flowLineBreak6:setName("flowLineBreak6");

    obj.experienciaOp = gui.fromHandle(_obj_newObject("edit"));
    obj.experienciaOp:setParent(obj.flowLayout3);
    obj.experienciaOp:setName("experienciaOp");
    obj.experienciaOp:setField("experienciaOp");
    obj.experienciaOp:setHorzTextAlign("center");
    obj.experienciaOp:setWidth(100);

    obj.endExpOp = gui.fromHandle(_obj_newObject("button"));
    obj.endExpOp:setParent(obj.flowLayout3);
    obj.endExpOp:setName("endExpOp");
    obj.endExpOp:setText("X");
    obj.endExpOp:setWidth(30);

    obj.flowLineBreak7 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak7:setParent(obj.flowLayout2);
    obj.flowLineBreak7:setName("flowLineBreak7");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowLayout2);
    obj.label9:setText("Nível");
    obj.label9:setName("label9");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowLayout2);
    obj.edit3:setField("nivel");
    obj.edit3:setMin(1);
    obj.edit3:setMax(20);
    obj.edit3:setHeight(20);
    obj.edit3:setType("number");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.flowLineBreak8 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak8:setParent(obj.flowLayout2);
    obj.flowLineBreak8:setName("flowLineBreak8");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowLayout2);
    obj.label10:setText("Proficiência");
    obj.label10:setName("label10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowLayout2);
    obj.label11:setField("proficiencia");
    obj.label11:setWidth(15);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.flowLineBreak9 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak9:setParent(obj.flowLayout2);
    obj.flowLineBreak9:setName("flowLineBreak9");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowLayout2);
    obj.label12:setText("Percepção Passiva");
    obj.label12:setName("label12");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowLayout2);
    obj.edit4:setField("PercepcaoPassiva");
    obj.edit4:setHeight(20);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.flowLineBreak10 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak10:setParent(obj.flowLayout2);
    obj.flowLineBreak10:setName("flowLineBreak10");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowLayout2);
    obj.label13:setText("Deslocamento");
    obj.label13:setName("label13");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowLayout2);
    obj.edit5:setField("Deslocamento");
    obj.edit5:setHeight(20);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.flowLayout2);
    obj.button1:setText("Iniciativa");
    obj.button1:setHeight(20);
    obj.button1:setName("button1");

    obj.flowLayout4 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.flowLayout1);
    obj.flowLayout4:setWidth(200);
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setAlign("right");
    obj.flowLayout4:setName("flowLayout4");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.flowLayout4);
    obj.rectangle1:setWidth(400);
    obj.rectangle1:setHeight(200);
    obj.rectangle1:setMargins({top = 5});
    obj.rectangle1:setName("rectangle1");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle1);
    obj.label14:setAlign("client");
    obj.label14:setText("Imagem");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setVertTextAlign("center");
    obj.label14:setName("label14");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setField("imagemDoPersonagem");
    obj.image1:setEditable(true);
    obj.image1:setStyle("stretch");
    obj.image1:setWidth(200);
    obj.image1:setHeight(200);
    obj.image1:setCenter(false);
    obj.image1:setName("image1");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.flowLayout4);
    obj.label15:setText("Vida");
    obj.label15:setName("label15");

    obj.progressBar2 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar2:setParent(obj.flowLayout4);
    obj.progressBar2:setWidth(200);
    obj.progressBar2:setHeight(15);
    obj.progressBar2:setColor("Green");
    obj.progressBar2:setField("atributos.vidaAtual");
    obj.progressBar2:setFieldMax("atributos.vidaMax");
    obj.progressBar2:setHitTest(true);
    obj.progressBar2:setName("progressBar2");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.progressBar2);
    obj.label16:setField("atributos.vidaAtualxTotal");
    obj.label16:setAlign("client");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.setVidaPopup = gui.fromHandle(_obj_newObject("popup"));
    obj.setVidaPopup:setParent(obj.progressBar2);
    obj.setVidaPopup:setName("setVidaPopup");
    obj.setVidaPopup:setWidth(150);
    obj.setVidaPopup:setHeight(80);
    obj.setVidaPopup:setNodeObject({sheet});

    obj.flowLayout5 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.setVidaPopup);
    obj.flowLayout5:setAlign("client");
    obj.flowLayout5:setName("flowLayout5");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowLayout5);
    obj.label17:setText("Vida");
    obj.label17:setAutoSize(true);
    obj.label17:setName("label17");

    obj.flowLineBreak11 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak11:setParent(obj.flowLayout5);
    obj.flowLineBreak11:setName("flowLineBreak11");

    obj.vidaOp = gui.fromHandle(_obj_newObject("edit"));
    obj.vidaOp:setParent(obj.flowLayout5);
    obj.vidaOp:setName("vidaOp");
    obj.vidaOp:setField("vidaOp");
    obj.vidaOp:setHorzTextAlign("center");
    obj.vidaOp:setWidth(100);

    obj.endVidaOp = gui.fromHandle(_obj_newObject("button"));
    obj.endVidaOp:setParent(obj.flowLayout5);
    obj.endVidaOp:setName("endVidaOp");
    obj.endVidaOp:setText("X");
    obj.endVidaOp:setWidth(30);
    obj.endVidaOp:setMargins({left = 5});

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.flowLayout4);
    obj.label18:setText("Recurso");
    obj.label18:setName("label18");

    obj.progressBar3 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar3:setParent(obj.flowLayout4);
    obj.progressBar3:setWidth(200);
    obj.progressBar3:setHeight(15);
    obj.progressBar3:setColor("DodgerBlue");
    obj.progressBar3:setField("atributos.recursoAtual");
    obj.progressBar3:setFieldMax("atributos.recursoMax");
    obj.progressBar3:setHitTest(true);
    obj.progressBar3:setName("progressBar3");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.progressBar3);
    obj.label19:setField("atributos.recursoAtualxTotal");
    obj.label19:setAlign("client");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.setRecursoPopup = gui.fromHandle(_obj_newObject("popup"));
    obj.setRecursoPopup:setParent(obj.progressBar3);
    obj.setRecursoPopup:setName("setRecursoPopup");
    obj.setRecursoPopup:setWidth(150);
    obj.setRecursoPopup:setHeight(80);
    obj.setRecursoPopup:setNodeObject({sheet});

    obj.flowLayout6 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.setRecursoPopup);
    obj.flowLayout6:setAlign("client");
    obj.flowLayout6:setName("flowLayout6");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.flowLayout6);
    obj.label20:setText("Recurso");
    obj.label20:setAutoSize(true);
    obj.label20:setName("label20");

    obj.flowLineBreak12 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak12:setParent(obj.flowLayout6);
    obj.flowLineBreak12:setName("flowLineBreak12");

    obj.recursoOp = gui.fromHandle(_obj_newObject("edit"));
    obj.recursoOp:setParent(obj.flowLayout6);
    obj.recursoOp:setName("recursoOp");
    obj.recursoOp:setField("recursoOp");
    obj.recursoOp:setHorzTextAlign("center");
    obj.recursoOp:setWidth(100);

    obj.endRecursoOp = gui.fromHandle(_obj_newObject("button"));
    obj.endRecursoOp:setParent(obj.flowLayout6);
    obj.endRecursoOp:setName("endRecursoOp");
    obj.endRecursoOp:setText("X");
    obj.endRecursoOp:setWidth(30);
    obj.endRecursoOp:setMargins({left = 5});

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.flowLayout4);
    obj.label21:setText("Desejo");
    obj.label21:setName("label21");

    obj.progressBar4 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar4:setParent(obj.flowLayout4);
    obj.progressBar4:setWidth(200);
    obj.progressBar4:setHeight(15);
    obj.progressBar4:setColor("darkorchid");
    obj.progressBar4:setField("desejo");
    obj.progressBar4:setFieldMax("desejoMax");
    obj.progressBar4:setHitTest(true);
    obj.progressBar4:setName("progressBar4");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.progressBar4);
    obj.label22:setField("desejoxTotal");
    obj.label22:setAlign("client");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.setDesejoPopup = gui.fromHandle(_obj_newObject("popup"));
    obj.setDesejoPopup:setParent(obj.progressBar4);
    obj.setDesejoPopup:setName("setDesejoPopup");
    obj.setDesejoPopup:setWidth(150);
    obj.setDesejoPopup:setHeight(80);
    obj.setDesejoPopup:setNodeObject({sheet});

    obj.flowLayout7 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.setDesejoPopup);
    obj.flowLayout7:setAlign("client");
    obj.flowLayout7:setName("flowLayout7");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowLayout7);
    obj.label23:setText("Desejo");
    obj.label23:setAutoSize(true);
    obj.label23:setName("label23");

    obj.flowLineBreak13 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak13:setParent(obj.flowLayout7);
    obj.flowLineBreak13:setName("flowLineBreak13");

    obj.desejoOp = gui.fromHandle(_obj_newObject("edit"));
    obj.desejoOp:setParent(obj.flowLayout7);
    obj.desejoOp:setName("desejoOp");
    obj.desejoOp:setField("desejoOp");
    obj.desejoOp:setHorzTextAlign("center");
    obj.desejoOp:setWidth(100);

    obj.endDesejoOp = gui.fromHandle(_obj_newObject("button"));
    obj.endDesejoOp:setParent(obj.flowLayout7);
    obj.endDesejoOp:setName("endDesejoOp");
    obj.endDesejoOp:setText("X");
    obj.endDesejoOp:setWidth(30);
    obj.endDesejoOp:setMargins({left = 5});

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowLayout4);
    obj.label24:setText("Dinheiro");
    obj.label24:setName("label24");

    obj.flowLineBreak14 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak14:setParent(obj.flowLayout4);
    obj.flowLineBreak14:setName("flowLineBreak14");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.flowLayout4);
    obj.image2:setURL("/images/goldCoin.png");
    obj.image2:setHeight(16);
    obj.image2:setWidth(16);
    obj.image2:setName("image2");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowLayout4);
    obj.edit6:setField("ouro");
    obj.edit6:setType("number");
    obj.edit6:setMin(0);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setHeight(20);
    obj.edit6:setWidth(30);
    obj.edit6:setName("edit6");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.flowLayout4);
    obj.image3:setURL("/images/silverCoin.png");
    obj.image3:setHeight(16);
    obj.image3:setWidth(16);
    obj.image3:setName("image3");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowLayout4);
    obj.edit7:setField("prata");
    obj.edit7:setType("number");
    obj.edit7:setMin(0);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setHeight(20);
    obj.edit7:setWidth(30);
    obj.edit7:setName("edit7");

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.flowLayout4);
    obj.image4:setURL("/images/copperCoin.png");
    obj.image4:setHeight(16);
    obj.image4:setWidth(16);
    obj.image4:setName("image4");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowLayout4);
    obj.edit8:setField("cobre");
    obj.edit8:setType("number");
    obj.edit8:setMin(0);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setHeight(20);
    obj.edit8:setWidth(30);
    obj.edit8:setName("edit8");

    obj.flowLayout8 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.flowLayout1);
    obj.flowLayout8:setWidth(400);
    obj.flowLayout8:setAutoHeight(true);
    obj.flowLayout8:setName("flowLayout8");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.flowLayout8);
    obj.label25:setText("Atributos");
    obj.label25:setWidth(300);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setMargins({top = 5});
    obj.label25:setName("label25");

    obj.flowLineBreak15 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak15:setParent(obj.flowLayout8);
    obj.flowLineBreak15:setName("flowLineBreak15");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowLayout8);
    obj.label26:setText("Valor");
    obj.label26:setWidth(30);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setMargins({left = 70});
    obj.label26:setName("label26");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowLayout8);
    obj.label27:setText("+");
    obj.label27:setWidth(10);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setMargins({left = 5});
    obj.label27:setName("label27");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowLayout8);
    obj.label28:setText("Mod");
    obj.label28:setWidth(30);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setMargins({left = 5});
    obj.label28:setName("label28");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.flowLayout8);
    obj.label29:setText("Fórmula");
    obj.label29:setWidth(100);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.flowLineBreak16 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak16:setParent(obj.flowLayout8);
    obj.flowLineBreak16:setName("flowLineBreak16");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.flowLayout8);
    obj.label30:setText("Ataque");
    obj.label30:setWidth(70);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setHeight(20);
    obj.label30:setMargins({top = 5});
    obj.label30:setName("label30");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.flowLayout8);
    obj.edit9:setField("atributos.ataque");
    obj.edit9:setHeight(20);
    obj.edit9:setWidth(30);
    obj.edit9:setType("number");
    obj.edit9:setMin(1);
    obj.edit9:setMax(20);
    obj.edit9:setTextPrompt("1");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowLayout8);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setVertTextAlign("center");
    obj.label31:setWidth(10);
    obj.label31:setText("+");
    obj.label31:setMargins({left = 5});
    obj.label31:setName("label31");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowLayout8);
    obj.edit10:setField("atributos.ataqueMod");
    obj.edit10:setType("number");
    obj.edit10:setMin(0);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setHeight(20);
    obj.edit10:setWidth(30);
    obj.edit10:setMargins({left = 5});
    obj.edit10:setName("edit10");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.flowLayout8);
    obj.label32:setWidth(100);
    obj.label32:setField("atributos.ataqueFormula");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.flowLayout8);
    obj.label33:setField("equipamento.ataqueProficiencia");
    obj.label33:setVisible(false);
    obj.label33:setName("label33");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.flowLayout8);
    obj.label34:setField("equipamento.ataqueEquipBonus");
    obj.label34:setVisible(false);
    obj.label34:setName("label34");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.flowLayout8);
    obj.button2:setText("ATQ");
    obj.button2:setWidth(50);
    obj.button2:setHeight(20);
    obj.button2:setName("button2");

    obj.flowLineBreak17 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak17:setParent(obj.flowLayout8);
    obj.flowLineBreak17:setName("flowLineBreak17");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowLayout8);
    obj.label35:setText("Defesa");
    obj.label35:setWidth(70);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setHeight(20);
    obj.label35:setMargins({top = 5});
    obj.label35:setName("label35");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowLayout8);
    obj.edit11:setField("atributos.defesa");
    obj.edit11:setType("number");
    obj.edit11:setMin(1);
    obj.edit11:setMax(20);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setHeight(20);
    obj.edit11:setWidth(30);
    obj.edit11:setName("edit11");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.flowLayout8);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setVertTextAlign("center");
    obj.label36:setWidth(10);
    obj.label36:setText("+");
    obj.label36:setMargins({left = 5});
    obj.label36:setName("label36");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowLayout8);
    obj.edit12:setField("atributos.defesaMod");
    obj.edit12:setType("number");
    obj.edit12:setMin(0);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setHeight(20);
    obj.edit12:setWidth(30);
    obj.edit12:setMargins({left = 5});
    obj.edit12:setName("edit12");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.flowLayout8);
    obj.label37:setWidth(100);
    obj.label37:setField("atributos.defesaFormula");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.flowLayout8);
    obj.label38:setField("equipamento.defesaProficiencia");
    obj.label38:setVisible(false);
    obj.label38:setName("label38");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.flowLayout8);
    obj.label39:setField("equipamento.defesaEquipBonus");
    obj.label39:setVisible(false);
    obj.label39:setName("label39");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.flowLayout8);
    obj.button3:setText("DEF");
    obj.button3:setWidth(50);
    obj.button3:setHeight(20);
    obj.button3:setName("button3");

    obj.flowLineBreak18 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak18:setParent(obj.flowLayout8);
    obj.flowLineBreak18:setName("flowLineBreak18");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.flowLayout8);
    obj.label40:setText("Agilidade");
    obj.label40:setWidth(70);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setHeight(20);
    obj.label40:setMargins({top = 5});
    obj.label40:setName("label40");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.flowLayout8);
    obj.edit13:setField("atributos.agilidade");
    obj.edit13:setType("number");
    obj.edit13:setMin(1);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setHeight(20);
    obj.edit13:setWidth(30);
    obj.edit13:setName("edit13");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.flowLayout8);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setVertTextAlign("center");
    obj.label41:setWidth(10);
    obj.label41:setText("+");
    obj.label41:setMargins({left = 5});
    obj.label41:setName("label41");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.flowLayout8);
    obj.edit14:setField("atributos.agilidadeMod");
    obj.edit14:setType("number");
    obj.edit14:setMin(0);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setHeight(20);
    obj.edit14:setWidth(30);
    obj.edit14:setMargins({left = 5});
    obj.edit14:setName("edit14");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.flowLayout8);
    obj.label42:setWidth(100);
    obj.label42:setField("atributos.iniciativaFormula");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.flowLayout8);
    obj.button4:setText("AGI");
    obj.button4:setWidth(50);
    obj.button4:setHeight(20);
    obj.button4:setName("button4");

    obj.flowLineBreak19 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak19:setParent(obj.flowLayout8);
    obj.flowLineBreak19:setName("flowLineBreak19");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.flowLayout8);
    obj.label43:setText("Sorte");
    obj.label43:setWidth(70);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setHeight(20);
    obj.label43:setMargins({top = 5});
    obj.label43:setName("label43");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.flowLayout8);
    obj.edit15:setField("atributos.sorte");
    obj.edit15:setType("number");
    obj.edit15:setMin(1);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setHeight(20);
    obj.edit15:setWidth(30);
    obj.edit15:setName("edit15");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.flowLayout8);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setVertTextAlign("center");
    obj.label44:setWidth(10);
    obj.label44:setText("+");
    obj.label44:setMargins({left = 5});
    obj.label44:setName("label44");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.flowLayout8);
    obj.edit16:setField("atributos.sorteMod");
    obj.edit16:setType("number");
    obj.edit16:setMin(-20);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setHeight(20);
    obj.edit16:setWidth(30);
    obj.edit16:setMargins({left = 5});
    obj.edit16:setName("edit16");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.flowLayout8);
    obj.label45:setWidth(100);
    obj.label45:setField("atributos.critRange");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.flowLayout8);
    obj.button5:setText("SOR");
    obj.button5:setWidth(50);
    obj.button5:setHeight(20);
    obj.button5:setName("button5");

    obj.flowLineBreak20 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak20:setParent(obj.flowLayout8);
    obj.flowLineBreak20:setName("flowLineBreak20");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.flowLayout8);
    obj.label46:setText("Magia");
    obj.label46:setWidth(70);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setHeight(20);
    obj.label46:setMargins({top = 5});
    obj.label46:setName("label46");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.flowLayout8);
    obj.edit17:setField("atributos.magia");
    obj.edit17:setType("number");
    obj.edit17:setMin(1);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setHeight(20);
    obj.edit17:setWidth(30);
    obj.edit17:setName("edit17");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.flowLayout8);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setVertTextAlign("center");
    obj.label47:setWidth(10);
    obj.label47:setText("+");
    obj.label47:setMargins({left = 5});
    obj.label47:setName("label47");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.flowLayout8);
    obj.edit18:setField("atributos.MagiaMod");
    obj.edit18:setType("number");
    obj.edit18:setMin(0);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setHeight(20);
    obj.edit18:setWidth(30);
    obj.edit18:setMargins({left = 5});
    obj.edit18:setName("edit18");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.flowLayout8);
    obj.label48:setWidth(100);
    obj.label48:setField("atributos.magiaFormula");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.flowLayout8);
    obj.button6:setText("MAG");
    obj.button6:setWidth(50);
    obj.button6:setHeight(20);
    obj.button6:setName("button6");

    obj.flowLineBreak21 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak21:setParent(obj.flowLayout8);
    obj.flowLineBreak21:setName("flowLineBreak21");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.flowLayout8);
    obj.label49:setText("Resistencia Mágica");
    obj.label49:setWidth(70);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setHeight(20);
    obj.label49:setMargins({top = 5});
    obj.label49:setName("label49");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.flowLayout8);
    obj.edit19:setField("atributos.resistenciaMagica");
    obj.edit19:setMin(1);
    obj.edit19:setType("number");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setHeight(20);
    obj.edit19:setWidth(30);
    obj.edit19:setName("edit19");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.flowLayout8);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setVertTextAlign("center");
    obj.label50:setWidth(10);
    obj.label50:setText("+");
    obj.label50:setMargins({left = 5});
    obj.label50:setName("label50");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.flowLayout8);
    obj.edit20:setField("atributos.resistenciaMagicaMod");
    obj.edit20:setType("number");
    obj.edit20:setMin(0);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setHeight(20);
    obj.edit20:setWidth(30);
    obj.edit20:setMargins({left = 5});
    obj.edit20:setName("edit20");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.flowLayout8);
    obj.label51:setWidth(100);
    obj.label51:setField("atributos.resistenciaMagicaFormula");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.flowLayout8);
    obj.button7:setText("RMAG");
    obj.button7:setWidth(50);
    obj.button7:setHeight(20);
    obj.button7:setName("button7");

    obj.flowLineBreak22 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak22:setParent(obj.flowLayout8);
    obj.flowLineBreak22:setName("flowLineBreak22");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.flowLayout8);
    obj.label52:setText("Recurso");
    obj.label52:setWidth(70);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setHeight(20);
    obj.label52:setMargins({top = 5});
    obj.label52:setName("label52");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.flowLayout8);
    obj.edit21:setField("atributos.recurso");
    obj.edit21:setType("number");
    obj.edit21:setMin(1);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setHeight(20);
    obj.edit21:setWidth(30);
    obj.edit21:setName("edit21");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.flowLayout8);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setVertTextAlign("center");
    obj.label53:setWidth(10);
    obj.label53:setText("X");
    obj.label53:setMargins({left = 5});
    obj.label53:setName("label53");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.flowLayout8);
    obj.edit22:setField("atributos.recursoMod");
    obj.edit22:setType("number");
    obj.edit22:setMin(0);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setHeight(20);
    obj.edit22:setWidth(30);
    obj.edit22:setMargins({left = 5});
    obj.edit22:setName("edit22");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.flowLayout8);
    obj.label54:setWidth(100);
    obj.label54:setField("atributos.recursoMax");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.flowLineBreak23 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak23:setParent(obj.flowLayout8);
    obj.flowLineBreak23:setName("flowLineBreak23");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.flowLayout8);
    obj.label55:setText("Vida");
    obj.label55:setWidth(70);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setHeight(20);
    obj.label55:setMargins({top = 5});
    obj.label55:setName("label55");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.flowLayout8);
    obj.edit23:setField("atributos.vida");
    obj.edit23:setType("number");
    obj.edit23:setMin(1);
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setHeight(20);
    obj.edit23:setWidth(30);
    obj.edit23:setName("edit23");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.flowLayout8);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setVertTextAlign("center");
    obj.label56:setWidth(10);
    obj.label56:setText("X");
    obj.label56:setMargins({left = 5});
    obj.label56:setName("label56");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.flowLayout8);
    obj.edit24:setField("atributos.vidaMod");
    obj.edit24:setType("number");
    obj.edit24:setMin(0);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setHeight(20);
    obj.edit24:setWidth(30);
    obj.edit24:setMargins({left = 5});
    obj.edit24:setName("edit24");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.flowLayout8);
    obj.label57:setWidth(100);
    obj.label57:setField("atributos.vidaMax");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.flowLayout8);
    obj.button8:setText("VID");
    obj.button8:setWidth(50);
    obj.button8:setHeight(20);
    obj.button8:setName("button8");

    obj.flowLayout9 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.flowLayout1);
    obj.flowLayout9:setWidth(400);
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setName("flowLayout9");

    obj.flowLayout10 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.flowLayout9);
    obj.flowLayout10:setWidth(320);
    obj.flowLayout10:setAutoHeight(true);
    obj.flowLayout10:setName("flowLayout10");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.flowLayout10);
    obj.label58:setText("Armas");
    obj.label58:setAlign("client");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.flowLineBreak24 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak24:setParent(obj.flowLayout10);
    obj.flowLineBreak24:setName("flowLineBreak24");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.flowLayout10);
    obj.label59:setText("Ataque Total");
    obj.label59:setAlign("right");
    obj.label59:setName("label59");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.flowLayout10);
    obj.label60:setField("equipamento.ataqueTotal");
    obj.label60:setAlign("right");
    obj.label60:setName("label60");

    obj.flowLineBreak25 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak25:setParent(obj.flowLayout10);
    obj.flowLineBreak25:setName("flowLineBreak25");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.flowLayout10);
    obj.button9:setWidth(20);
    obj.button9:setHeight(20);
    obj.button9:setText("+");
    obj.button9:setName("button9");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.flowLayout10);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setWidth(150);
    obj.label61:setText("Nome");
    obj.label61:setName("label61");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.flowLayout10);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setWidth(30);
    obj.label62:setText("P");
    obj.label62:setName("label62");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.flowLayout10);
    obj.label63:setHorzTextAlign("center");
    obj.label63:setWidth(30);
    obj.label63:setText("Bônus");
    obj.label63:setName("label63");

    obj.flowLineBreak26 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak26:setParent(obj.flowLayout10);
    obj.flowLineBreak26:setName("flowLineBreak26");

    obj.rclArmas = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclArmas:setParent(obj.flowLayout10);
    obj.rclArmas:setWidth(500);
    obj.rclArmas:setAutoHeight(true);
    obj.rclArmas:setName("rclArmas");
    obj.rclArmas:setField("equipamento.armas");
    obj.rclArmas:setTemplateForm("frmArma");

    obj.flowLayout11 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.flowLayout9);
    obj.flowLayout11:setLeft(320);
    obj.flowLayout11:setWidth(250);
    obj.flowLayout11:setAutoHeight(true);
    obj.flowLayout11:setName("flowLayout11");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.flowLayout11);
    obj.label64:setText("Armaduras");
    obj.label64:setAlign("client");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.flowLineBreak27 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak27:setParent(obj.flowLayout11);
    obj.flowLineBreak27:setName("flowLineBreak27");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.flowLayout11);
    obj.label65:setText("Defesa Total");
    obj.label65:setAlign("right");
    obj.label65:setName("label65");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.flowLayout11);
    obj.label66:setField("equipamento.defesaTotal");
    obj.label66:setAlign("right");
    obj.label66:setName("label66");

    obj.flowLineBreak28 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak28:setParent(obj.flowLayout11);
    obj.flowLineBreak28:setName("flowLineBreak28");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.flowLayout11);
    obj.button10:setWidth(20);
    obj.button10:setHeight(20);
    obj.button10:setText("+");
    obj.button10:setName("button10");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.flowLayout11);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setWidth(150);
    obj.label67:setText("Nome");
    obj.label67:setName("label67");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.flowLayout11);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setWidth(30);
    obj.label68:setText("P");
    obj.label68:setName("label68");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.flowLayout11);
    obj.label69:setHorzTextAlign("center");
    obj.label69:setWidth(30);
    obj.label69:setText("Bônus");
    obj.label69:setName("label69");

    obj.flowLineBreak29 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak29:setParent(obj.flowLayout11);
    obj.flowLineBreak29:setName("flowLineBreak29");

    obj.rclArmaduras = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclArmaduras:setParent(obj.flowLayout11);
    obj.rclArmaduras:setWidth(320);
    obj.rclArmaduras:setAutoHeight(true);
    obj.rclArmaduras:setName("rclArmaduras");
    obj.rclArmaduras:setField("equipamento.armaduras");
    obj.rclArmaduras:setTemplateForm("frmArmadura");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Inventário");
    obj.tab2:setName("tab2");

    obj.richEdit1 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.tab2);
    obj.richEdit1:setAlign("client");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setField("inventario");
    obj.richEdit1:setName("richEdit1");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("História");
    obj.tab3:setName("tab3");

    obj.richEdit2 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.tab3);
    obj.richEdit2:setAlign("client");
    lfm_setPropAsString(obj.richEdit2, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit2, "defaultFontColor",  "white");
    obj.richEdit2:setField("historia");
    obj.richEdit2:setName("richEdit2");

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Anotações");
    obj.tab4:setName("tab4");

    obj.richEdit3 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.tab4);
    obj.richEdit3:setAlign("client");
    lfm_setPropAsString(obj.richEdit3, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit3, "defaultFontColor",  "white");
    obj.richEdit3:setField("anotacoes");
    obj.richEdit3:setName("richEdit3");

    obj.tab5 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Magias");
    obj.tab5:setName("tab5");

    obj.richEdit4 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit4:setParent(obj.tab5);
    obj.richEdit4:setAlign("client");
    lfm_setPropAsString(obj.richEdit4, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit4, "defaultFontColor",  "white");
    obj.richEdit4:setField("magias");
    obj.richEdit4:setName("richEdit4");

    obj.tab6 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Habilidades");
    obj.tab6:setName("tab6");

    obj.flowLayout12 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.tab6);
    obj.flowLayout12:setWidth(310);
    obj.flowLayout12:setAutoHeight(true);
    obj.flowLayout12:setName("flowLayout12");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.flowLayout12);
    obj.button11:setWidth(20);
    obj.button11:setHeight(20);
    obj.button11:setText("+");
    obj.button11:setName("button11");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.flowLayout12);
    obj.label70:setWidth(310);
    obj.label70:setHeight(20);
    obj.label70:setText("Habilidades");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.flowLineBreak30 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak30:setParent(obj.flowLayout12);
    obj.flowLineBreak30:setName("flowLineBreak30");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.flowLayout12);
    obj.label71:setWidth(70);
    obj.label71:setHeight(20);
    obj.label71:setText("Nome");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setMargins({left=5});
    obj.label71:setName("label71");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.flowLayout12);
    obj.label72:setWidth(70);
    obj.label72:setHeight(20);
    obj.label72:setText("Dado");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setMargins({left=5});
    obj.label72:setName("label72");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.flowLayout12);
    obj.label73:setWidth(30);
    obj.label73:setHeight(20);
    obj.label73:setText("Mod");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setMargins({left=5});
    obj.label73:setName("label73");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.flowLayout12);
    obj.label74:setWidth(30);
    obj.label74:setHeight(20);
    obj.label74:setText("Custo");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setMargins({left=5});
    obj.label74:setName("label74");

    obj.flowLineBreak31 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak31:setParent(obj.flowLayout12);
    obj.flowLineBreak31:setName("flowLineBreak31");

    obj.frmHabilidade = gui.fromHandle(_obj_newObject("recordList"));
    obj.frmHabilidade:setParent(obj.flowLayout12);
    obj.frmHabilidade:setWidth(500);
    obj.frmHabilidade:setAutoHeight(true);
    obj.frmHabilidade:setName("frmHabilidade");
    obj.frmHabilidade:setField("habilidades");
    obj.frmHabilidade:setTemplateForm("frmHabilidade");

    obj.tab7 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Pericias");
    obj.tab7:setName("tab7");

    obj.flowLayout13 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.tab7);
    obj.flowLayout13:setWidth(300);
    obj.flowLayout13:setAutoHeight(true);
    obj.flowLayout13:setName("flowLayout13");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.flowLayout13);
    obj.label75:setText("Perícias");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setWidth(300);
    obj.label75:setName("label75");

    obj.flowLineBreak32 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak32:setParent(obj.flowLayout13);
    obj.flowLineBreak32:setName("flowLineBreak32");

    obj.flowLayout14 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout14:setParent(obj.flowLayout13);
    obj.flowLayout14:setWidth(140);
    obj.flowLayout14:setHeight(20);
    obj.flowLayout14:setName("flowLayout14");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.flowLayout14);
    obj.label76:setText("Atletismo");
    obj.label76:setHeight(20);
    obj.label76:setWidth(100);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setVertTextAlign("center");
    obj.label76:setName("label76");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.flowLayout14);
    obj.edit25:setWidth(20);
    obj.edit25:setHeight(20);
    obj.edit25:setField("pericias.Atletismo");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setType("number");
    obj.edit25:setMin(0);
    obj.edit25:setMax(20);
    obj.edit25:setName("edit25");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.flowLayout14);
    obj.button12:setText("*");
    obj.button12:setWidth(20);
    obj.button12:setHeight(20);
    obj.button12:setName("button12");

    obj.flowLayout15 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout15:setParent(obj.flowLayout13);
    obj.flowLayout15:setWidth(140);
    obj.flowLayout15:setHeight(20);
    obj.flowLayout15:setName("flowLayout15");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.flowLayout15);
    obj.label77:setText("Acrobacia");
    obj.label77:setHeight(20);
    obj.label77:setWidth(100);
    obj.label77:setHorzTextAlign("center");
    obj.label77:setVertTextAlign("center");
    obj.label77:setName("label77");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.flowLayout15);
    obj.edit26:setWidth(20);
    obj.edit26:setHeight(20);
    obj.edit26:setField("pericias.Acrobacia");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setType("number");
    obj.edit26:setMin(0);
    obj.edit26:setMax(20);
    obj.edit26:setName("edit26");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.flowLayout15);
    obj.button13:setText("*");
    obj.button13:setWidth(20);
    obj.button13:setHeight(20);
    obj.button13:setName("button13");

    obj.flowLayout16 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout16:setParent(obj.flowLayout13);
    obj.flowLayout16:setWidth(140);
    obj.flowLayout16:setHeight(20);
    obj.flowLayout16:setName("flowLayout16");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.flowLayout16);
    obj.label78:setText("Arcanismo");
    obj.label78:setHeight(20);
    obj.label78:setWidth(100);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setVertTextAlign("center");
    obj.label78:setName("label78");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.flowLayout16);
    obj.edit27:setWidth(20);
    obj.edit27:setHeight(20);
    obj.edit27:setField("pericias.Arcanismo");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setType("number");
    obj.edit27:setMin(0);
    obj.edit27:setMax(20);
    obj.edit27:setName("edit27");

    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.flowLayout16);
    obj.button14:setText("*");
    obj.button14:setWidth(20);
    obj.button14:setHeight(20);
    obj.button14:setName("button14");

    obj.flowLayout17 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout17:setParent(obj.flowLayout13);
    obj.flowLayout17:setWidth(140);
    obj.flowLayout17:setHeight(20);
    obj.flowLayout17:setName("flowLayout17");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.flowLayout17);
    obj.label79:setText("História");
    obj.label79:setHeight(20);
    obj.label79:setWidth(100);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setVertTextAlign("center");
    obj.label79:setName("label79");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.flowLayout17);
    obj.edit28:setWidth(20);
    obj.edit28:setHeight(20);
    obj.edit28:setField("pericias.Historia");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setType("number");
    obj.edit28:setMin(0);
    obj.edit28:setMax(20);
    obj.edit28:setName("edit28");

    obj.button15 = gui.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.flowLayout17);
    obj.button15:setText("*");
    obj.button15:setWidth(20);
    obj.button15:setHeight(20);
    obj.button15:setName("button15");

    obj.flowLayout18 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout18:setParent(obj.flowLayout13);
    obj.flowLayout18:setWidth(140);
    obj.flowLayout18:setHeight(20);
    obj.flowLayout18:setName("flowLayout18");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.flowLayout18);
    obj.label80:setText("Investigação");
    obj.label80:setHeight(20);
    obj.label80:setWidth(100);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setVertTextAlign("center");
    obj.label80:setName("label80");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.flowLayout18);
    obj.edit29:setWidth(20);
    obj.edit29:setHeight(20);
    obj.edit29:setField("pericias.Investigacao");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setType("number");
    obj.edit29:setMin(0);
    obj.edit29:setMax(20);
    obj.edit29:setName("edit29");

    obj.button16 = gui.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.flowLayout18);
    obj.button16:setText("*");
    obj.button16:setWidth(20);
    obj.button16:setHeight(20);
    obj.button16:setName("button16");

    obj.flowLayout19 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout19:setParent(obj.flowLayout13);
    obj.flowLayout19:setWidth(140);
    obj.flowLayout19:setHeight(20);
    obj.flowLayout19:setName("flowLayout19");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.flowLayout19);
    obj.label81:setText("Natureza");
    obj.label81:setHeight(20);
    obj.label81:setWidth(100);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setVertTextAlign("center");
    obj.label81:setName("label81");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.flowLayout19);
    obj.edit30:setWidth(20);
    obj.edit30:setHeight(20);
    obj.edit30:setField("pericias.Natureza");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setType("number");
    obj.edit30:setMin(0);
    obj.edit30:setMax(20);
    obj.edit30:setName("edit30");

    obj.button17 = gui.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.flowLayout19);
    obj.button17:setText("*");
    obj.button17:setWidth(20);
    obj.button17:setHeight(20);
    obj.button17:setName("button17");

    obj.flowLayout20 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout20:setParent(obj.flowLayout13);
    obj.flowLayout20:setWidth(140);
    obj.flowLayout20:setHeight(20);
    obj.flowLayout20:setName("flowLayout20");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.flowLayout20);
    obj.label82:setText("Religião");
    obj.label82:setHeight(20);
    obj.label82:setWidth(100);
    obj.label82:setHorzTextAlign("center");
    obj.label82:setVertTextAlign("center");
    obj.label82:setName("label82");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.flowLayout20);
    obj.edit31:setWidth(20);
    obj.edit31:setHeight(20);
    obj.edit31:setField("pericias.Religiao");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setType("number");
    obj.edit31:setMin(0);
    obj.edit31:setMax(20);
    obj.edit31:setName("edit31");

    obj.button18 = gui.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.flowLayout20);
    obj.button18:setText("*");
    obj.button18:setWidth(20);
    obj.button18:setHeight(20);
    obj.button18:setName("button18");

    obj.flowLayout21 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout21:setParent(obj.flowLayout13);
    obj.flowLayout21:setWidth(140);
    obj.flowLayout21:setHeight(20);
    obj.flowLayout21:setName("flowLayout21");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.flowLayout21);
    obj.label83:setText("Adestrar Animais");
    obj.label83:setHeight(20);
    obj.label83:setWidth(100);
    obj.label83:setHorzTextAlign("center");
    obj.label83:setVertTextAlign("center");
    obj.label83:setName("label83");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.flowLayout21);
    obj.edit32:setWidth(20);
    obj.edit32:setHeight(20);
    obj.edit32:setField("pericias.AdestrarAnimais");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setType("number");
    obj.edit32:setMin(0);
    obj.edit32:setMax(20);
    obj.edit32:setName("edit32");

    obj.button19 = gui.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.flowLayout21);
    obj.button19:setText("*");
    obj.button19:setWidth(20);
    obj.button19:setHeight(20);
    obj.button19:setName("button19");

    obj.flowLayout22 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout22:setParent(obj.flowLayout13);
    obj.flowLayout22:setWidth(140);
    obj.flowLayout22:setHeight(20);
    obj.flowLayout22:setName("flowLayout22");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.flowLayout22);
    obj.label84:setText("Medicina");
    obj.label84:setHeight(20);
    obj.label84:setWidth(100);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setVertTextAlign("center");
    obj.label84:setName("label84");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.flowLayout22);
    obj.edit33:setWidth(20);
    obj.edit33:setHeight(20);
    obj.edit33:setField("pericias.Medicina");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setType("number");
    obj.edit33:setMin(0);
    obj.edit33:setMax(20);
    obj.edit33:setName("edit33");

    obj.button20 = gui.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.flowLayout22);
    obj.button20:setText("*");
    obj.button20:setWidth(20);
    obj.button20:setHeight(20);
    obj.button20:setName("button20");

    obj.flowLayout23 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout23:setParent(obj.flowLayout13);
    obj.flowLayout23:setWidth(140);
    obj.flowLayout23:setHeight(20);
    obj.flowLayout23:setName("flowLayout23");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.flowLayout23);
    obj.label85:setText("Atuação");
    obj.label85:setHeight(20);
    obj.label85:setWidth(100);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setVertTextAlign("center");
    obj.label85:setName("label85");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.flowLayout23);
    obj.edit34:setWidth(20);
    obj.edit34:setHeight(20);
    obj.edit34:setField("pericias.Atuacao");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setType("number");
    obj.edit34:setMin(0);
    obj.edit34:setMax(20);
    obj.edit34:setName("edit34");

    obj.button21 = gui.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.flowLayout23);
    obj.button21:setText("*");
    obj.button21:setWidth(20);
    obj.button21:setHeight(20);
    obj.button21:setName("button21");

    obj.flowLayout24 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout24:setParent(obj.flowLayout13);
    obj.flowLayout24:setWidth(140);
    obj.flowLayout24:setHeight(20);
    obj.flowLayout24:setName("flowLayout24");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.flowLayout24);
    obj.label86:setText("Sobrevivência");
    obj.label86:setHeight(20);
    obj.label86:setWidth(100);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setVertTextAlign("center");
    obj.label86:setName("label86");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.flowLayout24);
    obj.edit35:setWidth(20);
    obj.edit35:setHeight(20);
    obj.edit35:setField("pericias.Sobrevivencia");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setType("number");
    obj.edit35:setMin(0);
    obj.edit35:setMax(20);
    obj.edit35:setName("edit35");

    obj.button22 = gui.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.flowLayout24);
    obj.button22:setText("*");
    obj.button22:setWidth(20);
    obj.button22:setHeight(20);
    obj.button22:setName("button22");

    obj.flowLayout25 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout25:setParent(obj.flowLayout13);
    obj.flowLayout25:setWidth(140);
    obj.flowLayout25:setHeight(20);
    obj.flowLayout25:setName("flowLayout25");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.flowLayout25);
    obj.label87:setText("Percepção");
    obj.label87:setHeight(20);
    obj.label87:setWidth(100);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setVertTextAlign("center");
    obj.label87:setName("label87");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.flowLayout25);
    obj.edit36:setWidth(20);
    obj.edit36:setHeight(20);
    obj.edit36:setField("pericias.Percepcao");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setType("number");
    obj.edit36:setMin(0);
    obj.edit36:setMax(20);
    obj.edit36:setName("edit36");

    obj.button23 = gui.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.flowLayout25);
    obj.button23:setText("*");
    obj.button23:setWidth(20);
    obj.button23:setHeight(20);
    obj.button23:setName("button23");

    obj.flowLayout26 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout26:setParent(obj.flowLayout13);
    obj.flowLayout26:setWidth(140);
    obj.flowLayout26:setHeight(20);
    obj.flowLayout26:setName("flowLayout26");

    obj.label88 = gui.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.flowLayout26);
    obj.label88:setText("Furtividade");
    obj.label88:setHeight(20);
    obj.label88:setWidth(100);
    obj.label88:setHorzTextAlign("center");
    obj.label88:setVertTextAlign("center");
    obj.label88:setName("label88");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.flowLayout26);
    obj.edit37:setWidth(20);
    obj.edit37:setHeight(20);
    obj.edit37:setField("pericias.Furtividade");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setType("number");
    obj.edit37:setMin(0);
    obj.edit37:setMax(20);
    obj.edit37:setName("edit37");

    obj.button24 = gui.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.flowLayout26);
    obj.button24:setText("*");
    obj.button24:setWidth(20);
    obj.button24:setHeight(20);
    obj.button24:setName("button24");

    obj.flowLayout27 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout27:setParent(obj.flowLayout13);
    obj.flowLayout27:setWidth(140);
    obj.flowLayout27:setHeight(20);
    obj.flowLayout27:setName("flowLayout27");

    obj.label89 = gui.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.flowLayout27);
    obj.label89:setText("Prestidigitação");
    obj.label89:setHeight(20);
    obj.label89:setWidth(100);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setVertTextAlign("center");
    obj.label89:setName("label89");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.flowLayout27);
    obj.edit38:setWidth(20);
    obj.edit38:setHeight(20);
    obj.edit38:setField("pericias.Prestidigitacao");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setType("number");
    obj.edit38:setMin(0);
    obj.edit38:setMax(20);
    obj.edit38:setName("edit38");

    obj.button25 = gui.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.flowLayout27);
    obj.button25:setText("*");
    obj.button25:setWidth(20);
    obj.button25:setHeight(20);
    obj.button25:setName("button25");

    obj.flowLayout28 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout28:setParent(obj.flowLayout13);
    obj.flowLayout28:setWidth(140);
    obj.flowLayout28:setHeight(20);
    obj.flowLayout28:setName("flowLayout28");

    obj.label90 = gui.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.flowLayout28);
    obj.label90:setText("Intuição");
    obj.label90:setHeight(20);
    obj.label90:setWidth(100);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setVertTextAlign("center");
    obj.label90:setName("label90");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.flowLayout28);
    obj.edit39:setWidth(20);
    obj.edit39:setHeight(20);
    obj.edit39:setField("pericias.Intuicao");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setType("number");
    obj.edit39:setMin(0);
    obj.edit39:setMax(20);
    obj.edit39:setName("edit39");

    obj.button26 = gui.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.flowLayout28);
    obj.button26:setText("*");
    obj.button26:setWidth(20);
    obj.button26:setHeight(20);
    obj.button26:setName("button26");

    obj.flowLayout29 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout29:setParent(obj.flowLayout13);
    obj.flowLayout29:setWidth(140);
    obj.flowLayout29:setHeight(20);
    obj.flowLayout29:setName("flowLayout29");

    obj.label91 = gui.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.flowLayout29);
    obj.label91:setText("Intimidação");
    obj.label91:setHeight(20);
    obj.label91:setWidth(100);
    obj.label91:setHorzTextAlign("center");
    obj.label91:setVertTextAlign("center");
    obj.label91:setName("label91");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.flowLayout29);
    obj.edit40:setWidth(20);
    obj.edit40:setHeight(20);
    obj.edit40:setField("pericias.Intimidacao");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setType("number");
    obj.edit40:setMin(0);
    obj.edit40:setMax(20);
    obj.edit40:setName("edit40");

    obj.button27 = gui.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.flowLayout29);
    obj.button27:setText("*");
    obj.button27:setWidth(20);
    obj.button27:setHeight(20);
    obj.button27:setName("button27");

    obj.flowLayout30 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout30:setParent(obj.flowLayout13);
    obj.flowLayout30:setWidth(140);
    obj.flowLayout30:setHeight(20);
    obj.flowLayout30:setName("flowLayout30");

    obj.label92 = gui.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.flowLayout30);
    obj.label92:setText("Persuasão");
    obj.label92:setHeight(20);
    obj.label92:setWidth(100);
    obj.label92:setHorzTextAlign("center");
    obj.label92:setVertTextAlign("center");
    obj.label92:setName("label92");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.flowLayout30);
    obj.edit41:setWidth(20);
    obj.edit41:setHeight(20);
    obj.edit41:setField("pericias.Persuasao");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setType("number");
    obj.edit41:setMin(0);
    obj.edit41:setMax(20);
    obj.edit41:setName("edit41");

    obj.button28 = gui.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.flowLayout30);
    obj.button28:setText("*");
    obj.button28:setWidth(20);
    obj.button28:setHeight(20);
    obj.button28:setName("button28");

    obj.flowLayout31 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout31:setParent(obj.flowLayout13);
    obj.flowLayout31:setWidth(140);
    obj.flowLayout31:setHeight(20);
    obj.flowLayout31:setName("flowLayout31");

    obj.label93 = gui.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.flowLayout31);
    obj.label93:setText("Enganação");
    obj.label93:setHeight(20);
    obj.label93:setWidth(100);
    obj.label93:setHorzTextAlign("center");
    obj.label93:setVertTextAlign("center");
    obj.label93:setName("label93");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.flowLayout31);
    obj.edit42:setWidth(20);
    obj.edit42:setHeight(20);
    obj.edit42:setField("pericias.Enganacao");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setType("number");
    obj.edit42:setMin(0);
    obj.edit42:setMax(20);
    obj.edit42:setName("edit42");

    obj.button29 = gui.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.flowLayout31);
    obj.button29:setText("*");
    obj.button29:setWidth(20);
    obj.button29:setHeight(20);
    obj.button29:setName("button29");

    obj.flowLayout32 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout32:setParent(obj.flowLayout13);
    obj.flowLayout32:setAutoHeight(true);
    obj.flowLayout32:setWidth(250);
    obj.flowLayout32:setMargins({top=15});
    obj.flowLayout32:setName("flowLayout32");

    obj.label94 = gui.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.flowLayout32);
    obj.label94:setHorzTextAlign("center");
    obj.label94:setWidth(250);
    obj.label94:setText("Perícias adicionais");
    obj.label94:setName("label94");

    obj.flowLineBreak33 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak33:setParent(obj.flowLayout32);
    obj.flowLineBreak33:setName("flowLineBreak33");

    obj.button30 = gui.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.flowLayout32);
    obj.button30:setWidth(20);
    obj.button30:setHeight(20);
    obj.button30:setText("+");
    obj.button30:setName("button30");

    obj.label95 = gui.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.flowLayout32);
    obj.label95:setHorzTextAlign("center");
    obj.label95:setWidth(130);
    obj.label95:setText("Nome");
    obj.label95:setName("label95");

    obj.label96 = gui.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.flowLayout32);
    obj.label96:setHorzTextAlign("center");
    obj.label96:setWidth(30);
    obj.label96:setText("Valor");
    obj.label96:setName("label96");

    obj.flowLineBreak34 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak34:setParent(obj.flowLayout32);
    obj.flowLineBreak34:setName("flowLineBreak34");

    obj.frmPericia = gui.fromHandle(_obj_newObject("recordList"));
    obj.frmPericia:setParent(obj.flowLayout32);
    obj.frmPericia:setWidth(250);
    obj.frmPericia:setAutoHeight(true);
    obj.frmPericia:setName("frmPericia");
    obj.frmPericia:setField("pericias");
    obj.frmPericia:setTemplateForm("frmPericia");

    obj.tab8 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Profissão");
    obj.tab8:setName("tab8");

    obj.richEdit5 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit5:setParent(obj.tab8);
    obj.richEdit5:setAlign("client");
    lfm_setPropAsString(obj.richEdit5, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit5, "defaultFontColor",  "white");
    obj.richEdit5:setField("profissao");
    obj.richEdit5:setName("richEdit5");

    obj.tab9 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl1);
    obj.tab9:setTitle("Raça");
    obj.tab9:setName("tab9");

    obj.richEdit6 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit6:setParent(obj.tab9);
    obj.richEdit6:setAlign("client");
    lfm_setPropAsString(obj.richEdit6, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit6, "defaultFontColor",  "white");
    obj.richEdit6:setField("racaTxt");
    obj.richEdit6:setName("richEdit6");

    obj.tab10 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab10:setParent(obj.tabControl1);
    obj.tab10:setTitle("Personalidade");
    obj.tab10:setName("tab10");

    obj.flowLayout33 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout33:setParent(obj.tab10);
    obj.flowLayout33:setAlign("client");
    obj.flowLayout33:setName("flowLayout33");

    obj.label97 = gui.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.flowLayout33);
    obj.label97:setText("Antecedente");
    obj.label97:setWidth(75);
    obj.label97:setHeight(20);
    obj.label97:setMargins({top = 5});
    obj.label97:setName("label97");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.flowLayout33);
    obj.edit43:setField("antecedente");
    obj.edit43:setWidth(100);
    obj.edit43:setHeight(20);
    obj.edit43:setType("text");
    obj.edit43:setName("edit43");

    obj.flowLineBreak35 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak35:setParent(obj.flowLayout33);
    obj.flowLineBreak35:setName("flowLineBreak35");

    obj.flowLayout34 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout34:setParent(obj.flowLayout33);
    obj.flowLayout34:setWidth(200);
    obj.flowLayout34:setHeight(100);
    obj.flowLayout34:setName("flowLayout34");

    obj.label98 = gui.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.flowLayout34);
    obj.label98:setText("caracteristicas");
    obj.label98:setWidth(200);
    obj.label98:setHeight(20);
    obj.label98:setHorzTextAlign("center");
    obj.label98:setName("label98");

    obj.flowLineBreak36 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak36:setParent(obj.flowLayout34);
    obj.flowLineBreak36:setName("flowLineBreak36");

    obj.flowLayout35 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout35:setParent(obj.flowLayout34);
    obj.flowLayout35:setWidth(200);
    obj.flowLayout35:setHeight(20);
    obj.flowLayout35:setName("flowLayout35");

    obj.label99 = gui.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.flowLayout35);
    obj.label99:setText("Idade");
    obj.label99:setAutoSize(true);
    obj.label99:setWidth(95);
    obj.label99:setHeight(20);
    obj.label99:setHorzTextAlign("center");
    obj.label99:setName("label99");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.flowLayout35);
    obj.edit44:setWidth(100);
    obj.edit44:setHeight(20);
    obj.edit44:setField("idade");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setMargins({left=5});
    obj.edit44:setName("edit44");

    obj.flowLayout36 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout36:setParent(obj.flowLayout34);
    obj.flowLayout36:setWidth(200);
    obj.flowLayout36:setHeight(20);
    obj.flowLayout36:setName("flowLayout36");

    obj.label100 = gui.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.flowLayout36);
    obj.label100:setText("Altura");
    obj.label100:setAutoSize(true);
    obj.label100:setWidth(95);
    obj.label100:setHeight(20);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.flowLayout36);
    obj.edit45:setWidth(100);
    obj.edit45:setHeight(20);
    obj.edit45:setField("altura");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setMargins({left=5});
    obj.edit45:setName("edit45");

    obj.flowLayout37 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout37:setParent(obj.flowLayout34);
    obj.flowLayout37:setWidth(200);
    obj.flowLayout37:setHeight(20);
    obj.flowLayout37:setName("flowLayout37");

    obj.label101 = gui.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.flowLayout37);
    obj.label101:setText("Cor dos Olhos");
    obj.label101:setAutoSize(true);
    obj.label101:setWidth(95);
    obj.label101:setHeight(20);
    obj.label101:setHorzTextAlign("center");
    obj.label101:setName("label101");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.flowLayout37);
    obj.edit46:setWidth(100);
    obj.edit46:setHeight(20);
    obj.edit46:setField("corOlhos");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setMargins({left=5});
    obj.edit46:setName("edit46");

    obj.flowLayout38 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout38:setParent(obj.flowLayout34);
    obj.flowLayout38:setWidth(200);
    obj.flowLayout38:setHeight(20);
    obj.flowLayout38:setName("flowLayout38");

    obj.label102 = gui.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.flowLayout38);
    obj.label102:setText("Cor da Pele");
    obj.label102:setAutoSize(true);
    obj.label102:setWidth(95);
    obj.label102:setHeight(20);
    obj.label102:setHorzTextAlign("center");
    obj.label102:setName("label102");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.flowLayout38);
    obj.edit47:setWidth(100);
    obj.edit47:setHeight(20);
    obj.edit47:setField("CorPele");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setMargins({left=5});
    obj.edit47:setName("edit47");

    obj.flowLayout39 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout39:setParent(obj.flowLayout34);
    obj.flowLayout39:setWidth(200);
    obj.flowLayout39:setHeight(20);
    obj.flowLayout39:setName("flowLayout39");

    obj.label103 = gui.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.flowLayout39);
    obj.label103:setText("Cor dos Cabelos");
    obj.label103:setAutoSize(true);
    obj.label103:setWidth(95);
    obj.label103:setHeight(20);
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.flowLayout39);
    obj.edit48:setWidth(100);
    obj.edit48:setHeight(20);
    obj.edit48:setField("corCabelos");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setMargins({left=5});
    obj.edit48:setName("edit48");

    obj.flowLineBreak37 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak37:setParent(obj.flowLayout33);
    obj.flowLineBreak37:setName("flowLineBreak37");

    obj.flowLayout40 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout40:setParent(obj.flowLayout33);
    obj.flowLayout40:setWidth(300);
    obj.flowLayout40:setHeight(320);
    obj.flowLayout40:setMargins({left=10, top=5});
    obj.flowLayout40:setName("flowLayout40");

    obj.label104 = gui.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.flowLayout40);
    obj.label104:setText("Personalidade");
    obj.label104:setAutoSize(true);
    obj.label104:setWidth(300);
    obj.label104:setHeight(20);
    obj.label104:setHorzTextAlign("center");
    obj.label104:setName("label104");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.flowLayout40);
    obj.textEditor1:setWidth(300);
    obj.textEditor1:setHeight(300);
    obj.textEditor1:setField("personalidades");
    obj.textEditor1:setMargins({top=5});
    obj.textEditor1:setName("textEditor1");

    obj.flowLayout41 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout41:setParent(obj.flowLayout33);
    obj.flowLayout41:setWidth(300);
    obj.flowLayout41:setHeight(320);
    obj.flowLayout41:setMargins({left=10, top=5});
    obj.flowLayout41:setName("flowLayout41");

    obj.label105 = gui.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.flowLayout41);
    obj.label105:setText("Ideais");
    obj.label105:setAutoSize(true);
    obj.label105:setWidth(300);
    obj.label105:setHeight(20);
    obj.label105:setHorzTextAlign("center");
    obj.label105:setName("label105");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.flowLayout41);
    obj.textEditor2:setWidth(300);
    obj.textEditor2:setHeight(300);
    obj.textEditor2:setField("ideais");
    obj.textEditor2:setMargins({top=5});
    obj.textEditor2:setName("textEditor2");

    obj.flowLineBreak38 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak38:setParent(obj.flowLayout33);
    obj.flowLineBreak38:setName("flowLineBreak38");

    obj.flowLayout42 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout42:setParent(obj.flowLayout33);
    obj.flowLayout42:setWidth(300);
    obj.flowLayout42:setHeight(320);
    obj.flowLayout42:setMargins({left=10, top=5});
    obj.flowLayout42:setName("flowLayout42");

    obj.label106 = gui.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.flowLayout42);
    obj.label106:setText("Fraquezas");
    obj.label106:setAutoSize(true);
    obj.label106:setWidth(300);
    obj.label106:setHeight(20);
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.flowLayout42);
    obj.textEditor3:setWidth(300);
    obj.textEditor3:setHeight(300);
    obj.textEditor3:setField("fraquezas");
    obj.textEditor3:setMargins({top=5});
    obj.textEditor3:setName("textEditor3");

    obj.flowLayout43 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout43:setParent(obj.flowLayout33);
    obj.flowLayout43:setWidth(300);
    obj.flowLayout43:setHeight(320);
    obj.flowLayout43:setMargins({left=10, top=5});
    obj.flowLayout43:setName("flowLayout43");

    obj.label107 = gui.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.flowLayout43);
    obj.label107:setText("Vínculos");
    obj.label107:setAutoSize(true);
    obj.label107:setWidth(300);
    obj.label107:setHeight(20);
    obj.label107:setHorzTextAlign("center");
    obj.label107:setName("label107");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.flowLayout43);
    obj.textEditor4:setWidth(300);
    obj.textEditor4:setHeight(300);
    obj.textEditor4:setField("vinculos");
    obj.textEditor4:setMargins({top=5});
    obj.textEditor4:setName("textEditor4");

    obj.tab11 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab11:setParent(obj.tabControl1);
    obj.tab11:setTitle("Classe");
    obj.tab11:setName("tab11");

    obj.richEdit7 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit7:setParent(obj.tab11);
    obj.richEdit7:setAlign("client");
    lfm_setPropAsString(obj.richEdit7, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit7, "defaultFontColor",  "white");
    obj.richEdit7:setField("classeTxt");
    obj.richEdit7:setName("richEdit7");

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

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (self)
            initialize(sheet)
        end, obj);

    obj._e_event1 = obj.progressBar1:addEventListener("onDblClick",
        function (self)
            self.setExperienciaPopup:setNodeObject(sheet); self.setExperienciaPopup:show(); setExpPopup(sheet); self.experienciaOp:setFocus();
        end, obj);

    obj._e_event2 = obj.setExperienciaPopup:addEventListener("onClose",
        function (self, canceled)
            expChange(sheet);
        end, obj);

    obj._e_event3 = obj.experienciaOp:addEventListener("onKeyDown",
        function (self, event)
            
            							if(event.keyCode==13) then
            								self.endExpOp:setFocus();
            								self.setExperienciaPopup:closePopup();
            							end;
        end, obj);

    obj._e_event4 = obj.endExpOp:addEventListener("onClick",
        function (self)
            self.setExperienciaPopup:closePopup();
        end, obj);

    obj._e_event5 = obj.button1:addEventListener("onClick",
        function (self)
            rolarIniciativa(sheet);
        end, obj);

    obj._e_event6 = obj.progressBar2:addEventListener("onDblClick",
        function (self)
            self.setVidaPopup:setNodeObject(sheet); self.setVidaPopup:show(); setVidaPopup(sheet); self.vidaOp:setFocus();
        end, obj);

    obj._e_event7 = obj.setVidaPopup:addEventListener("onClose",
        function (self, canceled)
            changeBarraVida(sheet);
        end, obj);

    obj._e_event8 = obj.vidaOp:addEventListener("onKeyDown",
        function (self, event)
            
            						if(event.keyCode==13) then
            							self.endVidaOp:setFocus();
            							self.setVidaPopup:closePopup();
            						end;
        end, obj);

    obj._e_event9 = obj.endVidaOp:addEventListener("onClick",
        function (self)
            self.setVidaPopup:closePopup();
        end, obj);

    obj._e_event10 = obj.progressBar3:addEventListener("onDblClick",
        function (self)
            self.setRecursoPopup:setNodeObject(sheet); self.setRecursoPopup:show(); setRecursoPopup(sheet); self.recursoOp:setFocus();
        end, obj);

    obj._e_event11 = obj.setRecursoPopup:addEventListener("onClose",
        function (self, canceled)
            changeBarraRecurso(sheet);
        end, obj);

    obj._e_event12 = obj.recursoOp:addEventListener("onKeyDown",
        function (self, event)
            
            						if(event.keyCode==13) then
            							self.endRecursoOp:setFocus();
            							self.setRecursoPopup:closePopup();
            						end;
        end, obj);

    obj._e_event13 = obj.endRecursoOp:addEventListener("onClick",
        function (self)
            self.setRecursoPopup:closePopup();
        end, obj);

    obj._e_event14 = obj.progressBar4:addEventListener("onDblClick",
        function (self)
            self.setDesejoPopup:setNodeObject(sheet); self.setDesejoPopup:show(); setDesejoPopup(sheet); self.desejoOp:setFocus();
        end, obj);

    obj._e_event15 = obj.setDesejoPopup:addEventListener("onClose",
        function (self, canceled)
            changeBarraDesejo(sheet);
        end, obj);

    obj._e_event16 = obj.desejoOp:addEventListener("onKeyDown",
        function (self, event)
            
            						if(event.keyCode==13) then
            							self.endDesejoOp:setFocus();
            							self.setDesejoPopup:closePopup();
            						end;
        end, obj);

    obj._e_event17 = obj.endDesejoOp:addEventListener("onClick",
        function (self)
            self.setDesejoPopup:closePopup();
        end, obj);

    obj._e_event18 = obj.button2:addEventListener("onClick",
        function (self)
            rolarAtaque(sheet);
        end, obj);

    obj._e_event19 = obj.button3:addEventListener("onClick",
        function (self)
            rolarDefesa(sheet);
        end, obj);

    obj._e_event20 = obj.button4:addEventListener("onClick",
        function (self)
            rolarAgilidade(sheet);
        end, obj);

    obj._e_event21 = obj.button5:addEventListener("onClick",
        function (self)
            rolarSorte(sheet);
        end, obj);

    obj._e_event22 = obj.button6:addEventListener("onClick",
        function (self)
            rolarMagia(sheet);
        end, obj);

    obj._e_event23 = obj.button7:addEventListener("onClick",
        function (self)
            rolarResistenciaMagica(sheet);
        end, obj);

    obj._e_event24 = obj.button8:addEventListener("onClick",
        function (self)
            rolarVida(sheet);
        end, obj);

    obj._e_event25 = obj.button9:addEventListener("onClick",
        function (self)
            self.rclArmas:append();
        end, obj);

    obj._e_event26 = obj.button10:addEventListener("onClick",
        function (self)
            self.rclArmaduras:append();
        end, obj);

    obj._e_event27 = obj.button11:addEventListener("onClick",
        function (self)
            self.frmHabilidade:append();
        end, obj);

    obj._e_event28 = obj.button12:addEventListener("onClick",
        function (self)
            rolarPericia(sheet, 'Atletismo');
        end, obj);

    obj._e_event29 = obj.button13:addEventListener("onClick",
        function (self)
            rolarPericia(sheet, 'Acrobacia');
        end, obj);

    obj._e_event30 = obj.button14:addEventListener("onClick",
        function (self)
            rolarPericia(sheet, 'Arcanismo');
        end, obj);

    obj._e_event31 = obj.button15:addEventListener("onClick",
        function (self)
            rolarPericia(sheet, 'História');
        end, obj);

    obj._e_event32 = obj.button16:addEventListener("onClick",
        function (self)
            rolarPericia(sheet, 'Investigação');
        end, obj);

    obj._e_event33 = obj.button17:addEventListener("onClick",
        function (self)
            rolarPericia(sheet, 'Natureza');
        end, obj);

    obj._e_event34 = obj.button18:addEventListener("onClick",
        function (self)
            rolarPericia(sheet, 'Religião');
        end, obj);

    obj._e_event35 = obj.button19:addEventListener("onClick",
        function (self)
            rolarPericia(sheet, 'Adestrar Animais');
        end, obj);

    obj._e_event36 = obj.button20:addEventListener("onClick",
        function (self)
            rolarPericia(sheet, 'Medicina');
        end, obj);

    obj._e_event37 = obj.button21:addEventListener("onClick",
        function (self)
            rolarPericia(sheet, 'Atuação');
        end, obj);

    obj._e_event38 = obj.button22:addEventListener("onClick",
        function (self)
            rolarPericia(sheet, 'Sobrevivência');
        end, obj);

    obj._e_event39 = obj.button23:addEventListener("onClick",
        function (self)
            rolarPericia(sheet, 'Percepção');
        end, obj);

    obj._e_event40 = obj.button24:addEventListener("onClick",
        function (self)
            rolarPericia(sheet, 'Furtividade');
        end, obj);

    obj._e_event41 = obj.button25:addEventListener("onClick",
        function (self)
            rolarPericia(sheet, 'Prestidigitação');
        end, obj);

    obj._e_event42 = obj.button26:addEventListener("onClick",
        function (self)
            rolarPericia(sheet, 'Intuição');
        end, obj);

    obj._e_event43 = obj.button27:addEventListener("onClick",
        function (self)
            rolarPericia(sheet, 'Intimidação');
        end, obj);

    obj._e_event44 = obj.button28:addEventListener("onClick",
        function (self)
            rolarPericia(sheet, 'Persuasão');
        end, obj);

    obj._e_event45 = obj.button29:addEventListener("onClick",
        function (self)
            rolarPericia(sheet, 'Enganação');
        end, obj);

    obj._e_event46 = obj.button30:addEventListener("onClick",
        function (self)
            self.frmPericia:append();
        end, obj);

    obj._e_event47 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            updateBase(sheet);
        end, obj);

    obj._e_event48 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            updateAtaque(sheet);
        end, obj);

    obj._e_event49 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            updateDefesa(sheet);
        end, obj);

    obj._e_event50 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            updateMagia(sheet);
        end, obj);

    obj._e_event51 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            updateResistenciaMagica(sheet);
        end, obj);

    obj._e_event52 = obj.dataLink6:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            updateSorte(sheet);
        end, obj);

    obj._e_event53 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            updateAgilidade(sheet);
        end, obj);

    obj._e_event54 = obj.dataLink8:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            updateVida(sheet);
        end, obj);

    obj._e_event55 = obj.dataLink9:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            updateRecurso(sheet);
        end, obj);

    function obj:_releaseEvents()
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

        if self.flowLayout37 ~= nil then self.flowLayout37:destroy(); self.flowLayout37 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.flowLayout22 ~= nil then self.flowLayout22:destroy(); self.flowLayout22 = nil; end;
        if self.flowLayout24 ~= nil then self.flowLayout24:destroy(); self.flowLayout24 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.flowLineBreak23 ~= nil then self.flowLineBreak23:destroy(); self.flowLineBreak23 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.flowLineBreak19 ~= nil then self.flowLineBreak19:destroy(); self.flowLineBreak19 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.flowLineBreak22 ~= nil then self.flowLineBreak22:destroy(); self.flowLineBreak22 = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.flowLayout19 ~= nil then self.flowLayout19:destroy(); self.flowLayout19 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.frmPericia ~= nil then self.frmPericia:destroy(); self.frmPericia = nil; end;
        if self.flowLineBreak7 ~= nil then self.flowLineBreak7:destroy(); self.flowLineBreak7 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.flowLayout43 ~= nil then self.flowLayout43:destroy(); self.flowLayout43 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.endRecursoOp ~= nil then self.endRecursoOp:destroy(); self.endRecursoOp = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.flowLineBreak18 ~= nil then self.flowLineBreak18:destroy(); self.flowLineBreak18 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.flowLayout16 ~= nil then self.flowLayout16:destroy(); self.flowLayout16 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.flowLayout30 ~= nil then self.flowLayout30:destroy(); self.flowLayout30 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.setRecursoPopup ~= nil then self.setRecursoPopup:destroy(); self.setRecursoPopup = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.vidaOp ~= nil then self.vidaOp:destroy(); self.vidaOp = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.setVidaPopup ~= nil then self.setVidaPopup:destroy(); self.setVidaPopup = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.flowLineBreak6 ~= nil then self.flowLineBreak6:destroy(); self.flowLineBreak6 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rclArmaduras ~= nil then self.rclArmaduras:destroy(); self.rclArmaduras = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.flowLineBreak29 ~= nil then self.flowLineBreak29:destroy(); self.flowLineBreak29 = nil; end;
        if self.flowLayout39 ~= nil then self.flowLayout39:destroy(); self.flowLayout39 = nil; end;
        if self.flowLayout23 ~= nil then self.flowLayout23:destroy(); self.flowLayout23 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.flowLineBreak27 ~= nil then self.flowLineBreak27:destroy(); self.flowLineBreak27 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.flowLineBreak17 ~= nil then self.flowLineBreak17:destroy(); self.flowLineBreak17 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.frmHabilidade ~= nil then self.frmHabilidade:destroy(); self.frmHabilidade = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.flowLayout29 ~= nil then self.flowLayout29:destroy(); self.flowLayout29 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.flowLayout33 ~= nil then self.flowLayout33:destroy(); self.flowLayout33 = nil; end;
        if self.flowLineBreak37 ~= nil then self.flowLineBreak37:destroy(); self.flowLineBreak37 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.flowLineBreak35 ~= nil then self.flowLineBreak35:destroy(); self.flowLineBreak35 = nil; end;
        if self.flowLayout35 ~= nil then self.flowLayout35:destroy(); self.flowLayout35 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.flowLineBreak28 ~= nil then self.flowLineBreak28:destroy(); self.flowLineBreak28 = nil; end;
        if self.flowLineBreak32 ~= nil then self.flowLineBreak32:destroy(); self.flowLineBreak32 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.flowLayout14 ~= nil then self.flowLayout14:destroy(); self.flowLayout14 = nil; end;
        if self.flowLineBreak15 ~= nil then self.flowLineBreak15:destroy(); self.flowLineBreak15 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.flowLayout31 ~= nil then self.flowLayout31:destroy(); self.flowLayout31 = nil; end;
        if self.tab10 ~= nil then self.tab10:destroy(); self.tab10 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.flowLineBreak26 ~= nil then self.flowLineBreak26:destroy(); self.flowLineBreak26 = nil; end;
        if self.flowLayout40 ~= nil then self.flowLayout40:destroy(); self.flowLayout40 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.flowLineBreak11 ~= nil then self.flowLineBreak11:destroy(); self.flowLineBreak11 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.flowLineBreak24 ~= nil then self.flowLineBreak24:destroy(); self.flowLineBreak24 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.experienciaOp ~= nil then self.experienciaOp:destroy(); self.experienciaOp = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.progressBar2 ~= nil then self.progressBar2:destroy(); self.progressBar2 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.flowLineBreak12 ~= nil then self.flowLineBreak12:destroy(); self.flowLineBreak12 = nil; end;
        if self.richEdit3 ~= nil then self.richEdit3:destroy(); self.richEdit3 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.templates ~= nil then self.templates:destroy(); self.templates = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.endDesejoOp ~= nil then self.endDesejoOp:destroy(); self.endDesejoOp = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.flowLineBreak9 ~= nil then self.flowLineBreak9:destroy(); self.flowLineBreak9 = nil; end;
        if self.flowLayout32 ~= nil then self.flowLayout32:destroy(); self.flowLayout32 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.setDesejoPopup ~= nil then self.setDesejoPopup:destroy(); self.setDesejoPopup = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.flowLineBreak31 ~= nil then self.flowLineBreak31:destroy(); self.flowLineBreak31 = nil; end;
        if self.flowLayout18 ~= nil then self.flowLayout18:destroy(); self.flowLayout18 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.flowLayout15 ~= nil then self.flowLayout15:destroy(); self.flowLayout15 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.flowLayout41 ~= nil then self.flowLayout41:destroy(); self.flowLayout41 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.flowLineBreak21 ~= nil then self.flowLineBreak21:destroy(); self.flowLineBreak21 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.endVidaOp ~= nil then self.endVidaOp:destroy(); self.endVidaOp = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.richEdit4 ~= nil then self.richEdit4:destroy(); self.richEdit4 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.flowLineBreak20 ~= nil then self.flowLineBreak20:destroy(); self.flowLineBreak20 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.flowLayout20 ~= nil then self.flowLayout20:destroy(); self.flowLayout20 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.progressBar4 ~= nil then self.progressBar4:destroy(); self.progressBar4 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.flowLineBreak38 ~= nil then self.flowLineBreak38:destroy(); self.flowLineBreak38 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.flowLayout25 ~= nil then self.flowLayout25:destroy(); self.flowLayout25 = nil; end;
        if self.flowLayout26 ~= nil then self.flowLayout26:destroy(); self.flowLayout26 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowLineBreak16 ~= nil then self.flowLineBreak16:destroy(); self.flowLineBreak16 = nil; end;
        if self.flowLineBreak25 ~= nil then self.flowLineBreak25:destroy(); self.flowLineBreak25 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.endExpOp ~= nil then self.endExpOp:destroy(); self.endExpOp = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.flowLayout17 ~= nil then self.flowLayout17:destroy(); self.flowLayout17 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.flowLineBreak13 ~= nil then self.flowLineBreak13:destroy(); self.flowLineBreak13 = nil; end;
        if self.flowLineBreak14 ~= nil then self.flowLineBreak14:destroy(); self.flowLineBreak14 = nil; end;
        if self.tab11 ~= nil then self.tab11:destroy(); self.tab11 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.rclArmas ~= nil then self.rclArmas:destroy(); self.rclArmas = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.flowLayout21 ~= nil then self.flowLayout21:destroy(); self.flowLayout21 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.flowLayout42 ~= nil then self.flowLayout42:destroy(); self.flowLayout42 = nil; end;
        if self.flowLayout27 ~= nil then self.flowLayout27:destroy(); self.flowLayout27 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.flowLineBreak33 ~= nil then self.flowLineBreak33:destroy(); self.flowLineBreak33 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.flowLineBreak36 ~= nil then self.flowLineBreak36:destroy(); self.flowLineBreak36 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.flowLayout34 ~= nil then self.flowLayout34:destroy(); self.flowLayout34 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.flowLineBreak10 ~= nil then self.flowLineBreak10:destroy(); self.flowLineBreak10 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.flowLineBreak8 ~= nil then self.flowLineBreak8:destroy(); self.flowLineBreak8 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.richEdit7 ~= nil then self.richEdit7:destroy(); self.richEdit7 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.desejoOp ~= nil then self.desejoOp:destroy(); self.desejoOp = nil; end;
        if self.flowLineBreak30 ~= nil then self.flowLineBreak30:destroy(); self.flowLineBreak30 = nil; end;
        if self.richEdit6 ~= nil then self.richEdit6:destroy(); self.richEdit6 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.flowLayout36 ~= nil then self.flowLayout36:destroy(); self.flowLayout36 = nil; end;
        if self.flowLayout38 ~= nil then self.flowLayout38:destroy(); self.flowLayout38 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.flowLayout28 ~= nil then self.flowLayout28:destroy(); self.flowLayout28 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.progressBar3 ~= nil then self.progressBar3:destroy(); self.progressBar3 = nil; end;
        if self.richEdit5 ~= nil then self.richEdit5:destroy(); self.richEdit5 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.flowLineBreak34 ~= nil then self.flowLineBreak34:destroy(); self.flowLineBreak34 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.setExperienciaPopup ~= nil then self.setExperienciaPopup:destroy(); self.setExperienciaPopup = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.recursoOp ~= nil then self.recursoOp:destroy(); self.recursoOp = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
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
rrpg.registrarForm(_Kitsune);
rrpg.registrarDataType(_Kitsune);

return _Kitsune;
