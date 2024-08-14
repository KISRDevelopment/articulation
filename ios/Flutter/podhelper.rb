flutter_root = File.expand_path(File.join('..', '..'))
engine_dir = File.expand_path(File.join(flutter_root, 'bin', 'cache', 'artifacts', 'engine'))
frameworks_dir = File.expand_path(File.join(engine_dir, 'ios'))

project 'Runner', {
  'Debug' => ':debug',
  'Profile' => ':profile',
  'Release' => ':release',
}

target 'Runner' do
  install_flutter_engine_pod
end

def install_flutter_engine_pod
  if not Dir.exist?(frameworks_dir)
    raise "Could not find Flutter engine framework in #{frameworks_dir}"
  end

  pod 'Flutter', :path => frameworks_dir
end
