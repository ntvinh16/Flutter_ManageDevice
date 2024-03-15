const { CreateStatus} = require("../services/status_service");

// Controller to get all users
module.exports = {
  CreateStatus: async (req, res) => {
    try {
      const result = await CreateStatus(req.body);
      return res.status(200).json(result);
    } catch (err) {
      return res.status(500).json({
        message: "Internal Server Error",
        err: err,
      });
    }
  },
};