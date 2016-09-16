Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bkvBF-0005xu-El
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 11:35:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bkvBA-0005u3-73
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 11:35:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bkvB8-0007Ep-CV
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 11:35:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40952)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bkvB2-00079U-KA; Fri, 16 Sep 2016 11:35:44 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A39C396A2;
	Fri, 16 Sep 2016 15:35:43 +0000 (UTC)
Received: from [10.3.116.184] (ovpn-116-184.phx2.redhat.com [10.3.116.184])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GFZhvC015590; Fri, 16 Sep 2016 11:35:43 -0400
To: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
	<1474034177-17663-2-git-send-email-lvivier@redhat.com>
Cc: qemu-devel@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <21c7213a-c4d3-ac89-7729-5ee90113c354@redhat.com>
Date: Fri, 16 Sep 2016 10:35:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1474034177-17663-2-git-send-email-lvivier@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="SvRojQOW84sJHpcoDFtUslld1HT9PE1bN"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 16 Sep 2016 15:35:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 01/26] coccinelle: use
 exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 15:35:56 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SvRojQOW84sJHpcoDFtUslld1HT9PE1bN
Content-Type: multipart/mixed; boundary="joqQTeaSfifNIqDiHdNoBInE9VTWDvoRs"
From: Eric Blake <eblake@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
Message-ID: <21c7213a-c4d3-ac89-7729-5ee90113c354@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 01/26] coccinelle: use exit(EXIT_SUCCESS) and
 exit(EXIT_FAILURE)
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
 <1474034177-17663-2-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-2-git-send-email-lvivier@redhat.com>

--joqQTeaSfifNIqDiHdNoBInE9VTWDvoRs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/16/2016 08:55 AM, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  scripts/coccinelle/exit.cocci | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 scripts/coccinelle/exit.cocci
>=20

Script itself is fine. Whether to apply it throughout the tree is a
cosmetic question, but I'm in favor of it; and the script will help us
keep the tree clean. Do we need/want to update HACKING to mention our
new enforced style as well, later in the series?

Reviewed-by: Eric Blake <eblake@redhat.com>

However, Coccinelle doesn't seem to catch comments; your series has
missed at least the 'exit(1)' in the comments of include/qapi/error.h.

> diff --git a/scripts/coccinelle/exit.cocci b/scripts/coccinelle/exit.co=
cci
> new file mode 100644
> index 0000000..73386c0
> --- /dev/null
> +++ b/scripts/coccinelle/exit.cocci
> @@ -0,0 +1,12 @@
> +// replace exit(0) by exit(EXIT_SUCCESS)
> +//         exit(1) by exit(EXIT_FAILURE)
> +
> +@@
> +@@
> +(
> +- exit(0)
> ++ exit(EXIT_SUCCESS)
> +|
> +- exit(1)
> ++ exit(EXIT_FAILURE)
> +)
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--joqQTeaSfifNIqDiHdNoBInE9VTWDvoRs--

--SvRojQOW84sJHpcoDFtUslld1HT9PE1bN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJX3BFOAAoJEKeha0olJ0Nqq1wH/3zercjpoCrnV8OhJGVlKtje
d0GSS/ZOCWcH+8X8O2DUhvfr5mbte0OF2WoGWuiDHcxS3r/yz0iS+rvUBnxpADOR
OSrZjyS/ssGvfcu6c20r5rMIVELIBy4H2i9quKOrDU99Zm3cL6fhR6Py+N7qh62t
Ss+f0xlxLsID1t+uGfvZPrXxAgVDrLad+CiG6+qNUrUTmW8yu3IMWnsKp5Frz37E
dHWgNx4epnlBc7gNe3Aj7CxQ2ecnWZ0VIYzf8HSlYiV4kjiX/NlDIZ+vB2dtegNk
sg29c5icmyHuE/TSo04duG9gM2Bt8UYMWLB7V7f4b6Pwl0dubtAAPyDg/OV01GU=
=Nfl1
-----END PGP SIGNATURE-----

--SvRojQOW84sJHpcoDFtUslld1HT9PE1bN--

