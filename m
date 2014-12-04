Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XwbuV-0007z9-Mw
	for mharc-qemu-trivial@gnu.org; Thu, 04 Dec 2014 14:17:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XwbuO-0007rO-Uj
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 14:17:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XwbuK-00033O-7p
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 14:17:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43291)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XwbuA-00030m-Ck; Thu, 04 Dec 2014 14:17:34 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB4JHXO6009557
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 4 Dec 2014 14:17:33 -0500
Received: from [10.3.113.183] (ovpn-113-183.phx2.redhat.com [10.3.113.183])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB4JHXDY007128; Thu, 4 Dec 2014 14:17:33 -0500
Message-ID: <5480B34C.1040706@redhat.com>
Date: Thu, 04 Dec 2014 12:17:32 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, Fam Zheng <famz@redhat.com>
References: <1417685215-5289-1-git-send-email-armbru@redhat.com>	<20141204093414.GB28961@ad.nay.redhat.com>
	<87mw73snpo.fsf@blackfin.pond.sub.org>
In-Reply-To: <87mw73snpo.fsf@blackfin.pond.sub.org>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="cePltrkIj6WrKrarx0LKP2gJ32Vs9i5qq"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Drop superfluous
	conditionals around g_strdup()
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
X-List-Received-Date: Thu, 04 Dec 2014 19:17:53 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cePltrkIj6WrKrarx0LKP2gJ32Vs9i5qq
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/04/2014 03:39 AM, Markus Armbruster wrote:

> As per standard operating procedure, I expanded tabs in the lines I
> touched.  No visual difference, except in patches.
>=20
> What do you want me to do?
>=20
> 1. Don't expand tabs, ignore checkpatch.pl whining
>=20
> 2. Expand tabs in touched lines (current patch)
>=20
> 3. Expand all tabs in uri_resolve() (in a separate patch, of course)
>=20
> 4. Expand all tabs in util/uri.c (in a separate patch, of course)

My preferred choice first: 2, 4, 3, 1

That is, I'm fine with how you did it.  If you are going to clean up
tabs as a separate patch, I'd prefer you do it for the whole file rather
than just one function. And I'd rather a tab cleanup than ignoring
checkpatch.pl, but not at the expense of favoring a tab cleanup ahead of
the current proposed patch.


--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--cePltrkIj6WrKrarx0LKP2gJ32Vs9i5qq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUgLNNAAoJEKeha0olJ0NqMgYIAKeddM9FVXcnA9xk5Xj3Tgn+
HDjxKT3661YwDcKZ6Ugl73mhisltjodX2n17QR7fQ+791fXzWaY2Xmpyy8suye0t
AYm9+ASjX0SAUu2CTXRPcpCoVH4p1R4Pff8B6oAP0n1O9p5Pod1Ybf6Bj1OZCKYc
v9eHukNYHDH1sPlaHsointco9sjn3CuxjgcXnFQ1zUW19/mS7p1aZwlOCBt9KBTh
2ib2SN++1ZhqZyZ87qpZW3pGnzsSDZQGJi0s1eMB51X87V14i3uOi/3FewNRBZ2f
bGRd4o3PM+Nab5bZvjA5drxBgr4N6gmD7KEXpK6R+adktMLrqxj+SmSxacEbye8=
=q9hu
-----END PGP SIGNATURE-----

--cePltrkIj6WrKrarx0LKP2gJ32Vs9i5qq--

