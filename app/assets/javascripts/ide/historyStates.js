window.addEventListener("popstate", function(e) {
    var apiEndpoint = "/m/" + location.pathname + ".json";
    //$.get(apiEndpoint, function(data) {
		// ---- hardcoding for testing
    	data = {"id":1,"name":"About","description":"\u003ch1\u003eTitle\u003c/h1\u003e\u003cp\u003eThis is the description\u003c/p\u003e\u003cp\u003e\u003cb\u003eThis is bold\u003c/b\u003e\u003c/p\u003e\u003cp\u003e\u003ci\u003e\u003c/i\u003e\u003ci\u003eThis is italic\u003c/i\u003e\u003cbr\u003e\u003c/p\u003e\u003cp\u003e\u003ci\u003e\u003cu\u003e\u003c/u\u003e\u003c/i\u003e\u003cu\u003eThis is underlined\u003c/u\u003e\u003ci\u003e\u003cbr\u003e\u003c/i\u003e\u003c/p\u003e\u003cp\u003e\u003csmall\u003e\u003c/small\u003e\u003cu\u003e\u003csmall\u003e\u003c/small\u003e\u003c/u\u003e\u003csmall\u003e\u003c/small\u003e\u003cu\u003e\u003csmall\u003e\u003c/small\u003e\u003c/u\u003e\u003csmall\u003eThis is small\u003c/small\u003e\u003cu\u003e\u003c/u\u003e\u003c/p\u003e\u003cblockquote\u003eThis is quoted\u003c/blockquote\u003e\u003cul\u003e\u003cli\u003eul1\u003c/li\u003e\u003cli\u003eul2\u003c/li\u003e\u003c/ul\u003e\u003col\u003e\u003cli\u003eol1\u003cbr\u003e\u003c/li\u003e\u003cli\u003eol2\u003c/li\u003e\u003c/ol\u003e\u003cbr\u003e\u003cbr\u003e","created_at":"2015-06-26T13:23:18.727Z","updated_at":"2015-06-26T13:23:18.727Z"}
		//-----
		editor.setValue(data.description, true);
	//});
});