
const { environment } = require("@rails/webpacker");

const webpack = require("webpack");

// Refer here https://webpack.js.org/plugins/provide-plugin/
environment.plugins.append(
    "Provide",
    new webpack.ProvidePlugin({
        $: "jquery",
        jQuery: "jquery",
        Rails: '@rails/ujs',
        Popper: ['popper.js', 'default']
    })
);

module.exports = environment;
