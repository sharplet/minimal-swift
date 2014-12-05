directory "build"

desc "Build the Foobar module"
task :foobar => "build/libFoobar.a"

file "build/libFoobar.a" => FileList["build", "src/*.swift"] do |t|
  sources = t.sources[1..-1].join(" ")
  module_name = t.name.pathmap("%{lib,}n")
  sh "xcrun -sdk macosx swiftc " \
     "-emit-library -o #{t.name} " \
     "-emit-module -emit-module-path build/#{module_name}.swiftmodule " \
     "-module-name #{module_name} " \
     "#{sources}"
end

desc "Build the main program"
file "main" => ["main.swift", "build/libFoobar.a"] do |t|
  sh "xcrun -sdk macosx swiftc -o #{t.name} -Ibuild -Lbuild -lFoobar #{t.source}"
end

file "build/runtests" => FileList["build/libFoobar.a", "test/*.swift"] do |t|
  sources = t.sources[1..-1].join(" ")
  sh "xcrun -sdk macosx swiftc " \
     "-o #{t.name} " \
     "-F/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks " \
     "-Xlinker -rpath -Xlinker /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks " \
     "-Ibuild -Lbuild -lFoobar " \
     "#{sources}"
end

desc "Build and run the tests"
task :test => "build/runtests" do |t|
  sh "xcrun xctest #{t.source}"
end

desc "Clean build products"
task :clean do
  rm_rf "build"
  rm_f "main"
end

task :default => "main"
