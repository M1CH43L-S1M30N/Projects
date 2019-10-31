import React from "react";
import allTodos from "../../reducers/selectors";
import TodoListContainer from "./todo_list_container";
import TodoListItem from '../todo_list/todo_list_item';
import TodoForm from "../todo_list/todo_form";

export default class TodoList extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    const todoItems = this.props.todos.map( (todo, i) => {
      return(
        <TodoListItem key={i} todo={todo}/>
        )
      })
      return(
        <div>
          <ul>{todoItems}</ul>
          <TodoForm receiveTodo={this.props.receiveTodo}/>
        </div>
    )
  }
}