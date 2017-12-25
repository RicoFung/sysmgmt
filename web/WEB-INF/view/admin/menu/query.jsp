<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/view-begin.jsp"%>
<!-- 主内容面板 -->
<div class="content-wrapper">
	<!-- Header ======================================================================================================= -->
	<section class="content-header">
		<h1>${param.menuName}</h1>
		<ol class="breadcrumb">
			<li><a href="${ctx}/index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
			<li class="active">${param.menuName}</li>
		</ol>
	</section>
	<!-- Content ======================================================================================================= -->
	<section class="content">
		<div class="row">
			<!-- Left Content ======================================================================================================= -->
			<div class="col-md-9">
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title"><small><i class="glyphicon glyphicon-th-list"></i></small></h3>
					</div>
					<div class="box-body">
						<!-- ToolBar ======================================================================================================= -->
						<div id="toolbar">
						<button type="button" class="btn btn-default" id="bar_btn_add" pbtnId="pbtn_add"><i class="glyphicon glyphicon-plus"></i></button>
						<button type="button" class="btn btn-default" id="bar_btn_del" pbtnId="pbtn_del"><i class="glyphicon glyphicon-remove"></i></button>
						<button type="button" class="btn btn-default" id="bar_btn_query" pbtnId="pbtn_query2" data-toggle="modal" data-target="#modal_form_query"><i class="glyphicon glyphicon-search"></i></button>
						</div>
						<!-- DataTable ======================================================================================================= -->
						<table id="tb_list"></table>
						<!-- context menu
						======================================================================================================= -->
						<ul id="tb_ctx_menu" class="dropdown-menu">
						    <li data-item="upd" class="upd" pbtnId="pbtn_upd"><a><i class="glyphicon glyphicon-edit"></i></a></li>
						    <li data-item="get" class="get" pbtnId="pbtn_get"><a><i class="glyphicon glyphicon-info-sign"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- Right Content ======================================================================================================= -->
			<div class="col-md-3">
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title"><small><i class="glyphicon glyphicon-equalizer"></i></small></h3>
					</div>
					<div class="box-body">
						<input type="checkbox" id="expandAll"/><label for="expandAll">&nbsp;展开</label>
						<ul id="menuTree" class="ztree" style="overflow:auto;padding-left:0px"></ul>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<!-- QueryDialog ======================================================================================================= -->
<form id="form_query">
<div id="modal_form_query" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modal_label" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			   <h4 class="modal-title" id="modal_label">筛选条件</h4>
			</div>
			<div class="modal-body">
				<!-- queryForm -->
				<div class="form-group">
					<label for="f_tc_app_id">应用：</label>
					<select class="form-control input-sm" id="f_tc_app_id">
						<option value="">全部</option>
						<c:forEach var="o" items="${appList}"><option value="${o.m.id}">${o.m.tc_name}</option></c:forEach>
					</select>
					<label for="f_tc_level">级别：</label>
					<select class="form-control input-sm" id="f_tc_level">
						<option value="">全部</option>
						<option value="0">根节点</option>
						<option value="1">一级节点</option>
						<option value="2">次级节点</option>
					</select>
					<label for="f_tc_name">代号：</label><input type="text" class="form-control input-sm" id="f_tc_code"/>
					<label for="f_tc_name">名称：</label><input type="text" class="form-control input-sm" id="f_tc_name"/>
					<label for="f_tc_p_name">父节点名称：</label><input type="text" class="form-control input-sm" id="f_tc_p_name"/>
				</div>
			</div>
			<div class="modal-footer">
			   <button type="reset" class="btn btn-default"><i class="glyphicon glyphicon-repeat"></i></button>
			   <button type="button" class="btn btn-primary" id="form_query_btn"><i class="glyphicon glyphicon-ok"></i></button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</form>
<%@ include file="/include/view-end.jsp"%>
<!-- ======================================================================================================= -->
<script type="text/javascript" src="${statics}/res/chok/js/chok.auth.js"></script>
<script type="text/javascript" src="${statics}/res/chok/js/chok.view.query.js"></script>
<script type="text/javascript">
/**********************************************************/
/* 全局函数 */
/**********************************************************/
$(function() {
	$chok.view.fn.selectSidebarMenu("${param.menuId}","${param.menuPermitId}","${param.menuName}");
	$chok.view.query.init.toolbar();
	$chok.view.query.init.modalFormQuery();
	$chok.view.query.init.table("${queryParams.f_page}","${queryParams.f_pageSize}");
	$chok.auth.btn($chok.view.menuPermitId,$g_btnJson);
});
/**********************************************************/
/* 初始化配置 */
/**********************************************************/
$chok.view.query.config.setPreFormParams = function(){
 	$("#f_tc_app_id").val(typeof("${queryParams.f_tc_app_id}")=="undefined"?"":"${queryParams.f_tc_app_id}");
 	$("#f_tc_level").val(typeof("${queryParams.f_tc_level}")=="undefined"?"":"${queryParams.f_tc_level}");
	$("#f_tc_code").val(typeof("${queryParams.f_tc_code}")=="undefined"?"":"${queryParams.f_tc_code}");
	$("#f_tc_name").val(typeof("${queryParams.f_tc_name}")=="undefined"?"":"${queryParams.f_tc_name}");
 	$("#f_tc_p_name").val(typeof("${queryParams.f_tc_p_name}")=="undefined"?"":"${queryParams.f_tc_p_name}");
};
$chok.view.query.config.formParams = function(p){
	p.tc_app_id = $("#f_tc_app_id").val();
	p.tc_level = $("#f_tc_level").val();
	p.tc_code = $("#f_tc_code").val();
	p.tc_name = $("#f_tc_name").val();
	p.tc_p_name = $("#f_tc_p_name").val();
    return p;
};
$chok.view.query.config.urlParams = function(){
	return {f_tc_app_id : $("#f_tc_app_id").val(),
			f_tc_level : $("#f_tc_level").val(),
		   	f_tc_code : $("#f_tc_code").val(),
		   	f_tc_name : $("#f_tc_name").val(),
			f_tc_p_name : $("#f_tc_p_name").val()};
};
$chok.view.query.config.tableColumns = 
[
    {title:'ID', field:'m.id', align:'center', valign:'middle', sortable:false},
    {title:'PID', field:'m.pid', align:'center', valign:'middle', sortable:false},
    {title:'权限', field:'m.tc_permit_id', align:'center', valign:'middle', sortable:false},
    {title:'类型', field:'m.tc_level_name', align:'center', valign:'middle', sortable:false},
    {title:'代号', field:'m.tc_code', align:'left', valign:'middle', sortable:false, 
    	editable:
    	{
	    	type:'text',
	    	title:'代号',
	    	validate: function(value){
	            return $chok.validator.checkEditable("required", null, value, null);
	    	}
    	}
    },
    {title:'名称', field:'m.tc_name', align:'left', valign:'middle', sortable:false, 
    	editable:
    	{
	    	type:'text',
	    	title:'名称',
	    	validate: function(value){
	            return $chok.validator.checkEditable("required", null, value, null);
	    	}
    	}
    },
    {title:'URL', field:'m.tc_url', align:'left', valign:'middle', sortable:false},
    {title:'排序', field:'m.tc_order', align:'left', valign:'middle', sortable:false, 
    	editable:
    	{
	    	type:'text',
	    	title:'排序',
	    	validate: function(value){
	            return $chok.validator.checkEditable("required", null, value, null);
	    	}
    	}
    },
    {title:'应用', field:'m.tc_app_name', align:'center', valign:'middle', sortable:false}
];
$chok.view.query.callback.delRows = function(){
	//zTreeObj.reAsyncChildNodes(null, "refresh"); // 刷新zTree
	initTree();
};
$chok.view.query.callback.onLoadSuccess = function(){
	//zTreeObj.reAsyncChildNodes(null, "refresh"); // 刷新zTree
	initTree();
	$chok.auth.btn($chok.view.menuPermitId,$g_btnJson);
};
/**********************************************************/
/* zTree配置 */
/**********************************************************/
// zTree 的参数配置
var zTreeObj;
var setting = 
{
	view: 
	{
		selectedMulti: false
	},
	check: 
	{
		enable: false
	},
	async: 
	{
		enable: true,
		url:function(){return "${ctx}/dict/getMenuTreeNodes.action?tc_app_id="+$("#f_tc_app_id").val();}
	},
	data: 
	{
		key: 
		{
			name:"tc_name"
		},
		simpleData: 
		{
			idKey:"id",
			pIdKey:"pid",
			enable: true
		}
	},
	callback: {
	}
};
// zTree的初始化
function initTree(){
    zTreeObj = $.fn.zTree.init($("#menuTree"), setting);
    // 全部展开/折叠
    $("#expandAll").click(function(){
    	var zTree = $.fn.zTree.getZTreeObj("menuTree");
        if($(this).prop("checked")==true){
        	zTree.expandAll(true);
        }else{
        	zTree.expandAll(false);
        }
    });
}
</script>
</head>