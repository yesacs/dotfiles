/**
 * Danger will alert the user of doom
 * @param {any} args - the dooms
 * @returns args
 */
const danger = (...args) => {
  alert(['Danger:', ...args].join(' '))

  return args
}

/**
 * Safety will tell the user of peace
 * @param {string} a - A is for apple
 * @param {string} b - B is for baby
 * @param {string} c - C is for cat
 * @async
 * @returns null
 */
const safety = async (a, b, c) => alert(['Peace, friend:', a, b, c].join(' '))

// --------------------------

export { danger, safety }

danger.ael = window.document.addEventListener

danger = x => {
  console.log('reassign')
}

let obj = { danger, safety }

export default obj
