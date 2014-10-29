<import resource="classpath:alfresco/module/app-content-lamptt-repo/scripts/minhpt.lib.js">
function main() {
	logger.log("Inside");
	process();
}
function process(){
	/*set("minhpt12312321", 1, "workspace://SpacesStore/7c3b6061-ee9c-4642-8c9d-8ec6dfdb1181");
	
	
	var rootNodetemp = resolveRootNode("workspace://SpacesStore/d47e2c1f-15df-43cc-a025-739343fcaede");
	
	model.a = rootNodetemp;
	
	model.path = getPath("workspace://SpacesStore/d47e2c1f-15df-43cc-a025-739343fcaede");*/
	//model.path = getPath("workspace://SpacesStore/ff329739-b1b6-4e41-82db-9993bf7ae5a9");
	var cru1s = companyhome.childAssocs["sla:rcu1s"];
	if(cru1s == null || cru1s.length == 0)
	{
		logger.log("No docs found");
        status.code = 404;
        status.message = "No docs found";
        status.redirect = true;
	}
	else
	{
		 var cru1sInfo = new Array();
		 for (var i = 0; i < cru1s.length; i++) {
			 	var path = "", stringPath="";
			 	if (cru1s[i].properties["sla:rcu1p1"] == 0){
			 		path = getPath(cru1s[i].properties["sla:rcu1p2"]);
			 	}
			 	var ChuaNhap = 0, DayDu= 0, SoTrang = 0;
			 	stringPath = cru1s[i].properties["sla:rcu1p2"];
			 	var arrayPath = stringPath.split(",");
			 	for(var j = 0; j < arrayPath.length; j++)
		 		{
			 		var namePath = getPath(arrayPath[j]);
			 		var getNamePath = namePath.substring(14);
			 		var nodeFolder = companyhome.childByNamePath(getNamePath);
			 		var nodeInFolder = nodeFolder.children;
			 		for(var k = 0; k < nodeInFolder.length; k++)
		 			{
			 			var getType = nodeInFolder[k].typeShort;
			 			var t="";//1 la co gia tri
						if (getType == "la:t1")
							t = "la:t1p1,la:t1p2,la:t1p3,la:t1p4,la:t1p5,la:t1p6,la:t1p7,la:t1p8,la:t1p36,la:t1p10,cm:description,cm:name,la:t1p15,la:t1p16,la:t1p17,la:t1p18";
						if (getType == "la:t2") 
							t = "la:t2p1,la:t2p2,la:t2p3,la:t2p4,la:t2p5,cm:name,cm:description,la:t2p36,la:t2p37,la:t2p8,la:t2p11,la:t2p12,la:t2p15,la:t2p16,la:t2p17";
						
						var a = t.split(',');
						if(getType == "la:t1" || getType == "la:t2")
						{
							DayDu++;
							if(nodeInFolder[k].properties["la:numberofpage"] == null || nodeInFolder[k].properties["la:numberofpage"] == "")
							{}
							else
								SoTrang += parseInt(nodeInFolder[k].properties["la:numberofpage"]) ;
							for ( var l in a) {
								if (nodeInFolder[k].properties[a[l]] == null
										|| nodeInFolder[k].properties[a[l]] == ""){
									ChuaNhap++;
									DayDu--;
									break;
									}
								}
						}
		 			}
		 		}
	            var cru1 = new cru1sEntry(cru1s[i], path, ChuaNhap, DayDu, SoTrang);
	            cru1sInfo[i]= cru1;
		 }
        model.cru1s = cru1sInfo;
        return model;
	}
}
function cru1sEntry(cru1, path, ChuaNhap, DayDu, SoTrang) {
    this.cru1 = cru1;
    this.path = path;
    this.ChuaNhap = ChuaNhap;
    this.DayDu = DayDu;
    this.SoTrang = SoTrang;
}
main();