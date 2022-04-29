# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include utils::rhel_subscribe
class utils::rhel_subscribe {
  if (
    $facts['os']['distro']['id']!=undef
    and $facts['os']['distro']['id']=='RedHatEnterpise'
    and $facts['rhel_sub_info']['status']!='Subscribed'
    and $facts['rhel_sub_info']['status']!=''
  ) {
    $rhel_user=lookup('rhel_subscription::user', undef, undef, '')
    $rhel_pswd=lookup('rhel_subscription::password', undef, undef, '')
    unless (($rhel_user == '') or ($rhel_pswd == '')) {
      exec { "/usr/sbin/subscription-manager register --username=${rhel_user} --auto-attach --password='${rhel_pswd}'": }
    }
  }
}
