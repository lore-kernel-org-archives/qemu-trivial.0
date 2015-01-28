Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YGUJa-000679-C3
	for mharc-qemu-trivial@gnu.org; Wed, 28 Jan 2015 10:13:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YGUJX-00065u-2P
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 10:13:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YGUJT-0005hY-1n
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 10:13:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34739)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YGUJS-0005hO-Pp; Wed, 28 Jan 2015 10:13:51 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0SFDnIF030999
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 28 Jan 2015 10:13:50 -0500
Received: from [10.3.113.144] (ovpn-113-144.phx2.redhat.com [10.3.113.144])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0SFDmru002470; Wed, 28 Jan 2015 10:13:49 -0500
Message-ID: <54C8FCAC.7070905@redhat.com>
Date: Wed, 28 Jan 2015 08:13:48 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1422456844-13043-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1422456844-13043-1-git-send-email-armbru@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="9kuJEitwt3GSOOEjqeTdtAEdsRG7jLcrK"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] Pair g_malloc() with
	g_free(), not free()
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
X-List-Received-Date: Wed, 28 Jan 2015 15:13:56 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9kuJEitwt3GSOOEjqeTdtAEdsRG7jLcrK
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/28/2015 07:54 AM, Markus Armbruster wrote:
> I'm routing these patches through qemu-trivial, even though some of
> them touch actively maintained code, and could go through the
> respective tree instead:
>=20
> * PATCH 3 sPAPR (Alex)
>=20
> * PATCH 4 USB (Gerd)
>=20
> If you want me to reroute any of them, let me know.

Reviewed-by: Eric Blake <eblake@redhat.com>

[for patches like these, sometimes I like to use git format-patch -U20
or whatever it takes to make the patch show full context of the
allocation a few lines earlier that matches with the actual g_free fix,
so that reviewers don't have to open the file themselves.  It makes for
larger emails, but potentially faster reviews.  But it's not the end of
the world to stick with the default 3-line context]

>=20
> Markus Armbruster (4):
>   qemu-option: Replace pointless use of g_malloc0() by g_malloc()
>   qemu-option: Pair g_malloc() with g_free(), not free()
>   spapr_vio: Pair g_malloc() with g_free(), not free()
>   usb: Pair g_malloc() with g_free(), not free()
>=20
>  hw/ppc/spapr_vio.c | 2 +-
>  hw/usb/desc-msos.c | 2 +-
>  util/qemu-option.c | 8 ++++----
>  3 files changed, 6 insertions(+), 6 deletions(-)
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--9kuJEitwt3GSOOEjqeTdtAEdsRG7jLcrK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJUyPysAAoJEKeha0olJ0Nqhu0H/04WUhv+2kESZ+d5Q5/ZloKC
+nTXdbZ9jDBLDaDqtNnBZa6Q0ut8lDyE/QiG2qk1WjmROmuLDcujSojuIKCpj01F
NV+wXGSRrECgFZtJ2M63yvgtuYcHH3eMfdSgT6ivnuaPYTlQKrT96p23djhwnlHI
xz9caNfEvW7U+oYE2PGESiEn+KhUKKOwMvoqQj4ZyJ/kSk0ZhoI0nfp+chlxbQcx
nmw49TOTEZigemsvDJIW0KSf4uX1P7RJrl68ZpL9ojIaLZ16RmAJbVNQOyL0QsEV
wTBPxO2mrvXvVOl7A3idhUuIMFxkWm6lgZpTMfYTx1bGm9g900Il+DGOITu2jWw=
=atiH
-----END PGP SIGNATURE-----

--9kuJEitwt3GSOOEjqeTdtAEdsRG7jLcrK--

