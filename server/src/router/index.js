const auth = require('./authentication')
const router = require('express').Router()

router.use(auth)


module.exports = router