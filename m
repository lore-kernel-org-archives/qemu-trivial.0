Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZgtSq-0007E0-AW
	for mharc-qemu-trivial@gnu.org; Tue, 29 Sep 2015 07:52:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Zga0o-0004hC-73
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 11:06:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Zga0k-0002pw-AV
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 11:06:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56505)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Zga0b-0002oi-In; Mon, 28 Sep 2015 11:06:29 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 89F09C0B64CD;
	Mon, 28 Sep 2015 15:06:28 +0000 (UTC)
Received: from [10.3.113.188] (ovpn-113-188.phx2.redhat.com [10.3.113.188])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8SF6Rgn023322; Mon, 28 Sep 2015 11:06:27 -0400
To: Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>
References: <1443211950-8207-1-git-send-email-sw@weilnetz.de>
	<871tdjni3w.fsf@blackfin.pond.sub.org> <5608F9BC.603@weilnetz.de>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5609576F.2060407@redhat.com>
Date: Mon, 28 Sep 2015 09:06:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <5608F9BC.603@weilnetz.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="1eL7uoHSJVR8SDMPOuUXtAjEnWuCwM9nQ"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] trace/simple: Fix warning
 and wrong trace file name for MinGW
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
X-List-Received-Date: Mon, 28 Sep 2015 15:06:47 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1eL7uoHSJVR8SDMPOuUXtAjEnWuCwM9nQ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/28/2015 02:26 AM, Stefan Weil wrote:

>> Can you explain why osdep.h's
>>
>>     #define FMT_pid "%" PRId64
>>
>> is appropriate for Windows?
>=20
> Don't blame me for any strangeness which you might find in Windows. :-)=

>=20
> Mingw-w64 sys/types.h defines pid_t to be either an int or an __int64.
> FMT_pid must match these definitions.
>=20
> But getpid returns an int, not a pid_t...

Can we 1) file a bug against mingw for their buggy getpid(), and 2)
write a wrapper that makes getpid() always return pid_t in the meantime?

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--1eL7uoHSJVR8SDMPOuUXtAjEnWuCwM9nQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWCVdvAAoJEKeha0olJ0NqkVYIAJBcxwB0pi4t6TEOpxFafhic
dbiRIVD6im6PCnFWJk33YPwMbhO+nINPDH0L8SMtDT2X95cSmH4eMBhZd3PS46uv
rJoT+V2QOnQbNPTNlfcbLRKSbIkYW6EVvvOtRUGnUTk8R0Y4kuB1H+LE1a0YyxKf
PWR1GYTpdmDsMvdqP/0UqpzmuQmQQvWkVVFlyowU0gHQJqdlGkK1Xe/lQLBDswa6
rpB0S0zb2EQxNt/fQ2hDtFYOiJLXS/WRIi3PYXPSZE/33Pxyy+UJbEwETR9rEaYa
zYgt4KzN4ylHJRYl23KNLncQ4kU6ARI98ty4h2TsFGyJ+V7T6sLkdfh+czePWqA=
=yGVi
-----END PGP SIGNATURE-----

--1eL7uoHSJVR8SDMPOuUXtAjEnWuCwM9nQ--

