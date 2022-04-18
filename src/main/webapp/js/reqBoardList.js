function goPrev(gp){
   let goPrev = gp-1;
   location.href="/board/reqBoardList?currentPage="+goPrev+"";
}

function goPage(p){
   location.href="/board/reqBoardList?currentPage="+p+"";
}

function goNext(gn){
   let goNext = gn+1;
   location.href="/board/reqBoardList?currentPage="+goNext+"";
}
