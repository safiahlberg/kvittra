"use strict";
(function(){
	
 class Category{
	 constructor(item){
		this.name=item.name;
		this.uuid=item.uuid;
		this.colors=['color-1','color-2','color-3','color-4'];
	 }
	 build(index){
		let color=this.colors[index%this.colors.length];
		let wrap=$('<div class="row category '+color+'"></div>');
		let summary=$('<div class="col-sm"><h3><a href="reciepts/'+this.uuid+'">'+this.name+'</a></h3><span class="bottom"><small>UUID <a href="#">'+this.uuid+'</a></small></span></div>');
		let controls=$('<div class="col-sm">Ta bort</div>');
		wrap.append(summary);
		wrap.append(controls);
		return wrap;
	 }
 }
 
 window.Category=Category;
	
})();