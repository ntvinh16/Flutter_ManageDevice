const bcrypt = require("bcrypt");
const Users = require("../models/user_model");
const SuccessHander = require("../utils/notification/success_hander")
const ErrorHander = require("../utils/notification/error_hander")

exports.Login = async (data) => {
  try {
    const checkUser = await Users.find({
      username : data.username
    });
    console.log(checkUser);
    if (checkUser.length === 0) return SuccessHander(400, "UserId already exists");
    const condition = await bcrypt.compareSync(data.password, checkUser[0].password);
    if (condition) return SuccessHander(200, "Login Success");
    return SuccessHander(400, "Password is incorrect");
  }
  catch (err) {
    return ErrorHander(500, err);
  }
}
