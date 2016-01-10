Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIK8x-0002y7-SU
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jan 2016 12:51:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIK8w-0002uv-7k
	for qemu-trivial@nongnu.org; Sun, 10 Jan 2016 12:51:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIK8v-0002s3-9w
	for qemu-trivial@nongnu.org; Sun, 10 Jan 2016 12:51:06 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:59202)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIK8p-0002qy-BJ; Sun, 10 Jan 2016 12:50:59 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E14B64035B;
	Sun, 10 Jan 2016 20:50:59 +0300 (MSK)
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <1450433172-1175-1-git-send-email-marcandre.lureau@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56929A02.2080509@msgid.tls.msk.ru>
Date: Sun, 10 Jan 2016 20:50:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1450433172-1175-1-git-send-email-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] misc: spelling
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
X-List-Received-Date: Sun, 10 Jan 2016 17:51:07 -0000

18.12.2015 13:06, marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

This patch does not have a required Signed-off-By tag, sorry.

Thanks,

/mjt

> ---
>  monitor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/monitor.c b/monitor.c
> index e7e7ae2..51ec4c3 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -311,7 +311,7 @@ static void monitor_flush_locked(Monitor *mon)
>              return;
>          }
>          if (rc > 0) {
> -            /* partinal write */
> +            /* partial write */
>              QString *tmp =3D qstring_from_str(buf + rc);
>              QDECREF(mon->outbuf);
>              mon->outbuf =3D tmp;
>=20


