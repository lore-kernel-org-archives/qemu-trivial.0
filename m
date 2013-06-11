Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmNqq-0007z4-AR
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 08:39:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40838)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmNqn-0007rT-6U
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 08:39:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmNql-0005B4-RF
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 08:39:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45219)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UmNqg-00059k-RC; Tue, 11 Jun 2013 08:38:54 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 331CA41266;
	Tue, 11 Jun 2013 16:38:53 +0400 (MSK)
Message-ID: <51B71A5B.7040001@msgid.tls.msk.ru>
Date: Tue, 11 Jun 2013 16:38:51 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1370780536-28150-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1370780536-28150-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] audio: Replace macro GCC_ATTR by
 GCC_FMT_ATTR and use inline functions
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
X-List-Received-Date: Tue, 11 Jun 2013 12:39:03 -0000

[Removing malc's email since it bounces]
09.06.2013 16:22, Stefan Weil wrote:
> GCC_ATTR was only used in audio_int.h, so it is now unused and
> the definition can be removed from compiler.h.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  audio/audio_int.h       |    8 +++-----
>  include/qemu/compiler.h |    3 ---
>  2 files changed, 3 insertions(+), 8 deletions(-)
>=20
> diff --git a/audio/audio_int.h b/audio/audio_int.h
> index b9b0676..5a6284b 100644
> --- a/audio/audio_int.h
> +++ b/audio/audio_int.h
> @@ -243,7 +243,7 @@ static inline int audio_ring_dist (int dst, int src=
, int len)
>      return (dst >=3D src) ? (dst - src) : (len - src + dst);
>  }
> =20
> -static void GCC_ATTR dolog (const char *fmt, ...)
> +static inline void GCC_FMT_ATTR(1, 2) dolog (const char *fmt, ...)

This change (adding `inline') causes build failure with at least with gcc=
-4.7:

audio/wavaudio.c: In function =91dolog=92:
audio/audio_int.h:246:100: error: function =91dolog=92 can never be inlin=
ed because it uses variable argument lists

$ gcc --version
gcc (Debian 4.7.2-5) 4.7.2

I think the addition of inline should be dropped here and in other
similar places (the rest is ok).

I can do that myself if you want.

Alternatively these functions can be turned into varargs #defines.

Thanks,

/mjt

