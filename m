Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7nDe-0004US-Px
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 13:12:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b7nDc-0004S2-Nk
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 13:12:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b7nDb-0004lG-J9
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 13:12:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49413)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1b7nDV-0004gj-R3; Tue, 31 May 2016 13:12:33 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 17B7E3B70B;
	Tue, 31 May 2016 17:12:33 +0000 (UTC)
Received: from [10.3.116.22] (ovpn-116-22.phx2.redhat.com [10.3.116.22])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VHCWqM022005; Tue, 31 May 2016 13:12:32 -0400
To: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
	<1464712565-14857-2-git-send-email-lvivier@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <574DC600.8010904@redhat.com>
Date: Tue, 31 May 2016 11:12:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1464712565-14857-2-git-send-email-lvivier@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="PVxC2lgIvkUj5Q5tDtt7n8aR7hJ3KWgAD"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 31 May 2016 17:12:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 01/16] coccinelle: use macro
 DIV_ROUND_UP instead of (((n) + (d) - 1) /(d))
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
X-List-Received-Date: Tue, 31 May 2016 17:12:41 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PVxC2lgIvkUj5Q5tDtt7n8aR7hJ3KWgAD
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/31/2016 10:35 AM, Laurent Vivier wrote:
> sample from http://coccinellery.org/
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  scripts/coccinelle/round.cocci | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 scripts/coccinelle/round.cocci
>=20
> diff --git a/scripts/coccinelle/round.cocci b/scripts/coccinelle/round.=
cocci
> new file mode 100644
> index 0000000..ed06773
> --- /dev/null
> +++ b/scripts/coccinelle/round.cocci
> @@ -0,0 +1,19 @@
> +// Use macro DIV_ROUND_UP instead of (((n) + (d) - 1) /(d))
> +@@
> +expression e1;
> +expression e2;
> +@@
> +(
> +- ((e1) + e2 - 1) / (e2)
> ++ DIV_ROUND_UP(e1,e2)

Should this also cover things like:

((e1) & e2) / (e2 + 1)

or with bit-shifts in place of division? I don't know how much
coccinelle can spot other issues (at least until I review the rest of
your series), but at any rate your patch looks like a good first start.
I also like the fact that we are committing the script into the repo, so
that we can reuse it to catch future additions of the open-coded forms.

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--PVxC2lgIvkUj5Q5tDtt7n8aR7hJ3KWgAD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXTcYAAAoJEKeha0olJ0NqwbsIAJ2eRqfJJ6ZNkA+RP1KI8OFa
4D7Qgh+g9DlRzDES+8tUTlQTyRrhWs6HH3aMzv87Cf8g6X7x9+OVnXrN0kwJ0TGT
CZIFDo9FfBxfui1sjhv0uPC6aIaznrggi5vp2VTB4KujgrGj0Mt2kONocPho+VP3
kWUxyNJxTTnj9b0AwWib7mEPyV+RwhRZTVj3Op2XsCvK04uY5tMmrUVB9DOgelTf
cAJPyTebTiC8O7j12aoMQQ9qDa0jfKksooPm1MpmPnwLyKiyNCnW5hGaPkGDGvrK
8yG9zNJ2JewUAdEtrCRlXAtAvV4ASBhWRqnfHQIWezB+0aTcGgW5Je6WwtALK7k=
=t5+Q
-----END PGP SIGNATURE-----

--PVxC2lgIvkUj5Q5tDtt7n8aR7hJ3KWgAD--

