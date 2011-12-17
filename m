Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RbsRx-0001oU-KB
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2011 06:29:09 -0500
Received: from eggs.gnu.org ([140.186.70.92]:49974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RbsRu-0001cf-KI
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 06:29:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RbsRt-0004LI-S3
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 06:29:06 -0500
Received: from mail-qy0-f173.google.com ([209.85.216.173]:32956)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1RbsRr-0004J1-87; Sat, 17 Dec 2011 06:29:03 -0500
Received: by qcsd15 with SMTP id d15so2472415qcs.4
	for <multiple recipients>; Sat, 17 Dec 2011 03:29:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.69.68 with SMTP id y4mr2974984qci.5.1324121341976; Sat, 17
	Dec 2011 03:29:01 -0800 (PST)
Received: by 10.229.211.4 with HTTP; Sat, 17 Dec 2011 03:29:01 -0800 (PST)
In-Reply-To: <1324110459-3932-4-git-send-email-sw@weilnetz.de>
References: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
	<1324110459-3932-4-git-send-email-sw@weilnetz.de>
Date: Sat, 17 Dec 2011 11:29:01 +0000
Message-ID: <CAFEAcA8MY3zc7xLD_PosE_fHnOL+jn54wX7TAS8MxE=4vVa+Bw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 03/11] configure: Fix
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
X-List-Received-Date: Sat, 17 Dec 2011 11:29:07 -0000

On 17 December 2011 08:27, Stefan Weil <sw@weilnetz.de> wrote:
> warning: return makes integer from pointer without a cast
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> =C2=A0configure | =C2=A0 =C2=A06 +++++-
> =C2=A01 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/configure b/configure
> index 93c6cbe..8dee237 100755
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
> + =C2=A0return s !=3D (const char *)0;

You don't need this cast, I think.

> +}
> =C2=A0EOF
> =C2=A0 for curses_lib in $curses_list; do
> =C2=A0 =C2=A0 if compile_prog "" "$curses_lib" ; then
> --
> 1.7.2.5

-- PMM

