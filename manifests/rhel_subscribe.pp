# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include utils::rhel_subscribe
class utils::rhel_subscribe {
  $rhel_user=lookup('rhel_subscription::user')
  $rhel_pswd=lookup('rhel_subscription::password')
  #exec { "/usr/sbin/subscription-manager register --username=${rhel_user} --auto-attach --password='${rhel_pswd}'":
  Notify { "/usr/sbin/subscription-manager register --username=${rhel_user} --auto-attach --password='${rhel_pswd}'": }

}
