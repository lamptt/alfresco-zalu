<import resource="classpath:/alfresco/extension/templates/webscripts/org/alfresco/slingshot/searchreport/search.lib.js">

/**
 * param: doituong String
 * 
 * 
 * @return
 */
function get(doituong){
	var rcu1p0 = companyhome.childrenByXPath("*//.[@sla:rcu1p0='"+ doituong +"']");
	return rcu1p0;
}

function set(doituong, kiemtra, thumuc){
	addAspect();
	var rcu1p0 = get(doituong);
	if(rcu1p0.length != 0){
		rcu1p0[0].remove();
		//add vao
		var p = new Array();
		p['sla:rcu1p0'] = doituong;
		p['sla:rcu1p1'] = kiemtra;
		p['sla:rcu1p2'] = thumuc;
		var node = companyhome.createNode(doituong, "sla:rcu1", p, "sla:rcu1s");
		node.save();
	}
	else {
		//add vao
		var p = new Array();
		p['sla:rcu1p0'] = doituong;
		p['sla:rcu1p1'] = kiemtra;
		p['sla:rcu1p2'] = thumuc;
		var node = companyhome.createNode(doituong, "sla:rcu1", p, "sla:rcu1s");
		node.save();
	}
}
function del(doituong){
	var rcu1p0 = get(doituong);
	if(rcu1p0.length != 0)
		rcu1p0[0].remove();
}
function delALL(){
	if(companyhome.hasAspect("sla:countreport"))
		companyhome.removeAspect("sla:countreport")
}
function addAspect()
{	
	if(!companyhome.hasAspect("sla:countreport"))
		companyhome.addAspect("sla:countreport");
}

function getPath(idPath){
	var rootNodetemp = resolveRootNode(idPath);
	return rootNodetemp.displayPath + "/" + rootNodetemp.name;
}

