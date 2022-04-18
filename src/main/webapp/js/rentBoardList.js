function goPrev(gp){
   let goPrev = gp-1;
   location.href="/board/rentBoardList?currentPage="+goPrev+"";
}

function goPage(p){
   location.href="/board/rentBoardList?currentPage="+p+"";
}

function goNext(gn){
   let goNext = gn+1;
   location.href="/board/rentBoardList?currentPage="+goNext+"";
}
