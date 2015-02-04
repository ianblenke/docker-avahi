## github repository: [ianblenke/docker-avahi](https://github.com/ianblenke/docker-avahi)
## docker hub image: [ianblenke/avahi](https://registry.hub.docker.com/u/ianblenke/avahi/)

This enables mdns broadcasting of dbus discovered resources.

### Usage:

Run this with /var/run/dbus mounted for dbus:

    docker run -d -v /var/run/dbus:/var/run/dbus ianblenke/avahi

This will broadcast the docker host's `$(hostname).local` to the local segments, along with resource records for the services discovered on dbus.

You will likely need to add a dbus policy to allow org.freedesktop.Avahi to be owned on the underlying host:

    cat <<EOF > /etc/dbus-1/system.d/avahi.conf
    <!DOCTYPE busconfig PUBLIC
    "-//freedesktop//DTD D-Bus Bus Configuration 1.0//EN"
    "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
    <busconfig>
        <policy user="root">
            <allow own="org.freedesktop.Avahi"/>
        </policy>
    </busconfig>
    EOF

If you are using CoreOS, you can use the supplied [avahi.cloud-init](https://github.com/ianblenke/docker-avahi/blob/master/avahi.cloud-init) like this:

    wget -O /tmp/avahi.cloud-init https://raw.githubusercontent.com/ianblenke/docker-avahi/master/avahi.cloud-init
    sudo coreos-cloudinit -from-file /tmp/avahi.cloud-init

Or just tack this on to your boot time cloud-init.

