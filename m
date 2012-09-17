Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TDZwX-0002F5-Up
	for mharc-qemu-trivial@gnu.org; Mon, 17 Sep 2012 07:56:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TDZwQ-0001uA-TE
	for qemu-trivial@nongnu.org; Mon, 17 Sep 2012 07:56:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TDZwL-0006QD-3p
	for qemu-trivial@nongnu.org; Mon, 17 Sep 2012 07:56:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:7029)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1TDZwF-0006Oi-KO; Mon, 17 Sep 2012 07:56:31 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q8HBuTNY006511
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 17 Sep 2012 07:56:30 -0400
Received: from blackfin.pond.sub.org (ovpn-116-55.ams2.redhat.com
	[10.36.116.55])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q8HBuSL0004628; Mon, 17 Sep 2012 07:56:29 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id F403820069; Mon, 17 Sep 2012 13:56:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
References: <1347873003-11593-1-git-send-email-lersek@redhat.com>
Date: Mon, 17 Sep 2012 13:56:27 +0200
In-Reply-To: <1347873003-11593-1-git-send-email-lersek@redhat.com> (Laszlo
	Ersek's message of "Mon, 17 Sep 2012 11:10:03 +0200")
Message-ID: <87k3vsoob8.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] TextConsole: saturate
	escape parameter in TTY_STATE_CSI
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
X-List-Received-Date: Mon, 17 Sep 2012 11:56:48 -0000

Laszlo Ersek <lersek@redhat.com> writes:

> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> ---
>  Build tested.
>  console.c |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/console.c b/console.c
> index c1ed5e0..67080f4 100644
> --- a/console.c
> +++ b/console.c
> @@ -938,8 +938,11 @@ static void console_putchar(TextConsole *s, int ch)
>      case TTY_STATE_CSI: /* handle escape sequence parameters */
>          if (ch >= '0' && ch <= '9') {
>              if (s->nb_esc_params < MAX_ESC_PARAMS) {
> -                s->esc_params[s->nb_esc_params] =
> -                    s->esc_params[s->nb_esc_params] * 10 + ch - '0';
> +                int *param = &s->esc_params[s->nb_esc_params];
> +                int digit = (ch - '0');
> +
> +                *param = (*param <= (INT_MAX - digit) / 10) ?
> +                         *param * 10 + digit : INT_MAX;
>              }
>          } else {
>              if (s->nb_esc_params < MAX_ESC_PARAMS)

Before this patch, silent integer overflow.  Exact behavior depends on
hosts int type.  For instance, \e[4294967296 is the same as \e[0 with 32
bit int, but with 64 bit int.

What does a real vt100 do?  I don't have one anymore.  For what it's
worth, both xterm and Xfce Terminal appear to saturate at some "big"
number ("big" compared to the argument values that are actually useful;
INT_MAX should do fine).  In particular, \e[4294967296 does *not* behave
like \e[0.

Therefore, changing QEMU to saturate makes sense.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

