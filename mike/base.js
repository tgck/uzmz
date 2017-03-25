var
  uuid = function () {
    var uuid = "", i, random;
    for (i = 0; i < 32; i++) {
      random = Math.random() * 16 | 0;
      if (i == 8 || i == 12 || i == 16 || i == 20) {
        uuid += "-"
      }
      uuid += (i == 12 ? 4 : (i == 16 ? (random & 3 | 8) : random)).toString(16);
    }
    return uuid;
  },
  uuids = function() {
	   return uuid().substr(0,8);
  }
  ;

var // BASE = [1, 1, 1, 1, 0, 1, 1, 1, 1],
		BASE = [0, 0, 0, 0, 1, 0, 0, 0, 0],
    CENTER = 4;
		Entry = function(parentId, id) { // クラス定義
		  this.id = id || uuids();
  		// this.content = this.id; // とりあえず
      this.content = "nv";
		  this.parent = parentId;
      this.date = moment().format('X');
		  this.relatives = BASE.map(function(val){ // 初期化
  			return val ? "" : val;
  		});
		};
		saveStorage = function(obj) {
	  	var ostr;
		  switch (typeof obj) {
    		case "string":
      		ostr = obj;
	      	break;
	  	  case "object":
  	  	default:
	  	    ostr = JSON.stringify(obj);
      		break;
	  	};
  		localStorage.setItem('mdr', ostr);
		},
    loadStorage = function() {
  		return JSON.parse(localStorage.getItem('mdr'));
		};
