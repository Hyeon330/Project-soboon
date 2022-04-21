function goPrev(gp){
   let goPrev = gp-1;
   location.href="/board/saleBoardList?currentPage="+goPrev+"";
}

function goPage(p){
   location.href="/board/saleBoardList?currentPage="+p+"";
}

function goNext(gn){
   let goNext = gn+1;
   location.href="/board/saleBoardList?currentPage="+goNext+"";
}
