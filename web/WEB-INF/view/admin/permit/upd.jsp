<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/view-begin.jsp"%>
<!-- 主内容面板 -->
<div class="content-wrapper">
	<section class="content-header">
		<h1>${param.menuName}<small>修改</small></h1>
		<ol class="breadcrumb">
			<li><a href="${ctx}/index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
			<li><a href="query.action?menuId=${param.menuId}&menuName=${param.menuName}">${param.menuName}</a></li>
			<li class="active">修改</li>
		</ol>
	</section>
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">&nbsp</h3>
				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool" id="back"><i class="glyphicon glyphicon-arrow-left"></i></button>
				</div>
			</div>
			<div class="box-body">
				<form class="dataForm" id="dataForm" role="form" action="upd2.action" method="post">
					<div class="form-group"><label class="control-label" for="tc_code">代号：</label><input type="text" class="form-control input-sm" id="tc_code" name="m['tc_code']" value="${po.m.tc_code}" validate validate-rule-required/></div>
					<div class="form-group"><label class="control-label" for="tc_name">名称：</label><input type="text" class="form-control input-sm" id="tc_name" name="m['tc_name']" value="${po.m.tc_name}" validate validate-rule-required/></div>
					<div class="form-group"><label class="control-label" for="tc_url">URL：</label><input type="text" class="form-control input-sm" id="tc_url" name="m['tc_url']" value="${po.m.tc_url}"/></div>
					<div class="form-group"><label class="control-label" for="tc_order">排序：</label><input type="text" class="form-control input-sm" id="tc_order" name="m['tc_order']" value="${po.m.tc_order}"/></div>
					<div class="form-group"><label for="tc_type">类型：</label>
						<select class="form-control input-sm" id="tc_type" name="m['tc_type']">
							<option value="0">应用</option>
							<option value="1">菜单</option>
							<option value="2">按钮</option>
							<option value="3">请求</option>
						</select>
					</div>
					<div class="form-group"><label class="control-label" for="tc_app_id">应用：</label>
						<input type="text" class="form-control input-sm" id="sel_app" value="${po.m.tc_app_name}[${po.m.tc_app_id}]"/>
						<input type="hidden" class="form-control input-sm" id="tc_app_id" name="m['tc_app_id']" value="${po.m.tc_app_id}"/>
					</div>
					<div class="form-group"><label class="control-label" for="pid">父节点：</label>
						<input type="text" class="form-control input-sm" id="sel_permit" value="${po.m.tc_p_name}[${po.m.pid}]"/>
						<input type="hidden" class="form-control input-sm" id="pid" name="m['pid']" value="${po.m.pid}"/>
					</div>
					<input type="hidden" name="m['id']" value="${po.m.id}">
				</form>
				<!-- modal -->
				<div id="modal_sel_app"></div>
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
// permitTree 的参数配置
var permitSetting = {
	async: 
	{
		enable: true,
		url:function(){return "${ctx}/dict/getPermitTreeNodes.action?permitId=${po.m.pid}&tc_app_id="+$("#tc_app_id").val();}
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
	// 类型selection返回值
	$("#tc_type").val("${po.m.tc_type}");
	// 初始化所有modal_sel
	var modal_sel_app = $("#modal_sel_app").ZtreeSelectModal({
		treeid : "tree_app",
		title : "绑定应用",
		setting : appSetting,
		callback : {
			onConfirm : function(modalObj, rtnVal) {
				$("#sel_app").val(rtnVal.vName);
				$("#tc_app_id").val(rtnVal.vId);
			}
		}
	});
	var modal_sel_permit = $("#modal_sel_permit").ZtreeSelectModal({
		treeid : "tree_permit",
		title : "绑定父节点",
		setting : permitSetting,
		callback : {
			onConfirm : function(modalObj, rtnVal) {
				$("#sel_permit").val(rtnVal.vName);
				$("#pid").val(rtnVal.vId);
			}
		}
	});
	$("#sel_app").focus(function() {
		modal_sel_app.modal("show");
	});
	$("#sel_permit").click(function() {
		modal_sel_permit.modal("show");
	});
});
</script>