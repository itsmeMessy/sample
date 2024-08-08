const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    username: { type: String, required: true },
    strand: { type: String, required: true },
    school: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true, select:false }
});


userSchema.statics.isValidEmail = function (email) {
    return this.findOne({ email });
};


const userModel = mongoose.model('User', userSchema);
module.exports = userModel;
