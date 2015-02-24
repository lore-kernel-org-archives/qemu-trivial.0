Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQIRl-0003Sg-0T
	for mharc-qemu-trivial@gnu.org; Tue, 24 Feb 2015 11:34:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YQIRi-0003Ry-Ja
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 11:34:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YQIRf-0002jn-Bv
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 11:34:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49577)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YQIRf-0002jV-39; Tue, 24 Feb 2015 11:34:51 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1OGY86b025516
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 24 Feb 2015 11:34:09 -0500
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1OGY738023262; Tue, 24 Feb 2015 11:34:07 -0500
Message-ID: <54ECA7FF.8020301@redhat.com>
Date: Tue, 24 Feb 2015 09:34:07 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Alberto Garcia <berto@igalia.com>
References: <1424723236-24368-1-git-send-email-berto@igalia.com>
	<54EB9B04.1070901@redhat.com> <20150224070152.GA8006@igalia.com>
In-Reply-To: <20150224070152.GA8006@igalia.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="qcORlKD6ujsSTWv6afT8cLXbwraTxkoV3"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp-commands.hx: Fix
	several typos
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
X-List-Received-Date: Tue, 24 Feb 2015 16:34:55 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qcORlKD6ujsSTWv6afT8cLXbwraTxkoV3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/24/2015 12:01 AM, Alberto Garcia wrote:
> On Mon, Feb 23, 2015 at 02:26:28PM -0700, Eric Blake wrote:
>=20
>>> -- "tls": whevener the channel is encrypted (json-bool)
>>> +- "tls": whenever the channel is encrypted (json-bool)
>>
>> Might be nicer as 'whether' rather than 'whenever'.
>=20
> Oh, you're right. Feel free to change it, or do you want me to
> resubmit the patch?

Up to the trivial tree maintainer, but if it were me, I'd resend a v2 to
make his life easier.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--qcORlKD6ujsSTWv6afT8cLXbwraTxkoV3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJU7Kf/AAoJEKeha0olJ0Nqn3YIAKEW/kR7TbOc6qJvo2FExtT3
duxtJ61CQTj/yTw5GjHMLsYunPkKWY2B1R68HlkyvHVVm3YwdMAMfnOkeugdECAb
3WYxV0Cm/Px4h3RXFYCFrknQEkNFugZeZRcwjH4aEv0UM6aGGG5EjLvqbbarz4Hr
rQWcNpEgm3762PjPc6ef4Egmkzh4lBu3VvdkGNSYV7WdoPssL87ne6TQCLuMxsVF
T05ZKE7QazKmJsDdHWpEEQ0+RLfcxQlPKIzQs3u8O3wFywThU/b1QOGzya4dFh70
GF9SnAldcPBJJn0jSr28Dos4DEM30w4ZC9IczUVZyfAYTXtpoOOg3dYqdagsoMs=
=6s6t
-----END PGP SIGNATURE-----

--qcORlKD6ujsSTWv6afT8cLXbwraTxkoV3--

