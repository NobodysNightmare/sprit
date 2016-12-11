# Sprit

A small application to log fuel costs of your car.

## Managing users

The application is configured to authenticate via Google (using omniauth) and
only grant access to a few selected users. Everyone that is allowed to access
the application has full access.

Check `rake -T`, all commands starting with `users:` are intended for user
management.
