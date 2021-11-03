# async_ruby

Demonstrates the use of the async gem in Ruby 2.7 and 3.0. Based on the code examples in <https://brunosutic.com/blog/async-ruby>

## Installation

```bash
$ bundle install
```

## Running

Set your local Ruby version to 2.7.x or 3.0.x, then:

```bash
$ bin/run
```

## Output

You should see something like:

```bash
$ rbenv local 2.7.4

$ bin/run
Ruby 2.7.4
URI.open duration: 3.734776
Async::HTTP duration: 1.86563

$ rbenv local 3.0.2

$ bin/run
Ruby 3.0.2
URI.open duration: 1.82335
Async::HTTP duration: 1.846074

```

Note that in Ruby 2.7, the `async-http` gem runs asynchronously, but `URI.open` runs synchronously. But in Ruby 3.0, both run asynchronously. This is because, as the article writes,

> Async Ruby was created by Samuel Williams, who is also a Ruby core committer. Samuel also implemented "fiber scheduler", a big Ruby 3.0 feature. It's "library agnostic" and may have other uses in the future, but currently, the main purpose of fiber scheduler is to enable seamless integration of async gem with Ruby.

In other words, in Ruby 2.7 you have to explicitly use async-compatible gems. But in Ruby 3,

> any blocking operation (a method where Ruby interpreter waits) is compatible with Async and will work asynchronously within Async code block with Ruby 3.0 and later.
