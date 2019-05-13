Pod::Spec.new do |s|
  s.name = 'ExSejima'
  s.version = '0.1.0'
  s.license = 'MIT'
  s.summary = 'ExSejima is a framework that expose reusable components.'
  s.description  = <<-DESC
    As we always use the same or a really close object, we made severals components that we want to share with you.
                   DESC
  s.homepage = 'https://github.com/MoveUpwards/ExSejima.git'
  s.authors = { 'Damien NOËL DUBUISSON' => 'damien@slide-r.com', 'Loïc GRIFFIÉ' => 'loic@slide-r.com' }
  s.source = { :git => 'https://github.com/MoveUpwards/ExSejima.git', :tag => s.version }
  s.swift_version   = '5.0'

  s.ios.deployment_target = '9.1'

  s.source_files = 'ExSejima/Source/**/*.swift'

  s.frameworks = 'Foundation'
end