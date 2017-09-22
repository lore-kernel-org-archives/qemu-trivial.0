Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvR4N-0006f2-0e
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 12:44:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvR4K-0006do-V2
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:44:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvR4J-0007XZ-Pf
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:44:49 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:45606)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dvR4J-0007Wq-HF
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:44:47 -0400
Received: by mail-wm0-x230.google.com with SMTP id q124so5520461wmb.0
	for <qemu-trivial@nongnu.org>; Fri, 22 Sep 2017 09:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hR0hmv8lIFmJIboJDWWIGT1gV/ILiQlZ7MsY9BFABII=;
	b=aVhFojo+rxtSdwaF+9cOeSkq8TxhDXKVh2Wd/rm7yt/kJJhqV1XGI8CZy1LDx3W4Gr
	RZw5BilugvKxk9GwcNdUcqOuL9d8Ftha/+QGjwoJ+FJqQFUTXeNnkkuLmOhCMW88EsJA
	aKsuTMIvCphicZOXuoCqI5v8OJ9KzevbMZAas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hR0hmv8lIFmJIboJDWWIGT1gV/ILiQlZ7MsY9BFABII=;
	b=JXeAD3zYHem2Qe7kGfqS6dLHP8kkMIryQO7elRS/BOCOWwMyFa0u1hCqF03eChIXBd
	RLvofF04eNsGH8br+TFX0yNkxwstrNUmMfty/g/BsJr3qU1tOgLxUWeE5ObmMCf1Gv+X
	gH1EQL2ysf2mJOZeH9zrjYj3RdUy94UXFDQi5XfOwoDO4lxsZeYKgIIhwWji8culNEWU
	y4Jg3aCeUBkYRJGcRQzlSaK3H7qMXLAhEILpzXv90h5QZi7zO81qWyhJchQi9r8RYcRb
	/0Y3ai4skjU/y4Vy1H84oi6EC3r9bxY6xGfkU3X4gTVdM6HnVZOIf8Ip1eBiYbQn8fOK
	jPtw==
X-Gm-Message-State: AHPjjUhgVRsgCMPZ2P62dOye2jgYWQR5XejPv3A9CrVp0TSnbPUwTQsY
	heCfemH69pGpoAskS/qzCdfdu+NGF43koi/FQu4+sQ==
X-Google-Smtp-Source: AOwi7QCXRrqnwZhG2uZvjUnh/JeAOy/YHuQ6crufuYjPpxb6RCCWluXjjS2VeBgoc5yQH4GLI0akZUIKRpNWHQh+Sp8=
X-Received: by 10.28.166.135 with SMTP id p129mr4650835wme.147.1506098686358; 
	Fri, 22 Sep 2017 09:44:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Fri, 22 Sep 2017 09:44:25 -0700 (PDT)
In-Reply-To: <20170922154014.29350-9-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-9-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Sep 2017 17:44:25 +0100
Message-ID: <CAFEAcA-96b81D4a+y3NEaxWUhegfLBt-y_33NnEg3P52FjQ-ew@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>, QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-trivial] [PATCH 08/34] nios2: remove duplicated includes
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
X-List-Received-Date: Fri, 22 Sep 2017 16:44:50 -0000

On 22 September 2017 at 16:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> applied using ./scripts/clean-includes
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/nios2/cpu.h       | 1 -
>  disas/nios2.c            | 3 ---
>  hw/nios2/boot.c          | 1 -
>  target/nios2/helper.c    | 7 ++-----
>  target/nios2/op_helper.c | 1 +
>  target/nios2/translate.c | 1 +
>  6 files changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index 50d803a217..fda02c39b9 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -20,7 +20,6 @@
>  #ifndef CPU_NIOS2_H
>  #define CPU_NIOS2_H
>
> -#include "qemu/osdep.h"
>  #include "qemu-common.h"
>
>  #define TARGET_LONG_BITS 32
> diff --git a/disas/nios2.c b/disas/nios2.c
> index b342936d21..de11f04cc4 100644
> --- a/disas/nios2.c
> +++ b/disas/nios2.c
> @@ -1756,7 +1756,6 @@ extern const int nios2_num_r2_reg_range_mappings;
>  #endif /* _NIOS2_H */
>
>  /*#include "sysdep.h"
> -#include <stdio.h>
>  #include "opcode/nios2.h"
>  */
>  /* Register string table */
> @@ -2521,8 +2520,6 @@ const int nios2_num_r2_reg_range_mappings =3D 8;
>  #include "dis-asm.h"
>  #include "opcode/nios2.h"
>  #include "libiberty.h"
> -#include <string.h>
> -#include <assert.h>
>  */

These are in commented out bits of code anyway, but I guess it doesn't
hurt and it'll prevent the script complaining later.

>  /* No symbol table is available when this code runs out in an embedded
>     system as when it is used for disassembler support in a monitor.  */
> diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
> index 2b31f5b844..94f436e7fb 100644
> --- a/hw/nios2/boot.c
> +++ b/hw/nios2/boot.c
> @@ -34,7 +34,6 @@
>  #include "qemu/option.h"
>  #include "qemu/config-file.h"
>  #include "qemu/error-report.h"
> -#include "qemu-common.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/loader.h"
> diff --git a/target/nios2/helper.c b/target/nios2/helper.c
> index ef9ee05798..9f741a8f19 100644
> --- a/target/nios2/helper.c
> +++ b/target/nios2/helper.c
> @@ -18,12 +18,9 @@
>   * <http://www.gnu.org/licenses/lgpl-2.1.html>
>   */
>
> -#include <stdio.h>
> -#include <string.h>
> -#include <assert.h>
> -
> -#include "cpu.h"
>  #include "qemu/osdep.h"
> +
> +#include "cpu.h"
>  #include "qemu/host-utils.h"
>  #include "qapi/error.h"
>  #include "exec/exec-all.h"
> diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
> index efb1c489c9..c853aeae02 100644
> --- a/target/nios2/op_helper.c
> +++ b/target/nios2/op_helper.c
> @@ -18,6 +18,7 @@
>   * <http://www.gnu.org/licenses/lgpl-2.1.html>
>   */
>
> +#include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "exec/helper-proto.h"
>  #include "exec/cpu_ldst.h"
> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
> index 6b0961837d..796d399bd1 100644
> --- a/target/nios2/translate.c
> +++ b/target/nios2/translate.c
> @@ -21,6 +21,7 @@
>   * <http://www.gnu.org/licenses/lgpl-2.1.html>
>   */
>
> +#include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "tcg-op.h"
>  #include "exec/exec-all.h"

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

