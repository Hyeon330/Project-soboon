<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/addrDialog.css">
<script src="/js/addrDialog.js"></script>
<div id="addrSelectDialog">
	<form id="addrSelectBox">
		<select id="largeAddrSelect" name="large" default="${addrLarge}"></select>
		<select id="mediumAddrSelect" name="medium" default="${addrMedium}"></select>
		<select id="smallAddrSelect" name="small" default="${addrSmall}"></select>
	</form>
</div>