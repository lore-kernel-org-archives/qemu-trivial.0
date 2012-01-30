Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rrr2b-000415-QF
	for mharc-qemu-trivial@gnu.org; Mon, 30 Jan 2012 08:13:01 -0500
Received: from eggs.gnu.org ([140.186.70.92]:57953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Rrr2U-0003a2-62
	for qemu-trivial@nongnu.org; Mon, 30 Jan 2012 08:12:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Rrr2T-00062J-4f
	for qemu-trivial@nongnu.org; Mon, 30 Jan 2012 08:12:54 -0500
Received: from cantor2.suse.de ([195.135.220.15]:57173 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Rrr2H-00060j-Sf; Mon, 30 Jan 2012 08:12:42 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id E82078BB22;
	Mon, 30 Jan 2012 14:12:40 +0100 (CET)
Message-ID: <4F2696BF.7040601@suse.de>
Date: Mon, 30 Jan 2012 14:10:23 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111220 Thunderbird/9.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1326806593-21785-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1326806593-21785-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.3.4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, patches@linaro.org,
	qemu-devel@nongnu.org,
	=?UTF-8?B?6Zmz?= =?UTF-8?B?6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>,
	Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] exec.c: Clarify comment
 about tlb_flush() flush_global parameter
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
X-List-Received-Date: Mon, 30 Jan 2012 13:13:00 -0000

Am 17.01.2012 14:23, schrieb Peter Maydell:
> Clarify the comment about tlb_flush()'s flush_global parameter,
> so it is clearer what it does and why it is OK that the implementation
> currently ignores it.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>

CC'ing qemu-trivial.

Andreas

> ---
> Minor clarification following a conversation on IRC...
>=20
>  exec.c |   14 ++++++++++++--
>  1 files changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/exec.c b/exec.c
> index 7f9f730..f667cf0 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -1876,8 +1876,18 @@ static CPUTLBEntry s_cputlb_empty_entry =3D {
>      .addend     =3D -1,
>  };
> =20
> -/* NOTE: if flush_global is true, also flush global entries (not
> -   implemented yet) */
> +/* NOTE:
> + * If flush_global is true (the usual case), flush all tlb entries.
> + * If flush_global is false, flush (at least) all tlb entries not
> + * marked global.
> + *
> + * Since QEMU doesn't currently implement a global/not-global flag
> + * for tlb entries, at the moment tlb_flush() will also flush all
> + * tlb entries in the flush_global =3D=3D false case. This is OK becau=
se
> + * CPU architectures generally permit an implementation to drop
> + * entries from the TLB at any time, so flushing more entries than
> + * required is only an efficiency issue, not a correctness issue.
> + */
>  void tlb_flush(CPUState *env, int flush_global)
>  {
>      int i;

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

