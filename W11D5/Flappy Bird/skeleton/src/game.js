import Level from './level';
import Bird from './bird';

export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
    this.registerEvents();
    this.restart();
  }

  animate() {
    this.level.animate(this.ctx);
    this.bird.animate(this.ctx);

    if (this.gameOver()) {
      alert(this.score);
      this.restart();
    }

    this.level.passedPipe(this.bird.bounds(), () => {
      this.score += 1;
      console.log(this.score);

      
    this.drawScore();

    if (this.running) {
      requestAnimationFrame(this.animate.bind(this));
    }

      
  });
};

  restart() {
    this.level = new Level(this.dimensions);
    this.bird = new Bird(this.dimensions);

    this.animate();
  };

  drawScore() {
    const loc = { x: this.dimensions.width / 2, y: this.dimensions.height / 4 }
    this.ctx.font = "bold 50pt serif";
    this.ctx.fillStyle = "white";
    this.ctx.fillText(this.score, loc.x, loc.y);
    this.ctx.strokeStyle = "black";
    this.ctx.lineWidth = 2;
    this.ctx.strokeText(this.score, loc.x, loc.y);
  };

  registerEvents() {
    this.boundClickHandler = this.click.bind(this);
    this.ctx.canvas.addEventListener("mousedown", this.boundClickHandler);
  };

  click(e) {
    if (!this.running) {
      this.play();
    }
    this.bird.flap();
  };

  gameOver() {
    return (
      this.level.collidesWith(this.bird.bounds()) || this.bird.outOfBounds(this.height)
    );
  };

  play() {
    this.running = true;
    this.animate();
  };


};

