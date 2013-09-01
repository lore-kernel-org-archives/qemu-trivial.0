Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VG9VS-0004ZF-M7
	for mharc-qemu-trivial@gnu.org; Sun, 01 Sep 2013 11:24:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9VL-0004PD-SF
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:24:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9VG-0007Z3-Vv
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:23:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54238)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VG9V6-0007UD-PK; Sun, 01 Sep 2013 11:23:40 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id F00CC400BA;
	Sun,  1 Sep 2013 19:23:39 +0400 (MSK)
Message-ID: <52235BFB.1060506@msgid.tls.msk.ru>
Date: Sun, 01 Sep 2013 19:23:39 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Jan Krupa <JKrupa@suse.com>
References: <1377616488-16491-1-git-send-email-JKrupa@suse.com>
	<1377616488-16491-2-git-send-email-JKrupa@suse.com>
	<1377616488-16491-3-git-send-email-JKrupa@suse.com>
	<1377616488-16491-4-git-send-email-JKrupa@suse.com>
In-Reply-To: <1377616488-16491-4-git-send-email-JKrupa@suse.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, anthony@codemonkey.ws
Subject: Re: [Qemu-trivial] [PATCH 3/3] qemu-char: add support for
 U-prefixed symbols
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
X-List-Received-Date: Sun, 01 Sep 2013 15:24:00 -0000

27.08.2013 19:14, Jan Krupa wrote:
> This patch adds support for Unicode symbols in keymap files. This
> feature was already used in some keyboard layouts in QEMU generated
> from XKB (e.g. Arabic) but it wasn't implemented in QEMU source code.
>
> Signed-off-by: Jan Krupa <jkrupa@suse.com>
> ---
>   ui/keymaps.c |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/ui/keymaps.c b/ui/keymaps.c
> index f373cc5..426a893 100644
> --- a/ui/keymaps.c
> +++ b/ui/keymaps.c
> @@ -33,6 +33,9 @@ static int get_keysym(const name2keysym_t *table,
>           if (!strcmp(p->name, name))
>               return p->keysym;
>       }
> +    if (strlen(name) == 5 && name[0] == 'U') {
> +        return (int)strtol(name + 1, NULL, 16);
> +    }

How about something like

   if (sscanf(name, "U%04x", &temp) == 1)

instead, to ensure it actually is a valid hex number?
Because this code will behave in interesting way
given, eg, "U" or "UU"... ;)  But I don't think this
really matters much...

Thanks,

