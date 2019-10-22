const HanoiGame = require("./game.js"); 
const HanoiView = require("./hanoi-view.js");
$(() => {
  const rootEl = $('.hanoi');
  const game = new HanoiGame();
  const hanoiView = new HanoiView(game, rootEl);
});
