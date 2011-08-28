Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QxdIx-0007Ru-O8
	for mharc-qemu-trivial@gnu.org; Sun, 28 Aug 2011 07:13:31 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QxdIu-0007K2-Eu
	for qemu-trivial@nongnu.org; Sun, 28 Aug 2011 07:13:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QxdIt-0007Gk-OD
	for qemu-trivial@nongnu.org; Sun, 28 Aug 2011 07:13:28 -0400
Received: from fmmailgate01.web.de ([217.72.192.221]:36033)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1QxdIq-0007Fu-UP; Sun, 28 Aug 2011 07:13:25 -0400
Received: from smtp04.web.de  ( [172.20.0.225])
	by fmmailgate01.web.de (Postfix) with ESMTP id D2031195D0C7D;
	Sun, 28 Aug 2011 13:13:17 +0200 (CEST)
Received: from [84.148.54.226] (helo=[10.0.1.1])
	by smtp04.web.de with asmtp (TLSv1:AES128-SHA:128) (WEB.DE 4.110 #2)
	id 1QxdIj-0005eN-00; Sun, 28 Aug 2011 13:13:17 +0200
Message-Id: <E4C4E340-4777-48DD-B5B8-7FF18E9559A1@web.de>
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
To: Stefan Weil <weil@mail.berlios.de>
In-Reply-To: <1311188196-2867-1-git-send-email-weil@mail.berlios.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed; delsp=yes
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Apple Message framework v936)
Date: Sun, 28 Aug 2011 13:13:16 +0200
References: <1311188196-2867-1-git-send-email-weil@mail.berlios.de>
X-Mailer: Apple Mail (2.936)
Sender: andreas.faerber@web.de
X-Sender: Andreas.Faerber@web.de
X-Provags-ID: V01U2FsdGVkX19tWwJw0RqZnbQfDM+lp7epesB2qa1ZATjd7ROZ
	lyaLhVfQeUJ7WMmRQiCKvdYWqv8EaJOOoxGunkuir/i5mH7Ymg
	dPW6hIm6kh8Hjc7QBQJQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.221
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sh4: Fix potential crash in
	debug code
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
X-List-Received-Date: Sun, 28 Aug 2011 11:13:29 -0000

Am 20.07.2011 um 20:56 schrieb Stefan Weil:

> cppcheck reports this error:
>
> qemu/hw/sh_intc.c:390: error: Possible null pointer dereference:
> s - otherwise it is redundant to check if s is null at line 385
>
> If s were NULL, the printf() statement would crash.
> Setting braces fixes this bug.
>
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>

Apart from the stated addition of brackets, this reindents the =20
bracketed block, replacing tabs with spaces.
Reindenting further code or introducing a trace point is beyond the =20
scope of a trivial bugfix, so patch looks fine to me.

Reviewed-by: Andreas F=E4rber <andreas.faerber@web.de>

Andreas

> ---
> hw/sh_intc.c |    9 +++++----
> 1 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/hw/sh_intc.c b/hw/sh_intc.c
> index 0734da9..f73a4b0 100644
> --- a/hw/sh_intc.c
> +++ b/hw/sh_intc.c
> @@ -382,13 +382,14 @@ void sh_intc_register_sources(struct intc_desc =20=

> *desc,
>
> 	sh_intc_register_source(desc, vect->enum_id, groups, nr_groups);
> 	s =3D sh_intc_source(desc, vect->enum_id);
> -	if (s)
> -	    s->vect =3D vect->vect;
> +        if (s) {
> +            s->vect =3D vect->vect;
>
> #ifdef DEBUG_INTC_SOURCES
> -	printf("sh_intc: registered source %d -> 0x%04x (%d/%d)\n",
> -	       vect->enum_id, s->vect, s->enable_count, s->enable_max);
> +            printf("sh_intc: registered source %d -> 0x%04x (%d/%d)=20=

> \n",
> +                   vect->enum_id, s->vect, s->enable_count, s-=20
> >enable_max);
> #endif
> +        }
>     }
>
>     if (groups) {
> --=20
> 1.7.2.5


