var pln=119.591585;
var pla=39.94528;
function $s(s){
	return document.getElementById(s);
	}
function $$(s){
	return document.getElementByName(s);
	}
    //�����ͳ�ʼ����ͼ������
    function initMap(){
        createMap();//������ͼ
        setMapEvent();//���õ�ͼ�¼�
        addMapControl();//���ͼ��ӿؼ�
        addMarker();//���ͼ�����marker
    }
    
    //������ͼ������
    function createMap(){
        var map = new BMap.Map("baidumap");//�ڰٶȵ�ͼ�����д���һ����ͼ
        var point = new BMap.Point(pln,pla);//����һ�����ĵ�����
        map.centerAndZoom(point,14);//�趨��ͼ�����ĵ�����겢����ͼ��ʾ�ڵ�ͼ������
        window.map = map;//��map�����洢��ȫ��
    }
    
    //��ͼ�¼����ú�����
    function setMapEvent(){
        map.enableDragging();//���õ�ͼ��ק�¼���Ĭ������(�ɲ�д)
        map.enableScrollWheelZoom();//���õ�ͼ���ַŴ���С
        map.enableDoubleClickZoom();//�������˫���Ŵ�Ĭ������(�ɲ�д)
        map.enableKeyboard();//���ü����������Ҽ��ƶ���ͼ
    }
    
    //��ͼ�ؼ���Ӻ�����
    function addMapControl(){
        //���ͼ��������ſؼ�
 //var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
 //map.addControl(ctrl_nav);
        //���ͼ���������ͼ�ؼ�
 var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
 map.addControl(ctrl_ove);
        //���ͼ����ӱ����߿ؼ�
var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
 map.addControl(ctrl_sca);
    

   	
	}
    
    //��ע������
	
    //var markerArr = [{title:"΢Ѷ���",content:"�绰��0335-1234567<br/>�ֻ���1330001111",point:"119.591585|39.94528",isOpen:1,icon:{w:23,h:25,l:46,t:21,x:9,lb:12}}];
   
    var markerArr = [{title:"",content:"",point:"",isOpen:0,icon:{w:23,h:25,l:46,t:21,x:9,lb:12}}];

    //����marker
    function addMarker(){
        for(var i=0;i<markerArr.length;i++){
				var json = markerArr[i];
				var p0 = json.point.split("|")[0];
				var p1 = json.point.split("|")[1];
				var point = new BMap.Point(p0,p1);
				var iconImg = createIcon(json.icon);
				var marker = new BMap.Marker(point,{icon:iconImg});
				var iw = createInfoWindow(i);
				var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
				marker.setLabel(label);
				map.addOverlay(marker);
				label.setStyle({
                        borderColor:"#808080",
                        color:"#333",
                        cursor:"pointer"
            });
   
  (function(){
    var index = i;
    var _iw = createInfoWindow(i);
    var _marker = marker;
    _marker.addEventListener("click",function(){
        this.openInfoWindow(_iw);
       });
       _iw.addEventListener("open",function(){
        _marker.getLabel().hide();
       })
       _iw.addEventListener("close",function(){
        _marker.getLabel().show();
       })
    label.addEventListener("click",function(){
	alert(e.point);
        _marker.openInfoWindow(_iw);
       })
    if(!!json.isOpen){
     label.hide();
     _marker.openInfoWindow(_iw);
    }
   })()
        }
    }
    //����InfoWindow
    function createInfoWindow(i){
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
        return iw;
    }
    //����һ��Icon
    function createIcon(json){
        var icon = new BMap.Icon("js/baidumapico/us_cursor.gif", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
        return icon;
    }
function showmap(){
	try{
		//alert($s("baidumap"));
		if($("#baidumap").css("z-index")!="9" && $("#baidumap").css("z-index")!="-9"){
			var ln=$("#longtitude").val().replace(/\s/gm,"");
			var la=$("#latitude").val().replace(/\s/gm,"");
			if (ln!="" && la!=""){
				pln=parseFloat(ln);
				pla=parseFloat(la);
				
				markerArr[0].point=ln+"|"+la;
			}
			var mw = $('#baidumap')[0].clientWidth;
			var mh = $('#baidumap')[0].clientHeight;
			var dh = document.body.clientHeight;
			var dw = document.body.clientWidth;
			var dl = $('#man_zone')[0].scrollLeft;
			var dt = $('#man_zone')[0].scrollTop;
			//alert("mw:"+mw+";  "+"mh:"+mh+";  "+"dh:"+dh+";  "+"dw:"+dw+";  "+"dl:"+dl+";  "+"dt:"+dt+";  ");
			//$s('baidumap').style.top=(dh-dt-mh)/2;
			//$s('baidumap').style.left=(dw-dl-mw)/2;
			$('#baidumap').css("top",(dh-dt-mh)/2);
			$('#baidumap').css("left",(dw-dl-mw)/2);
			//alert($s('baidumap').top);
			$('#baidumap').css("z-index","9");
			initMap();//�����ͳ�ʼ����ͼ
			map.addEventListener("click",function(e){   
				newpoint = new BMap.Point(e.point.lng,e.point.lat);

				$("#longtitude")[0].value = e.point.lng; 
				$("#latitude")[0].value = e.point.lat;    //���������ľ�γ��
				//����map.removeOverlay����map.clearOverlays����ʱ��API���Զ���initialize�������ص�DOMԪ�ؽ����Ƴ�
				map.clearOverlays();
				markerArr[0].point=e.point.lng+"|"+e.point.lat;
				addMarker();
				//return false;
			});
			
		}else{
			$("#baidumap").css("z-index",$("#baidumap").css("z-index")=="9"?"-9":"9");
		}
	}catch(e){
	alert(e.description );
	}
}
function hidemap(){
	//$s('baidumap').style.zIndex="-9";
	$('#baidumap').css({"z-index":"-9"});
}
$(document).ready(function(ev){
	$(document).click(function(ev){
		var ev  =  ev  ||  window.event;
		var target =  ev.target  ||  ev.srcElement;
		var thiseleid=target.id;
		//alert(thiseleid);
		if(thiseleid!="latitude" && thiseleid!="longtitude" && $("#baidumap").css("z-index")=="9"){hidemap()}
	});
	$("#baidumap").click(function(){
		return false;
	});
	$("#longtitude,#latitude").dblclick(function(){
		showmap();
	});
});