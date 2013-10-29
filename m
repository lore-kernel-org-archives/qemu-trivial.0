Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vb1j6-0002gV-DR
	for mharc-qemu-trivial@gnu.org; Tue, 29 Oct 2013 01:20:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Vb1iy-0002Wq-T6
	for qemu-trivial@nongnu.org; Tue, 29 Oct 2013 01:20:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Vb1it-0001QT-8t
	for qemu-trivial@nongnu.org; Tue, 29 Oct 2013 01:20:16 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=58547
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Vb1ih-0000ov-Ro; Tue, 29 Oct 2013 01:19:59 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	E205B72801A2; Tue, 29 Oct 2013 06:19:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id iSolX6XDvEmB; Tue, 29 Oct 2013 06:19:47 +0100 (CET)
Received: from [192.168.178.35] (p54ADA977.dip0.t-ipconnect.de
	[84.173.169.119])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	06AB1728019C; Tue, 29 Oct 2013 06:19:46 +0100 (CET)
Message-ID: <526F4571.7080807@weilnetz.de>
Date: Tue, 29 Oct 2013 06:19:45 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Antony Pavlov <antonynpavlov@gmail.com>, 
	Anthony Liguori <aliguori@amazon.com>
References: <1383021391-3152-1-git-send-email-antonynpavlov@gmail.com>
In-Reply-To: <1383021391-3152-1-git-send-email-antonynpavlov@gmail.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl: fix build when
 configured with no graphic support
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
X-List-Received-Date: Tue, 29 Oct 2013 05:20:22 -0000

Am 29.10.2013 05:36, schrieb Antony Pavlov:
> The following error occurs when building no graphic output support:
>
>   vl.c: In function =E2=80=98main=E2=80=99:
>   vl.c:2829:19: error: variable =E2=80=98ds=E2=80=99 set but not used [=
-Werror=3Dunused-but-set-variable]
>        DisplayState *ds;
>                      ^
>   cc1: all warnings being treated as errors
>
> To reproduce this issue, just run:
>
>   $ ./configure \
>       --disable-curses \
>       --disable-sdl \
>       --disable-cocoa \
>       --disable-gtk \
>       --disable-vnc \
>       --enable-werror
>   $ make vl.o
>
> Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> ---
>  vl.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/vl.c b/vl.c
> index b42ac67..8fbf25e 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4269,6 +4269,7 @@ int main(int argc, char **argv, char **envp)
>      /* init local displays */
>      switch (display_type) {
>      case DT_NOGRAPHIC:
> +        (void)ds;
>          break;
>  #if defined(CONFIG_CURSES)
>      case DT_CURSES:

Reviewed-by: Stefan Weil <sw@weilnetz.de>


