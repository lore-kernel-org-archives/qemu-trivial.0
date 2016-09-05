Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bgvDw-0006Qj-4g
	for mharc-qemu-trivial@gnu.org; Mon, 05 Sep 2016 10:50:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1bgvDt-0006M9-C2
	for qemu-trivial@nongnu.org; Mon, 05 Sep 2016 10:50:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1bgvDs-0006cP-Ht
	for qemu-trivial@nongnu.org; Mon, 05 Sep 2016 10:50:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60112)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1bgvDo-0006Yj-4P; Mon, 05 Sep 2016 10:50:04 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 115EC8535A;
	Mon,  5 Sep 2016 14:50:03 +0000 (UTC)
Received: from localhost (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u85Eo1VT002794; Mon, 5 Sep 2016 10:50:02 -0400
Date: Mon, 5 Sep 2016 10:50:00 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, thuth@redhat.com, qemu-trivial@nongnu.org
Message-ID: <20160905145000.GB24387@stefanha-x1.localdomain>
References: <1473078532-3331-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Content-Disposition: inline
In-Reply-To: <1473078532-3331-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 05 Sep 2016 14:50:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Fix up F: entry bit rot
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Sep 2016 14:50:10 -0000


--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 05, 2016 at 02:28:52PM +0200, Markus Armbruster wrote:
> include/hw/xilinx.h is gone since commit d5001cf, drop.
>=20
> include/hw/*/xlnx*.c is a typo, change .c to .h.
>=20
> include/hw/acpi/piix.h is a typo, change piix.h to piix4.h.
>=20
> hw/i386/*dsl and scripts/acpi*py are gone since since commit 9fc6502,
> drop.
>=20
> hw/virtio/dataplane/* are gone since commit fee089e, drop.
>=20
> ICC Bus is gone since commit dfeb867, drop.
>=20
> block/raw-aio.h was moved to include/block/raw-aio.h in commit
> 0187f5c, update.
>=20
> Tracked down with
>=20
>     for i in `grep "^[FX]: " MAINTAINERS | sed "s/^.: //"`
>     do if [ ! -e "$i" ]; then echo "$i"; fi
>     done
>=20
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
> Note: this supersedes Thomas's "[PATCH] virtio-blk: Remove
> hw/virtio/dataplane folder from MAINTAINERS file".
>=20
>  MAINTAINERS | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJXzYYYAAoJEJykq7OBq3PI8w4IAKWhSzzVAMzCvf5z/CBWXXbI
CICH3P4Hbb0MC9zFL/qyHyp1+KK9l7oSTooSbGn9RygpapLISA35X0pX0x9NmL0S
+vW8qrPqjH2TnsEQ59+suW2Wll5a4eEpzkJYrYtCxwMj5BzvGkvU8TW6/Mfvo96r
ZRG1uiO/fB6jQ9zDoIN6s1Hx2Hm4O6xpMbTP51qGQuumsPH94N3JmzaxyCZXDFCI
bBkNMhHJJ1E6URAOBXms9h4Jb/zc8RodUmwA9jUbnq0IzfkQOMeCXWZ1VoQ2YAST
JIRlXZePWVdIkbWliiycnU4gy/WDOcg3Cy9zTeXnIGqtIpXS/Y0XHpOGGk+Xw4k=
=qCgK
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--

