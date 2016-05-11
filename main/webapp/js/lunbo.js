$(function(){
    var f=0;
    var i=0;
    $(".pic-mini").eq(0).show();
    $(".info-area").eq(0).show();
    $(".pic-mini").eq(0).css("opacity","1");
    $(".title").eq(0).show();
    $(".bgi").eq(0).show();
    var dsq=setInterval(function(){cChange_z(i)},2000);
    $(".pic-mini").hover(function(){
        i=$(this).index();
        clearInterval(dsq);
        cChange_z(i);
    },function(){dsq=setInterval(function(){cChange_z(i)},2000);});
    function cChange_s(i){
        if(i!=f){
            $(".bgi").eq(f).fadeTo(500, 0);
            $(".bgi").eq(i).fadeTo(500, 1);
            f=i;
        }
    }
    function cChange_z(g){
        if(g<=4) {
            cChange_s(g);
            oChange(g);
            i++;
        }
        else{
            cChange_s(0);
            oChange(0);
            i=0;
        }
    }
    function oChange(i){
        $(".pic-mini").eq(i).css("opacity","1").siblings().css("opacity","0.5");
        $(".info-area").hide();
        $(".info-area").eq(i).show();
        $(".title").hide();
        $(".title").eq(i).show();
    }
});