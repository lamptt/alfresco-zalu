<import resource="classpath:alfresco/module/app-content-lamptt-repo/scripts/minhpt.lib.js">

function main()
{
	//lay du lieu
	var params =
	   {
	      query: (args.query !== null) ? args.query : null
	   };
	//tinh toan
	var formData = params.query;
	var formJson = jsonUtils.toObject(formData);
	del(formJson.username);
	//xuat ket qua
	model.data = "true";
}

main();