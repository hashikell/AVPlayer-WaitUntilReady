Pod::Spec.new do |s|

  s.name         = "AVPlayer-WaitUntilReady"
  s.version      = "0.9"
  s.summary      = "AVPlayer category which enables to wait until ready."

  s.description  = <<-DESC
                   AVPlayer+WaitUntilReady is an AVPlayer category which enables to wait until ready.
                   Internally the category uses GCD to wait for the tasks to finish.
                   DESC

  s.homepage     = "https://github.com/hashikell/AVPlayer-WaitUntilReady"

  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Manabu Hashimoto" => "hashikell@icloud.com" }
  s.social_media_url   = "http://twitter.com/hashikell"

  s.ios.deployment_target = "5.0"
  s.osx.deployment_target = "10.7"

  s.source       = { :git => "https://github.com/hashikell/AVPlayer-WaitUntilReady.git", :tag => "0.9" }
  s.source_files = "AVPlayer+WaitUntilReady"

end
