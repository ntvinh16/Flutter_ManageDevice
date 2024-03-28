const bcrypt = require("bcrypt");
const Users = require("../models/user_model");
const SuccessHander = require("../utils/notification/success_hander")
const ErrorHander = require("../utils/notification/error_hander")

exports.createUser = async (data) => {
  try {
    var checkUser = await Users.find({
      userId: data.userId
    })
    if (checkUser.length === 0) {
      const hashPassword = await bcrypt.hashSync(data.password, 10);
      const result = new Users({
        fullname: data.fullname,
        username: data.username,
        password: hashPassword,
        userId: data.userId,
        officeId: data.officeId
      });
      await result.save();

      return SuccessHander(200, "Create User Success", result)
    }
    return ErrorHander(400, "userid already exists");
  }
  catch (err) {
    return ErrorHander(500, err);
  }
}

exports.getAllUser = async (data) => {
  try {
    var result = await Users.find().select("-password");
    return SuccessHander(200, "Get All UserId Success", result)
  }

  catch (err) {
    return ErrorHander(500, err);
  }
}
