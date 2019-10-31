export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";


const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};

const todosReducer = (state = initialState, action) => {
  switch (action.type) {
    case RECEIVE_TODOS:
      const newState = {};
      action.todos.forEach( todo => {
        newState[todo.id] = todo
      })
      return newState;
    case RECEIVE_TODO:
      const newtodoState = Object.assign({}, state);
      newtodoState[action.todo.id] = action.todo;
      return newtodoState;
    default:
      return state;
  }
}

export default todosReducer;