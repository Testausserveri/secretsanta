const express = require('express')
const router = express.Router()
const User = require('../schemas/User');
const Gift = require('../schemas/Gift')
const axios = require('axios');
const { v4 } = require('uuid');

require('dotenv').config();

axios.defaults.baseURL = 'https://daas-public-api.development.dev.woltapi.com';
axios.defaults.headers.common['Authorization'] = `Bearer ${process.env.TOKEN}`;

const deliveryCenter = 'Betonimiehenkuja 3D, 02150 Espoo';

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

router.post('/order_delivery', async (req, res) => {
  // This is a prototype, so very high advanced authentication!
  if (!req.body.user) return res.status(401).json({ success: false, message: 'Not logged in' })
  const user = await User.findOne({ _id: req.body.user });
  if (!user) return res.status(400).json({ success: false, message: 'Invalid user' })
  try {
    const woltRes1 = await axios.post('/merchants/6364e00e8018ce361efafcbd/delivery-order', {
      "pickup": {
        "location": {
          "formatted_address": `${user.address} ${user.postalCode} ${user.city}`,
        },
        "comment": "Pick up the gift from the user",
        "contact_details": {
          "name": user.name,
          "phone_number": "+358402190030",
          "send_tracking_link_sms": true,
        }
      },
      "dropoff": {
        "location": {
          "formatted_address": deliveryCenter,
        },
        "comment": "Drop off at the gift center",
        "contact_details": {
          "name": "Liisa Lastaaja",
          "phone_number": "+358402190030",
          "send_tracking_link_sms": true,
        }
      },
      "customer_support": {
        "email": "masterminds@testausserveri.fi",
        "phone_number": "+358402190030",
        "url": "https://testausserveri.fi"
      },
      "is_no_contact": false,
      "contents": [
        {
          "count": 0,
          "description": "Christmas gift",
          "identifier": v4(),
          "tags": []
        }
      ],
      "tips": [
        {
          "type": "pre_delivery_courier_tip",
          "price": {
            "amount": 0,
            "currency": "string"
          }
        }
      ],
      "min_preparation_time_minutes": 0,
    })
    console.log(woltRes1.data)
    res.json({ success: true, trackingLink: woltRes1.data.tracking.url, estimatedPickup: woltRes1.data.pickup.eta })
  } catch (e) {
    console.log(e);
    if (e.response) {
      console.log(JSON.stringify(e.response.data, 2, 2))
    }
    if (e.response.data.reason) {
      res.status(500).json({ success: false, message: e.response.data.reason })
    } else {
      res.status(500).json({ success: false, message: 'Unknown error' })
    }
  }
})

router.get('/interests', async (req, res) => {
  if (!req.query.user) return res.status(401).json({ success: false, message: 'Not logged in'});
  const user = await User.findOne({ _id: req.query.user });
  if (!user) return res.status(400).json({ success: false, message: 'Invalid user' })
  const userBuysTo = await User.findOne({ secretSanta: user._id });
  res.json({ success: true, interests: userBuysTo.interests, name: userBuysTo.name.split(' ')[0] });
})

router.post('/calculate_price', async (req, res) => {
  // This is a prototype, so very high advanced authentication!
  if (!req.body.user) return res.status(401).json({ success: false, message: 'Not logged in' })
  const user = await User.findOne({ _id: req.body.user });
  if (!user) return res.status(400).json({ success: false, message: 'Invalid user' })
  try {
    const woltRes1 = await axios.post('/merchants/6364e00e8018ce361efafcbd/delivery-fee', {
      "pickup": {
        "location": {
          "formatted_address": `${user.address} ${user.postalCode} ${user.city}`,
        }
      },
      "dropoff": {
        "location": {
          "formatted_address": deliveryCenter,
        }
      },
    })
    const woltRes2 = await axios.post('/merchants/6364e00e8018ce361efafcbd/delivery-fee', {
      "pickup": {
        "location": {
          "formatted_address": deliveryCenter,
        }
      },
      "dropoff": {
        "location": {
          "formatted_address": `${user.address} ${user.postalCode} ${user.city}`,
        }
      },
    })
    console.log(woltRes1.data);
    res.json({ success: true, amount: woltRes1.data.fee.amount + woltRes2.data.fee.amount })
  } catch (e) {
    if (e.response.data.reason) {
      res.status(500).json({ success: false, message: e.response.data.reason })
    } else {
      res.status(500).json({ success: false, message: 'Unknown error' })
    }
  }
})

module.exports = router