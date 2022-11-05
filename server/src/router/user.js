const express = require('express')
const router = express.Router()
const User = require('../schemas/User');
const Gift = require('../schemas/Gift')

const categories = []

// define the about route
router.post('/register', async (req, res) => {
  if (!req.body) return res.status(400).json({ success: false, message: 'Invalid body' });
  const firstNoPresent = await User.findOne({
    secretSanta: null
  });
  const user = await User.create({
    name: req.body.name,
    interests: req.body.interests,
    address: req.body.address,
    city: req.body.city,
    postalCode: req.body.city,
  });
  if (firstNoPresent) {
    console.log(firstNoPresent)
    firstNoPresent.secretSanta = user._id;
    await firstNoPresent.save();
  }
  res.json({ success: true, message: 'Welcome!', user: user._id });
})

router.post('/gift', async (req, res) => {
  // This is a prototype, so very high advanced authentication!
  if (!req.body.user) return res.status(401).json({ success: false, message: 'Not logged in' })
  const gifts = await Gift.findAll({});
})

module.exports = router