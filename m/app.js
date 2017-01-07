// エントリ
var
  _arr = [], // (親ID, 子の配列. max 8個)
  _ids = [], // 発行済 ID の ストア
  _pwd = "" // 現在ノード(ID)
;

var new_entry = function () {
  // ID を払い出す
  var
    new_id = "";

  // 重複しない ID を保証する
  do {
    new_id = uuids();
  } while ( _ids.indexOf(new_id) >= 0 )

  return {
    id: new_id,
    children: []
  };
}

// ほる
var descend = function (id) {
}
// 特に指定せず、ほれるところを掘る
var descend_some = function () {
}

/**
 * 大親であるルートオブジェクトを取得する
 * したがって, 現在地がどこであれ同じオブジェクトが返却される
 * NOTE: ルートが作成されていない場合は, 作成して返す
 */
var get_root = function () {
  // プロキシパターン的な
  if ( _ids.length == 0 ) {
    var _root;
    _root = new_entry();
    _ids.push(_root.id);
    _arr.push(_root);
    _pwd = _root.id;
  }
  return _arr[0];
}
/**
 * ルートオブジェクト(ID) を取得する
 * 現在地がどこであれ同じオブジェクトが返却される
 * NOTE: ルートが作成されていない場合は, 作成される
 */
var get_root_id = function () {
  // ガード処理
  if (_arr.length === 0 ) {
    get_root();
  }
  return _arr[0].id;
}
var pr = get_root_id;

/**
 * IDを指定してノードを取得する
 * TODO: 該当無しの場合の挙動を追記
 */
var get_entry = function (id) {
  return _.find(_arr, ['id', id]);
}
var g = get_entry; // ショートカット

// カレントのポジションを返す
// TODO: スイッチとか
/**
 * 現在ノード(ID)を返す
 * ユーティリティ関数
 * TODO: 階層堀った時、そこから一段上がった時、ただしく動くか検証
 */
var current_node = function () {
  // return _ids[_ids.length -1] || "";
  return _pwd;
}
var l = current_node; // ショートカット

/**
 * 現在ノードの子ノード群(ID)を配列で返す
 * ユーティリティ関数
 */
var print_children = function () {
  return print_children_of( l() );
}
/**
 * 指定したノードの子ノード群(ID)を配列で返す
 * ユーティリティ関数
 */
var print_children_of = function (id) {
  var
    children = get_entry(id).children,
    msg1 = "There are [XXX] childs for [YYY]",
    msg2 = " child[ZZZ]: ";
  console.log( msg1.replace('XXX', children.length)
                    .replace('YYY', id) );
  children.forEach( function(elem, index, array) {
    console.log( msg2.replace('ZZZ', index) + elem.id );
  });
  return;
}
var pc = print_children;

/**
 * 指定したノードの、子のノード(obj)を配列で取得する
 */
var get_children_of = function (id) {
  // TODO
}
/**
 * 現在ノードの、子のノード(obj)を配列で取得する
 */
var get_children = function () {
  // TODO
}


/**
 * 現在のノードに子を一つ追加する
 * 成功した場合、現在ノード(obj)を返却する
 */
var add_child = function() {
  return add_child_to( l() );
};
var ac = add_child; // ショートカット
/**
 * 指定したノード(id)に子を一つ追加する
 * 成功した場合、ターゲットのノード(obj)を返却する
 */
var add_child_to = function (id) {
  var
    targ = _.find(_arr, ['id', id]),  // なければ undefined
    child_cnt,
    child;

  // id が 異常なら抜ける
  if ( _ids.indexOf(id) < 0 ) {
    var msg = "add_child_to: invalid target id [XXX]";
    console.info(msg.replace('XXX', id));
    return;
  }
  child_cnt = targ.children.length;
  // child add できるかどうかチェックして、だめなら抜ける
  // var target = _arr.find(test, id);
  if ( targ === undefined || child_cnt > 7) {
    var msg = "add_child_to[XXX1]: can't add child. Maybe the target is invalid or too much children. count[XXX2]";
    console.info(msg.replace('XXX1', id).replace('XXX2', child_cnt));
    return;
  };

  // 追加　実処理
  var child = new_entry();
  _ids.push(child.id);
  _arr.push(child);

  targ.children.push( child );
  return targ;
}
////////////////////////////////////////////
// vue に射影する
// とりあえずのデバッグ的なユーティリティ
var print_as_map = function () {
  var cur_id = l(),
    child_cnt = get_entry(cur_id).children.length,
    arr;

    arr = Array.from(get_entry(l()).children, function(val){return val.id});

  vmodel.$data.posId = cur_id;
  vmodel.$data.relatives = arr;
  vmodel.$data.subs = arr; //
}

////////////////////////////////////////////
var vmodel = new Vue({
  el: '#app',
  data: {
		me: {},
    posId: 3333,
    relatives: [],
    subs: ["dum1", "dum2", "dum3", "dum4", "dum5", "dum6", "dum7", "dum8", "dum9"],// 内容
    store: {}
  },
  ready: function() {
    this.load();

    // とりあえず自動で開始
    this.init();
  },
  computed: { // for Debug
  	disp: function() {
    	return this.serialize();
    }
  },
  methods: {
    init: function(){
      console.log("=== init ===");
      var that = this;
      var firstObj = new Entry(null);

      // 辞書に push
      this.store[firstObj.id] = firstObj;
      console.log('first obj created');
      // this.makeNewChild(CENTER, null);
      this.makeNewChild(CENTER, firstObj);
    },

    makeNewChild: function(idx, parentEntry) {
	    var that = this;
      console.log("=== makeNewChild ===");
      console.log("arg:" + arguments);

      // まず id を必要数 はらいだす
      // 実際に必要な id は 9 つではなく 8つ。
      // TODO: CENTER の時にスキップする処理を入れる
    	var relatives = BASE.map(function(val, idx, arr){
      	return val ? parentEntry.id: uuids() ;
      });
      // TODO: CENTER の時のスキップ
			relatives.forEach(function(val, idx, arr){
      	if (idx == CENTER) {
        	return;
        };
        that.store[val] = new Entry(parentEntry.id, val); // 辞書に push
      });
      console.log(relatives);
      console.log("stored. now " + Object.keys(that.store).length);
      // 8 個ずつ増えるはず. 9, 17, 25, 33, ...
      // 分布が出来た.

      // vue に割り当てる
      this.subs = relatives.map(function(val, idx, arr){
        var obj = that.store[val];
        console.log(typeof obj);
        console.log("id[" + idx + "] " + obj.id);
        console.log("content[" + idx + "] " + obj.content);

      	return obj.content;
      });
			this.$set('relatives', relatives);
      this.$set('id', that.store[relatives[CENTER]].id);
      console.log(this.relatives);
      console.log(this.subs);
      console.log(this.id);

      console.log("=== END makeNewChild ===");
    },
    // 新しいビューを生成して描画する
    drawViewWith: function(obj) {
      console.log("drawViewWith ... not implemented " + obj.id);

      // nuesub の取り出し方が肝
      var newsub = BASE.map(function(val) {
        if (val) {
          return "1";
        } else {
          return "" + obj.id;
        }
      });
      this.posId = obj.id;
      this.$set('subs', newsub);
    },
    // 新しいビューを生成して描画する
    drawViewWithPos: function(obj, index) {
      console.log("drawViewWithPos.....");

    	// obj を使って描画する
      this.$set('posId', obj.id);
      this.$set('subs', obj.relatives);
    },
    button: function(idx, $event) {

      var shift = $event.shiftKey,
      		ctrl = $event.ctrlKey,
      		option = $event.altKey;
      if (ctrl) {
      	console.log('ctrl key down');
        return;
      }
			if (option) {
      	console.log('opt key down');
        this.inspect(idx);
        return;
      }
      if (shift) {
      	this.makeNewChild(idx, this.id);
      }
      return;
    },

    //
    // 固いやつ
    //
    echo: function(str) {
      console.log(str);
    },
    save: function() {
      console.log("save... ");
      saveStorage(this.serialize());},

    load: function() {
      console.log("load...NOT IMPLEMENTED !!!");
      // var obj = loadStorage();
      // this.$set('subs', obj.subs);// TODO

    },
    serialize: function() {
      console.log("serialize...");
      var str = JSON.stringify(this.$data);
      // TODO: this.$data ではなく、
      // 原初である this.$data.store を軸に
      return str;
    },
    inspect : function(val){
    	console.log("subs[" + val + "]:" + this.subs[val]);
      console.log("relatives[" + val + "]:" + this.relatives[val]);
    }

  } // methods end
});
