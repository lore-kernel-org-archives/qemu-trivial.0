Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YG9pI-0003b3-3w
	for mharc-qemu-trivial@gnu.org; Tue, 27 Jan 2015 12:21:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YG9pB-0003Wy-7Y
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 12:21:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YG9p7-0000RL-59
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 12:21:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54688)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YG9p6-0000RH-TE; Tue, 27 Jan 2015 12:21:09 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0RHL70r002322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 27 Jan 2015 12:21:07 -0500
Received: from [10.3.113.144] (ovpn-113-144.phx2.redhat.com [10.3.113.144])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0RHL6eE026564; Tue, 27 Jan 2015 12:21:06 -0500
Message-ID: <54C7C902.5050208@redhat.com>
Date: Tue, 27 Jan 2015 10:21:06 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1422376711-31648-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1422376711-31648-1-git-send-email-armbru@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="71PBD4PWscOjeFpROjPAefF5b4KtdD8V1"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/6] Trivial cleanups around
	g_malloc()
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
X-List-Received-Date: Tue, 27 Jan 2015 17:21:18 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--71PBD4PWscOjeFpROjPAefF5b4KtdD8V1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

[your mail used the wrong address for qemu-trivial; I'm redirecting my
reply]

On 01/27/2015 09:38 AM, Markus Armbruster wrote:
> I'm routing these patches through qemu-trivial, even though some of
> them touch actively maintained code, and could go through the
> respective tree instead:
>=20
> * PATCH 1 block (Kevin, Stefan)
>=20
> * PATCH 3 KVM (Paolo)
>=20
> * PATCH 4 migration (Juan, Amit)
>=20
> * PATCH 5 VNC (Gerd)
>=20
> If you want me to reroute any of them, let me know.

For all 6:
Reviewed-by: Eric Blake <eblake@redhat.com>

Patch 2 was the hardest to review (the allocation occurs in context not
shown in the patch).

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--71PBD4PWscOjeFpROjPAefF5b4KtdD8V1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJUx8kCAAoJEKeha0olJ0NqtCIH/0HrGgmqSP4BVPivLAYVZtVY
jSsVA+9/mIyN7U5N0ykneQbdvexI9G55qbTOZVKb7Ak7Mr1+takgQ8oMd4s+LC5u
dS5mec07z7LYDLzkSTSCJKiL9E4ul7qruex7eXiB+MO69fHQZIGqGty3zNBSe8mx
+S59jtSFBmqYOvlOgGu0tgjHpHQ+aQ8d9OMNwp/WvI0dmbBYP5aME7hKyV8xgZN0
84DS15n56LwNxSClb0eKj5MU6t/6y0EbxWuWanVq6P6TQXttr3tnbOMFzKzAjG62
Fp0VfziWiaNgG/xUB9akSBUsBFSzIebdN0c/dWTxh2mdFS0KBN3847wF31/iOXk=
=CbWn
-----END PGP SIGNATURE-----

--71PBD4PWscOjeFpROjPAefF5b4KtdD8V1--

