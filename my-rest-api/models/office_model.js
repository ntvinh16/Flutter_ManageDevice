const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const offices = new Schema(
  {
    officeName: {
      type: String
    },
    officeCode: {
      type: Number
    }
  },
  { timestamps: true }
);

module.exports = mongoose.model("Offices", offices);