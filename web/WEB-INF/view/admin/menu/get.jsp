<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/view-begin.jsp"%>
<!-- 主内容面板 -->
<div class="content-wrapper">
	<!-- Header ======================================================================================================= -->
	<section class="content-header">
		<h1>${param.menuName}<small>明细</small></h1>
		<ol class="breadcrumb">
			<li><a href="${ctx}/index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
			<li><a href="query.action?menuId=${param.menuId}&menuName=${param.menuName}">${param.menuName}</a></li>
			<li class="active">明细</li>
		</ol>
	</section>
	<!-- Content ======================================================================================================= -->
	<section class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title"><small><i class="glyphicon glyphicon-info-sign"></i></small></h3>
				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool" id="back"><i class="glyphicon glyphicon-arrow-left"></i></button>
				</div>
			</div>
			<div class="box-body">
				<form class="dataForm" id="dataForm" role="form">
					<div class="form-group"><label class="control-label" for="id">ID：</label><input type="text" class="form-control input-sm" id="id" name="m['id']" value="${po.m.id}" readonly="readonly"/></div>
					<div class="form-group"><label class="control-label" for="tc_code">代号：</label><input type="text" class="form-control input-sm" id="tc_code" name="m['tc_code']" value="${po.m.tc_code}" readonly="readonly"/></div>
					<div class="form-group"><label class="control-label" for="tc_name">名称：</label><input type="text" class="form-control input-sm" id="tc_name" name="m['tc_name']" value="${po.m.tc_name}" readonly="readonly"/></div>
					<div class="form-group"><label class="control-label" for="tc_url">URL：</label><input type="text" class="form-control input-sm" id="tc_url" name="m['tc_url']" value="${po.m.tc_url}" readonly="readonly"/></div>
					<div class="form-group"><label class="control-label" for="tc_order">排序：</label><input type="text" class="form-control input-sm" id="tc_order" name="m['tc_order']" value="${po.m.tc_order}" readonly="readonly"/></div>
					<div class="form-group"><label class="control-label" for="tc_app_name">应用：</label><input type="text" class="form-control input-sm" id="tc_app_name" name="m['tc_app_name']" value="${po.m.tc_app_name}[${po.m.tc_app_id}]" readonly="readonly"/></div>
					<div class="form-group"><label class="control-label" for="tc_p_name">PID：</label><input type="text" class="form-control input-sm" id="tc_p_name" name="m['tc_p_name']" value="${po.m.tc_p_name}[${po.m.pid}]" readonly="readonly"/></div>
					<div class="form-group"><label class="control-label" for="tc_permit_name">权限：</label><input type="text" class="form-control input-sm" id="tc_permit_name" name="m['tc_permit_name']" value="${po.m.tc_permit_name}[${po.m.tc_permit_id}]" readonly="readonly"/></div>
					<div class="form-group"><label class="control-label" for="tc_level">级别：</label>
						<select class="form-control input-sm" id="tc_level" name="m['tc_level']" readonly="readonly">
							<option value="0">根节点</option>
							<option value="1">一级节点</option>
							<option value="2">次级节点</option>
						</select>
					</div>				
				</form>
			</div>
			<div class="box-footer">
			&nbsp;
			</div>
		</div>
	</section>
</div>
<%@ include file="/include/view-end.jsp"%>
<script type="text/javascript" src="${statics}/res/chok/js/chok.view.get.js"></script>
<script type="text/javascript">
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
	$("#tc_level").val("${po.m.tc_level}");
});
</script>