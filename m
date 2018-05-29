Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNnqt-0004qI-Dw
	for mharc-qemu-trivial@gnu.org; Tue, 29 May 2018 19:16:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fNnqr-0004nn-Er
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 19:16:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fNnqq-0003MW-Dv
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 19:16:25 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:36087)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fNnqn-0003Hb-Qc; Tue, 29 May 2018 19:16:22 -0400
Received: by mail-lf0-x243.google.com with SMTP id u4-v6so1310058lff.3;
	Tue, 29 May 2018 16:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=hGwVKp/ox9vW1K+q6uus999NdbG67cbgYA8NuH/Gj3k=;
	b=CCCFWSTxb/5hq1hCLc7vkmBdaZWHsUvZk7yxt2qm58XpGbhj6wn6pxOKBk9McnDGMS
	jmXQdGJL6PAkXfB4xt2WMbWTJOmQpDVhCwUIqIlvDxm2q6mawTaN55nbBzkUASD3a96a
	+MTSbYqc1vGzdhC21QTFAJm3Wm5wN7h4SxgbfvkdD28090ZdliMU+NhRW4fPlzmeNZi6
	N0DxbWeyxBs044eXrJy7gBHHHzGg5oIZ+tyfmmWBP8JDvMadclSFgH41BiNGYkUG/RDG
	Q0jvlPfBi755OSgA36fPdL4L0k4MfmH2fBe4z/O5u9nc8Mns2enQsYwtCXMsJes+jhB8
	vXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=hGwVKp/ox9vW1K+q6uus999NdbG67cbgYA8NuH/Gj3k=;
	b=CqlYwx7wbhHV5HbXWPh2UYMtVsmyGsqWCJFRk/L5SLyt5otlnKIYn/baYOUCIAgHsu
	PGKgwAnjs/EnZWeXJ6MBB0szGpAxXLqgdbpRJ9ZVBolYIo5fgbCu7qYoy6rz8YebL4Hg
	aDeCrxl1C7XD/N5qtKN2CVTjoaifnuASnA2iey2zDUm1plQJG5b5TWrMl0E0tNBDSPa0
	JyTiJExccETasdRarMaItmkqbVri5Y5ItGcyydTJOI/y0sYgAm6E+cJm5qCZTBRKVwPJ
	bQfzDWPenhTtBcJLiQ05C15IanwvsL5STHDKF5P6SD6ATFvzfyY3hVizVZoDCfjd+YwA
	NWVQ==
X-Gm-Message-State: ALKqPwesrKgSpExUhDTOPVosOaHgoDPvfkkjzALgilNAXc5l8RzJajp6
	CABCoENsJJvgEROd0T/sd/D2+6D69YMD0etA3Lw=
X-Google-Smtp-Source: ADUXVKJVwZ98yGv175n9M6lYX7aBXqNt4pVMo58g5pvqHw4m7b+TADc+Y9UqvartJfsp8wq3bhy0s4KEU7Tm1DcnTzg=
X-Received: by 2002:a19:b2c2:: with SMTP id t63-v6mr202888lfk.27.1527635780315;
	Tue, 29 May 2018 16:16:20 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 2002:a2e:3c12:0:0:0:0:0 with HTTP; Tue, 29 May 2018 16:15:49
	-0700 (PDT)
In-Reply-To: <1527531079-32717-1-git-send-email-thuth@redhat.com>
References: <1527531079-32717-1-git-send-email-thuth@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 29 May 2018 16:15:49 -0700
X-Google-Sender-Auth: HV6Y5YqzBn4EDF4_ZKXHVba-4wA
Message-ID: <CAKmqyKMgcG1sfQa1W_-kT-cnBSWyoaTGwftxoDE2-P=BFMKq0Q@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>, 
	"open list:New World" <qemu-ppc@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Alistair Francis <alistair.francis@xilinx.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target/ppc: Use proper
 logging function for possible guest errors
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
X-List-Received-Date: Tue, 29 May 2018 23:16:26 -0000

On Mon, May 28, 2018 at 11:11 AM, Thomas Huth <thuth@redhat.com> wrote:
> fprintf() and qemu_log_separate() are frowned upon these days for printing
> logging information in QEMU. Accessing the wrong SPRs indicates wrong guest
> behaviour in most cases, and we've got a proper way to log such situations,
> which is the qemu_log_mask(LOG_GUEST_ERROR, ...) function. So use this
> function now for logging the bad SPR accesses instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/ppc/translate.c | 37 ++++++++++++-------------------------
>  1 file changed, 12 insertions(+), 25 deletions(-)
>
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index e30d99f..0806ee0 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -3933,13 +3933,9 @@ static inline void gen_op_mfspr(DisasContext *ctx)
>               * allowing userland application to read the PVR
>               */
>              if (sprn != SPR_PVR) {
> -                fprintf(stderr, "Trying to read privileged spr %d (0x%03x) at "
> -                        TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
> -                if (qemu_log_separate()) {
> -                    qemu_log("Trying to read privileged spr %d (0x%03x) at "
> -                             TARGET_FMT_lx "\n", sprn, sprn,
> -                             ctx->base.pc_next - 4);
> -                }
> +                qemu_log_mask(LOG_GUEST_ERROR, "Trying to read privileged spr "
> +                              "%d (0x%03x) at " TARGET_FMT_lx "\n", sprn, sprn,
> +                              ctx->base.pc_next - 4);
>              }
>              gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
>          }
> @@ -3951,12 +3947,9 @@ static inline void gen_op_mfspr(DisasContext *ctx)
>              return;
>          }
>          /* Not defined */
> -        fprintf(stderr, "Trying to read invalid spr %d (0x%03x) at "
> -                TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
> -        if (qemu_log_separate()) {
> -            qemu_log("Trying to read invalid spr %d (0x%03x) at "
> -                     TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
> -        }
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "Trying to read invalid spr %d (0x%03x) at "
> +                      TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
>
>          /* The behaviour depends on MSR:PR and SPR# bit 0x10,
>           * it can generate a priv, a hv emu or a no-op
> @@ -4097,12 +4090,9 @@ static void gen_mtspr(DisasContext *ctx)
>              (*write_cb)(ctx, sprn, rS(ctx->opcode));
>          } else {
>              /* Privilege exception */
> -            fprintf(stderr, "Trying to write privileged spr %d (0x%03x) at "
> -                    TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
> -            if (qemu_log_separate()) {
> -                qemu_log("Trying to write privileged spr %d (0x%03x) at "
> -                         TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
> -            }
> +            qemu_log_mask(LOG_GUEST_ERROR, "Trying to write privileged spr "
> +                          "%d (0x%03x) at " TARGET_FMT_lx "\n", sprn, sprn,
> +                          ctx->base.pc_next - 4);
>              gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
>          }
>      } else {
> @@ -4114,12 +4104,9 @@ static void gen_mtspr(DisasContext *ctx)
>          }
>
>          /* Not defined */
> -        if (qemu_log_separate()) {
> -            qemu_log("Trying to write invalid spr %d (0x%03x) at "
> -                     TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
> -        }
> -        fprintf(stderr, "Trying to write invalid spr %d (0x%03x) at "
> -                TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "Trying to write invalid spr %d (0x%03x) at "
> +                      TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
>
>
>          /* The behaviour depends on MSR:PR and SPR# bit 0x10,
> --
> 1.8.3.1
>
>

