Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RbxZy-0006kE-JK
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2011 11:57:46 -0500
Received: from eggs.gnu.org ([140.186.70.92]:50092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RbxZv-0006XW-6j
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 11:57:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RbxZu-0001UB-68
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 11:57:43 -0500
Received: from mail-qw0-f45.google.com ([209.85.216.45]:60434)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1RbxZs-0001TN-0e; Sat, 17 Dec 2011 11:57:40 -0500
Received: by qadc10 with SMTP id c10so1513503qad.4
	for <multiple recipients>; Sat, 17 Dec 2011 08:57:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.219.144 with SMTP id hu16mr17416360qab.53.1324141059218;
	Sat, 17 Dec 2011 08:57:39 -0800 (PST)
Received: by 10.229.211.4 with HTTP; Sat, 17 Dec 2011 08:57:39 -0800 (PST)
In-Reply-To: <1324140362-12636-1-git-send-email-sw@weilnetz.de>
References: <1324110459-3932-4-git-send-email-sw@weilnetz.de>
	<1324140362-12636-1-git-send-email-sw@weilnetz.de>
Date: Sat, 17 Dec 2011 16:57:39 +0000
Message-ID: <CAFEAcA-4HwEoQowSEiyLBStjOgMkJa7uu3oSewywLfD=D-LhLg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 03/11] configure: Fix
 compiler warning in config.log (integer from pointer)
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
X-List-Received-Date: Sat, 17 Dec 2011 16:57:44 -0000

On 17 December 2011 16:46, Stefan Weil <sw@weilnetz.de> wrote:
> warning: return makes integer from pointer without a cast
>
> v2: Removed type cast.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

> ---
> =C2=A0configure | =C2=A0 =C2=A06 +++++-
> =C2=A01 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/configure b/configure
> index 93c6cbe..773df6a 100755
> --- a/configure
> +++ b/configure
> @@ -1841,7 +1841,11 @@ if test "$curses" !=3D "no" ; then
> =C2=A0#ifdef __OpenBSD__
> =C2=A0#define resize_term resizeterm
> =C2=A0#endif
> -int main(void) { resize_term(0, 0); return curses_version(); }
> +int main(void) {
> + =C2=A0const char *s =3D curses_version();
> + =C2=A0resize_term(0, 0);
> + =C2=A0return s !=3D 0;
> +}
> =C2=A0EOF
> =C2=A0 for curses_lib in $curses_list; do
> =C2=A0 =C2=A0 if compile_prog "" "$curses_lib" ; then
> --
> 1.7.2.5
>
>



--=20
123456789012345678901234567890123456789012345678901234567890123456789012345=
67890
=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 3 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 8

