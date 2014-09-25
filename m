Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XX8H7-0002cO-Ja
	for mharc-qemu-trivial@gnu.org; Thu, 25 Sep 2014 08:35:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XX8H1-0002b1-JA
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 08:35:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XX8Gx-0007Vc-7X
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 08:35:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48837)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XX8Gw-0007Uv-VK; Thu, 25 Sep 2014 08:35:47 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8PCZYkO021883
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 25 Sep 2014 08:35:34 -0400
Received: from [10.3.113.28] (ovpn-113-28.phx2.redhat.com [10.3.113.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8PCZX39029072; Thu, 25 Sep 2014 08:35:33 -0400
Message-ID: <54240C15.1010408@redhat.com>
Date: Thu, 25 Sep 2014 06:35:33 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>
	<1411638384-5844-4-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1411638384-5844-4-git-send-email-arei.gonglei@huawei.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="t8MtUC2gep9eH82giKX9bRNoWU7MBxXHv"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, weidong.huang@huawei.com, qemu-trivial@nongnu.org,
	luonengjun@huawei.com, mjt@tls.msk.ru, armbru@redhat.com,
	peter.huangpeng@huawei.com, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/4] osdep: convert fprintf
	to error_report
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
X-List-Received-Date: Thu, 25 Sep 2014 12:35:56 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--t8MtUC2gep9eH82giKX9bRNoWU7MBxXHv
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/25/2014 03:46 AM, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  util/osdep.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/util/osdep.c b/util/osdep.c
> index b2bd154..7f6e483 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -401,9 +401,9 @@ void fips_set_state(bool requested)
>  #endif /* __linux__ */
> =20
>  #ifdef _FIPS_DEBUG
> -    fprintf(stderr, "FIPS mode %s (requested %s)\n",
> -	    (fips_enabled ? "enabled" : "disabled"),
> -	    (requested ? "enabled" : "disabled"));
> +    error_report("FIPS mode %s (requested %s)",
> +                 (fips_enabled ? "enabled" : "disabled"),
> +                 (requested ? "enabled" : "disabled"));

Do we really want debugging messages going through error_report()?  This
may be one hunk we don't want.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--t8MtUC2gep9eH82giKX9bRNoWU7MBxXHv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUJAwVAAoJEKeha0olJ0NqASQH/ip0Sxxnkc5tUXULs3Tl/Lli
5OzC9Q6FhIGEwmgEdi9EzXCR91bJ0DXO7w74TxolOyfNeJRz674gtDuVMgAdU6Mb
XUizzQlTugd/DF0kVlxpPEMrciIlSdH+V11F4UcuT+cvdpLhQbJGHt07WbHlVXrd
Jr+5Hfe2nspUKm32LFbB6nl90KfKqtkJ7VZ45O3SRxeqSbbIxczqXyR0aXzsQ5GU
QC3hzY2MtnCacVY6bFNhNmrv2/KX0m6UqqjjNCmAEOdohIQhd6QZGRUaE3GvPW5J
1XlZTlv0QD/PLxrQeJkUyvEwaxfN+jmF4smjW84/EnYktj3u2kzcF0MdaXLmzmA=
=AyG+
-----END PGP SIGNATURE-----

--t8MtUC2gep9eH82giKX9bRNoWU7MBxXHv--

