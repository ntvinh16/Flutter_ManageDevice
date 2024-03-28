const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const offices = new Schema(
  {
    officeId: {
      type: Number
    },
    classify: {
      type: String
    },
    deviceCode: {
      type: String
    },
    deviceName: {
      type: String
    },
    description: {
      type: String
    },
    statusId: {
      type: String
    },
    userProposeId: {
      type: Number
    },
    buyDate: {
      type: Date
    },
    price: {
      type: Number
    },
    userBeneficiariesId: {
      type: Number
    },
    deliveryDate: {
      type: Date
    },
    handOverRecordCode: {
      type: String
    },
    paymentDate: {
      type: Date
    }
    ,
    support: {
      type: String
    }
  },
  { timestamps: true }
);

module.exports = mongoose.model("Offices", offices);