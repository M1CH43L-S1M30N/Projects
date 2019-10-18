const CONSTANTS = {
  GRAVITY: 0.4,
  FLAP_SPEED: 8,
  TERMINAL_VEL: 12,
  BIRD_WIDTH: 40,
  BIRD_HEIGHT: 30
};

export default class Bird {

  contructor(dimensions) {
    this.dimensions = dimensions;
    this.y = this.dimensions.height / 2;
    this.x = this.dimensions.width / 3;
    this.velocity = 0;
    
  }

  drawBird(ctx) {
    ctx.fillStyle = "yellow";
    ctx.fillRect(this.x, this.y, CONSTANTS.BIRD_WIDTH, CONSTANTS.BIRD_HEIGHT);
  }

  animate(ctx) {
    this.drawBird(ctx);
    this.move();
  }

  move() {
    this.y += this.vel;
    this.vel += CONSTANTS.GRAVITY;

    if (Math.abs(this.vel) > CONSTANTS.TERMINAL_VEL) {

      if (this.vel > 0) {
        this.vel = CONSTANTS.TERMINAL_VEL;
      } else {
        this.vel = CONSTANTS.TERMINAL_VEL * -1;
      }
    }
  }

  outOfBounds() {
    const aboveTheTop = this.y < 0;
    const belowTheBottom = this.y + CONSTANTS.BIRD_HEIGHT > this.dimensions.height;
    return aboveTheTop || belowTheBottom;
  }

  bounds() {
    return {
      left: this.x,
      right: this.x + CONSTANTS.BIRD_WIDTH,
      top: this.y,
      bottom: this.y + CONSTANTS.BIRD_HEIGHT
    };
  }

  flap() {
    
    this.vel = -1 * CONSTANTS.FLAP_SPEED;
    
  }


}