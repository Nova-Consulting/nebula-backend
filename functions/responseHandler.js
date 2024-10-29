module.exports = {
    success: (res, data, code = 200) => {
        return res.status(code).json({
            data,
            "@Common.numericSeverity": 1
        });
    },

    error: (res, message, code = 500, severity = 4) => {
        return res.status(code).json({
            error: {
                code: code.toString(),
                message,
                "@Common.numericSeverity": severity
            }
        });
    }
};
