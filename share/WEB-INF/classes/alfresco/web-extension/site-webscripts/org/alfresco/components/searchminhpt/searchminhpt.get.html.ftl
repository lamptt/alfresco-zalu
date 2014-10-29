<@markup id="css" >
   <#-- CSS Dependencies -->
   <#include "../form/form.css.ftl"/>
   <@link href="${url.context}/res/components/searchminhpt/css/bootstrap.min.css" group="search"/>
   <@link href="${url.context}/res/components/searchminhpt/css/font-awesome.css" group="search"/>
</@>

<@markup id="js">
   <#-- JavaScript Dependencies -->
   <#include "../form/form.js.ftl"/>
   <@script src="${url.context}/res/components/searchreport/js/jquery-1.11.0.min.js" group="search"/>
   <@script src="${url.context}/res/components/searchreport/js/FileSaver.js" group="search"/>
   
</@>

<@markup id="widgets">
   <@createWidgets group="search"/>
</@>

<@markup id="html">
   <@uniqueIdDiv>
      <#assign el=args.htmlid?html>
      <div id="${el}-body" class="search">
		<div class="container">
            <div class="page-header">
            </div>
            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">${msg("label.paneltitle")}</h3>
                    </div>
                    <div class="panel-body">
                        <div class="radio-inline">
                            <label>
                                <input class="radiobttALL" type="radio" checked="true" name="Type"> ${msg("label.radioAll")}
                            </label>
                        </div>
                        <div class="radio-inline">
                            <label>
                                <input class="radiobtt1" type="radio" name="Type"> ${msg("label.radioLoai1")}
                            </label>
                        </div>
                        <div class="radio-inline">
                            <label>
                                <input class="radiobtt2" type="radio" name="Type"> ${msg("label.radioLoai2")}
                            </label>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input class="checkboxbttNULL" type="checkbox"> ${msg("label.checkboxNuLL")}
                            </label>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input class="checkboxbttHTML" type="checkbox"> ${msg("label.checkboxHtml")}
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="page-header">
                <h3>${msg("label.titleUsername")}</h3>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>${msg("label.STT")}</th>
                            <th>${msg("label.username")}</th>
                            <th>${msg("label.folder")}</th>
                            <th>${msg("label.action")}</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#if (count > 0)>
                        <#assign stt = 0>
                       <#list data.Object as item>
                       <#if item.cru1p1 == 1>
                       <#assign stt = stt + 1>
                        <tr>
                            <td>${stt}</td>
                            <td>${item.cru1p0}</td>
                            <td>${item.soluong}</td>
                            <td class="text-right">
                                <button title="Chi tiết" class="btn btn-default detaill" id="${item.cru1p0}" value="${item.cru1p2}"><i class="fa fa-pencil fa-fw"></i></button>&nbsp;
                                <button title="Xóa " class="btn btn-danger dell" id="${item.cru1p0}"><i class="fa fa-trash fa-fw"></i></button>&nbsp;
                            </td>
                        </tr>
                        </#if>
                       </#list>
                       </#if>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="form-group">
                <a title="Thêm người dùng" href="/share/page/add-username" class="btn btn-default">Thêm</a>
                <a title="Báo cáo chi tiết theo người dùng" target="_blank" class="btn btn-default clickreportusername" id="username">Báo cáo</a>
            </div>

            <div class="page-header">
                <h3>Quản lý bảng phân công theo năm</h3>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Năm</th>
                            <th>Thư mục</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#if (count > 0)>
                       <#assign stt = 0>
                       <#list data.Object as item>
                       <#if item.cru1p1 == 0>
                       <#assign stt = stt + 1>
                        <tr>
                            <td>${stt}</td>
                            <td>${item.cru1p0}</td>
                            <td>${item.path}</td>
                            <td class="text-right">
                                <button title="Chi tiết" class="btn btn-default detaill" id="${item.cru1p0}" value="${item.cru1p2}"><i class="fa fa-pencil fa-fw"></i></button>&nbsp;
                                <button title="Xóa " class="btn btn-danger dell" id="${item.cru1p0}"><i class="fa fa-trash fa-fw"></i></button>&nbsp;
                            </td>
                        </tr>
                       </#if>
                       </#list>
                        </#if>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="form-group">
                <a title="Thêm năm" href="/share/page/add-year" class="btn btn-default">Thêm</a>
                <a title="Báo cáo chi tiết theo năm" target="_blank" class="btn btn-default clickreportyear">Báo cáo</a>
            </div>
        </div>
      </div>
   </@>
</@>
<script type="text/javascript" src="${url.context}/res/components/searchminhpt/js/javascripts.js"></script>
<script type="text/javascript" src="${url.context}/res/components/searchminhpt/js/bootstrap.min.js"></script>