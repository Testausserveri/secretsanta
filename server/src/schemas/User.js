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
    lat: {
      type: Schema.Types.Decimal128,
      required: true,
    },
    long: {
      type: Schema.Types.Decimal128,
      required: true,
    },
    instructions: {
      type: String,
      default: ''
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