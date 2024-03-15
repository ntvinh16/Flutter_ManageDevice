const Status = require("../models/status_model");
const SuccessHander = require("../utils/notification/success_hander")
const ErrorHander = require("../utils/notification/error_hander")

exports.CreateStatus = async (data) => {
  try {
    var checkUser = await Status.find({
      statusCode: data.statusCode
    });
    if (checkUser.length != 0) return SuccessHander(200, "StatusCode already exists");
    var result = new Status({
      statusCode: data.statusCode,
      statusName: data.statusName
    })
    await result.save();
    return SuccessHander(200, "Create Status Success", result);
  }
  catch (err) {
    return ErrorHander(500, err);
  }
}
