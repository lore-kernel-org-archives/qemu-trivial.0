Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vi70L-0005ld-A8
	for mharc-qemu-trivial@gnu.org; Sun, 17 Nov 2013 13:23:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Vi70E-0005b4-Eh
	for qemu-trivial@nongnu.org; Sun, 17 Nov 2013 13:23:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Vi709-0007vK-6C
	for qemu-trivial@nongnu.org; Sun, 17 Nov 2013 13:23:22 -0500
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:35316)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Vi6zy-0007tl-3x; Sun, 17 Nov 2013 13:23:06 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	A5EDA728008A; Sun, 17 Nov 2013 19:23:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Ul6EBLudHltM; Sun, 17 Nov 2013 19:23:02 +0100 (CET)
Received: from [192.168.178.35] (p54AD858D.dip0.t-ipconnect.de
	[84.173.133.141])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	96E967280089; Sun, 17 Nov 2013 19:23:02 +0100 (CET)
Message-ID: <52890987.3020701@weilnetz.de>
Date: Sun, 17 Nov 2013 19:23:03 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Anthony Liguori <aliguori@amazon.com>
References: <1384711267-9032-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1384711267-9032-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH for 1.7] qga: Fix compiler warnings
 (missing gnu_printf format attribute, wrong format string)
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
X-List-Received-Date: Sun, 17 Nov 2013 18:23:27 -0000

This patch is superseded by a new one.

v2 fixes three more format strings and is needed for 32 bit hosts.

Stefan


Am 17.11.2013 19:01, schrieb Stefan Weil:
> gcc 4.8.2 reports this warning when extra warnings are enabled (-Wextra=
):
>
>   CC    qga/commands.o
> qga/commands.c: In function =E2=80=98slog=E2=80=99:
> qga/commands.c:28:5: error:
>  function might be possible candidate for =E2=80=98gnu_printf=E2=80=99 =
format attribute [-Werror=3Dsuggest-attribute=3Dformat]
>      g_logv("syslog", G_LOG_LEVEL_INFO, fmt, ap);
>      ^
>
> gcc 4.8.2 reports this warning when slog is declared with the
> gnu_printf format attribute:
>
> qga/commands-posix.c: In function =E2=80=98qmp_guest_file_open=E2=80=99=
:
> qga/commands-posix.c:404:5: warning:
>  format =E2=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=
=99, but argument 2 has type =E2=80=98int64_t=E2=80=99 [-Wformat=3D]
>      slog("guest-file-open, handle: %d", handle);
>      ^
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> Note: checkpatch.pl wrongly reports an error.
>
>  qga/commands-posix.c   |    2 +-
>  qga/guest-agent-core.h |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>


