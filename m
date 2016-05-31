Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7noo-0003Zt-E2
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 13:51:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b7noj-0003Vi-Eq
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 13:51:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b7noh-0006Pz-BH
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 13:51:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59151)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1b7noZ-0006Ow-TL; Tue, 31 May 2016 13:50:52 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5FCF13B727;
	Tue, 31 May 2016 17:50:51 +0000 (UTC)
Received: from [10.3.116.22] (ovpn-116-22.phx2.redhat.com [10.3.116.22])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VHoo0I028254; Tue, 31 May 2016 13:50:50 -0400
To: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
	<1464712565-14857-6-git-send-email-lvivier@redhat.com>
Cc: qemu-block@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <574DCEFA.70906@redhat.com>
Date: Tue, 31 May 2016 11:50:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1464712565-14857-6-git-send-email-lvivier@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="KSuN9mNN5PQDbtOihbkaGwnbj6of5XV8K"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 31 May 2016 17:50:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 05/16] block: Use
 DIV_ROUND_UP
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
X-List-Received-Date: Tue, 31 May 2016 17:51:04 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KSuN9mNN5PQDbtOihbkaGwnbj6of5XV8K
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/31/2016 10:35 AM, Laurent Vivier wrote:
> Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).
>=20
> This patch is the result of coccinelle script
> scripts/coccinelle/round.cocci
>=20
> CC: qemu-block@nongnu.org
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  block/vvfat.c      | 3 +--
>  hw/block/tc58128.c | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/block/vvfat.c b/block/vvfat.c
> index a39dbe6..6d2e21c 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -1960,8 +1960,7 @@ DLOG(fprintf(stderr, "check direntry %d:\n", i); =
print_direntry(direntries + i))
>  		/* check file size with FAT */
>  		cluster_count =3D get_cluster_count_for_direntry(s, direntries + i, =
path2);
>  		if (cluster_count !=3D
> -			(le32_to_cpu(direntries[i].size) + s->cluster_size
> -			 - 1) / s->cluster_size) {
> +            DIV_ROUND_UP(le32_to_cpu(direntries[i].size), s->cluster_s=
ize)) {

The tab-vs.-space issues in this file make the patch look weird.  It's
not your fault, but you may want to manually touch up the result so that
visual indentation under 8-spaces-per-tab still looks okay.

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--KSuN9mNN5PQDbtOihbkaGwnbj6of5XV8K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXTc76AAoJEKeha0olJ0NqwPMH/109sZcR32jQZgavwQSmpANX
ML1AEFzftECN2c1efKo3bSVXEhw/yGTViYPhyAsAmzbwa2HHjA5LBc1ashyaDHGi
29BYq//mw73OLg+W9lWbA1PAEvFlUZ5E3MpQcOFh+9EqGSCIrb9gg9AqkP0nnCNi
pOSNIkrgLX5CFZUuC7sAwJaEspe4CIw0tmahZsdZb1Bmomtj+ynIo9ljcJ9U5TWl
Qk5Zzt2NjQWDgiLPqBvyuZh0Ipsn3jIAHOeRcPmeg2oZ+RZmDtBCkvaUIBbtr6+7
kNfmPHRiEbb9gHqupiPznBVJF/zIR0tc0HtvyMM41boh7TkcKgtnUvVPA3gkWdM=
=Z23M
-----END PGP SIGNATURE-----

--KSuN9mNN5PQDbtOihbkaGwnbj6of5XV8K--

