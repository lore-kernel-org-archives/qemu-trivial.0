Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNMzf-0001xG-BF
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 14:35:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNMzd-0001w4-Da
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 14:35:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNMzb-0008BN-Sb
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 14:35:41 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:44997)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNMzW-00084i-DM; Mon, 28 May 2018 14:35:34 -0400
Received: by mail-qk0-x244.google.com with SMTP id 185-v6so9721513qkk.11;
	Mon, 28 May 2018 11:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Eyg2NKSW+eoKXVpB8aGboPQzPlULRoWXqEdB1mF5j6I=;
	b=CbQB3S+wscc3oZ7/HgDur3tBK2LMFB4cskcNTFzm08FByVwpPh0JhUu+DNND7XKAb9
	h1JcNx+l+REJc70NyVItW5gsiwXUqxNK4Su15/fx7V0CFNrZG6CHyC3OOqzNu6Gsr7IT
	QintmLhPfuujiny2nxYnnuPI5pKG/J9d6PkMQNqtCdzRI9he5u29AN44rJ8DLD3KBeGR
	KBm5Jj8AzxUJ1MV1o81KaY+3Wm9a4IQA9YtTXN9bTC7b6LT92XfNn6QAYrithZbrqYFK
	dMQSWy1eyi++c3wtdTp1caRa358+7/IAQdDQFyv9f8nQEmiOl8pvFsZe3onN7Fut1v9l
	Rjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Eyg2NKSW+eoKXVpB8aGboPQzPlULRoWXqEdB1mF5j6I=;
	b=sMPJKCTqfRlprwxhnJ8R8+N7KrO8PnxaoGePupc0lh1l1reKGZxaMayHwxGkBIawfz
	bHoCGrKn6ykKHcFSvmeyyRmvNePwZKRyP98MPAoOwYCsuiy8Ok1Qqou6vkzIp6nd5dqO
	t/58WRsdj+D1Ug/ALlSrGaGNkiw/zww+cOaT707vVEUFT4nyaaLZTC54B6wrgk126Kwd
	rC1S+QVKZZI8v4npm8w9XGNV7EHjG6hCwFNlEOA1kaSDhUELxZ2f1gN8kV24RVxlLU/p
	g684wxMOxtDEFXT/KBQxXOu3VMK3XgOEOCtDgIMBykGhaMSk22wHusS1nP9vORrJdYe2
	p/wQ==
X-Gm-Message-State: ALKqPwdfRyQo4RlZjSTKwal5Nm8djxBqSIAB5NMCTNhIQZhwNvMRKKjM
	D6zui0uFspT8AQwXJzM7jrc=
X-Google-Smtp-Source: ADUXVKIMjbkwmRP5waDyLljQRSE4R3run49NrQ3rJFWmmKlCaJxYww0j97zkHUfJ3jFJb5oQ/VcsKA==
X-Received: by 2002:a37:9007:: with SMTP id
	s7-v6mr12575442qkd.354.1527532533738; 
	Mon, 28 May 2018 11:35:33 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	m16-v6sm6202578qtn.92.2018.05.28.11.35.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 11:35:33 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, David Gibson
	<david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org
Cc: qemu-trivial@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <1527531079-32717-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <90f9685c-8407-6ffc-922c-8dd1221c33cf@amsat.org>
Date: Mon, 28 May 2018 15:35:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1527531079-32717-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [PATCH] target/ppc: Use proper logging function
 for possible guest errors
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
X-List-Received-Date: Mon, 28 May 2018 18:35:42 -0000

On 05/28/2018 03:11 PM, Thomas Huth wrote:
> fprintf() and qemu_log_separate() are frowned upon these days for printing
> logging information in QEMU. Accessing the wrong SPRs indicates wrong guest
> behaviour in most cases, and we've got a proper way to log such situations,
> which is the qemu_log_mask(LOG_GUEST_ERROR, ...) function. So use this
> function now for logging the bad SPR accesses instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

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
> 

