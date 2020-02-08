// import necessary modules
const { Keystone } = require("@keystonejs/keystone");
const { AdminUIApp } = require("@keystonejs/app-admin-ui");
const { GraphQLApp } = require("@keystonejs/app-graphql");
const { StaticApp } = require("@keystonejs/app-static");
const { MongooseAdapter } = require("@keystonejs/adapter-mongoose");
const { Text } = require("@keystonejs/fields");

// create an instance of Keystone app
const keystone = new Keystone({
  name: "Korama",
  adapter: new MongooseAdapter()
});

keystone.createList("Todo", {
  fields: {
    label: { type: Text },
    description: { type: Text }
  }
});

module.exports = {
  keystone,
  apps: [
    new GraphQLApp(),
    new AdminUIApp({ adminPath: "/admin" }),
    new StaticApp({ path: "/page", src: "src/static", fallback: "index.html" })
  ]
};
