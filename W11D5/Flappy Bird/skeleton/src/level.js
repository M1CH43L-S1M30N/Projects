const CONSTANTS = {
  PIPE_SPEED: 2,
  GAP_HEIGHT: 150,
  PIPE_WIDTH: 50,
  EDGE_BUFFER: 50,
  PIPE_SPACING: 220,
  WARM_UP_SECONDS: 1
};

export default class Level {
  constructor(dimensions) {
    this.dimensions = dimensions;
  }

  drawBackground(ctx) {
    ctx.fillStyle = "skyblue";
    ctx.fillRect(0, 0, this.dimensions.width, this.dimensions.height);
  }

  animate(ctx) {
    this.drawBackground(ctx);
    this.movePipes();
    this.drawPipes(ctx);
  }
}