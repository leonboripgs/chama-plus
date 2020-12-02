var mongoose = require('mongoose');
autoIncrement = require('mongoose-auto-increment');
var passportLocalMongoose = require('passport-local-mongoose');
var Schema = mongoose.Schema;

autoIncrement.initialize(mongoose.connection);

var verificationSchema = new Schema({
  _id: Number,
  phone: {
    type: String,
    required: true
  },
  chama_code: {
    type: String,
    required: true
  },
  amount: {
    type: Number,
    required: true
  },
  currency: {
    type: String,
    default: 'KES'
  },
  type: String,
  end_at: Date,
  created_at: {
    type: Date,
    default: Date.now()
  }
},{
  usePushEach : true
});

verificationSchema.plugin(autoIncrement.plugin, 'data_verifications');
verificationSchema.plugin(passportLocalMongoose);

module.exports = mongoose.model('data_verifications', verificationSchema);