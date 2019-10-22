const View = require('./ttt-view');
const Game = require('../../solution/game');
const Board = require('../../solution/board'); 

  $(() => {
    // Your code here
    const game = new Game(); 
    const board = game.board; 
    const $el = $(".ttt"); 
    const view = new View(game, $el);
  });
