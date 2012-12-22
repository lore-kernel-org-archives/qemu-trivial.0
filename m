Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TmREY-0006Ym-VG
	for mharc-qemu-trivial@gnu.org; Sat, 22 Dec 2012 10:43:30 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TmRET-0006HX-4k
	for qemu-trivial@nongnu.org; Sat, 22 Dec 2012 10:43:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TmREQ-0001G3-8t
	for qemu-trivial@nongnu.org; Sat, 22 Dec 2012 10:43:25 -0500
Received: from mail-pb0-f50.google.com ([209.85.160.50]:45041)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TmREC-0001Cj-CF; Sat, 22 Dec 2012 10:43:08 -0500
Received: by mail-pb0-f50.google.com with SMTP id wz7so3301952pbc.23
	for <multiple recipients>; Sat, 22 Dec 2012 07:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=DcboKmyY+WVBRsa4dn9i0psFLB4nQfaI+AuDAN7KJ5k=;
	b=Z70UvjxkUBYM7/iw487tBANAigdf+HJIUyBk9eAY8VI7lAEXfGSGncO1ns7CH98g8h
	R0IkupYDjVfj0APasdYQXLNvjQz+cekSe0OWfHS0J0KHXdvu6TPJQPGDxJ7JQ4HT1uJo
	tWBVEazPKAgFaFvTc1WMp0J/ICgMaSzImJkvahucD1ICa5dOzaY0CDcVVUQ8s2NNSRrN
	D98ddG5s9Gr4yydN4v5QiRJMCOLikzsMwKoDbenwWZg0D/hcqUpvkVyHSinaw9wlrrrr
	O8Ou6Cie3vZA2Yktfndqq3Q0x4u+dOfRlk/0dSZb9SyzvGzOHHWHzyM7w8ikmZ9/FUUQ
	DRGg==
Received: by 10.68.239.232 with SMTP id vv8mr50080357pbc.53.1356190987475;
	Sat, 22 Dec 2012 07:43:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.68.49.101 with HTTP; Sat, 22 Dec 2012 07:42:46 -0800 (PST)
In-Reply-To: <1356041393-13853-1-git-send-email-sw@weilnetz.de>
References: <1356041393-13853-1-git-send-email-sw@weilnetz.de>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sat, 22 Dec 2012 15:42:46 +0000
Message-ID: <CAAu8pHvFGKi3PwpT6pwjRZqVUBuO5oVqzNw6v1AGB6siJJj7SQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.160.50
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net: Add missing include
 statement (fix compiler warnings for MinGW)
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
X-List-Received-Date: Sat, 22 Dec 2012 15:43:29 -0000

Thanks, applied.

On Thu, Dec 20, 2012 at 10:09 PM, Stefan Weil <sw@weilnetz.de> wrote:
> These and some more compiler warnings were caused by a recent commit:
>
> net/tap-win32.c:724: warning: no previous prototype for =E2=80=98tap_has_=
ufo=E2=80=99
> net/tap-win32.c:729: warning: no previous prototype for =E2=80=98tap_has_=
vnet_hdr=E2=80=99
> ...
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  net/tap-win32.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/net/tap-win32.c b/net/tap-win32.c
> index 0c63cbd..265369c 100644
> --- a/net/tap-win32.c
> +++ b/net/tap-win32.c
> @@ -31,6 +31,7 @@
>  #include "qemu-common.h"
>  #include "clients.h"            /* net_init_tap */
>  #include "net/net.h"
> +#include "net/tap.h"            /* tap_has_ufo, ... */
>  #include "sysemu/sysemu.h"
>  #include "qemu/error-report.h"
>  #include <stdio.h>
> --
> 1.7.10.4
>
>

