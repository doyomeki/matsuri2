guard 'rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^spec/features/.+\.feature})
  watch(%r{^spec/step_definitions/.+\_steps.rb})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

guard :rubocop do
  watch(%r{.+\.rb$})
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end
