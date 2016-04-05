Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1anYx3-00042l-BW
	for mharc-qemu-trivial@gnu.org; Tue, 05 Apr 2016 17:55:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1anYx0-00041S-LQ
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 17:55:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1anYwv-00071z-Pf
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 17:55:54 -0400
Received: from e33.co.us.ibm.com ([32.97.110.151]:43348)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1anYwv-00070p-GI
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 17:55:49 -0400
Received: from localhost
	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mdroth@linux.vnet.ibm.com>;
	Tue, 5 Apr 2016 15:55:47 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
	by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 5 Apr 2016 15:55:45 -0600
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: mdroth@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
	[9.57.198.24])
	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 565D119D803E;
	Tue,  5 Apr 2016 15:43:37 -0600 (MDT)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	u35LtiVV36962420; Tue, 5 Apr 2016 21:55:44 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
	by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	u35LthGF003865; Tue, 5 Apr 2016 17:55:44 -0400
Received: from localhost ([9.53.92.253])
	by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	u35LthYc003844; Tue, 5 Apr 2016 17:55:43 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Stefan Weil <sw@weilnetz.de>, "QEMU Developer" <qemu-devel@nongnu.org>,
	"QEMU Trivial" <qemu-trivial@nongnu.org>
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <1459888177-18075-1-git-send-email-sw@weilnetz.de>
References: <1459888177-18075-1-git-send-email-sw@weilnetz.de>
Message-ID: <20160405215538.24353.14932@loki>
User-Agent: alot/0.3.6
Date: Tue, 05 Apr 2016 16:55:38 -0500
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16040521-0009-0000-0000-00001A81605E
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 32.97.110.151
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Sergey Fedorov <serge.fdrv@gmail.com>, Stefan Weil <sw@weilnetz.de>
Subject: Re: [Qemu-trivial] [PATCH v2 for-2.6] tci: Fix build regression
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
X-List-Received-Date: Tue, 05 Apr 2016 21:55:56 -0000

Quoting Stefan Weil (2016-04-05 15:29:37)
> Commit d38ea87ac54af64ef611de434d07c12dc0399216 cleaned the include
> statements which resulted in a wrong order of assert.h and the definition
> of NDEBUG in tci.c. Normally NDEBUG modifies the definition of the assert
> macro, but here this definition comes too late which results in a failing
> build.
> =

> To fix this, a new macro tci_assert which depends on CONFIG_DEBUG_TCG
> is introduced. Only builds with CONFIG_DEBUG_TCG will use assertions.
> Even in this case, it is still possible to disable assertions by
> defining NDEBUG via compiler settings.
> =

> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Tested-by: Michael Roth <mdroth@linux.vnet.ibm.com>

> ---
> =

> v2:
> Use parentheses around (void)0 as suggested by Sergey Fedorov
> and Peter Maydell and required for assert by the POSIX standard.
> =

> =

>  tci.c | 41 ++++++++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 19 deletions(-)
> =

> diff --git a/tci.c b/tci.c
> index 7cbb39e..82705fe 100644
> --- a/tci.c
> +++ b/tci.c
> @@ -1,7 +1,7 @@
>  /*
>   * Tiny Code Interpreter for QEMU
>   *
> - * Copyright (c) 2009, 2011 Stefan Weil
> + * Copyright (c) 2009, 2011, 2016 Stefan Weil
>   *
>   * This program is free software: you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License as published by
> @@ -19,9 +19,12 @@
> =

>  #include "qemu/osdep.h"
> =

> -/* Defining NDEBUG disables assertions (which makes the code faster). */
> -#if !defined(CONFIG_DEBUG_TCG) && !defined(NDEBUG)
> -# define NDEBUG
> +/* Enable TCI assertions only when debugging TCG (and without NDEBUG def=
ined).
> + * Without assertions, the interpreter runs much faster. */
> +#if defined(CONFIG_DEBUG_TCG)
> +# define tci_assert(cond) assert(cond)
> +#else
> +# define tci_assert(cond) ((void)0)
>  #endif
> =

>  #include "qemu-common.h"
> @@ -56,7 +59,7 @@ static tcg_target_ulong tci_reg[TCG_TARGET_NB_REGS];
> =

>  static tcg_target_ulong tci_read_reg(TCGReg index)
>  {
> -    assert(index < ARRAY_SIZE(tci_reg));
> +    tci_assert(index < ARRAY_SIZE(tci_reg));
>      return tci_reg[index];
>  }
> =

> @@ -105,9 +108,9 @@ static uint64_t tci_read_reg64(TCGReg index)
> =

>  static void tci_write_reg(TCGReg index, tcg_target_ulong value)
>  {
> -    assert(index < ARRAY_SIZE(tci_reg));
> -    assert(index !=3D TCG_AREG0);
> -    assert(index !=3D TCG_REG_CALL_STACK);
> +    tci_assert(index < ARRAY_SIZE(tci_reg));
> +    tci_assert(index !=3D TCG_AREG0);
> +    tci_assert(index !=3D TCG_REG_CALL_STACK);
>      tci_reg[index] =3D value;
>  }
> =

> @@ -325,7 +328,7 @@ static uint64_t tci_read_ri64(uint8_t **tb_ptr)
>  static tcg_target_ulong tci_read_label(uint8_t **tb_ptr)
>  {
>      tcg_target_ulong label =3D tci_read_i(tb_ptr);
> -    assert(label !=3D 0);
> +    tci_assert(label !=3D 0);
>      return label;
>  }
> =

> @@ -468,11 +471,11 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8=
_t *tb_ptr)
> =

>      tci_reg[TCG_AREG0] =3D (tcg_target_ulong)env;
>      tci_reg[TCG_REG_CALL_STACK] =3D sp_value;
> -    assert(tb_ptr);
> +    tci_assert(tb_ptr);
> =

>      for (;;) {
>          TCGOpcode opc =3D tb_ptr[0];
> -#if !defined(NDEBUG)
> +#if defined(CONFIG_DEBUG_TCG) && !defined(NDEBUG)
>          uint8_t op_size =3D tb_ptr[1];
>          uint8_t *old_code_ptr =3D tb_ptr;
>  #endif
> @@ -525,7 +528,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t=
 *tb_ptr)
>              break;
>          case INDEX_op_br:
>              label =3D tci_read_label(&tb_ptr);
> -            assert(tb_ptr =3D=3D old_code_ptr + op_size);
> +            tci_assert(tb_ptr =3D=3D old_code_ptr + op_size);
>              tb_ptr =3D (uint8_t *)label;
>              continue;
>          case INDEX_op_setcond_i32:
> @@ -600,7 +603,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t=
 *tb_ptr)
>              t0 =3D tci_read_r32(&tb_ptr);
>              t1 =3D tci_read_r(&tb_ptr);
>              t2 =3D tci_read_s32(&tb_ptr);
> -            assert(t1 !=3D sp_value || (int32_t)t2 < 0);
> +            tci_assert(t1 !=3D sp_value || (int32_t)t2 < 0);
>              *(uint32_t *)(t1 + t2) =3D t0;
>              break;
> =

> @@ -725,7 +728,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t=
 *tb_ptr)
>              condition =3D *tb_ptr++;
>              label =3D tci_read_label(&tb_ptr);
>              if (tci_compare32(t0, t1, condition)) {
> -                assert(tb_ptr =3D=3D old_code_ptr + op_size);
> +                tci_assert(tb_ptr =3D=3D old_code_ptr + op_size);
>                  tb_ptr =3D (uint8_t *)label;
>                  continue;
>              }
> @@ -751,7 +754,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t=
 *tb_ptr)
>              condition =3D *tb_ptr++;
>              label =3D tci_read_label(&tb_ptr);
>              if (tci_compare64(tmp64, v64, condition)) {
> -                assert(tb_ptr =3D=3D old_code_ptr + op_size);
> +                tci_assert(tb_ptr =3D=3D old_code_ptr + op_size);
>                  tb_ptr =3D (uint8_t *)label;
>                  continue;
>              }
> @@ -885,7 +888,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t=
 *tb_ptr)
>              t0 =3D tci_read_r64(&tb_ptr);
>              t1 =3D tci_read_r(&tb_ptr);
>              t2 =3D tci_read_s32(&tb_ptr);
> -            assert(t1 !=3D sp_value || (int32_t)t2 < 0);
> +            tci_assert(t1 !=3D sp_value || (int32_t)t2 < 0);
>              *(uint64_t *)(t1 + t2) =3D t0;
>              break;
> =

> @@ -992,7 +995,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t=
 *tb_ptr)
>              condition =3D *tb_ptr++;
>              label =3D tci_read_label(&tb_ptr);
>              if (tci_compare64(t0, t1, condition)) {
> -                assert(tb_ptr =3D=3D old_code_ptr + op_size);
> +                tci_assert(tb_ptr =3D=3D old_code_ptr + op_size);
>                  tb_ptr =3D (uint8_t *)label;
>                  continue;
>              }
> @@ -1087,7 +1090,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8=
_t *tb_ptr)
>              break;
>          case INDEX_op_goto_tb:
>              t0 =3D tci_read_i32(&tb_ptr);
> -            assert(tb_ptr =3D=3D old_code_ptr + op_size);
> +            tci_assert(tb_ptr =3D=3D old_code_ptr + op_size);
>              tb_ptr +=3D (int32_t)t0;
>              continue;
>          case INDEX_op_qemu_ld_i32:
> @@ -1234,7 +1237,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8=
_t *tb_ptr)
>              TODO();
>              break;
>          }
> -        assert(tb_ptr =3D=3D old_code_ptr + op_size);
> +        tci_assert(tb_ptr =3D=3D old_code_ptr + op_size);
>      }
>  exit:
>      return next_tb;
> -- =

> 2.1.4
> =

>=20


