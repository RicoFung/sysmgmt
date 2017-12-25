<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/view-begin.jsp"%>
<!-- 主内容面板 -->
<div class="content-wrapper">
	<section class="content-header">
		<h1>${param.menuName}</h1>
		<ol class="breadcrumb">
			<li><a href="${ctx}/index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
			<li class="active">${param.menuName}</li>
		</ol>
	</section>
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title"><i class="glyphicon glyphicon-edit"></i></h3>
			</div>
			<div class="box-body">
				<form class="dataForm" id="dataForm" role="form" action="upd2.action" method="post">
					<div class="row">
						<div class="col-md-6 column">
							<fieldset>
							<legend>基础信息</legend>
								<div class="form-group"><label class="control-label" for="tc_code">代号：</label><input type="text" class="form-control input-sm" id="tc_code" name="m['tc_code']" value="${po.m.tc_code}" validate validate-rule-required/></div>
								<div class="form-group"><label class="control-label" for="tc_name">名称：</label><input type="text" class="form-control input-sm" id="tc_name" name="m['tc_name']" value="${po.m.tc_name}" validate validate-rule-required/></div>
								<div class="form-group"><label class="control-label" for="tc_email">邮箱：</label><input type="text" class="form-control input-sm" id="tc_email" name="m['tc_email']" value="${po.m.tc_email}" validate validate-rule-inputType="email"/></div>
								<input type="hidden" name="m['id']" value="${po.m.id}">
								<input type="hidden" id="tc_role_ids" name="m['tc_role_ids']" value="${po.m.tc_role_ids}">
							</fieldset>
						</div>
						<div class="col-md-6 column">
							<fieldset>
							<legend>角色</legend>
								<input type="checkbox" id="expandAll"/><label for="expandAll">&nbsp;展开</label>
								<ul id="roleTree" class="ztree" style="overflow:auto"></ul>
							</fieldset>
						</div>
					</div>
				</form>
			</div>
			<div class="box-footer">
				<button type="submit" class="btn btn-block btn-success btn-flat pull-right" id="dataFormSave"><i class="glyphicon glyphicon-floppy-save"></i></button>
			</div>
		</div>
	</section>
</div>
<%@ include file="/include/view-end.jsp"%>
<!-- ======================================================================================================= -->
<script type="text/javascript">
/**********************************************************/
/* 保存后回调函数 */
/**********************************************************/
$chok.form.callback = function(){
	if($chok.result.type == 1){
		location.href = "getMyInfo.action?id=${po.m.id}&menuName=个人资料";
	}
};
/**********************************************************/
/* 全局函数 */
/**********************************************************/
$(function(){
	$chok.view.fn.selectSidebarMenu("","${param.menuName}");
	// zTree的初始化
    zTreeObj = $.fn.zTree.init($("#roleTree"), setting);
    // 全部展开/折叠
    $("#expandAll").click(function(){
    	var zTree = $.fn.zTree.getZTreeObj("roleTree");
        if($(this).prop("checked")==true){
        	zTree.expandAll(true);
        }else{
        	zTree.expandAll(false);
        }
    });
});
/**********************************************************/
/* zTree配置 */
/**********************************************************/
// zTree 的参数配置
var zTreeObj;
var setting = 
{
	check: 
	{
		enable: true
	},
	async: 
	{
		enable: true,
		url:"getRoleTreeNodesByUserId.action?tc_user_id=${po.m.id}"
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
	}
};
</script>