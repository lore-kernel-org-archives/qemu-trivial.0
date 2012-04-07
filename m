Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SGWb9-0000dE-6f
	for mharc-qemu-trivial@gnu.org; Sat, 07 Apr 2012 10:26:39 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1SGWb6-0000Ti-Ix
	for qemu-trivial@nongnu.org; Sat, 07 Apr 2012 10:26:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1SGWb5-0006u4-1B
	for qemu-trivial@nongnu.org; Sat, 07 Apr 2012 10:26:36 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:58208)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1SGWb1-0006tg-Py; Sat, 07 Apr 2012 10:26:31 -0400
Received: by iafj26 with SMTP id j26so4969971iaf.4
	for <multiple recipients>; Sat, 07 Apr 2012 07:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=ttUrjbJzxcJW3X7NPpA1K4kK6IEeav6tIf1lzDkAUFw=;
	b=pO2NIgz+ub3iFLitGs+rY2NVNWFqbJpb53o2enNSPPPQ+dQcSJvv//u6FkIqIMRR8h
	cicccSQaob89XbeBAB3UFio6GtajzYmm5HTemEnDI7LN0MGHAIHG1K2Yb/u3gAFnEkcI
	HUeyVJ8Lzg5l+k8syR7uqfCUGee8ha0p2E7LKvHKNZ14MMzluSqShGfxXxB/R71IWUBh
	rqPVx/lfW4sN00FA/pnv2bEcHWUtx2btDRsG70icCrjxtUGoBh+tCgyPXRnr2pl71ceP
	wPsBb+300kRx4ZVcHTRJ0WCierSpNhWthoz/91h/b1hjl/Gl0rtM6MqTL0OSUgfhIZGp
	tBnA==
Received: by 10.50.222.162 with SMTP id qn2mr1003596igc.65.1333808789566; Sat,
	07 Apr 2012 07:26:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.197.194 with HTTP; Sat, 7 Apr 2012 07:26:09 -0700 (PDT)
In-Reply-To: <1333780821-15593-1-git-send-email-sw@weilnetz.de>
References: <1333780821-15593-1-git-send-email-sw@weilnetz.de>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sat, 7 Apr 2012 14:26:09 +0000
Message-ID: <CAAu8pHuphejwTUTzp=vCNrMS4EaE0XPoaZ+A79bh0mfOYU_kzQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] Add QEMU_NORETURN to
	function cpu_resume_from_signal
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
X-List-Received-Date: Sat, 07 Apr 2012 14:26:38 -0000

On Sat, Apr 7, 2012 at 06:40, Stefan Weil <sw@weilnetz.de> wrote:
> cpu_resume_from_signal terminates by calling longjmp.

Patch no longer applies, please rebase.

>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> =C2=A0exec-all.h | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/exec-all.h b/exec-all.h
> index 93a5b22..cd283dd 100644
> --- a/exec-all.h
> +++ b/exec-all.h
> @@ -86,7 +86,7 @@ int cpu_gen_code(CPUArchState *env, struct TranslationB=
lock *tb,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *gen_co=
de_size_ptr);
> =C2=A0int cpu_restore_state(struct TranslationBlock *tb,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 CPUArchState *env, unsigned long searched_pc);
> -void cpu_resume_from_signal(CPUArchState *env1, void *puc);
> +void QEMU_NORETURN cpu_resume_from_signal(CPUArchState *env1, void *puc)=
;
> =C2=A0void cpu_io_recompile(CPUArchState *env, void *retaddr);
> =C2=A0TranslationBlock *tb_gen_code(CPUArchState *env,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong pc, target_ulong cs_base, int =
flags,
> --
> 1.7.9
>
>

