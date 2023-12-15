# README

## Images

![IMG_4328](https://github.com/jvidalba1/library_management_system_concept/assets/968980/47e82200-a1f1-4798-8030-3e07cda3f9c6)
![IMG_4327](https://github.com/jvidalba1/library_management_system_concept/assets/968980/6abba01a-43c5-4614-ab5d-138395365e7b)
![IMG_4326](https://github.com/jvidalba1/library_management_system_concept/assets/968980/c1053241-2c6c-4d25-b398-c91c34ad6de1)

## Notes
- App allows to select multiple books by borrowing record, like a cart
- Please check seed file /db/seed.rb to get credentials for librarian and member users

## Pending tasks
- Unit tests
- Authorization under the hood, control actions by users librarian and member, I thought to use Pundit
- Dont allow to select multiple times the same book and controle book copies when adding to borrowing cart
- Refactoring controllers using object queries or services
- Add more logic in Models
- Refactoring views using more partials
- Styling in views

## Getting started

To get started with the app, clone the repo and then install the needed gems. You can clone the repo as follows:

```
$ git clone https://github.com/jvidalba1/library_management_system_concept.git
$ cd library_management_system_concept
```

Next, install the versions of `ruby` and the `bundler` gem from the above commands. The Ruby installation is system-dependent; on the cloud IDE recommended in the tutorial, it can be installed as follows:

```
$ rvm get stable
$ rvm install 3.2.2
```

Necessary gems can be installed with `bundle`

```
$ bundle install
```


If you run into any trouble, you can remove `Gemfile.lock` and rebundle at any time:

```
$ rm -f Gemfile.lock
$ bundle install
```

Next, setup and migrate the database:

```
$ rails db:setup
$ rails db:migrate
```

Seed the database with sample users and run the app in a local server:

```
$ rails db:seed
$ rails server
```
