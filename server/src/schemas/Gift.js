const { Schema, mongoose } = require("mongoose");

module.exports = mongoose.model('Gift', 
  {
    sender: {
      type: Schema.Types.ObjectId,
      required: true,
      ref: 'User',
    },
    category: {
      type: String,
      required: true,
    },
    sentToNewOwner: {
      type: Boolean,
      default: false
    }
  }
);