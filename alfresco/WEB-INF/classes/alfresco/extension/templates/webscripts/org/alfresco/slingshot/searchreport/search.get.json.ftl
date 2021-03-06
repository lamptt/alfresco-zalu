<#escape x as jsonUtils.encodeJSONString(x)>
{	
	<#assign xnotnull = 0>
	<#assign xnull = 0>
	"items":
	[
		<#list data.items as item>
		{	
			<#if item.pro = "1">
				<#assign xnotnull= xnotnull + 1>
				<#else>
				<#assign xnull= xnull + 1>
			</#if> 
			"pro": "${item.pro}",
			"nodeRef": "${item.nodeRef}",
			"type": "${item.type}",
			"name": "${item.name!''}",
			"displayName": "${item.displayName!''}",
			<#if item.title??>
			"title": "${item.title}",
			</#if>
			"description": "${item.description!''}",
			"modifiedOn": "${xmldate(item.modifiedOn)}",
			"modifiedByUser": "${item.modifiedByUser}",
			"modifiedBy": "${item.modifiedBy}",
			"size": ${item.size?c},
			"mimetype": "${item.mimetype!''}",
			<#if item.site??>
			"site":
			{
				"shortName": "${item.site.shortName}",
				"title": "${item.site.title}"
			},
			"container": "${item.container}",
			</#if>
			<#if item.path??>
			"path": "${item.path}",
			</#if>
			"tags": [<#list item.tags as tag>"${tag}"<#if tag_has_next>,</#if></#list>]
		}<#if item_has_next>,</#if>
		</#list>
	],
	"NodeNotNULL": ${xnotnull},
	"NodeNULL": ${xnull}
}
</#escape>