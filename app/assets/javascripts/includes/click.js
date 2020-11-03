document.getElementById("mypage").onclick = function(){
  const HeaderDropdown = document.getElementById("dropdown");
  if(HeaderDropdown.style.display=="block"){
    HeaderDropdown.style.display = "none";
  }else{
    HeaderDropdown.style.display = "block";
  };
};