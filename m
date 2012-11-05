Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TVRd0-0004to-L5
	for mharc-qemu-trivial@gnu.org; Mon, 05 Nov 2012 13:42:30 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1TVRcq-0004t7-3t
	for qemu-trivial@nongnu.org; Mon, 05 Nov 2012 13:42:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1TVRck-0004Nv-6D
	for qemu-trivial@nongnu.org; Mon, 05 Nov 2012 13:42:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:64286)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1TVRcj-0004Nf-SW; Mon, 05 Nov 2012 13:42:14 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qA5Ig4vl003895
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 5 Nov 2012 13:42:05 -0500
Received: from [10.3.113.113] (ovpn-113-113.phx2.redhat.com [10.3.113.113])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qA5IfK1F021842; Mon, 5 Nov 2012 13:41:22 -0500
Message-ID: <5098084B.2060105@redhat.com>
Date: Mon, 05 Nov 2012 11:41:15 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121016 Thunderbird/16.0.1
MIME-Version: 1.0
To: Aurelien Jarno <aurelien@aurel32.net>
References: <1352060975-18646-1-git-send-email-sw@weilnetz.de>
	<20121105070340.GH31495@ohm.aurel32.net>
In-Reply-To: <20121105070340.GH31495@ohm.aurel32.net>
X-Enigmail-Version: 1.4.5
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig6EA1E32A6804A7A84F149836"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-mips: Fix compiler
 warnings caused by very large constants
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
X-List-Received-Date: Mon, 05 Nov 2012 18:42:29 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig6EA1E32A6804A7A84F149836
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

On 11/05/2012 12:03 AM, Aurelien Jarno wrote:
> On Sun, Nov 04, 2012 at 09:29:35PM +0100, Stefan Weil wrote:
>> Those constants are larger than 32 bits and need a suffix to avoid
>> warnings from some versions of gcc.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>

>> @@ -3653,7 +3653,7 @@ target_ulong helper_extr_s_h(target_ulong ac, ta=
rget_ulong shift,
>>      if (temp > (int64_t)0x7FFF) {
>>          temp =3D 0x00007FFF;
>>          set_DSPControl_overflow_flag(1, 23, env);
>> -    } else if (temp < (int64_t)0xFFFFFFFFFFFF8000) {
>> +    } else if (temp < (int64_t)0xFFFFFFFFFFFF8000LL) {

Instead of using both a suffix and a cast to int64_t, shouldn't we
instead be writing '(temp < INT64_C(0xFFFFFFFFFFFF8000))'?

>=20
> Blue Swirl proposed the same patch a bit earlier then you, and I have
> just applied it.

But since I've seldom seen code using the *_C() macros from <stdint.h>,
it doesn't bother me enough to pursue it any further now that the
immediate concern of compiler warnings has been silenced.

--=20
Eric Blake   eblake@redhat.com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--------------enig6EA1E32A6804A7A84F149836
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iQEcBAEBCAAGBQJQmAhNAAoJEKeha0olJ0NqYfQIAJIHnh62eripiCw/d+M3nO0n
4+YwlT4GrNcARmE9nXaWc6WWLu1W4XfAeafm4Io8XM3yNNYwMLn90LfEYi4c7VFi
MlcsCZidIjZI23nXly5l2zpf6/tDtQJVIc6hn8sKtypNyDfkpRYj0/hKylF9ntNz
T/Jcuqb4W0KvhR+jjOHNkXCXMxm0VPBY+LQQl5UPXY1c7n2O17AUSryFeosL93Fx
5qmg9KgbL/BvM6t9jkp+9v3xb0lSGxXF+Q9jhHhzvtApv0ijUj1DSLI6X7x0/JQ3
gsluhzCbu0lgv9pO5FGsohU1z4xCktnUiBkMR6OugfzhK3tFxSqRrs8Cyjy5QTQ=
=3Y9+
-----END PGP SIGNATURE-----

--------------enig6EA1E32A6804A7A84F149836--

