Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1boSTj-0000Ah-3p
	for mharc-qemu-trivial@gnu.org; Mon, 26 Sep 2016 05:45:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1boSTg-00007N-E7
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2016 05:45:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1boSTe-0008Rw-B6
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2016 05:45:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57900)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1boSTX-0008Pl-Q4; Mon, 26 Sep 2016 05:45:28 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0BDE51293;
	Mon, 26 Sep 2016 09:45:27 +0000 (UTC)
Received: from [10.36.116.43] (ovpn-116-43.ams2.redhat.com [10.36.116.43])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8Q9jO6T027659
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 26 Sep 2016 05:45:25 -0400
To: Li Qiang <liq3ea@gmail.com>, kraxel@redhat.com, qemu-devel@nongnu.org
References: <57df5212.87adc20a.7f06f.fda3@mx.google.com>
Cc: Li Qiang <liqiang6-s@360.cn>, qemu-trivial@nongnu.org
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b12a46ed-a663-9ecb-d401-95fffeb8d42b@redhat.com>
Date: Mon, 26 Sep 2016 11:45:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <57df5212.87adc20a.7f06f.fda3@mx.google.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="WLdFQ9M3fCPhmP9eJIflckxg8meEECmom"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 26 Sep 2016 09:45:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] usb: ehci: fix memory leak
 in ehci_process_itd
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
X-List-Received-Date: Mon, 26 Sep 2016 09:45:37 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WLdFQ9M3fCPhmP9eJIflckxg8meEECmom
Content-Type: multipart/mixed; boundary="7okdNMGXMfRp2gEijisOXGQh0dI4Sjtub";
	protected-headers="v1"
From: Thomas Huth <thuth@redhat.com>
To: Li Qiang <liq3ea@gmail.com>, kraxel@redhat.com, qemu-devel@nongnu.org
Cc: Li Qiang <liqiang6-s@360.cn>, qemu-trivial@nongnu.org
Message-ID: <b12a46ed-a663-9ecb-d401-95fffeb8d42b@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] usb: ehci: fix memory leak in
 ehci_process_itd

--7okdNMGXMfRp2gEijisOXGQh0dI4Sjtub
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 19.09.2016 04:48, Li Qiang wrote:
> From: Li Qiang <liqiang6-s@360.cn>
>=20
> While processing isochronous transfer descriptors(iTD), if the page
> select(PG) field value is out of bands it will return. In this
> situation the ehci's sg list doesn't be freed thus leading a memory

s/doesn't be/is not/

> leak issue. This patch avoid this.
>=20
> Signed-off-by: Li Qiang <liqiang6-s@360.cn>
> ---
>  hw/usb/hcd-ehci.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
> index b093db7..f4ece9a 100644
> --- a/hw/usb/hcd-ehci.c
> +++ b/hw/usb/hcd-ehci.c
> @@ -1426,6 +1426,7 @@ static int ehci_process_itd(EHCIState *ehci,
>              if (off + len > 4096) {
>                  /* transfer crosses page border */
>                  if (pg =3D=3D 6) {
> +                    qemu_sglist_destroy(&ehci->isgl);
>                      return -1;  /* avoid page pg + 1 */
>                  }
>                  ptr2 =3D (itd->bufptr[pg + 1] & ITD_BUFPTR_MASK);
>=20

Looks right to me.

Reviewed-by: Thomas Huth <thuth@redhat.com>



--7okdNMGXMfRp2gEijisOXGQh0dI4Sjtub--

--WLdFQ9M3fCPhmP9eJIflckxg8meEECmom
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJX6O4zAAoJEC7Z13T+cC21oBcP/0UnTIyvXi9yFMjjk87FToQL
x5rQUFdhhWk4sDBWOFtkP8eCinQFGuGHPhQZSZiSuENOQaRZTQ3oBmTWIz4X98z2
/+XxhFB4zBsT5h3nK4t8YRvHYns6/gyf78+6Sjkg/mHPW/wj+Nax1Chy8KPi2EvU
MlmwxaWMfeoiZcE1lgjEXugo6GbDH6PcCD3tzbMi/Lyp+o8Ir1bCSY2NE2M1RgNi
05eCiw/FEFS6nKtZmmrY/3eV7fn1g9h56IvdwTtMQLHP1aS8ipwUU2mmu3Az5JQw
he/g5EEaIsRo7Th2LXonWx2E0wtuy1DyeieJaeLaqDmiOTD4S1sNfmZRtTTTYvfe
0muCKOT2AXUWUYRP7fNJaKjajdqqaKuk14b70tIef0ET2dPtBZAXW9kDDeQcPOLO
Bj7K2Lhx4xYvidlaqp2M1NlRTNawKMVdrDWU9bZKlfopD+hhNwDdDbuybqpXaujq
p/UjyxybZrpGDBXUlPKpqwxNhTCJ8uMjhyBoTPIRRIX9k73Ju4VRYk4w1eeuTSOv
Bzf1CsDLVOovripC/WhFqv/uFqPNkbG4Wi+LsLb/YqT4s7oGRs6s6rVcrkv/wVlX
cWKyxUIpZD4hO6BUwtQ1Y6sUm7Nl5aZTO5P77IJXJj2oqcEGQt+yn4Vr3dAlJblq
xat0197hJYNG0l5xnOQl
=dL+a
-----END PGP SIGNATURE-----

--WLdFQ9M3fCPhmP9eJIflckxg8meEECmom--

