import './main.css'
import { Elm } from './Main.elm'
import * as serviceWorker from './serviceWorker'

const app = Elm.Main.init({
  node: document.getElementById('root')
})

app.ports.sendData.subscribe(networkData => {
  const nodes = new vis.DataSet(networkData.nodes)
  const edges = new vis.DataSet(networkData.edges)
  const container = document.getElementById('network')
  const data = {
    nodes: nodes,
    edges: edges
  }
  const options = {}
  new vis.Network(container, data, options)
})

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister()
