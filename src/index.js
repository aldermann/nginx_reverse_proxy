// import necessary modules
const { Keystone } = require("@keystonejs/keystone");
const { AdminUIApp } = require("@keystonejs/app-admin-ui");
const { GraphQLApp } = require("@keystonejs/app-graphql");
const { StaticApp } = require("@keystonejs/app-static");
const { MongooseAdapter } = require("@keystonejs/adapter-mongoose");
const fields = require("@keystonejs/fields");
const { Wysiwyg } = require("@keystonejs/fields-wysiwyg-tinymce");
// create an instance of Keystone app
const keystone = new Keystone({
  name: "Korama",
  adapter: new MongooseAdapter()
});

keystone.createList("Post", {
  fields: {
    title: { type: fields.Text },
    content: { type: Wysiwyg },
    author: { type: fields.Text },
    createDate: { type: fields.DateTime }
  }
});

keystone.createList("Admin", {
  fields: {
    username: { type: fields.Text },
    password: { type: fields.Password }
  }
});

module.exports = {
  keystone,
  apps: [
    new GraphQLApp(),
    new AdminUIApp({ adminPath: "/admin" }),
    new StaticApp({ path: "/", src: "src/static", fallback: "home.html" })
  ]
};
