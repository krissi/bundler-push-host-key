# bundle-push-host-key

This gem adds support for multiple keys when pushing gems using the bundler rake tasks

## Usage

 * In the Rakefile, replace `require 'bundler/gem_tasks'` with `require 'bundler/gem_tasks/push_host_key'`
 * In `.gem/credentials add a new credential with your gemserver's hostname (only the hostname!) as key`:

       ---
       # Official rubygems API key entry 
       :rubygems_api_key: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
       
       # Your custom API key for gemserver.example.net
       :gemserver.example.net: <API Key>
       
       # Basic Authentication instead of API key 
       :gemserver.example.net: "Basic dXNlcjpwYXNzCg=="

 * In your gemspecs, set the `allowed_push_host`:
 
       Gem::Specification.new do |gem|
         # ...
         gem.metadata = {
           'allowed_push_host' => 'https://gemserver.example.com',
         }
         # ...
       end

## Notes

This gem uses the `--key` feature of the `gem` command.
When pushing with the `gem` command directly, you can specify `--key gemserver.example.net`  

Afaik, the `gem` command has no official way to authenticate when loading gems.
In Bundler you can set the basic auth credentials with this command: `bundle config gemserver.example.net user:pass`  

If there is a better, official way to have multiple private gemserver with individual credentials
and not only push-authentication, I will happily drop this gem.
  
