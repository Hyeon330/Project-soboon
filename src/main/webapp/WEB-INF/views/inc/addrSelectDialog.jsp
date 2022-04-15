<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/css/addrDialog.css">
<div id="addrSelectDialog">
	<form id="addrSelectBox">
		<select class="largeAddrSelect" name="large" default="${addrLarge}"></select>
		<select class="mediumAddrSelect" name="medium" default="${addrMedium}"></select>
		<select class="smallAddrSelect" name="small" default="${addrSmall}"></select>
	</form>
</div>