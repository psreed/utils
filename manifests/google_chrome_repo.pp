#
class utils::google_chrome_repo {
  $arch="el${facts['os']['release']['major']}"

  yumrepo { 'google-chrome':
    ensure   => 'present',
    name     => 'google-chrome',
    descr    => 'Google Chrome Repo for RPM base Linux',
    baseurl  => "http://dl.google.com/linux/chrome/rpm/stable/${arch}",
    gpgkey   => 'https://dl-ssl.google.com/linux/linux_signing_key.pub',
    enabled  => '1',
    gpgcheck => '1',
    target   => '/etc/yum.repo.d/google-chrome.repo',
  }
}
