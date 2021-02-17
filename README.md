# How to Use ActiveStorage to handle file uploads with a Rails API backend

First, get the latest version of the rails gem (6.1.3 as of this writing).

## Installation and Setup

```bash
gem install rails
```
Next, generate the new rails application.

```bash
rails new active_storage_api --database=postgresql --api -T
```

Now we need to set up the database:

```bash
rails db:create
```

### Understanding ActiveStorage

Let's start by setting up activestorage in our new rails app.

```bash
rails active_storage:install
```

This will generate a migration to create the attachments and blobs tables. The blobs table will store metadata about the uploaded file including its type, size, filename, and the service name that it was uploaded to (local filesystem is the default). The attachments table is a join model connecting a blob to a record that it's attached to. The attachment relationship to a record is polymorphic, so we'll be able to uses the attachments table to attach blobs to any of our other model objects through it. To do this, we'll be adding macros to the appropriate model, much like we would do with `has_many :posts`, except in this case we'd do something like `has_one_attached :avatar`. This would in turn give us the ability to do something like `@user.avatar.attach(params[:avatar])`. The migration also creates an active_storage_variant_records table, which allows us to create variations of an uploaded file–different image/video sizes for example–and store them as variants of a particular blob.

Before we dive in deeper, let's run this migration
```
bash
```
## Creating a model we can attach uploads to

In order to test this out, we're going to need a model we can attach uploads to. For this example, we'll be creating an Event resource that can have a poster attached.

```bash
rails g scaffold Event name start_time:datetime end_time:datetime location
```

