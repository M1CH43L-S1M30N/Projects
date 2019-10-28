import React from "react";

class Header extends React.Component {
  render() {
    const select = this.props.idx;
    const heads = this.props.tabs.map((tab, i) => {
      const title = tab.title;
      const classId = select === i ? "choosen" : "";

      return  (
        <li key={i}
        className={classId}
        onClick={() => this.props.changed(i)}>
        {title}{" "}
        </li>
      )
    })
    return  (
      <ul className="header">
        {heads}
      </ul>
    ) 
  }
}

class Tabs extends React.Component {
  constructor(props) {
    super(props)

    this.state = {idx: 0};
    this.changeIdx = this.changeIdx.bind(this);
  }

  changeIdx(num) {
    this.setState({idx: num});
  }

  render() {
    const pane = this.props.panes[this.state.idx];

    return (
      <div>
        <h1>Tabs</h1>
        <div className="tabs">
          <Header 
            idx = {this.state.idx}
            changed = {this.changeIdx}
            tabs = {this.props.panes}
          />
            <div className="tab-content">
          <article>
            {pane.content}
          </article>
          </div>
        </div>
      </div>
    );
  }
}

export default Tabs;