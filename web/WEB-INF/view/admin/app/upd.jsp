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
				<h3 class="box-title"><small><i class="glyphicon glyphicon-edit"></i></small></h3>
				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool" id="back"><i class="glyphicon glyphicon-arrow-left"></i></button>
				</div>
			</div>
			<div class="box-body">
				<form class="dataForm" id="dataForm" role="form" action="upd2.action" method="post">
					<div class="form-group"><label class="control-label" for="tc_code">代号：</label><input type="text" class="form-control input-sm" id="tc_code" name="m['tc_code']" value="${po.m.tc_code}" validate validate-rule-required/></div>
					<div class="form-group"><label class="control-label" for="tc_name">名称：</label><input type="text" class="form-control input-sm" id="tc_name" name="m['tc_name']" value="${po.m.tc_name}" validate validate-rule-required/></div>
					<div class="form-group"><label class="control-label" for="tc_url">URL：</label><input type="text" class="form-control input-sm" id="tc_url" name="m['tc_url']" value="${po.m.tc_url}" validate validate-rule-inputType="url"/></div>
					<div class="form-group"><label class="control-label" for="tc_order">排序：</label><input type="text" class="form-control input-sm" id="tc_order" name="m['tc_order']" value="${po.m.tc_order}" validate validate-rule-inputType="integer"/></div>
					<div class="form-group"><label class="control-label" for="tc_permit_id">权限：</label><input type="text" class="form-control input-sm" id="tc_permit_id" name="m['tc_permit_id']" value="${po.m.tc_permit_id}"/></div>
					<div class="form-group"><label class="control-label" for="tc_status">状态：</label>
						<select class="form-control input-sm" id="tc_status" name="m['tc_status']">
							<option value="1">启用</option>
							<option value="0">禁用</option>
						</select>
					</div>
					<input type="hidden" name="m['id']" value="${po.m.id}">
				</form>
				<!-- modal -->
				<div id="modal_sel1"></div>
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
// permitTree 的参数配置
var permitSetting = {
	async: 
	{
		enable: true,
		url:"${ctx}/dict/getPermitTreeNodes.action?tc_type=0&permitId=${po.m.tc_permit_id}"
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
	// 状态selection返回值
	$("#tc_status").val("${po.m.tc_status}");
	// 定义权限树选择框
    var s1 = $("#modal_sel1").ZtreeSelectModal({treeid:"tree_permit",
												  title:"请选择权限节点",
												  setting:permitSetting,
												  callback:{
													  onConfirm:function(modalObj,rtnVal){
														  $("#tc_permit_id").val(rtnVal.vId);
													  }
												  }
	});
	$("#tc_permit_id").focus(function(){
		s1.modal("show");
	});
});
</script>