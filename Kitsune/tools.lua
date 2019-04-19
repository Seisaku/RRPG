function printAllChildren(node)
	message = "printAllChildren: " .. NDB.getNodeName(node) .. "\n";
	listaChilds = NDB.getChildNodes(node);
	for key,child in pairs(listaChilds) do
		message = message .. "\n" .. key .. "=" .. NDB.getNodeName(child);
	end
	showMessage(message);
end

function printAllAttr(node)
	message = "printAllAttr:\n";
	
	listaAttr = NDB.getAttributes(node);
	for key,Attr in pairs(listaAttr) do
		message = message .. "\n" .. key .. "=" .. tostring(Attr);
	end
	showMessage(message);
end

function printParents(node)
	nodeName = NDB.getNodeName(node);
	message = "printParent: " .. NDB.getNodeName(node) .. "\n";

	parent = NDB.getParent(node);
	message = message .. "\n" .. NDB.getNodeName(parent);

	showMessage(message);
end

function getChildNodeByName(node, name)
	listaChilds = NDB.getChildNodes(node);
	for key,child in pairs(listaChilds) do
		childName = NDB.getNodeName(child)
		if (childName == name) then
			return child;
		end
	end
	return nil;
end