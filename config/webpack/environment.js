// const { environment } = require("@rails/webpacker");

// const webpack = require("webpack");

// // import our loaders.
// const datatables = require("./loaders/datatables");
// const jquery = require("./loaders/jquery");

// // append them to webpack loaders.
// environment.loaders.append("datatables", datatables);
// environment.loaders.append("expose", jquery);

// // ProviderPlugin helps us to load jQuery when the variables of $ and jQuery
// // are encountered as free variables at other modules.
// // Let's say if you want to use Bootstrap 4 and Popper.js.
// //
// // Refer here https://webpack.js.org/plugins/provide-plugin/
// environment.plugins.append(
//     "Provide",
//     new webpack.ProvidePlugin({
//         $: "jquery",
//         jQuery: "jquery",
//     })
// );

// environment.loaders.append('expose', {
//   test: require.resolve('jquery'),
//   use: [{
//     loader: 'expose-loader',
//     options: '$'
//   }, {
//     loader: 'expose-loader',
//     options: 'jQuery',
//   }]
// })

// module.exports = environment;

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
