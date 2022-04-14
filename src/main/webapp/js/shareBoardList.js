function goPrev(gp){
   let goPrev = gp-1;
   location.href="/board/shareBoardList?currentPage="+goPrev+"";
}

function goPage(p){
   location.href="/board/shareBoardList?currentPage="+p+"";
}

function goNext(gn){
   let goNext = gn+1;
   location.href="/board/shareBoardList?currentPage="+goNext+"";
}
