### Fake SSO

```sh
bundle
ruby app.rb
```

In your browser, access `localhost:8100/sso?return=http://localhost:9000/hello-world`, you will see a blank page has a `submit` button on it.

Click the button will perform a `login` post request, and then you will be redirected to the url defined in `return` parameter.

Addtionally, the redirect will has a `w3=wwx363344` in the query string.