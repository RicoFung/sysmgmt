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
		<div class="row">
			<!-- Left ======================================================================================================= -->
			<div class="col-md-8">
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
							<div class="form-group"><label class="control-label" for="tc_email">邮箱：</label><input type="text" class="form-control input-sm" id="tc_email" name="m['tc_email']" value="${po.m.tc_email}" validate validate-rule-inputType="email"/></div>
							<input type="hidden" name="m['id']" value="${po.m.id}">
							<input type="hidden" id="tc_role_ids" name="m['tc_role_ids']" value="${po.m.tc_role_ids}">
						</form>
					</div>
					<div class="box-footer">
						<button type="submit" class="btn btn-block btn-success btn-flat pull-right" id="dataFormSave"><i class="glyphicon glyphicon-floppy-save"></i></button>
					</div>
				</div>
			</div>
			<!-- right ====================================================================================================== -->
			<div class="col-md-4">
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title"><small><i class="glyphicon glyphicon-equalizer"></i></small>&nbsp;关联角色</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
						</div>
					</div>
					<div class="box-body">
						<input type="checkbox" id="expandAll"/><label for="expandAll">&nbsp;展开</label>
						<input type="checkbox" id="chkAll"/><label for="chkAll">&nbsp;全选</label>
						<ul id="roleTree" class="ztree" style="overflow:auto"></ul>
					</div>
					<div class="box-footer">
					&nbsp;
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<%@ include file="/include/view-end.jsp"%>
<!-- ======================================================================================================= -->
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
/* 全局函数 */
/**********************************************************/
$(function(){
	$chok.view.fn.selectSidebarMenu("${param.menuId}","${param.menuPermitId}","${param.menuName}");
	// 返回列表页
	$("#back").click(function(){
		location.href = "query.action?"+$chok.view.fn.getUrlParams("${queryParams}");
	});
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
    // 全选/全不选
    $("#chkAll").click(function(){
    	var zTree = $.fn.zTree.getZTreeObj("roleTree");
        if($(this).prop("checked")==true){
        	zTree.checkAllNodes(true);
        }else{
        	zTree.checkAllNodes(false);
        }
    	$("#tc_role_ids").val(getCheckedNodesIds());
    });
});
/**********************************************************/
/* zTree配置 */
/**********************************************************/
// 获取已选节点id集合
function getCheckedNodesIds()
{
	var zTree = $.fn.zTree.getZTreeObj("roleTree")
    var nodes = zTree.getCheckedNodes(true);
	var ids = [];
	for(var i=0; i<nodes.length; i++) {
		ids.push(nodes[i].id);
	}
	return ids;
}
// zTree 的参数配置
var zTreeObj;
var setting = 
{
	check: 
	{
		enable: true,
		chkboxType: { "Y": "ps", "N": "s" }
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
	},
	callback: {
		onCheck: function (event, treeId, treeNode) {
	    	$("#tc_role_ids").val(getCheckedNodesIds());
		}
	}
};
</script>