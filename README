## avahi

This enables mdns broadcasting of dbus discovered resources.

### Usage:

Run this with /var/run/dbus mounted for dbus:

    docker run -d -v /var/run/dbus:/var/run/dbus ianblenke/avahi

This will broadcast the docker host's `$(hostname).local` to the local segments, along with resource records for the services discovered on dbus.

