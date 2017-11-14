Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eEVq8-0007ao-Kp
	for mharc-qemu-trivial@gnu.org; Tue, 14 Nov 2017 02:41:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eEVq5-0007ZD-L6
	for qemu-trivial@nongnu.org; Tue, 14 Nov 2017 02:40:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eEVq4-0002I0-91
	for qemu-trivial@nongnu.org; Tue, 14 Nov 2017 02:40:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53028)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eEVpw-000261-PK; Tue, 14 Nov 2017 02:40:49 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33E4981DEC;
	Tue, 14 Nov 2017 07:40:47 +0000 (UTC)
Received: from [10.36.116.149] (ovpn-116-149.ams2.redhat.com [10.36.116.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1B0B2C318;
	Tue, 14 Nov 2017 07:40:45 +0000 (UTC)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: alistair23@gmail.com, armbru@redhat.com, qemu-ppc@nongnu.org
References: <cover.1510612380.git.alistair.francis@xilinx.com>
	<d297d74fd53f91e25e4ffb980ea40d4032beaf0b.1510612380.git.alistair.francis@xilinx.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7a185bec-43b3-7fcd-d419-9af143b2e3f9@redhat.com>
Date: Tue, 14 Nov 2017 08:40:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <d297d74fd53f91e25e4ffb980ea40d4032beaf0b.1510612380.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 14 Nov 2017 07:40:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 29/29] target: Use
 qemu_log() instead of fprintf(stderr, ...)
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
X-List-Received-Date: Tue, 14 Nov 2017 07:40:59 -0000

On 13.11.2017 23:36, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
[...]
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 998fbed848..8eafe30624 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -3945,11 +3945,11 @@ static inline void gen_op_mfspr(DisasContext *c=
tx)
>               * allowing userland application to read the PVR
>               */
>              if (sprn !=3D SPR_PVR) {
> -                fprintf(stderr, "Trying to read privileged spr %d (0x%=
03x) at "
> -                        TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
> +                qemu_log("Trying to read privileged spr %d (0x%03x) at=
 "
> +                         TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4)=
;
>                  if (qemu_log_separate()) {
>                      qemu_log("Trying to read privileged spr %d (0x%03x=
) at "
> -                             TARGET_FMT_lx "\n", sprn, sprn, ctx->nip =
- 4);
> +                              TARGET_FMT_lx "\n", sprn, sprn, ctx->nip=
 - 4);

Unnecessary and wrong white space change. Please fix that line.

>                  }
>              }
>              gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
> @@ -3962,8 +3962,8 @@ static inline void gen_op_mfspr(DisasContext *ctx=
)
>              return;
>          }
>          /* Not defined */
> -        fprintf(stderr, "Trying to read invalid spr %d (0x%03x) at "
> -                TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
> +        qemu_log("Trying to read invalid spr %d (0x%03x) at "
> +                 TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
>          if (qemu_log_separate()) {
>              qemu_log("Trying to read invalid spr %d (0x%03x) at "
>                       TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);

Now that looks wrong, too: If qemu_log_separate() returns true, the same
message is printed out again?

> @@ -4108,8 +4108,8 @@ static void gen_mtspr(DisasContext *ctx)
>              (*write_cb)(ctx, sprn, rS(ctx->opcode));
>          } else {
>              /* Privilege exception */
> -            fprintf(stderr, "Trying to write privileged spr %d (0x%03x=
) at "
> -                    TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
> +            qemu_log("Trying to write privileged spr %d (0x%03x) at "
> +                     TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
>              if (qemu_log_separate()) {
>                  qemu_log("Trying to write privileged spr %d (0x%03x) a=
t "
>                           TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4)=
;

dito

> @@ -4129,8 +4129,8 @@ static void gen_mtspr(DisasContext *ctx)
>              qemu_log("Trying to write invalid spr %d (0x%03x) at "
>                       TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
>          }
> -        fprintf(stderr, "Trying to write invalid spr %d (0x%03x) at "
> -                TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
> +        qemu_log("Trying to write invalid spr %d (0x%03x) at "
> +                 TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);

dito

> diff --git a/target/sh4/translate.c b/target/sh4/translate.c
> index 703020fe87..32b72b4701 100644
> --- a/target/sh4/translate.c
> +++ b/target/sh4/translate.c
> @@ -427,7 +427,7 @@ static void _decode_opc(DisasContext * ctx)
>  	}
> =20
>  #if 0
> -    fprintf(stderr, "Translating opcode 0x%04x\n", ctx->opcode);
> +    qemu_log("Translating opcode 0x%04x\n", ctx->opcode);

That looks like a debug statement for the develepers ... why should that
be a qemu_log() ?

>  #endif
> =20
>      switch (ctx->opcode) {
> @@ -1788,7 +1788,7 @@ static void _decode_opc(DisasContext * ctx)
>          break;
>      }
>  #if 0
> -    fprintf(stderr, "unknown instruction 0x%04x at pc 0x%08x\n",
> +    qemu_log_mask(LOG_UNIMP, "unknown instruction 0x%04x at pc 0x%08x\=
n",
>  	    ctx->opcode, ctx->pc);

Since this is now only logged conditionally if UNIMP logging is enabled,
I think you should remove the "#if 0" in front of it now.

>      fflush(stderr);

Since you don't print to stderr anymore, this fflush() also does not
make sense anymore.

>  #endif

 Thomas

