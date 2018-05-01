function updateAtributoA(sheet)
	if(sheet.test2.A.valor == nil) then
		sheet.test2.A.valor = 1;
	end
	if(sheet.test2.A.totalBonus == nil) then
		sheet.test2.A.totalBonus = 0;
	end
	bonus = sheet.test2.A.totalBonus >= 0 and "+"..sheet.test2.A.totalBonus or sheet.test2.A.totalBonus;
	sheet.test2.A.formula = sheet.test2.A.valor.."D100 ".. bonus;
end

function updateBonusAtributoA(sheet)
	sheet.test2.A.totalBonus = 1 + 2;
end


function updateATTR(sheet)
	if(sheet.atributos.ATTR.valor == nil) then
		sheet.atributos.ATTR.valor = 1;
	end
	if(sheet.atributos.ATTR.totalBonus == nil) then
		sheet.atributos.ATTR.totalBonus = 0;
	end
	bonus = sheet.atributos.ATTR.totalBonus >= 0 and "+"..sheet.atributos.ATTR.totalBonus or sheet.atributos.ATTR.totalBonus;
	sheet.atributos.ATTR.formula = sheet.atributos.ATTR.valor.."D100 ".. bonus;
end

function updateBonusATTR(sheet)
	sheet.atributos.ATTR.totalBonus = 1 + 2;
end