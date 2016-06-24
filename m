Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bGUn4-0006Bt-5E
	for mharc-qemu-trivial@gnu.org; Fri, 24 Jun 2016 13:21:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bGUn2-0006At-4N
	for qemu-trivial@nongnu.org; Fri, 24 Jun 2016 13:21:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bGUn1-0004ll-0C
	for qemu-trivial@nongnu.org; Fri, 24 Jun 2016 13:21:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52135)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bGUmu-0004kp-Fq; Fri, 24 Jun 2016 13:21:04 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA50A8553D;
	Fri, 24 Jun 2016 17:21:02 +0000 (UTC)
Received: from [10.3.116.83] (ovpn-116-83.phx2.redhat.com [10.3.116.83])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5OHL14P016277; Fri, 24 Jun 2016 13:21:02 -0400
To: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
	<1466007277-17525-2-git-send-email-lvivier@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <576D6BFD.3060402@redhat.com>
Date: Fri, 24 Jun 2016 11:21:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1466007277-17525-2-git-send-email-lvivier@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="MqlAlq4NxRWpdowPNpVudhu0A1w0L0lvL"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 24 Jun 2016 17:21:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/7] coccinelle: add a
 script to remove useless casts
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
X-List-Received-Date: Fri, 24 Jun 2016 17:21:13 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MqlAlq4NxRWpdowPNpVudhu0A1w0L0lvL
Content-Type: multipart/mixed; boundary="CQ7uWAmKU3dC6nO79BT3mKPe7p4NCv8Sk"
From: Eric Blake <eblake@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Message-ID: <576D6BFD.3060402@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/7] coccinelle: add a script to remove
 useless casts
References: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
 <1466007277-17525-2-git-send-email-lvivier@redhat.com>
In-Reply-To: <1466007277-17525-2-git-send-email-lvivier@redhat.com>

--CQ7uWAmKU3dC6nO79BT3mKPe7p4NCv8Sk
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/15/2016 10:14 AM, Laurent Vivier wrote:
> Script from LKML.

Link to a particular message?

>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  scripts/coccinelle/typecast.cocci | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 scripts/coccinelle/typecast.cocci
>=20
> diff --git a/scripts/coccinelle/typecast.cocci b/scripts/coccinelle/typ=
ecast.cocci
> new file mode 100644
> index 0000000..be2183e
> --- /dev/null
> +++ b/scripts/coccinelle/typecast.cocci
> @@ -0,0 +1,7 @@
> +// Remove useless casts
> +@@
> +type T;
> +T v;
> +@@
> +-	(T *)&v
> ++	&v

Since we're using C for the most part, do we also want to remove useless
casts in and out of void*?

But even if we do that, it could be separate.  This patch looks good on
its own:

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--CQ7uWAmKU3dC6nO79BT3mKPe7p4NCv8Sk--

--MqlAlq4NxRWpdowPNpVudhu0A1w0L0lvL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXbWv9AAoJEKeha0olJ0Nq7JkH/RNSFMi60iHop5z/8dzm0xC3
a2Kvlv+w5ZVra04bShhSOjYiPUCXdo3bPOHQrJSQlhBe62n69fMM7BlCmbA7DbB0
bS3cEl/mX1m0VFeHlpBUI0cMIMuWzoihaBLGHtiGAICGptpmUd612StJVPy4XPAW
cMCzvN+CaoE/xjoE4qgiyHUzyA74Dyl5DBn3h/uLO12dyOichU61mkukkmzNuRZF
I6E/A12KtOCBZ4hhAEGDP9TqSwvEMUxqHurqWbWQhb7fBDnu0NXndELfnSEbpGsb
soLYvMULOXexZUIJWhBaKnR4ItHFPV7NatPJuv+/BsV2SFYX94Y7hTo/s8USVFI=
=xsiW
-----END PGP SIGNATURE-----

--MqlAlq4NxRWpdowPNpVudhu0A1w0L0lvL--

