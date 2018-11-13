"use strict";
(function(){
	
	$(document).ready(function(){
		
		$.get('categories',{},function(data){
			let json=JSON.parse(data);
			if(!json){
				noCat();
				return;
			}
			
			let parent=$('#categories');
			parent.empty();
			for(let i=0;i<json.length;i++){
				let cat=new Category(json[i]);
				parent.append(cat.build(i));
			}
		});
	});
	
	function noCat(){
		$('#categories').append('<h3>Hittade inga kategorier</h3>');
	}
	
	
})();