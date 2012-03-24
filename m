Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SBTZ6-0000zU-1T
	for mharc-qemu-trivial@gnu.org; Sat, 24 Mar 2012 12:11:40 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1SBTZ3-0000qQ-2G
	for qemu-trivial@nongnu.org; Sat, 24 Mar 2012 12:11:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1SBTZ1-0006Hk-90
	for qemu-trivial@nongnu.org; Sat, 24 Mar 2012 12:11:36 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:33320)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1SBTZ1-0006HZ-1l
	for qemu-trivial@nongnu.org; Sat, 24 Mar 2012 12:11:35 -0400
Received: by iafj26 with SMTP id j26so7213492iaf.4
	for <qemu-trivial@nongnu.org>; Sat, 24 Mar 2012 09:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=nPvdyxZ+WR/whwUMNAx5Sz+uASslZhvamjmSga8S+kQ=;
	b=KHCd/pf8zQxfNYRQ04QC//xoW9n3t+B5lSt0nEgT3heZAEoTgD6zhrzlkP6JOEVG6E
	VhkUiIBFJVuiNmHpZBfhwI7zB9valPrbU1jCjoBaEnzplLA3xh1Ws+eyvrP6hfYduUaF
	8AqRpJzLiLMQB7ZD2eTyozLvp9RN+p6ll66uQDdGkwpQnkszNYZoFm/fZCkl2jZb+p2O
	NRnP/SJsXFvhxc8yZyUmPMmNUWNs4tfNVreR8B/rel8/riX9X1RJDAa6XxcZ0NeuxK8g
	LkygwGKJVyE88eSBP0nHe8cm421ePPZd1V6W538kswdPGuU3TCaH3OiV7Cm5IojQ1XqI
	uwQw==
Received: by 10.50.47.162 with SMTP id e2mr1834667ign.0.1332605493485; Sat, 24
	Mar 2012 09:11:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.75.41 with HTTP; Sat, 24 Mar 2012 09:11:13 -0700 (PDT)
In-Reply-To: <1332108898-6377-1-git-send-email-sw@weilnetz.de>
References: <1332108898-6377-1-git-send-email-sw@weilnetz.de>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sat, 24 Mar 2012 16:11:13 +0000
Message-ID: <CAAu8pHt4inLohPrtFK77nXv_9Q1v0+wiBL5WbHJfACfnKvSdeQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 1/3] Add support for target helper
	functions which don't return
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
X-List-Received-Date: Sat, 24 Mar 2012 16:11:38 -0000

Thanks, applied all three.

On Sun, Mar 18, 2012 at 22:14, Stefan Weil <sw@weilnetz.de> wrote:
> Most functions which handle exceptions don't return.
>
> With a compiler attribute (added by QEMU_NORETURN),
> gcc can optimize the code.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> =C2=A0def-helper.h | =C2=A0 =C2=A07 +++++++
> =C2=A01 files changed, 7 insertions(+), 0 deletions(-)
>
> diff --git a/def-helper.h b/def-helper.h
> index 0e70c31..b98ff69 100644
> --- a/def-helper.h
> +++ b/def-helper.h
> @@ -39,6 +39,7 @@
> =C2=A0#endif
> =C2=A0#define dh_alias_ptr ptr
> =C2=A0#define dh_alias_void void
> +#define dh_alias_noreturn noreturn
> =C2=A0#define dh_alias_env ptr
> =C2=A0#define dh_alias(t) glue(dh_alias_, t)
>
> @@ -52,36 +53,42 @@
> =C2=A0#define dh_ctype_tl target_ulong
> =C2=A0#define dh_ctype_ptr void *
> =C2=A0#define dh_ctype_void void
> +#define dh_ctype_noreturn void QEMU_NORETURN
> =C2=A0#define dh_ctype_env CPUArchState *
> =C2=A0#define dh_ctype(t) dh_ctype_##t
>
> =C2=A0/* We can't use glue() here because it falls foul of C preprocessor
> =C2=A0 =C2=A0recursive expansion rules. =C2=A0*/
> =C2=A0#define dh_retvar_decl0_void void
> +#define dh_retvar_decl0_noreturn void
> =C2=A0#define dh_retvar_decl0_i32 TCGv_i32 retval
> =C2=A0#define dh_retvar_decl0_i64 TCGv_i64 retval
> =C2=A0#define dh_retvar_decl0_ptr TCGv_ptr retval
> =C2=A0#define dh_retvar_decl0(t) glue(dh_retvar_decl0_, dh_alias(t))
>
> =C2=A0#define dh_retvar_decl_void
> +#define dh_retvar_decl_noreturn
> =C2=A0#define dh_retvar_decl_i32 TCGv_i32 retval,
> =C2=A0#define dh_retvar_decl_i64 TCGv_i64 retval,
> =C2=A0#define dh_retvar_decl_ptr TCGv_ptr retval,
> =C2=A0#define dh_retvar_decl(t) glue(dh_retvar_decl_, dh_alias(t))
>
> =C2=A0#define dh_retvar_void TCG_CALL_DUMMY_ARG
> +#define dh_retvar_noreturn TCG_CALL_DUMMY_ARG
> =C2=A0#define dh_retvar_i32 GET_TCGV_i32(retval)
> =C2=A0#define dh_retvar_i64 GET_TCGV_i64(retval)
> =C2=A0#define dh_retvar_ptr GET_TCGV_ptr(retval)
> =C2=A0#define dh_retvar(t) glue(dh_retvar_, dh_alias(t))
>
> =C2=A0#define dh_is_64bit_void 0
> +#define dh_is_64bit_noreturn 0
> =C2=A0#define dh_is_64bit_i32 0
> =C2=A0#define dh_is_64bit_i64 1
> =C2=A0#define dh_is_64bit_ptr (TCG_TARGET_REG_BITS =3D=3D 64)
> =C2=A0#define dh_is_64bit(t) glue(dh_is_64bit_, dh_alias(t))
>
> =C2=A0#define dh_is_signed_void 0
> +#define dh_is_signed_noreturn 0
> =C2=A0#define dh_is_signed_i32 0
> =C2=A0#define dh_is_signed_s32 1
> =C2=A0#define dh_is_signed_i64 0
> --
> 1.7.9
>

