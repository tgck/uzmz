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
