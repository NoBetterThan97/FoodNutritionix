# frozen_string_literal: true
require 'base64'
require 'dotenv'
require 'httparty'
require 'rake/testtask'

Dotenv.load

# rake test
Rake::TestTask.new do |task|
  task.pattern = 'spec/**/*_spec.rb'
end

namespace :util do
  desc 'deletes cassettes'
  task :delete_cassettes do
    sh 'rm -r spec/support/cassettes'
  end
end

namespace :quality do
  LIB_DIR = 'lib'

  desc 'perform all quality checks'
  task default: [:rubocop, :flay, :flog]

  desc 'linting code'
  task(:rubocop) { sh "bundle exec rubocop #{LIB_DIR}" }

  desc 'flay'
  task(:flay) { sh "bundle exec flay #{LIB_DIR}" }

  desc 'flog'
  task(:flog) { sh "bundle exec flog #{LIB_DIR}" }
end

desc 'runs all quality tasks'
task quality: ['quality:default']
