import React from 'react'

export default function allTodos(state) {
  let arr = [];
  Object.keys(state.todos).forEach((todoId) => { 
    arr.push(state.todos[todoId]);
  });
  return arr;
};