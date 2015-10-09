Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkZTE-00039b-4k
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 11:20:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZkRL2-0003YK-Kd
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 02:39:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZkRL1-0005F0-SD
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 02:39:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41880)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZkRKv-0005Dz-LW; Fri, 09 Oct 2015 02:39:25 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 5E289BB96F;
	Fri,  9 Oct 2015 06:39:25 +0000 (UTC)
Received: from [10.36.4.95] (vpn1-4-95.ams2.redhat.com [10.36.4.95])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t996dMDB001353
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 9 Oct 2015 02:39:24 -0400
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1444332916-16476-1-git-send-email-thuth@redhat.com>
	<1444332916-16476-2-git-send-email-thuth@redhat.com>
	<5616D94C.4040109@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5617611A.90205@redhat.com>
Date: Fri, 9 Oct 2015 08:39:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <5616D94C.4040109@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="KD6HewJjqNSm4mT5iFOogCrTM52Kl0AAN"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/5] hw/dma/pxa2xx: Remove
	superfluous memset
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
X-List-Received-Date: Fri, 09 Oct 2015 06:39:33 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KD6HewJjqNSm4mT5iFOogCrTM52Kl0AAN
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 08/10/15 22:59, Eric Blake wrote:
> On 10/08/2015 01:35 PM, Thomas Huth wrote:
>> g_malloc0 already clears the memory, so no need for
>> the additional memset here.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  hw/dma/pxa2xx_dma.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c
>> index d4501fb..3f0a720 100644
>> --- a/hw/dma/pxa2xx_dma.c
>> +++ b/hw/dma/pxa2xx_dma.c
>> @@ -461,7 +461,6 @@ static int pxa2xx_dma_init(SysBusDevice *sbd)
>> =20
>>      s->chan =3D g_malloc0(sizeof(PXA2xxDMAChannel) * s->channels);
>=20
> As long as we're here, this should probably be switched to g_new0(), in=

> part to avoid any chance that the multiply can overflow.

Ok, I doubt that we really get overflows here, but g_new0 is certainly
nicer here, so I'll change my patch accordingly.

 Thomas



--KD6HewJjqNSm4mT5iFOogCrTM52Kl0AAN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJWF2EaAAoJEC7Z13T+cC21WtYQAKGNF4bidscjcmmPfjRrKj1W
FNvsr7gNx/Xw/Mqt+chSdGsJV/hRpteyLxqycbRBkp3vUjthcfIHhbgL0fg15G5X
OgVLIrCWZDWe0aY1h/vqYMXX2HxiAh0wRqazy2ViVaUS8XEd4UvzPnzm5sknxQj4
bVjwHGqEh7gNAb2tK/2lZ2AABdVDdqCuIMoo3kTEPaz0nNOHZe1XxagWUa883Pzk
dwbp/3xJP3DAKqlnZH2s3OrjjPEkkP+lcscuAjbuxx05yIQdSZqhc7tWh2Lh5N5q
T72gFvm7RIofKLPUWqkYbEBOiW3gO99EpKxwOorvzmg2HtMVx2ydtNcOpY0u7eYY
OOYgBZhdSv3jPExJZjcbKE1v/tGa+wwtJu+/vtYzjMTx6nmpEcktkDE+yegpo7zB
a5DL8y0wQcmZELNhK++2zQXLettxoQerTnFh7jM0HssjF36UNyhR5IlgUZDC8sVA
zIjHz0Tfg1YyVyRVECTQyS5JOk5IxVyk7g3EVLMXAfFn6US8otQ9PQC8JL3M90Ed
32oc+m8pkHZcKL6cB6ctsBZZyV+RI0SwijYUpMaCk/6/3li+lPtu04pekY47uerT
KW0is1gYKGiKR105JOK5SSr54pg+270JDAdrJ3LlDy/ET9q3+W8XcVLnndnwX7p6
9jAQZCJLAmMnwRp9gYu/
=cwIt
-----END PGP SIGNATURE-----

--KD6HewJjqNSm4mT5iFOogCrTM52Kl0AAN--

