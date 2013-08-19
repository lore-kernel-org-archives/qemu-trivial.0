Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VBQEB-0001mg-Jb
	for mharc-qemu-trivial@gnu.org; Mon, 19 Aug 2013 10:14:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1VBQE5-0001e5-7A
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 10:14:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1VBQDz-00080g-Hw
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 10:14:32 -0400
Received: from cantor2.suse.de ([195.135.220.15]:36076 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1VBQDm-0007y5-6t; Mon, 19 Aug 2013 10:14:14 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 5D9E6A5530;
	Mon, 19 Aug 2013 16:14:13 +0200 (CEST)
Message-ID: <52122832.9000501@suse.de>
Date: Mon, 19 Aug 2013 16:14:10 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Fabien Chouteau <chouteau@adacore.com>
References: <1375447708-14545-1-git-send-email-chouteau@adacore.com>
In-Reply-To: <1375447708-14545-1-git-send-email-chouteau@adacore.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] Improve Monitor disas
	with symbol lookup
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
X-List-Received-Date: Mon, 19 Aug 2013 14:14:38 -0000

Am 02.08.2013 14:48, schrieb Fabien Chouteau:
> Part of M731-018.
>=20
> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
> ---
>  disas.c |   16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/disas.c b/disas.c
> index 71007fb..3ffb3ae 100644
> --- a/disas.c
> +++ b/disas.c
> @@ -480,11 +480,19 @@ void monitor_disas(Monitor *mon, CPUArchState *en=
v,
>  #endif
> =20
>      for(i =3D 0; i < nb_insn; i++) {
> -	monitor_printf(mon, "0x" TARGET_FMT_lx ":  ", pc);
> +        const char *sym =3D lookup_symbol(pc);
> +
> +        monitor_printf(mon, "0x" TARGET_FMT_lx " ", pc);
> +        if (sym[0] !=3D '\0') {
> +            monitor_printf(mon, "<%s>:  ", sym);
> +        } else {
> +            monitor_printf(mon, ":  ");
> +        }

Independent of PMM's comment, I think you meant

+        monitor_printf(mon, "0x" TARGET_FMT_lx, pc);
+        if (sym[0] !=3D '\0') {
+            monitor_printf(mon, " <%s>:  ", sym);
+        } else {
+            monitor_printf(mon, ":  ");
+        }

to keep the output unchanged.

Could you please put the tab fixing into a preceding patch for
readability and prepend a cover letter?

Regards,
Andreas

>          count =3D print_insn(pc, &s.info);
> -	monitor_printf(mon, "\n");
> -	if (count < 0)
> -	    break;
> +        monitor_printf(mon, "\n");
> +        if (count < 0) {
> +            break;
> +        }
>          pc +=3D count;
>      }
>  }
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

