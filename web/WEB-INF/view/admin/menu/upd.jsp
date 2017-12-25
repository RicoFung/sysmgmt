<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/view-begin.jsp"%>
<!-- 主内容面板 -->
<div class="content-wrapper">
	<!-- Header ======================================================================================================= -->
	<section class="content-header">
		<h1>${param.menuName}<small>修改</small></h1>
		<ol class="breadcrumb">
			<li><a href="${ctx}/index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
			<li><a href="query.action?menuId=${param.menuId}&menuName=${param.menuName}">${param.menuName}</a></li>
			<li class="active">修改</li>
		</ol>
	</section>
	<!-- Content ======================================================================================================= -->
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title"><small><i class="glyphicon glyphicon-edit"></i></small></h3>
				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool" id="back"><i class="glyphicon glyphicon-arrow-left"></i></button>
				</div>
			</div>
			<div class="box-body">
				<form class="dataForm" id="dataForm" role="form" action="upd2.action" method="post">
					<div class="form-group"><label class="control-label" for="tc_code">代号：</label><input type="text" class="form-control input-sm" id="tc_code" name="m['tc_code']" value="${po.m.tc_code}" validate validate-rule-required/></div>
					<div class="form-group"><label class="control-label" for="tc_name">名称：</label><input type="text" class="form-control input-sm" id="tc_name" name="m['tc_name']" value="${po.m.tc_name}" validate validate-rule-required/></div>
					<div class="form-group"><label class="control-label" for="tc_order">排序：</label><input type="text" class="form-control input-sm" id="tc_order" name="m['tc_order']" value="${po.m.tc_order}"/></div>
					<div class="form-group"><label class="control-label" for="tc_app_id">应用：</label>
						<input type="text" class="form-control input-sm" id="sel_app" value="${po.m.tc_app_name}[${po.m.tc_app_id}]"/>
						<input type="hidden" class="form-control input-sm" id="tc_app_id" name="m['tc_app_id']" value="${po.m.tc_app_id}"/>
					</div>
					<div class="form-group"><label class="control-label" for="pid">PID：</label>
						<input type="text" class="form-control input-sm" id="sel_menu" value="${po.m.tc_p_name}[${po.m.pid}]"/>
						<input type="hidden" class="form-control input-sm" id="pid" name="m['pid']" value="${po.m.pid}"/>
					</div>
					<div class="form-group"><label class="control-label" for="tc_permit_id">权限：</label>
						<input type="text" class="form-control input-sm" id="sel_permit" value="${po.m.tc_permit_name}[${po.m.tc_permit_id}]"/>
						<input type="hidden" class="form-control input-sm" id="tc_permit_id" name="m['tc_permit_id']" value="${po.m.tc_permit_id}"/>
					</div>
					<div class="form-group"><label class="control-label" for="tc_level">级别：</label>
						<select class="form-control input-sm" id="tc_level" name="m['tc_level']">
							<option value="0">根节点</option>
							<option value="1">一级节点</option>
							<option value="2">次级节点</option>
						</select>
					</div>
					<input type="hidden" name="m['id']" value="${po.m.id}">
				</form>
				<!-- modal -->
				<div id="modal_sel_app"></div>
				<div id="modal_sel_menu"></div>
				<div id="modal_sel_permit"></div>
			</div>
			<div class="box-footer">
				<button type="submit" class="btn btn-block btn-success btn-flat pull-right" id="dataFormSave"><i class="glyphicon glyphicon-floppy-save"></i></button>
			</div>
		</div>
	</section>
</div>
<%@ include file="/include/view-end.jsp"%>
<!-- ======================================================================================================= -->
<script type="text/javascript" src="${statics}/res/chok/js/chok.auth.js"></script>
<script type="text/javascript" src="${statics}/res/chok/js/chok.view.upd.js"></script>
<script type="text/javascript">
/**********************************************************/
/* 保存后回调函数 */
/**********************************************************/
$chok.form.callback = function(){
	if($chok.result.type == 1){
 		location.href = "query.action?"+$chok.view.fn.getUrlParams("${queryParams}");
	}
};
/**********************************************************/
/* zTree配置 */
/**********************************************************/
// appTree 的参数配置
var appSetting = {
	async: 
	{
		enable: true,
		url:function(){return "${ctx}/dict/getAppTreeNodes.action?appId="+$("#tc_app_id").val();}
	}
};
//menuTree 的参数配置
var menuSetting = {
	async: 
	{
		enable: true,
		url:function(){return "${ctx}/dict/getMenuTreeNodes.action?menuId=${po.m.pid}&tc_app_id="+$("#tc_app_id").val();}
	} 
};
// permitTree 的参数配置
var permitSetting = {
	async: 
	{
		enable: true,
		url:function(){return "${ctx}/dict/getPermitTreeNodes.action?tc_type=1&permitId=${po.m.tc_permit_id}&tc_app_id="+$("#tc_app_id").val();}
	}
};
/**********************************************************/
/* 全局函数 */
/**********************************************************/
$(function(){
	$chok.view.fn.selectSidebarMenu("${param.menuId}","${param.menuPermitId}","${param.menuName}");
	// 返回列表页
	$("#back").click(function(){
		location.href = "query.action?"+$chok.view.fn.getUrlParams("${queryParams}");
	});
	// 级别selection返回值
	$("#tc_level").val("${po.m.tc_level}");
	// 级别selection监听事件
	$("#tc_level").change(function(){
		if($(this).val()==0){
			$("#pid").val(0);
			$("#pid").attr("readonly",true);
			$("#sel_menu").val("");
			$("#sel_menu").attr("readonly",true);
			
			$("#tc_permit_id").val("0");
			$("#tc_permit_id").attr("readonly",true);
			$("#sel_permit").val("");
			$("#sel_permit").attr("readonly",true);
		}else{
			$("#pid").val("");
			$("#pid").attr("readonly",false);
			$("#sel_menu").attr("readonly",false);
			
			$("#tc_permit_id").val("");
			$("#tc_permit_id").attr("readonly",false);
			$("#sel_permit").attr("readonly",false);
		}
	});
	// 初始化所有modal_sel
	var modal_sel_app = $("#modal_sel_app").ZtreeSelectModal({
		treeid : "tree_app",
		title : "绑定应用",
		setting : appSetting,
		callback : {
			onConfirm : function(modalObj, rtnVal) {
				$("#sel_app").val(rtnVal.vName);
				$("#tc_app_id").val(rtnVal.vId);
				// 置空父菜单与权限
				$("#sel_menu").val("");
				$("#pid").val("");
				$("#sel_permit").val("");
				$("#tc_permit_id").val("");
			}
		}
	});
	var modal_sel_menu = $("#modal_sel_menu").ZtreeSelectModal({
		treeid : "tree_menu",
		title : "绑定父菜单",
		setting : menuSetting,
		callback : {
			onConfirm : function(modalObj, rtnVal) {
				$("#sel_menu").val(rtnVal.vName);
				$("#pid").val(rtnVal.vId);
			}
		}
	});
	var modal_sel_permit = $("#modal_sel_permit").ZtreeSelectModal({
		treeid : "tree_permit",
		title : "绑定权限",
		setting : permitSetting,
		callback : {
			onConfirm : function(modalObj, rtnVal) {
				$("#sel_permit").val(rtnVal.vName);
				$("#tc_permit_id").val(rtnVal.vId);
			}
		}
	});
	$("#sel_app").focus(function() {
		modal_sel_app.modal("show");
	});
	$("#sel_menu").focus(function() {
		modal_sel_menu.modal("show");
	});
	$("#sel_permit").focus(function() {
		modal_sel_permit.modal("show");
	});
});
</script>