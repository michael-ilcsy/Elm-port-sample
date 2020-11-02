import './main.css'
import { Elm } from './Main.elm'
import * as serviceWorker from './serviceWorker'

Elm.Main.init({
  node: document.getElementById('root')
})

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister()

const nodes = new vis.DataSet([
  { id: 1, label: 'A', group: 1 },
  { id: 2, label: 'B', group: 1 },
  { id: 3, label: 'C', group: 1 },
  { id: 4, label: 'D', group: 1 },
  { id: 5, label: 'E', group: 2 },
  { id: 6, label: 'F', group: 2 },
  { id: 7, label: 'G', group: 2 },
  { id: 8, label: 'H', group: 2 },
])
const edges = new vis.DataSet([
  { from: 1, to: 2, arrows: 'to' },
  { from: 1, to: 3, arrows: 'to' },
  { from: 3, to: 4, arrows: 'to' },
  { from: 6, to: 1, arrows: 'to' },
  { from: 7, to: 8, arrows: 'to' },
  { from: 8, to: 7, arrows: 'to' },
])
const container = document.getElementById('network')
const data = {
  nodes: nodes,
  edges: edges
}
const options = {}
const network = new vis.Network(container, data, options)
