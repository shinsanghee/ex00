/**
 **/

console.log("Reply Module..............");

var replyService = (function() {

function add(replyj callback, error) {
	console.log("add reply.........................");

$.ajax({
  type : ’post',
  url : '/replies/new',
  data : :JSON.stringify(reply)
  contentType : "application/json; charset=utf-8"丄
  success : function(result, status^ xhr) {
    if (callback) {
      callback(result);
    }
  },
  error : function(xhr\ status丄 er) {
   if (error) {
     error(er); 
   }
  }
 })
}
	return {
	 add:add
  };
})();

