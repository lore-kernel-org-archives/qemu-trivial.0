Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5KKY-0002dh-3A
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2012 12:07:14 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1S5KKQ-0002dH-7r
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 12:07:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1S5KK1-00086v-LN
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 12:07:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:21471)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1S5KK1-00086d-CL; Wed, 07 Mar 2012 12:06:41 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q27H6b7K029862
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 7 Mar 2012 12:06:37 -0500
Received: from [10.3.113.123] (ovpn-113-123.phx2.redhat.com [10.3.113.123])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q27H6aC8020482; Wed, 7 Mar 2012 12:06:36 -0500
Message-ID: <4F57959C.5090408@redhat.com>
Date: Wed, 07 Mar 2012 10:06:36 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1331122589-15717-1-git-send-email-peter.maydell@linaro.org>
	<CAJSP0QVjZ_YqRNrf5dVPHTQmkLwPJeo_M1G2z7gfVHBY_-Z33w@mail.gmail.com>
In-Reply-To: <CAJSP0QVjZ_YqRNrf5dVPHTQmkLwPJeo_M1G2z7gfVHBY_-Z33w@mail.gmail.com>
X-Enigmail-Version: 1.3.5
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigEAA529FC88DCA04FFCF6930B"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Quote the
 configure args printed in config.log
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Mar 2012 17:07:12 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigEAA529FC88DCA04FFCF6930B
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 03/07/2012 05:40 AM, Stefan Hajnoczi wrote:
> On Wed, Mar 7, 2012 at 12:16 PM, Peter Maydell <peter.maydell@linaro.or=
g> wrote:
>> Use the same mechanism we use for printing the configure command
>> line to config-host.mak to print it to config.log. This fixes a
>> bug where the config.log version didn't quote arguments with spaces.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> If I'd noticed when I was adding the banner to config.log that we alre=
ady
>> printed this in config-host.mak I'd have done it this way to start wit=
h...
>>
>>  configure |    4 +++-
>>  1 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/configure b/configure
>> index a5eb832..1b63436 100755
>> --- a/configure
>> +++ b/configure
>> @@ -22,7 +22,9 @@ rm -f config.log
>>
>>  # Print a helpful header at the top of config.log
>>  echo "# QEMU configure log $(date)" >> config.log
>> -echo "# produced by $0 $*" >> config.log

This left a trailing newline,

>> +printf "# Configured with:" >> config.log
>> +printf " '%s'" "$0" "$@" >> config.log

but this does not.  You probably want to add another echo afterwards, so
that the next line of the log doesn't look like another configure argumen=
t.

--=20
Eric Blake   eblake@redhat.com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--------------enigEAA529FC88DCA04FFCF6930B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBCAAGBQJPV5WcAAoJEKeha0olJ0NqUcEH+gKgNXBL0vcuRQWvMlnb/i2W
GkKUDHrCFccdxDs0Vk3DSs6XYyAcqKmbOBKWKPM/nmWpyJ+RanWQrEl1u/CLQjhj
fg+H3rD1WODcMWuTWN3LWrlU1SODnxg/dGMXiqVgIrFQqw0I3YjL6yX3aYr1PE1A
GjjpjodqyPL0RBqnULBwT3IOVCNksmhyUASPJqXmuIxPPgxeK4p6Mag1prYjPugX
uQSij1ZZSPVB4AvzTutad54+caOM9/pShueys1wZh8Dhk5HiOd2GAqDBbrim6YM+
ET4xFBnaCdoHKYB+3vz5wHjdkqAZGzfSPyIvfFm5DNVBwvjxaqoRnxGIK2xMRN0=
=F15A
-----END PGP SIGNATURE-----

--------------enigEAA529FC88DCA04FFCF6930B--

