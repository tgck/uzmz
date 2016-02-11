console.log("hello world!");
alert("hoge");

chrome.tabs.onUpdated.addListener(function(tabId, changeInfo, tab){
//	alert("hogehoge");
});

// タブの新規作成時。
// あたらしいURLに遷移した時、ではないことに注意
chrome.tabs.onCreated.addListener(function(tabId, changeInfo, tab){
	alert("hogehoge");
});