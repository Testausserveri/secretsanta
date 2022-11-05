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
      type: Number,
      required: true,
    },
    long: {
      type: Number,
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