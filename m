Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qmD7O-0004nK-Va
	for mharc-qemu-trivial@gnu.org; Fri, 29 Sep 2023 09:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1qmCpT-0004Ic-Bz
 for qemu-trivial@nongnu.org; Fri, 29 Sep 2023 08:42:47 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1qmCpG-0006Dr-NU
 for qemu-trivial@nongnu.org; Fri, 29 Sep 2023 08:42:47 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-565334377d0so10770388a12.2
 for <qemu-trivial@nongnu.org>; Fri, 29 Sep 2023 05:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1695991350; x=1696596150; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7sQ0VuR5GrrY/vRYyct7kFEYeRQwG8+9T1cxX80c4Ic=;
 b=e7hVXQiON1h665+ljUC+e3tONWLv63eBoMn8NzGzXaAH8mqCKKhOw8aa543Ak0IqxU
 /oaf6G8321OPKpPYqN4IaTtrQPQ0BV/VSOSSQBXKsCLYxhq/yYvo1+ZGs/kYvpgPH7TM
 oCi0IHChYS0cXDit7rKIqcUb9nw5vBuJa6ZYdPEv4iTnjM1YzrD94w8Ku44oEj8enhE8
 KfhEACGSGnpJz3QOSyEYrX0OzbDrbqTdZesUogqyhedhsaPsSum+JyHIwg2Qc8yHELnd
 n9j+c2Y6+oJp/Eor3yaa1O8+kwnUA0xmPHWpEg0Do2m/nYok+AG/Ovz0VFzBiLws6mYW
 koFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695991350; x=1696596150;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7sQ0VuR5GrrY/vRYyct7kFEYeRQwG8+9T1cxX80c4Ic=;
 b=HrTalog7z6/We+WP2JonRRIoUd8TN71ReuwJXrMcZINt3p+oRzT3ZfuQCK5HK2XrKT
 RKr5fdhlS7CVTi1Fv72Uw1zSwZ97H52xf6QEFHq6jTBkrLdAhWEJqDAMwwn52Pbb80iF
 7Etmik/pALQ7wueHVw2ijXktdTmo2lylX8WvFnIeN9rXgUkLy4hu9YjJy0fgkyfDSPWL
 2iYLB3BKc4Vfe4fU9snmcLmlAgt9IhRbBYMGKAaMg9U1DIkJOR4ttW+D2e2RJZwuKJ6L
 QUWCYtGAMc+L+vxNSi1tXEh8gVXYMLxVNKX05sPPNEKU5C7Rg+DfrPZegsGr1dLEis0a
 3xKQ==
X-Gm-Message-State: AOJu0YyzTO4Oxm8hj0ThF7cmSN2VuXTiHFDTnk7xonxK3S1gpaeGCqAB
 CjPNuhX09+fbEcyBEhEGMiMchgodD0MX5BJuzjir8g==
X-Google-Smtp-Source: AGHT+IGPaVBmrojIFfFcJ9acfS75oLOJfAKDNyrvyCbLQKd6nOww67HZRfdJSUES99c8613F5c6HPRyzPIt0ndt1lfc=
X-Received: by 2002:a17:90a:fb51:b0:274:a021:9383 with SMTP id
 iq17-20020a17090afb5100b00274a0219383mr4079886pjb.17.1695991350306; Fri, 29
 Sep 2023 05:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230929123727.391346-1-thuth@redhat.com>
In-Reply-To: <20230929123727.391346-1-thuth@redhat.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Fri, 29 Sep 2023 14:42:18 +0200
Message-ID: <CAEg0e7gJYL_U=Rn_jzoEXz+zQU81PifxZw8513TAPdZF5h8J2w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add unowned RISC-V related files to the
 right sections
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Vijai Kumar K <vijai@behindbytes.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 29 Sep 2023 09:01:04 -0400
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Sep 2023 12:42:47 -0000

On Fri, Sep 29, 2023 at 2:37=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrot=
e:
>
> There are a bunch of RISC-V files that are currently not covered
> by the "get_maintainers.pl" script. Add them to the right sections
> in MAINTAINERS to fix this problem.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>


Acked-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Thanks!

>
> ---
>  MAINTAINERS | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 355b1960ce..1313257180 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -317,8 +317,11 @@ R: Daniel Henrique Barboza <dbarboza@ventanamicro.co=
m>
>  R: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
>  L: qemu-riscv@nongnu.org
>  S: Supported
> +F: configs/targets/riscv*
> +F: docs/system/target-riscv.rst
>  F: target/riscv/
>  F: hw/riscv/
> +F: hw/intc/riscv*
>  F: include/hw/riscv/
>  F: linux-user/host/riscv32/
>  F: linux-user/host/riscv64/
> @@ -330,6 +333,7 @@ L: qemu-riscv@nongnu.org
>  S: Supported
>  F: target/riscv/insn_trans/trans_xthead.c.inc
>  F: target/riscv/xthead*.decode
> +F: disas/riscv-xthead*
>
>  RISC-V XVentanaCondOps extension
>  M: Philipp Tomsich <philipp.tomsich@vrull.eu>
> @@ -337,6 +341,7 @@ L: qemu-riscv@nongnu.org
>  S: Maintained
>  F: target/riscv/XVentanaCondOps.decode
>  F: target/riscv/insn_trans/trans_xventanacondops.c.inc
> +F: disas/riscv-xventana*
>
>  RENESAS RX CPUs
>  R: Yoshinori Sato <ysato@users.sourceforge.jp>
> @@ -1518,6 +1523,7 @@ Microchip PolarFire SoC Icicle Kit
>  M: Bin Meng <bin.meng@windriver.com>
>  L: qemu-riscv@nongnu.org
>  S: Supported
> +F: docs/system/riscv/microchip-icicle-kit.rst
>  F: hw/riscv/microchip_pfsoc.c
>  F: hw/char/mchp_pfsoc_mmuart.c
>  F: hw/misc/mchp_pfsoc_dmc.c
> @@ -1533,6 +1539,7 @@ Shakti C class SoC
>  M: Vijai Kumar K <vijai@behindbytes.com>
>  L: qemu-riscv@nongnu.org
>  S: Supported
> +F: docs/system/riscv/shakti-c.rst
>  F: hw/riscv/shakti_c.c
>  F: hw/char/shakti_uart.c
>  F: include/hw/riscv/shakti_c.h
> @@ -1544,6 +1551,7 @@ M: Bin Meng <bin.meng@windriver.com>
>  M: Palmer Dabbelt <palmer@dabbelt.com>
>  L: qemu-riscv@nongnu.org
>  S: Supported
> +F: docs/system/riscv/sifive_u.rst
>  F: hw/*/*sifive*.c
>  F: include/hw/*/*sifive*.h
>
> @@ -3543,7 +3551,7 @@ M: Alistair Francis <Alistair.Francis@wdc.com>
>  L: qemu-riscv@nongnu.org
>  S: Maintained
>  F: tcg/riscv/
> -F: disas/riscv.c
> +F: disas/riscv.[ch]
>
>  S390 TCG target
>  M: Richard Henderson <richard.henderson@linaro.org>
> --
> 2.41.0
>

