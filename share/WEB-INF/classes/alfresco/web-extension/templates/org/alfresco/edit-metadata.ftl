<#include "include/alfresco-template.ftl" />
<@templateHeader />
<@templateBody>
   <div id="alf-hd">
      <@region id="header" scope="global" protected=true />
      <@region id="title" scope="template" protected=true />
      <@region id="navigation" scope="template" protected=true />
   </div>
   <div id="bd">
      <div class="yui-g">
         <div class="yui-g first">
         <#if (config.scoped['DocumentDetails']['document-details'].getChildValue('display-web-preview') == "true")>
            <@region id="web-preview" scope="template" protected=true />
         </#if>
       </div>
       <div class="yui-u">
         <@region id="edit-metadata-mgr" scope="template" protected=true />
         <@region id="edit-metadata" scope="template" protected=true />
       </div>
      </div>
   </div>
</@>
<@templateFooter>
   <div id="alf-ft">
      <@region id="footer" scope="global" protected=true />
   </div>
</@>
