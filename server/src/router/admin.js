const express = require('express')
const router = express.Router()
const User = require('../schemas/User');
const Gift = require('../schemas/Gift');

const { Novu } = require('@novu/node');
const novu = new Novu('e361462ff59d5b4cae71ae53f4c9a14f');

// define the about route
router.post('/trigger_delivery', async (req, res) => {
  const firstNoPresent = await User.findOne({
    secretSanta: null
  });
  const allUsers = await User.find();
  const userWithoutSanta = await User.findOne({
    secretSanta: { "$nin": allUsers.map(i => i.toJSON()._id)}
  })
  if (firstNoPresent && userWithoutSanta) {
    console.log('match');
    firstNoPresent.secretSanta = userWithoutSanta._id;
    await firstNoPresent.save();
  }

  novu.trigger('junction2022-trigger-final-delivery', {
    to: {
      subscriberId: '<REPLACE_WITH_DATA>'
    },
    payload: {

    }
  });

  res.json({ success: true, message: 'Triggered!' });
})

router.post('/gift', async (req, res) => {
  // This is a prototype, so very high advanced authentication!
  if (!req.body.user) return res.status(401).json({ success: false, message: 'Not logged in' })
  const gifts = await Gift.findAll({});
})

module.exports = router