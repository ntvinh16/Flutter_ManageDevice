const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const users = new Schema(
  {
    fullname: {
      type: String
    },
    username: {
      type: String
    },
    password: {
      type: String
    },
    userId: {
      type: String
    },
    officeId: {
      type: String
    }
  },
  { timestamps: true }
);

module.exports = mongoose.model("Users", users);