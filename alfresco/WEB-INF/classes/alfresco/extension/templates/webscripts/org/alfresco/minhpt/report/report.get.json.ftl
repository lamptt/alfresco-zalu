<#assign datetimeformat="EEE, dd MMM yyyy HH:mm:ss zzz">
{	
	"Object": [
		<#list cru1s as child>
		{
			"cru1p0": "<#if child.cru1.properties["sla:rcu1p0"]?exists>${child.cru1.properties["sla:rcu1p0"]}<#else>0</#if>",
			"cru1p1": <#if child.cru1.properties["sla:rcu1p1"]?exists>${child.cru1.properties["sla:rcu1p1"]}<#else>0</#if>,
			"cru1p2": "<#if child.cru1.properties["sla:rcu1p2"]?exists>${child.cru1.properties["sla:rcu1p2"]}<#else>0</#if>",
			<#assign i = 0>
			<#list child.cru1.properties["sla:rcu1p2"]?split(",") as x>
				<#assign i = i +1>
			</#list> 
			"soluong": ${i},
			"path": "${child.path}",
			"DayDu" : ${child.DayDu},
			"ChuaNhap" : ${child.ChuaNhap},
			"SoTrang" : ${child.SoTrang}
		}
		<#if !(child.cru1 == cru1s?last.cru1)>,</#if>
		</#list>
	]
}