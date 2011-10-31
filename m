Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RKlLo-0003TH-76
	for mharc-qemu-trivial@gnu.org; Mon, 31 Oct 2011 02:28:04 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RKlLk-0003EK-5z
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2011 02:28:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RKlLi-0001h0-Nf
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2011 02:27:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46852)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1RKlLf-0001g5-U9; Mon, 31 Oct 2011 02:27:56 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9V6RsOT004445
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 31 Oct 2011 02:27:54 -0400
Received: from blackfin.pond.sub.org (ovpn-116-20.ams2.redhat.com
	[10.36.116.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9V6RrR4007926; Mon, 31 Oct 2011 02:27:53 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id A0BE66006D; Mon, 31 Oct 2011 07:27:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Pavel Borzenkov <pavel.borzenkov@gmail.com>
References: <1319838533-25405-1-git-send-email-pavel.borzenkov@gmail.com>
Date: Mon, 31 Oct 2011 07:27:52 +0100
In-Reply-To: <1319838533-25405-1-git-send-email-pavel.borzenkov@gmail.com>
	(Pavel Borzenkov's message of "Sat, 29 Oct 2011 01:48:53 +0400")
Message-ID: <m3pqhdn09j.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] cmd: Fix potential NULL
	pointer dereference
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
X-List-Received-Date: Mon, 31 Oct 2011 06:28:01 -0000

Pavel Borzenkov <pavel.borzenkov@gmail.com> writes:

> Signed-off-by: Pavel Borzenkov <pavel.borzenkov@gmail.com>
> ---
> Note, that almost all code in the file violates CODING STYLE. The changed lines
> are written wrt CODING STYLE (like commits 7d7d975c and c32d766a).
>
> ---
>
>  cmd.c |   11 +++--------
>  1 files changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/cmd.c b/cmd.c
> index f77897e..abcf206 100644
> --- a/cmd.c
> +++ b/cmd.c
> @@ -49,7 +49,7 @@ void
>  add_command(
>  	const cmdinfo_t	*ci)
>  {
> -	cmdtab = realloc((void *)cmdtab, ++ncmds * sizeof(*cmdtab));
> +    cmdtab = g_realloc((void *)cmdtab, ++ncmds * sizeof(*cmdtab));
>  	cmdtab[ncmds - 1] = *ci;
>  	qsort(cmdtab, ncmds, sizeof(*cmdtab), compare);
>  }

Inconsistent indentation.

Either stick to the original indentation, or reindent the whole
function.

[More of the same...]

