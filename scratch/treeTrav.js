let processNode, filterFn

// v1
processNode = (node, filter = x => x, acc = [], path) => {
  let { name, children = [], numbers = [] } = node,
    newPath = [path, name].filter(x => x).join('/')
  children.forEach(c => (acc = processNode(c, filter, acc, newPath)))
  return numbers.some(filter) ? [...acc, newPath] : [...acc]
}

// no passed accumulator
processNode = (node, filter = x => x, path = []) => {
  let { name, children = [] } = node,
    newPath = [...path, name]

  return children.length
    ? children.flatMap(c => processNode(c, filter, newPath)).filter(x => x)
    : filter(node)
    ? newPath.join('/')
    : null
}

// partially applicated version with passed accumulator
processNode =
  filter =>
  (node, path = [], acc = []) => {
    let { name, children = [] } = node,
      newPath = [...path, name]

    children.forEach(c => processNode(filter)(c, newPath, acc))
    filter(node) && acc.push(newPath.join('/'))

    return acc
  }

// two versions of the filter fn
filterFn = n => n % 10 === 0
filterFn = ({ numbers }) => numbers && numbers.some(n => n % 10 === 0)

// ---------------

console.clear()

console.log('Your paths, sire', processNode(require('./tree.json'), filterFn))

console.log('Your paths, sire', processNode(filterFn)(require('./tree.json')))
