# Redirects

These come from the vanity URL feature of the original giving.cu.edu website. You can read about that 
history here: ...

System-level redirects are handled by the frontend application; however there was still a need to provide 
stakeholders with a way for users to more easily find pages on the website, and the Redirects model 
provides this functionality.

## Fields

- **Source** - This is the path that users will enter to get redirected. For example, in `https://giveto.cu.
  edu/boulder` the source would be `boulder`. You do not need to add the "slash prefix", only what comes 
  after it.
- **Redirect** - This is the URL where users will be redirected. You must enter the URL fully as you want 
  it to be. No parsing or correction will be performed.
- **Expiration** - All redirects are set to expire one year from the creation date, but you can specify a 
  time here. A background job will notify the owners of the redirect.
- **Status** - By default, all redirects are active when created. However, you can make an redirect 
  inactive without needing to delete it. This allows for scheduling redirects to activate and deactivate 
  at certain times.
  
## Connection to crowdfunding-cu

In the backend, once you update a redirect, a call is sent to crowdfunding-cu app that adds, updates, or 
removes a key in a Redis store. When someone visits `https://giveto.cu.edu/boulder` the crowdfunding app 
looks for an entry under `boulder` and redirects the user if found. If no entries are found, the user is 
sent to `https://crowdfunding.cu.edu` with an "page not found" message. 

