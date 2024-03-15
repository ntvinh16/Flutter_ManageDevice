const { createOffice} = require("../services/office_service");

// Controller to get all users
module.exports = {
  createOffice: async (req, res) => {
    try {
      const result = await createOffice(req.body);
      return res.status(200).json(result);
    } catch (err) {
      return res.status(500).json({
        message: "Internal Server Error",
        err: err,
      });
    }
  },
};