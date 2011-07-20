Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QjmIx-0000ct-19
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jul 2011 02:00:15 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QjdxL-0008GV-0B
	for qemu-trivial@nongnu.org; Wed, 20 Jul 2011 17:05:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QjdxG-0003sz-EU
	for qemu-trivial@nongnu.org; Wed, 20 Jul 2011 17:05:22 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:35594)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1Qjdx1-0003ii-Sl; Wed, 20 Jul 2011 17:05:04 -0400
Received: by qwj8 with SMTP id 8so427382qwj.4
	for <multiple recipients>; Wed, 20 Jul 2011 14:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=xUg7ynBOyiRGgVIsGhOyIMcwcbiVNyr92o/YRlCD1BM=;
	b=gerHDujKnm0WhzxtWHAOOHM0L6w3yzetzBlT/9F0Vbtas79NwY7LTVeRhfT1bLrlSZ
	JUm6eEPpIcB5qOpHS4cPhUeQ7FEYFly8cwcfbyJ5dotFseFzcqvBpNmBTk+RdIy65bji
	j3m6woErBFDmIfuM1QWks+Rn9wcXW/DBYWpxI=
Received: by 10.224.193.7 with SMTP id ds7mr5698655qab.366.1311195903085; Wed,
	20 Jul 2011 14:05:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.29.6 with HTTP; Wed, 20 Jul 2011 14:04:43 -0700 (PDT)
In-Reply-To: <1311188196-2867-2-git-send-email-weil@mail.berlios.de>
References: <1311188196-2867-1-git-send-email-weil@mail.berlios.de>
	<1311188196-2867-2-git-send-email-weil@mail.berlios.de>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Thu, 21 Jul 2011 00:04:43 +0300
Message-ID: <CAAu8pHvuqasqexORHq_=NTpLkwjR=wOxUeRE3JoqzK1xymG1Rg@mail.gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] tcg/mips: Fix regression caused by typo
	(copy + paste bug)
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
X-List-Received-Date: Thu, 21 Jul 2011 06:00:13 -0000

Thanks, applied.

On Wed, Jul 20, 2011 at 9:56 PM, Stefan Weil <weil@mail.berlios.de> wrote:
> cppcheck reports an error:
> qemu/tcg/mips/tcg-target.c:1487: error: Invalid number of character (()
>
> The unpatched code won't compile on mips hosts starting with commit
> cea5f9a28faa528b6b1b117c9ab2d8828f473fef.
>
> Cc: Blue Swirl <blauwirbel@gmail.com>
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
> =C2=A0tcg/mips/tcg-target.c | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/tcg/mips/tcg-target.c b/tcg/mips/tcg-target.c
> index 12ff9d5..a33d21f 100644
> --- a/tcg/mips/tcg-target.c
> +++ b/tcg/mips/tcg-target.c
> @@ -1484,7 +1484,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
> =C2=A0 =C2=A0 }
>
> =C2=A0 =C2=A0 /* Call generated code */
> - =C2=A0 =C2=A0tcg_out_opc_reg(s, OPC_JR, 0, tcg_target_call_iarg_regs[1]=
), 0);
> + =C2=A0 =C2=A0tcg_out_opc_reg(s, OPC_JR, 0, tcg_target_call_iarg_regs[1]=
, 0);
> =C2=A0 =C2=A0 tcg_out_mov(s, TCG_TYPE_PTR, TCG_AREG0, tcg_target_call_iar=
g_regs[0]);
> =C2=A0 =C2=A0 tb_ret_addr =3D s->code_ptr;
>
> --
> 1.7.2.5
>
>

