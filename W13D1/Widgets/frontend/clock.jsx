import React from "react";

class Clock extends React.Component {

  constructor(props) {
    super(props);

    this.state = {time: new Date()};
    this.tick = this.tick.bind(this);
  }

  componentDidMount () {
    this.interval = setInterval(this.tick, 1000)
  }

  componentWillUnmount () {
    clearInterval(this.interval);
  }

  render() {
    let seconds = this.state.time.getSeconds();
    let minutes = this.state.time.getMinutes();
    let hours = this.state.time.getHours();
    
    hours = (hours < 10) ? `0${hours}` : hours;
    minutes = (minutes < 10) ? `0${minutes}` : minutes;
    seconds = (seconds < 10) ? `0${seconds}` : seconds;

    return <div>
      <h1>Clock</h1>
      <div className='clock-time'>
        <p><span>Time: </span><span>{hours}:{minutes}:{seconds}</span></p>
        <p>Date: {this.state.time.toDateString()}</p>
      </div>

    </div> 
  }

  tick() {
    this.setState({time: new Date()});
  }
}

export default Clock;