Pod::Spec.new do |s|
  s.name = 'NGResourcePodExample'
  s.version = '1.0.0'
  s.summary = 'A pod which contains a message.'
  s.description = 'A pod which contains a message.'
  s.license = "Private"
  s.homepage = 'https://github.com/noahsark769/NGResourcePodExample'
  s.author = { 'Noah Gilmore' => 'noah.w.gilmore@gmail.com' }
  s.ios.deployment_target = '11.0'
  url = "https://github.com/noahsark769/NGResourcePodExample/releases/download/v#{s.version}/v#{s.version}.tar"
  s.source = {
    :http => url,
    :flatten => false
  }

  s.resource_bundles = {
    'NGResourcePodExample' => ['*']
  }
end
