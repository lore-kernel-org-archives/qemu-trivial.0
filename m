Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aG9fv-00061e-FE
	for mharc-qemu-trivial@gnu.org; Mon, 04 Jan 2016 13:16:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aG9ft-0005yb-EO
	for qemu-trivial@nongnu.org; Mon, 04 Jan 2016 13:16:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aG9fs-00017Y-Am
	for qemu-trivial@nongnu.org; Mon, 04 Jan 2016 13:16:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55069)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1aG9fp-00016j-Oi; Mon, 04 Jan 2016 13:16:05 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 761A413A6A;
	Mon,  4 Jan 2016 18:16:05 +0000 (UTC)
Received: from [10.3.113.119] (ovpn-113-119.phx2.redhat.com [10.3.113.119])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u04IG44L021828; Mon, 4 Jan 2016 13:16:04 -0500
To: Sitsofe Wheeler <sitsofe@yahoo.com>, qemu-devel@nongnu.org
References: <20151230195338.GA25149@sucs.org> <20151230195744.GA26893@sucs.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
X-Enigmail-Draft-Status: N1110
Organization: Red Hat, Inc.
Message-ID: <568AB6E3.5010302@redhat.com>
Date: Mon, 4 Jan 2016 11:16:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20151230195744.GA26893@sucs.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Qb8elwq8texSID33wCaBtdgs8FCALi9S3"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] qemu-nbd: Minor texi
	updates
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
X-List-Received-Date: Mon, 04 Jan 2016 18:16:10 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Qb8elwq8texSID33wCaBtdgs8FCALi9S3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/30/2015 12:57 PM, Sitsofe Wheeler wrote:
> - Change some spacing.
> - Remove duplicate entry for --format.
> - Reword --discard documentation.
> - Add --detect-zeroes documentation.
>=20
> Signed-off-by: Sitsofe Wheeler <sitsofe@yahoo.com>
> ---
>  qemu-nbd.texi | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
>=20

> @@ -22,8 +22,9 @@ offset into the image
>  interface to bind to (default @samp{0.0.0.0})
>  @item -k, --socket=3D@var{path}
>  Use a unix socket with path @var{path}
> -@item -f, --format=3D@var{format}
> -Set image format as @var{format}
> +@item -f, --format=3D@var{fmt}
> +force the use of the block driver for format @var{fmt} instead of
> +auto-detecting

Why are you abbreviating 'format' to 'fmt'? Oh, because that's how the
other duplicate one was worded.

Should probably start with 'Force', to match the capitalization used
earlier....

>  @item -r, --read-only
>  export read-only
>  @item -P, --partition=3D@var{num}
> @@ -44,17 +45,22 @@ the emulator's @code{-drive cache=3D...} option for=
 allowed values.
>  choose asynchronous I/O mode between @samp{threads} (the default)
>  and @samp{native} (Linux only).
>  @item --discard=3D@var{discard}
> -toggles whether @dfn{discard} (also known as @dfn{trim} or @dfn{unmap}=
)

=2E..then again, later lines are not starting with upper case. Maybe
that's worth its own patch to make it uniformly consistent?

> -requests are ignored or passed to the filesystem.  The default is no
> -(@samp{--discard=3Dignore}).
> +controls whether @dfn{discard} (also known as @dfn{trim} or @dfn{unmap=
})
> +requests are ignored or passed to the filesystem.  @var{discard} is on=
e of
> +@samp{ignore} (or @samp{off}), @samp{unmap} (or @samp{on}).  The defau=
lt is
> +@samp{ignore}.
> +@item --detect-zeroes=3D@var{detect-zeroes}
> +enables the automatic conversion of plain zero writes by the OS to dri=
ver
> +specific optimized zero write commands.  @var{detect-zeroes} is one of=


I'd probably write this one as 'driver-specific'

> +@samp{off}, @samp{on} or @samp{unmap}.  @samp{unmap}
> +converts a zero write to an unmap operation and can only be used if
> +@var{discard} is set to @samp{unmap}.  The default is @samp{off}.
>  @item -c, --connect=3D@var{dev}
>  connect @var{filename} to NBD device @var{dev}
>  @item -d, --disconnect
>  disconnect the specified device
>  @item -e, --shared=3D@var{num}
>  device can be shared by @var{num} clients (default @samp{1})
> -@item -f, --format=3D@var{fmt}
> -force block driver for format @var{fmt} instead of auto-detecting
>  @item -t, --persistent
>  don't exit on the last connection
>  @item -v, --verbose
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--Qb8elwq8texSID33wCaBtdgs8FCALi9S3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWirbkAAoJEKeha0olJ0Nqa58H/j40wsrYS6r+4bVqI4HpMktO
7iADtSxf/BapSD5HYPjc9GsGORnxst7GRBRHbb9p/IG8lGpCOQCVzJ4y2XVcdAu5
S/rb77xfrhZo2mnvzEqanaJaIrUI9FVhDb8JWFPPEgk2b10MoyU3GcVeVc1HrBSI
RuSR5sRv/1SBC4qFlgu1biJYmzP2B1uIQ/NYsru/UqE7LQNHhs4PiyGTdbNwHwol
0pxD1dqvzavksa3ko6TXU0VUfJsOepsSRXpTdaqWYPrY8OQfFeLNHC3TwKO9FenZ
/pjlthBVYl/o7f6YdREo2gQP2sRUnfqvMV5LwiceDQiTxNeF10YFHxLMS0HAL4M=
=rjui
-----END PGP SIGNATURE-----

--Qb8elwq8texSID33wCaBtdgs8FCALi9S3--

