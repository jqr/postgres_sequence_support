require 'spec/rake/spectask'

require 'echoe'
Echoe.new 'postgres_sequence_support' do |p|
  p.description     = "Easy manipulation of PostgreSQL sequences from ActiveRecord."
  # p.url             = "http://postgres_sequence_support.rubyforge.org"
  p.author          = "Elijah Miller"
  p.email           = "elijah.miller@gmail.com"
  p.retain_gemspec  = true
  p.need_tar_gz     = false
  p.extra_deps      = [
  ]
end

desc 'Default: run specs'
task :default => :spec
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList["spec/**/*_spec.rb"]
end

task :test => :spec
