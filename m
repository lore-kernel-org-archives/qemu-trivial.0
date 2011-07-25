Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlGWt-0003Qo-GF
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2011 04:28:47 -0400
Received: from eggs.gnu.org ([140.186.70.92]:42426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geleman@gmail.com>) id 1QlGWr-0003I4-Au
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 04:28:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geleman@gmail.com>) id 1QlGWq-00073Q-DN
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 04:28:45 -0400
Received: from mail-gy0-f173.google.com ([209.85.160.173]:52198)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geleman@gmail.com>)
	id 1QlGWo-000735-D4; Mon, 25 Jul 2011 04:28:42 -0400
Received: by gyg8 with SMTP id 8so326722gyg.4
	for <multiple recipients>; Mon, 25 Jul 2011 01:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=FVGBTOsH0x50+uF1VR8RALnjbaauJliThw5y4yWFC8A=;
	b=PJWlDzCwP0j0i61V+nCXuT4YMGW83E1AQxXBqkuAY1SsgViZgsW+9aPyXsRqA/w2Em
	Ekq4xiwE1LNqOQ+BRGplGsDCZhGKxINnisL0OPrSsLvvp+BxrCZJS+vBI7tujreF4Ffj
	BzM3/RGwXrer0m+LS59FNeye4E2o7OvBQlNMI=
MIME-Version: 1.0
Received: by 10.147.142.8 with SMTP id u8mr3009306yan.37.1311582521747; Mon,
	25 Jul 2011 01:28:41 -0700 (PDT)
Received: by 10.147.169.5 with HTTP; Mon, 25 Jul 2011 01:28:41 -0700 (PDT)
In-Reply-To: <1311581791-923-1-git-send-email-geleman@gmail.com>
References: <1311581791-923-1-git-send-email-geleman@gmail.com>
Date: Mon, 25 Jul 2011 16:28:41 +0800
Message-ID: <CAETRQWkO6=hFPtZALNES3_Cu-ZoK9vKzs0GybztaXPLWM4zPYQ@mail.gmail.com>
From: TeLeMan <geleman@gmail.com>
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.160.173
Cc: qemu-trivial@nongnu.org, TeLeMan <geleman@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] qemu-char: fix the commit "qemu-char:
 Print strerror message on failure"
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
X-List-Received-Date: Mon, 25 Jul 2011 08:28:46 -0000

Oh, Blue Swirl did it, please ignore this.
--
SUN OF A BEACH



On Mon, Jul 25, 2011 at 16:16, TeLeMan <geleman@gmail.com> wrote:
> The commit 6e1db57b2ac9025c2443c665a0d9e78748637b26 missed patching qemu_=
chr_open_win_file().
>
> Signed-off-by: TeLeMan <geleman@gmail.com>
> ---
> =C2=A0qemu-char.c | =C2=A0 =C2=A08 +++++---
> =C2=A01 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/qemu-char.c b/qemu-char.c
> index dcf7065..ea7abfe 100644
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -1782,7 +1782,7 @@ static int qemu_chr_open_win_pipe(QemuOpts *opts, C=
harDriverState **_chr)
> =C2=A0 =C2=A0 return 0;
> =C2=A0}
>
> -static CharDriverState *qemu_chr_open_win_file(HANDLE fd_out)
> +static int qemu_chr_open_win_file(HANDLE fd_out, CharDriverState **_chr)
> =C2=A0{
> =C2=A0 =C2=A0 CharDriverState *chr;
> =C2=A0 =C2=A0 WinCharState *s;
> @@ -1793,12 +1793,14 @@ static CharDriverState *qemu_chr_open_win_file(HA=
NDLE fd_out)
> =C2=A0 =C2=A0 chr->opaque =3D s;
> =C2=A0 =C2=A0 chr->chr_write =3D win_chr_write;
> =C2=A0 =C2=A0 qemu_chr_generic_open(chr);
> - =C2=A0 =C2=A0return chr;
> +
> + =C2=A0 =C2=A0*_chr =3D chr;
> + =C2=A0 =C2=A0return 0;
> =C2=A0}
>
> =C2=A0static int qemu_chr_open_win_con(QemuOpts *opts, CharDriverState **=
_chr)
> =C2=A0{
> - =C2=A0 =C2=A0return qemu_chr_open_win_file(GetStdHandle(STD_OUTPUT_HAND=
LE), chr);
> + =C2=A0 =C2=A0return qemu_chr_open_win_file(GetStdHandle(STD_OUTPUT_HAND=
LE), _chr);
> =C2=A0}
>
> =C2=A0static int qemu_chr_open_win_file_out(QemuOpts *opts, CharDriverSta=
te **_chr)
> --
> 1.7.3.1.msysgit.0
>
>

