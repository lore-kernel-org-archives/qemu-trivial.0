Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WR7Mx-0007Wb-KJ
	for mharc-qemu-trivial@gnu.org; Fri, 21 Mar 2014 17:52:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WR7Mq-0007Oe-Qj
	for qemu-trivial@nongnu.org; Fri, 21 Mar 2014 17:52:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WR7Mk-0006IF-Pt
	for qemu-trivial@nongnu.org; Fri, 21 Mar 2014 17:52:44 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:60463)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1WR7MY-0006Fj-KW; Fri, 21 Mar 2014 17:52:26 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	C51611182EB7; Fri, 21 Mar 2014 22:52:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id fipsR2DNQ-_V; Fri, 21 Mar 2014 22:52:13 +0100 (CET)
Received: from [192.168.178.35] (p54AD831B.dip0.t-ipconnect.de [84.173.131.27])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	31AB11182EB3; Fri, 21 Mar 2014 22:52:13 +0100 (CET)
Message-ID: <532CB48B.6070404@weilnetz.de>
Date: Fri, 21 Mar 2014 22:52:11 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
References: <1395437377-5779-1-git-send-email-rjones@redhat.com>
In-Reply-To: <1395437377-5779-1-git-send-email-rjones@redhat.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, samuel.thibault@gnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] backends/baum.c: Fix
 compilation when SDL is not available.
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
X-List-Received-Date: Fri, 21 Mar 2014 21:52:50 -0000

Am 21.03.2014 22:29, schrieb Richard W.M. Jones:
> backends/baum.c: In function =E2=80=98chr_baum_init=E2=80=99:
> backends/baum.c:569:64: error: missing binary operator before token "("
>  #if defined(CONFIG_SDL) && SDL_COMPILEDVERSION < SDL_VERSIONNUM(2, 0, =
0)
>                                                                 ^
> backends/baum.c:598:64: error: missing binary operator before token "("
>  #if defined(CONFIG_SDL) && SDL_COMPILEDVERSION < SDL_VERSIONNUM(2, 0, =
0)
>=20
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  backends/baum.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/backends/baum.c b/backends/baum.c
> index 665107f..759003f 100644
> --- a/backends/baum.c
> +++ b/backends/baum.c
> @@ -566,9 +566,11 @@ CharDriverState *chr_baum_init(void)
>      BaumDriverState *baum;
>      CharDriverState *chr;
>      brlapi_handle_t *handle;
> -#if defined(CONFIG_SDL) && SDL_COMPILEDVERSION < SDL_VERSIONNUM(2, 0, =
0)
> +#if defined(CONFIG_SDL)
> +#if SDL_COMPILEDVERSION < SDL_VERSIONNUM(2, 0, 0)
>      SDL_SysWMinfo info;
>  #endif
> +#endif
>      int tty;
> =20
>      baum =3D g_malloc0(sizeof(BaumDriverState));
> @@ -595,13 +597,15 @@ CharDriverState *chr_baum_init(void)
>          goto fail;
>      }
> =20
> -#if defined(CONFIG_SDL) && SDL_COMPILEDVERSION < SDL_VERSIONNUM(2, 0, =
0)
> +#if defined(CONFIG_SDL)
> +#if SDL_COMPILEDVERSION < SDL_VERSIONNUM(2, 0, 0)
>      memset(&info, 0, sizeof(info));
>      SDL_VERSION(&info.version);
>      if (SDL_GetWMInfo(&info))
>          tty =3D info.info.x11.wmwindow;
>      else
>  #endif
> +#endif
>          tty =3D BRLAPI_TTY_DEFAULT;
> =20
>      if (brlapi__enterTtyMode(handle, tty, NULL) =3D=3D -1) {
>=20

Reviewed-by: Stefan Weil <sw@weilnetz.de>


