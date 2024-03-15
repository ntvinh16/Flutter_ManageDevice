const { createUser} = require("../services/user_service");

// Controller to get all users
module.exports = {
  createUser: async (req, res) => {
    try {
      const result = await createUser(req.body);
      return res.status(200).json(result);
    } catch (err) {
      return res.status(500).json({
        message: "Internal Server Error",
        err: err,
      });
    }
  },
};