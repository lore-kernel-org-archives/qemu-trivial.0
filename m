Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0rIR-0001rv-Pg
	for mharc-qemu-trivial@gnu.org; Sat, 07 Oct 2017 11:45:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1e0rIO-0001qE-7h
	for qemu-trivial@nongnu.org; Sat, 07 Oct 2017 11:45:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1e0rIL-0004tA-18
	for qemu-trivial@nongnu.org; Sat, 07 Oct 2017 11:45:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40334)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1e0rIC-0004hx-8q; Sat, 07 Oct 2017 11:45:32 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 39FEB883B8;
	Sat,  7 Oct 2017 15:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 39FEB883B8
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=jsnow@redhat.com
Received: from [10.10.120.249] (ovpn-120-249.rdu2.redhat.com [10.10.120.249])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E7665D753;
	Sat,  7 Oct 2017 15:45:22 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
	Fam Zheng <famz@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
	qemu trival <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-14-f4bug@amsat.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <286173de-a624-56c6-4521-576c8a9f97ce@redhat.com>
Date: Sat, 7 Oct 2017 11:45:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171006235023.11952-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Sat, 07 Oct 2017 15:45:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 13/88] Dirty Bitmaps: use
 g_new() family of functions
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
X-List-Received-Date: Sat, 07 Oct 2017 15:45:45 -0000



On 10/06/2017 07:49 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> [PMD: squashed tests/test-hbitmap.c changes]
> ---
>  tests/test-hbitmap.c | 2 +-
>  util/hbitmap.c       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/test-hbitmap.c b/tests/test-hbitmap.c
> index af41642346..fea3a64712 100644
> --- a/tests/test-hbitmap.c
> +++ b/tests/test-hbitmap.c
> @@ -122,7 +122,7 @@ static void hbitmap_test_truncate_impl(TestHBitmapD=
ata *data,
> =20
>      n =3D hbitmap_test_array_size(size);
>      m =3D hbitmap_test_array_size(data->old_size);
> -    data->bits =3D g_realloc(data->bits, sizeof(unsigned long) * n);
> +    data->bits =3D g_renew(unsigned long, data->bits, n);
>      if (n > m) {
>          memset(&data->bits[m], 0x00, sizeof(unsigned long) * (n - m));
>      }
> diff --git a/util/hbitmap.c b/util/hbitmap.c
> index 2f9d0fdbd0..4eb0188836 100644
> --- a/util/hbitmap.c
> +++ b/util/hbitmap.c
> @@ -668,7 +668,7 @@ void hbitmap_truncate(HBitmap *hb, uint64_t size)
>          }
>          old =3D hb->sizes[i];
>          hb->sizes[i] =3D size;
> -        hb->levels[i] =3D g_realloc(hb->levels[i], size * sizeof(unsig=
ned long));
> +        hb->levels[i] =3D g_renew(unsigned long, hb->levels[i], size);
>          if (!shrink) {
>              memset(&hb->levels[i][old], 0x00,
>                     (size - old) * sizeof(*hb->levels[i]));
>=20

Hm, I guess g_renew() isn't a new addition to glib, and we can safely
use it.

Reviewed-by: John Snow <jsnow@redhat.com>

And for convenience, this can be staged by whomever wishes to stage the
whole 88 patch enchilada:

Acked-by: John Snow <jsnow@redhat.com>

