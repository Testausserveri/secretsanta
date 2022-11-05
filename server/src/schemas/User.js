const { Schema, mongoose } = require("mongoose");

module.exports = mongoose.model('User', 
  {
    name: {
      type: String,
      required: true,
    },
    interests: {
      type: [String],
      default: []
    },
    address: {
      type: String,
      required: true,
    },
    city: {
      type: String,
      required: true,
    },
    postalCode: {
      type: String,
      required: true,
    },
    ownGift: {
      ref: 'Gift',
      type: Schema.Types.ObjectId,
    },
    secretSanta: {
      type: Schema.Types.ObjectId,
      ref: 'User'
    }
  }
);