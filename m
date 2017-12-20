Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eReFn-0002tk-C1
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 08:17:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eReFk-0002rb-DB
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 08:17:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eReFj-0003DJ-CJ
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 08:17:44 -0500
Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241]:35619)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eReFh-00038l-7B; Wed, 20 Dec 2017 08:17:41 -0500
Received: by mail-it0-x241.google.com with SMTP id f143so6819781itb.0;
	Wed, 20 Dec 2017 05:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=q4pumUioOSdfYQc2ywruf0aoo+gGLSEqelTSk/rbq6o=;
	b=QZYft7QPPh6K3gvM+1tSMoE5Cg02XVqBwT/KLSpDclEjLqR1Ej2VnVVkfP4/Mka383
	hcbOQJGXii2qS7xJ+ATcCUG2i5cdkPh6dRBXWck7YJI1yArtx+S18BLo8hWWC7bnQ5SV
	s5XaY9dg2bOZiio1lgbbHDUIPfHG6EHbVDBkfZt//n539ArBlzJiN8uLFCo3298DuinE
	S7gy1Ykpbq6rzuZZPmNqwSfp3ZO/LvLQRxxtRBcvs5QcSZ9lTr5S2CKXVocQT7Xa0fCt
	tf5meTVFOFBNUswaMjx9HefbKEkFIIvIkqASQoOgxHzh4ezp+JJZ/n1j45t7L15UocjE
	mArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=q4pumUioOSdfYQc2ywruf0aoo+gGLSEqelTSk/rbq6o=;
	b=ahaj1R7HCCbjh9AyeivqP/0x23IVAdmrkwxDjhy1Q4vY/ZRtEXnvtawWGNLMLomjCV
	+aKgXgwVac76UFjUXu0tInU5SdaMKrfssQuJhvlTeqKzmlGwA3QyQc406FRyJYrbvivS
	Gjc8Iu0HB8wQLpETrj1xJs3B2hEunY+TkIXy7AXGe1HG3HS6Nxay6tiCFYOsQuWFV8DY
	PrmRUUVH8/eqjbx/tdsWlCVoJ1MfZ2iz5INJsaY2/T0aNdhLUEuOKZmWqMh1xDtrkwt9
	3vrQciIM+AxXsitM09O59q7XByP24UO4EK8ym9LNuuk1WPA9/PrgsedppixA+EULthJa
	VXIw==
X-Gm-Message-State: AKGB3mIq3eSdsmJ823JeDwRS6eZRfrxMMQRm255aZ9CCAO3VQb/chD5s
	iZ1De7pX0pvehQfG4hXxTkfqgOnzv7k7wo1fdDqhSQzQ
X-Google-Smtp-Source: ACJfBos4LGCvS4EOBVeMyt+mqG68EcxZlQNGxXLZIg1hA2ef/PK95mpz4hwXswsBqbeGikTTw8lRU/fYxceidYYq/K0=
X-Received: by 10.36.73.9 with SMTP id z9mr3440436ita.88.1513775860572; Wed,
	20 Dec 2017 05:17:40 -0800 (PST)
MIME-Version: 1.0
Sender: philippe.mathieu.daude@gmail.com
Received: by 10.2.183.19 with HTTP; Wed, 20 Dec 2017 05:17:40 -0800 (PST)
In-Reply-To: <20171220130815.20708-1-laurent@vivier.eu>
References: <20171220130815.20708-1-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 20 Dec 2017 10:17:40 -0300
X-Google-Sender-Auth: _TOHew15Wqe3b06iIwrZksNBzZc
Message-ID: <CAAdtpL6byoHzPmYOJexD33SrJszK0s6neqgo=PxXfK92X4w5Qw@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::241
Subject: Re: [Qemu-trivial] [PATCH] target/m68k: remove unused variable
 gen_throws_exception
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Dec 2017 13:17:45 -0000

On Wed, Dec 20, 2017 at 10:08 AM, Laurent Vivier <laurent@vivier.eu> wrote:
> It has been introduced by e6e5906b6e ("ColdFire target."),
> but the content is never used.
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> ---
>  target/m68k/translate.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index b60909222c..dfb2d5dad2 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -181,11 +181,6 @@ static void do_writebacks(DisasContext *s)
>  #define IS_USER(s) s->user
>  #endif
>
> -/* XXX: move that elsewhere */
> -/* ??? Fix exceptions.  */
> -static void *gen_throws_exception;
> -#define gen_last_qop NULL
> -
>  typedef void (*disas_proc)(CPUM68KState *env, DisasContext *s, uint16_t =
insn);
>
>  #ifdef DEBUG_DISPATCH
> @@ -310,7 +305,6 @@ static inline TCGv gen_load(DisasContext * s, int ops=
ize, TCGv addr, int sign)
>      default:
>          g_assert_not_reached();
>      }
> -    gen_throws_exception =3D gen_last_qop;
>      return tmp;
>  }
>
> @@ -331,7 +325,6 @@ static inline void gen_store(DisasContext *s, int ops=
ize, TCGv addr, TCGv val)
>      default:
>          g_assert_not_reached();
>      }
> -    gen_throws_exception =3D gen_last_qop;
>  }
>
>  typedef enum {
> @@ -1001,7 +994,6 @@ static void gen_load_fp(DisasContext *s, int opsize,=
 TCGv addr, TCGv_ptr fp)
>      }
>      tcg_temp_free(tmp);
>      tcg_temp_free_i64(t64);
> -    gen_throws_exception =3D gen_last_qop;
>  }
>
>  static void gen_store_fp(DisasContext *s, int opsize, TCGv addr, TCGv_pt=
r fp)
> @@ -1056,7 +1048,6 @@ static void gen_store_fp(DisasContext *s, int opsiz=
e, TCGv addr, TCGv_ptr fp)
>      }
>      tcg_temp_free(tmp);
>      tcg_temp_free_i64(t64);
> -    gen_throws_exception =3D gen_last_qop;
>  }
>
>  static void gen_ldst_fp(DisasContext *s, int opsize, TCGv addr,
> @@ -5561,7 +5552,6 @@ void gen_intermediate_code(CPUState *cs, Translatio=
nBlock *tb)
>      gen_tb_start(tb);
>      do {
>          pc_offset =3D dc->pc - pc_start;
> -        gen_throws_exception =3D NULL;
>          tcg_gen_insn_start(dc->pc, dc->cc_op);
>          num_insns++;
>
> --
> 2.14.3
>
>

