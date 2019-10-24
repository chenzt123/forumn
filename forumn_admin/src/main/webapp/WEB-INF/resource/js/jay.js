
$(document).ready(function(){
   $(".sales_tab tbody tr").each(function(i) {  
         var className = ["odd", "even"][i % 2]; 
         $(this).addClass(className);  
    }); 
});

$(document).ready(function(){
	$(".regi tbody tr:odd").addClass("odd"); 
		 $(".regi tbody tr:even").addClass("even");
		 $(".regi tbody tr").hover(function(){
				$(this).addClass("highlight");
			},function(){
				$(this).removeClass("highlight");
	 });
}); 

