Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yt0ap-00086j-GU
	for mharc-qemu-trivial@gnu.org; Thu, 14 May 2015 17:22:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Yt0am-00083Z-QR
	for qemu-trivial@nongnu.org; Thu, 14 May 2015 17:22:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Yt0al-00079a-Ut
	for qemu-trivial@nongnu.org; Thu, 14 May 2015 17:22:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45189)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Yt0ah-000769-5R; Thu, 14 May 2015 17:22:51 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 97F588E3C5;
	Thu, 14 May 2015 21:22:50 +0000 (UTC)
Received: from [10.3.113.69] (ovpn-113-69.phx2.redhat.com [10.3.113.69])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4ELMnZ6026273; Thu, 14 May 2015 17:22:50 -0400
Message-ID: <55551229.2050702@redhat.com>
Date: Thu, 14 May 2015 15:22:49 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1431635892-31996-1-git-send-email-sw@weilnetz.de>	<55550E54.2080405@redhat.com>
	<555510C2.7020507@redhat.com>
In-Reply-To: <555510C2.7020507@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="cNC2MkT5KSXvnr0IfsSabBISbJVkPe96O"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pci: Fix compiler warning
 (MinGW-w64 gcc 4.9)
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
X-List-Received-Date: Thu, 14 May 2015 21:22:57 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cNC2MkT5KSXvnr0IfsSabBISbJVkPe96O
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/14/2015 03:16 PM, Eric Blake wrote:
>> Meanwhile, you may want to file a bug to the mingw maintainers that
>> their header is puny when compared to glibc assert() or to glib's
>> g_assert, when it comes to giving gcc decent hints.
>=20
> Oh, I was right!

>=20
> so it is indeed a bug in the mingw headers that __MINGW_ATTRIB_NORETURN=

> was not attached to _assert's declaration.

Filed a Fedora bug at
https://bugzilla.redhat.com/show_bug.cgi?id=3D1221811 but of course it
will take a while for fixed headers to propagate to all distros, so this
patch is fine for qemu in the meantime.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--cNC2MkT5KSXvnr0IfsSabBISbJVkPe96O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVVRIpAAoJEKeha0olJ0NqNHAIAIn1a3SDD1OBEmoPMw+irrmu
ijoovo/77AyC9Yxox9C6D9IeSQPKKjZuYqbgNxudme5yleJvBbbC1V1Bf3Y38rUx
zbQwxDzGls97Uy24+dFSokFuYfv6uBacmc2V+LgfNA6/03SsWXN76wh0hA/gAEUO
s4ApJaDB2bp/ob6EVBdyLMfBaaEm/FOufPeVSXm++xgbqmyI8YwYsjN+8bWbCCbS
id7mozodcc9HYxwGSbOiWemJeQt92bdiPZ3RlfHVfnIO5vNGvQdGJlGkbyk1SIFn
ZvugUJ2eZo9LWWd0tJ1wlLc4Ph9ijEsHbQdN5ZM1JK/SHaX25aN28BLdJiJoqDw=
=fuGV
-----END PGP SIGNATURE-----

--cNC2MkT5KSXvnr0IfsSabBISbJVkPe96O--

