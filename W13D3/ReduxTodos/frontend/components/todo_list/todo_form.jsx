import React from 'react';


export default class TodoForm extends React.Component {
  constructor(props) {
    super(props)
    this.state = {title: "", body: ""};
    this.handleSubmit = this.handleSubmit.bind(this);
  }
  render () {
    return ( 
      <form onSubmit={this.handleSubmit}>
        <label>Title:
        <input type="text" value={this.state.title} onChange={this.handleUpdate("title")} placeholder="Add todo title"/>
        </label>
        <label>Body:
        <input type="text" value={this.state.body} onChange={this.handleUpdate("body")} placeholder="Add todo body" />
        </label >
        <button>Submit</button>
      </form>
    )
  }

  handleUpdate(field) {
    return (e) => {
      this.setState({[field]: e.target.value })
    }
  }

  handleSubmit(e) {
    e.preventDefault();

    const todo = Object.assign({}, this.state, {id: new Date()})

    this.props.receiveTodo(todo);
    this.setState({title: "", body: ""})
  }
}