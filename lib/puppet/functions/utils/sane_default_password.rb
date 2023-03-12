# Function creates a sane default password
Puppet::Functions.create_function(:'utils::sane_default_password') do
    dispatch :func do
      optional_param 'Integer', :characters
      return_type 'String'
    end
    def func(characters = 32)
      cmd = "/opt/puppetlabs/sane_default_password_generator.sh #{characters}"
      code = %x[ #{cmd} ]
      code
     end
  end