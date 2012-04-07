Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SGc4q-0005CB-OK
	for mharc-qemu-trivial@gnu.org; Sat, 07 Apr 2012 16:17:40 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1SGc4n-00053h-SL
	for qemu-trivial@nongnu.org; Sat, 07 Apr 2012 16:17:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1SGc4m-0003YK-AY
	for qemu-trivial@nongnu.org; Sat, 07 Apr 2012 16:17:37 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:51931)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1SGc4i-0003Wk-Dh; Sat, 07 Apr 2012 16:17:32 -0400
Received: by iafj26 with SMTP id j26so5264637iaf.4
	for <multiple recipients>; Sat, 07 Apr 2012 13:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=Qys++Cl+GsNf42T5jPq9Vuu7P/mHqR8jcfdqLmJo7/0=;
	b=fwQRaON1QPxBKq+a4kStZIjaz+j1K3V4GqoZYG+77o4GStLxUwR2UMksY4kO2e69NP
	fLKdjzgctihzZtTjCYOWUQwyszyzLTxlloipGJcIQ08e8mr/BJJtsou6m2MyaSieOqKU
	LR0MR97gOjYeF8GuCCTdApeINBtc/xZhv91jYRGHmBvIz050uH2uk2rpykhS8Bkptf7z
	U5KVv8LNsIqtktlgk+Ii/i6oCGXuK5tzCDbglZa1HzLmS4DLWu/+thinCdi6/TtNiH9D
	bwg+Gv833h4gi9mnY51SHq/HXQ/rPhB/NJxbk+X7odUe5PTg+/8a4DjT+/0d9+sTDVmz
	J8bQ==
Received: by 10.50.212.97 with SMTP id nj1mr1572498igc.65.1333829849845; Sat,
	07 Apr 2012 13:17:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.197.194 with HTTP; Sat, 7 Apr 2012 13:17:09 -0700 (PDT)
In-Reply-To: <1333814314-23222-1-git-send-email-sw@weilnetz.de>
References: <1333814314-23222-1-git-send-email-sw@weilnetz.de>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sat, 7 Apr 2012 20:17:09 +0000
Message-ID: <CAAu8pHs2Wf7Nzdir1bRMweSD_-_bWqr4UqSi9ozQUyg0j4QBHg@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH (rebased) 1/2] Add QEMU_NORETURN to
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
X-List-Received-Date: Sat, 07 Apr 2012 20:17:39 -0000

Thanks, applied both.

On Sat, Apr 7, 2012 at 15:58, Stefan Weil <sw@weilnetz.de> wrote:
> cpu_resume_from_signal terminates by calling longjmp.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> =C2=A0exec-all.h | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/exec-all.h b/exec-all.h
> index a6d6519..4758d88 100644
> --- a/exec-all.h
> +++ b/exec-all.h
> @@ -86,7 +86,7 @@ int cpu_gen_code(CPUArchState *env, struct TranslationB=
lock *tb,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *gen_co=
de_size_ptr);
> =C2=A0int cpu_restore_state(struct TranslationBlock *tb,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 CPUArchState *env, uintptr_t searched_pc);
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

