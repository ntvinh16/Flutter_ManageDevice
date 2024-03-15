const { Login} = require("../services/login_service");

// Controller to get all users
module.exports = {
  Login: async (req, res) => {
    try {
      const result = await Login(req.body);
      return res.status(200).json(result);
    } catch (err) {
      return res.status(500).json({
        message: "Internal Server Error",
        err: err,
      });
    }
  },
};