guard 'rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^spec/features/.+\.feature})
  watch(%r{^spec/step_definitions/.+\_steps.rb})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
