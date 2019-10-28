import ReactDOM from "react-dom";
import React from "react";
import Clock from "./clock";
import Tabs from "./tabs";

const panes = [
  { title: 'uno', content: 'Pokemon' },
  { title: 'dos', content: 'Yugiyo' },
  { title: 'tres', content: 'Dungeons and Dorks' }
];

function Root() {
  return <div>
    <Clock/>
    <div>
      <Tabs panes={panes} />
    </div>
    </div>
}

document.addEventListener("DOMContentLoaded", function () {

  const root = document.getElementById("main");

  ReactDOM.render(<Root/>, root)
  
});