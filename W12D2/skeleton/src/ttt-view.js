class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    const $newUl = this.setupBoard();
    $newUl.forEach((ul) => $el.append(ul));
    this.bindEvents();
  };

  bindEvents() {
    $("ul").on("click", "li", (e) => {
      console.log(e.target);
      console.log(e.currentTarget);
      console.log(this);
      let $li = $(e.target); 
      $li.addClass('clicked');
      // let test = $.data($li, "pos")
      this.makeMove($li);
    })
  };

  

  makeMove($square) {
    if (this.game.isOver()) {
      window.alert(`CONGRATS ${this.game.winner().toUpperCase()} you won!!!`)
      return;
    }
    let test = $( $square ).data("pos"); 
    this.game.playMove(test); 
    $square.text(this.game.currentPlayer); 
    
  }

  setupBoard() {
    const $uls = [];
      for(let i = 0; i < 3; i++) {
      const $ul = $("<ul>");
      $ul.addClass("column");
      for(let j = 0; j < 3; j++) {
        const $li = $("<li>");
        $li.addClass("row");
        // $.data($li, "pos", [i, j]); 
        $( $li ).data( "pos", [i,j] ); 
        
        $ul.append($li);
      }
    $uls.push($ul)
    }
    return $uls; 
  };
}

module.exports = View;
