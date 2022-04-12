function goPrev(gp, category){
   let goPrev = gp-1;
   location.href="/board/shareAndReqList?currentPage="+goPrev+"&category="+category+"";
}

function goPage(p, category){
   location.href="/board/shareAndReqList?currentPage="+p+"&category="+category+"";
}

function goNext(gn, category){
   let goNext = gn+1;
   location.href="/board/shareAndReqList?currentPage="+goNext+"&category="+category+"";
}
