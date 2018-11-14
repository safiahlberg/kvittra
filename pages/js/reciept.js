"use strict";

(function(){
	
	$('#add-reciept-btn').click(function(){
		$.get('reciept',{},function(data){
			let json=JSON.parse(data);
			let reciept=new Reciept(json);
			$('#reciept-list').append(reciept.build());
		});
		
	});
	
	
})();