Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VMha5-0005B8-41
	for mharc-qemu-trivial@gnu.org; Thu, 19 Sep 2013 12:59:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1VMhZx-0004uM-Lu
	for qemu-trivial@nongnu.org; Thu, 19 Sep 2013 12:59:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1VMhZr-0002YH-G3
	for qemu-trivial@nongnu.org; Thu, 19 Sep 2013 12:59:45 -0400
Received: from cantor2.suse.de ([195.135.220.15]:35337 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1VMhZf-0002Wc-2I; Thu, 19 Sep 2013 12:59:27 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 40B8CA50DE;
	Thu, 19 Sep 2013 18:59:26 +0200 (CEST)
Message-ID: <523B2D6B.9050601@suse.de>
Date: Thu, 19 Sep 2013 18:59:23 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>,
	Stefan Hajnoczi <stefanha@redhat.com>
References: <1379436196-27506-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1379436196-27506-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block: Fix compiler warning
	(-Werror=uninitialized)
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
X-List-Received-Date: Thu, 19 Sep 2013 16:59:52 -0000

Am 17.09.2013 18:43, schrieb Stefan Weil:
> The patch fixes a warning from gcc (Debian 4.6.3-14+rpi1) 4.6.3:
>=20
> block/stream.c:141:22: error:
> =E2=80=98copy=E2=80=99 may be used uninitialized in this function [-Wer=
ror=3Duninitialized]
>=20
> This is not a real bug - a better compiler would not complain.
>=20
> Now 'copy' has always a defined value, so the check for ret >=3D 0
> can be removed.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  block/stream.c |    5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/block/stream.c b/block/stream.c
> index 078ce4a..fc19194 100644
> --- a/block/stream.c
> +++ b/block/stream.c
> @@ -108,7 +108,7 @@ static void coroutine_fn stream_run(void *opaque)
> =20
>      for (sector_num =3D 0; sector_num < end; sector_num +=3D n) {
>          uint64_t delay_ns =3D 0;
> -        bool copy;
> +        bool copy =3D false;
> =20
>  wait:
>          /* Note that even when no rate limit is applied we need to yie=
ld
> @@ -123,7 +123,6 @@ wait:
>                                  STREAM_BUFFER_SIZE / BDRV_SECTOR_SIZE,=
 &n);
>          if (ret =3D=3D 1) {
>              /* Allocated in the top, no need to copy.  */
> -            copy =3D false;
>          } else if (ret >=3D 0) {
>              /* Copy if allocated in the intermediate images.  Limit to=
 the
>               * known-unallocated area [sector_num, sector_num+n).  */

Sorry for not spotting this patch earlier. This hunk looks wrong and
needs to be dropped, I believe. In the ret >=3D 0 && copy case, there is =
a
"goto wait" which would now no longer be able to go from copy =3D=3D true=
 ->
copy =3D=3D false. Not sure if that can happen in practice.

Andreas

> @@ -138,7 +137,7 @@ wait:
>              copy =3D (ret =3D=3D 1);
>          }
>          trace_stream_one_iteration(s, sector_num, n, ret);
> -        if (ret >=3D 0 && copy) {
> +        if (copy) {
>              if (s->common.speed) {
>                  delay_ns =3D ratelimit_calculate_delay(&s->limit, n);
>                  if (delay_ns > 0) {
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

