Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmkLX-0004o2-Sf
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 10:49:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YmkLU-0004kX-Rm
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 10:49:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YmkLQ-0007oC-BQ
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 10:49:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54383)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YmkLF-0007j4-Pf; Mon, 27 Apr 2015 10:49:01 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 3FA318EA2F;
	Mon, 27 Apr 2015 14:49:01 +0000 (UTC)
Received: from [10.3.113.161] (ovpn-113-161.phx2.redhat.com [10.3.113.161])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3REn0Z0007063; Mon, 27 Apr 2015 10:49:00 -0400
Message-ID: <553E4C5C.7010705@redhat.com>
Date: Mon, 27 Apr 2015 08:49:00 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <1430122397-2807-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1430122397-2807-1-git-send-email-mjt@msgid.tls.msk.ru>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="dRagrlbPB6CJIms28NVrg5fm9T85ILrhs"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-options: trivial
	spelling fix (messsage)
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
X-List-Received-Date: Mon, 27 Apr 2015 14:49:17 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dRagrlbPB6CJIms28NVrg5fm9T85ILrhs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 04/27/2015 02:13 AM, Michael Tokarev wrote:
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

But while at it...

>=20
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 319d971..ec356f6 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3106,7 +3106,7 @@ executed often has little or no correlation with =
actual performance.
>  to synchronise the host clock and the virtual clock. The goal is to

Is there any consensus on whether we should prefer US spelling
(synchronize) over UK spelling in our user-facing text?

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--dRagrlbPB6CJIms28NVrg5fm9T85ILrhs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVPkxcAAoJEKeha0olJ0NqoScH+wZYK3yln3A2NmgCuMcqzaNd
YYNs7qKbTi4H1MwjR+YeBcvgeH+lIpvjv7PGhiBdERZNiGaGhBtZa3lqoH8fZUui
5syXie0lh9Igh6/n4DvV6nP4RfP+y9BhIdcBfz2X1Racfw3bkLjr8i0Icv5cqSqC
9fgdGjPnw0NmUqytOehIHpRysS5kqfW9zU9wPoxrLgFhExN/FY2MSAAtIRJKlsod
dWQE9YScVjhw+O+1oFZIaj65iBYYYBgw900KLiHolWCECs4jnTObiaV8LDhPDXx+
PdfUsEgRFNUURqFp3DLkyVzEywEsszH6jFwH1vAZagCmMkF9ZHvJTnFaBs2j0hI=
=0l/f
-----END PGP SIGNATURE-----

--dRagrlbPB6CJIms28NVrg5fm9T85ILrhs--

