# README

## Notes
- I chose to create 4 tables in the database, and 6 models in the Rails project, I used STI for users, librarians and members models. I chose to use a many-to-many relationship between Book and Borrowing with an intermediate model named Borrowable.
- App allows to select multiple books by borrowing record, like a cart
- Please check seed file /db/seed.rb to get credentials for librarian and member users

## Pending tasks
- Unit tests
- Authorization under the hood, control actions by users librarian and member, I thought to use Pundit
- Refactoring controllers using object queries or services
- Add more logic in Models
- Refactoring views using more partials
- Styling in views
- Restul API

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
## Support Images

![WhatsApp Image 2023-12-15 at 4 23 45 AM(2)](https://github.com/jvidalba1/library_management_system_concept/assets/968980/1ff993fa-ce11-47c9-9e50-58b5cbf9c43b)
![WhatsApp Image 2023-12-15 at 4 23 45 AM(1)](https://github.com/jvidalba1/library_management_system_concept/assets/968980/916124f6-260a-4ca6-9fc0-af119e047f44)
![WhatsApp Image 2023-12-15 at 4 23 45 AM](https://github.com/jvidalba1/library_management_system_concept/assets/968980/18217246-fdae-4219-aa27-5047abcf5213)
