const Offices = require("../models/office_model");
const SuccessHander = require("../utils/notification/success_hander")
const ErrorHander = require("../utils/notification/error_hander")

exports.createOffice = async (data) => {
  try {
    var checkUser = await Offices.find({
      officeCode: data.officeCode
    });
    if (checkUser.length != 0) return SuccessHander(200, "OfficeCode already exists");
    var result = new Offices({
      officeCode: data.officeCode,
      officeName: data.officeName
    })
    await result.save();
    return SuccessHander(200, "Create Office Success", result);
  }
  catch (err) {
    return ErrorHander(500, err);
  }
}
