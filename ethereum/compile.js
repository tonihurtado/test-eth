const path = require('path')
const solc = require('solc')
const fs = require('fs-extra')

const buildPath= path.resolve(__dirname, 'build')
fs.removeSync(buildPath)

const contractPath = path.resolve(__dirname, 'contract', 'Asignatura.sol')
const source = fs.readFileSync(contractPath, 'utf8')

const output = solc.compile(source, 1).contracts

fs.ensureDirSync(buildPath)

fs.outputJsonSync(
    path.resolve(buildPath, contract + '.json'), output
)
