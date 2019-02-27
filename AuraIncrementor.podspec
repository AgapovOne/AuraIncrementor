Pod::Spec.new do |spec|
  spec.name = "AuraIncrementor"
  spec.version = "0.0.1"
  spec.summary = "Incrementor class for AURA devices."

  spec.description = <<-DESC
  Fully tested and documented Incrementor class
                   DESC

  spec.homepage = "https://github.com/AgapovOne/AuraIncrementor"
  spec.license = {:type => "MIT", :file => "LICENSE"}
  spec.author = {"Alex Agapov" => "agapov.one@gmail.com"}

  spec.ios.deployment_target = "9.0"
  spec.swift_version = "4.2"

  spec.source = {:git => "https://github.com/AgapovOne/AuraIncrementor.git", :tag => "#{spec.version}"}
  spec.source_files = "AuraIncrementor/**/*.{h,m,swift}"
end
