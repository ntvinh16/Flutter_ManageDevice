const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const status = new Schema(
  {
    statusName: {
      type: String
    },
    statusCode: {
      type: Number
    }
  },
  { timestamps: true }
);

module.exports = mongoose.model("Status", status);