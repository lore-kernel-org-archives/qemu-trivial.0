Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bCTmX-00044i-8v
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jun 2016 11:28:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bCTmR-00041S-CY
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 11:28:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bCTmP-0003DL-9v
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 11:27:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47571)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bCTmG-00039Y-7n; Mon, 13 Jun 2016 11:27:48 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5A488553B;
	Mon, 13 Jun 2016 15:27:47 +0000 (UTC)
Received: from [10.3.116.126] (ovpn-116-126.phx2.redhat.com [10.3.116.126])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5DFRlHS027441; Mon, 13 Jun 2016 11:27:47 -0400
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1465805418-15906-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <575ED0F2.2080900@redhat.com>
Date: Mon, 13 Jun 2016 09:27:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1465805418-15906-1-git-send-email-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="57MpaOtX2hA2kGfr6Sxh18qGv8k6SQEBN"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 13 Jun 2016 15:27:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] scsi-disk: Use (unsigned
 long) typecasts when using "%lu" format string
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
X-List-Received-Date: Mon, 13 Jun 2016 15:28:03 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--57MpaOtX2hA2kGfr6Sxh18qGv8k6SQEBN
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/13/2016 02:10 AM, Thomas Huth wrote:
> Some source code analyzers like cppcheck spill out a warning if
> the sign of the argument does not match the format string.
>=20
> Ticket: https://bugs.launchpad.net/qemu/+bug/1589564
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/scsi/scsi-disk.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> index 1881969..36f8a85 100644
> --- a/hw/scsi/scsi-disk.c
> +++ b/hw/scsi/scsi-disk.c
> @@ -2060,13 +2060,13 @@ static int32_t scsi_disk_emulate_command(SCSIRe=
quest *req, uint8_t *buf)
>          }
>          break;
>      case MODE_SELECT:
> -        DPRINTF("Mode Select(6) (len %lu)\n", (long)r->req.cmd.xfer);
> +        DPRINTF("Mode Select(6) (len %lu)\n", (unsigned long)r->req.cm=
d.xfer);

Why do we need a cast in the first place?  r->req.cmd.xfer is size_t, so
why not just "Mode Select(6) (len %zu)\n", r->req.cmd.xfer)?

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--57MpaOtX2hA2kGfr6Sxh18qGv8k6SQEBN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXXtDzAAoJEKeha0olJ0NqnIMIAJTiw7DyCyIURqt5Es2yZOqQ
xngf3FRMuK3Z73kx0re+pSD7DejUU5EzJPuAGXrCEFN5/pQQdEAf7sCG8awhHuHW
isU0g5wNTnMplzO3b1lTaDtMhP4o0oWJ0btg7kBj/LMt4fWSbTq80Dlzw2NjBcdl
ZKr1QN2HloJC3yKkBHQuJdq9d2cM+7xp6tFUn7plO+t1g9h+iAf5c1n1/Il0Hwo4
1m4rpolzAek6AFDS1/Rv948Ljn+y88CR9jVqvUYrO7MLRMYuAnNW0ilpUISOc5qO
8bc7tc133PuQwkswqUMtNx181SPCIyVvXC3bCxSBWMnDfgsTZg34LzTKw/+u8ug=
=PC8r
-----END PGP SIGNATURE-----

--57MpaOtX2hA2kGfr6Sxh18qGv8k6SQEBN--

