let processNode

processNode = (node, filter = x => x, acc, path) => {
  let {name, children = [], numbers = []} = node, newPath = [path, name].filter(x => x).join('/')
  children.forEach(c => acc = processNode(c, filter, acc, newPath))
  return numbers.some(filter) ? [...acc, newPath] : acc
}

// ---------------

const tree = require('./tree.json') // eslint-disable-line

console.log('Your paths, sire', processNode(tree, n => n % 10 === 0, []))

console.clear()

