Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YczNA-0003zr-V9
	for mharc-qemu-trivial@gnu.org; Tue, 31 Mar 2015 12:50:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YczN8-0003yX-CD
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 12:50:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YczN7-0002Vq-CQ
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 12:50:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56864)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YczMz-0002TH-FA; Tue, 31 Mar 2015 12:50:29 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id DB8E58E793;
	Tue, 31 Mar 2015 16:50:28 +0000 (UTC)
Received: from [10.3.113.77] (ovpn-113-77.phx2.redhat.com [10.3.113.77])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2VGoSB9022991; Tue, 31 Mar 2015 12:50:28 -0400
Message-ID: <551AD054.40802@redhat.com>
Date: Tue, 31 Mar 2015 10:50:28 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-trivial@nongnu.org
References: <1427814318-541552-1-git-send-email-stefanb@linux.vnet.ibm.com>
In-Reply-To: <1427814318-541552-1-git-send-email-stefanb@linux.vnet.ibm.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="FkVFdqGU4PPqP3r5MvXUHHujNveBN7IAf"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] tpm_tis: fix format for
	64bit variable
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
X-List-Received-Date: Tue, 31 Mar 2015 16:50:39 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FkVFdqGU4PPqP3r5MvXUHHujNveBN7IAf
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/31/2015 09:05 AM, Stefan Berger wrote:
> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
> ---
>  hw/tpm/tpm_tis.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

However;

>=20
> diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
> index 815c8ea..3f42982 100644
> --- a/hw/tpm/tpm_tis.c
> +++ b/hw/tpm/tpm_tis.c
> @@ -814,7 +814,7 @@ static void tpm_tis_mmio_write_intern(void *opaque,=
 hwaddr addr,
>              tis->loc[locty].state =3D=3D TPM_TIS_STATE_COMPLETION) {
>              /* drop the byte */
>          } else {
> -            DPRINTF("tpm_tis: Data to send to TPM: %08x (size=3D%d)\n"=
,
> +            DPRINTF("tpm_tis: Data to send to TPM: 0x%08" PRIx64 " (si=
ze=3D%d)\n",

This caused me to do a double-take (usually, a variable named 'size' is
size_t, in which case %d is wrong; but here it is 'unsigned size').

Also, there is another suspicious DPRINTF earlier in the function; maybe
it's worth a v3? I'm talking about:

    DPRINTF("tpm_tis: write.%u(%08x) =3D %08x\n", size, (int)addr,
(uint32_t)val);

but there are some 32-bit platforms where uint32_t is a long, so %x will
cause a compiler warning, as compared to PRIx32.  And if you are just
going to cast, why not cast directly to int; on the other hand, if what
you are printing is truly 64-bit, then why not use %016x instead of %08x
(that is, when printing a 64-bit number, having a minimum of 8 0-padded
bytes doesn't make it easy to distinguish a 10-character from
11-character printout, while consistently padding all output to 16
characters makes alignment easier to spot).

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--FkVFdqGU4PPqP3r5MvXUHHujNveBN7IAf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVGtBUAAoJEKeha0olJ0NqXQkIAJigJ5U3iOpIplGW7bUmLGE1
N7ej51ZWYqScRD9Xh4npetmu9DrSVsian4fAJXMXOPz+fxgXSTQqTGwoXu8uZ6fC
h1DrgpKAWc5xAPql9H5RJJCUzEfpbbX1aojSg68YWWRcgKRWPk99WYYTfdGg9Pqg
JfqGL7HsZ9t5ZLo9x0SDYa3Db0hjZK9SeMvumWYsg6ChohXW+rpPJYHVRq7BW7+0
ENbMaJyUznOzoOGTQYb6TnYxkqQCMalSnvjtTk6jXjQ0x0GN6E4dfqWcbaNwrln4
2sBmvj6o2I43bFkdvX7a18hYZHy6FlZdm+VHaDhMUgvIbOxYGtUA/ohN76q2iJ4=
=/i0t
-----END PGP SIGNATURE-----

--FkVFdqGU4PPqP3r5MvXUHHujNveBN7IAf--

