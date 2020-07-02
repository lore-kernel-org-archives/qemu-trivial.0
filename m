Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jr4LA-0003NV-2W
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jul 2020 14:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jr4L8-0003Lj-3n
 for qemu-trivial@nongnu.org; Thu, 02 Jul 2020 14:53:42 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:40399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jr4L6-0007qy-59
 for qemu-trivial@nongnu.org; Thu, 02 Jul 2020 14:53:41 -0400
Received: by mail-pf1-x443.google.com with SMTP id u5so12916180pfn.7
 for <qemu-trivial@nongnu.org>; Thu, 02 Jul 2020 11:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=39+cgPDBRmmBW5bBlgb/2KDUXd1keNDPZ/MXYb8vINs=;
 b=gQr2a9xiFhQP71azFZT8Atb1XmgkGBDnJjgsm4TpuzfXiyb7Oy/tn5mj6s9js0YdF7
 ILuu/3CgKoEYYtaGyx2Z1u8xSZAPqcvt22OWf4mGLgioy0Qseqtf6+s+aN14bDh1cE73
 +RIaAo/FFAsqwVEcN0e4BVExB8/V4cEFIZu0pg368Fs31XU+V8GLEAqu1GX54uwKgban
 dxrbfga9UOeripjK3odr1Y1iZVo9BdOSIC+z51n8j3LFKs4ulPXkxvpUIXZI4jWPCFFB
 RdkH2ryhVzJkTM3+3fsgROH8uhCZ8wlgRYCKOLe998iroVDE78pQnCNll/tXssQzmOBK
 kCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=39+cgPDBRmmBW5bBlgb/2KDUXd1keNDPZ/MXYb8vINs=;
 b=Plj1S+cwXyo6SpWET//NdYVZiZBch82gzY9z1IiovnGrsUlxpJtRl7GPaRHf6/RghM
 XOnGrtGjMKvxZn7fcFm1+mLP7ldL053GVJhV26ZkR8RTU9L2fzvy1bs7Ix04T2/3+tta
 8cv9o+hbrgwY+aLEOwj+7MKfpTQIxsJeRroabBWRKMY8qV/hTvSToT9i73BXs3gciTmC
 hCEHSsIYbqpM+QiyFZjbqtrG60n7nPVvEBesfDhLJ3xAlEopO4c6RHOfUlWCxAAq0t1o
 99bFobAEQRRQ5iN+q5LytFjjVlCCSRa5HGwkLC1Ug528zlPbFnDM0n2hvPEkm0phdwEp
 504Q==
X-Gm-Message-State: AOAM532piMRA3pLwsLV7IKufPym5KZulZKlAq+g7cMIkFtQ2VXENSuBe
 rn1ao1tJszxgYghVheM+DhHMBw==
X-Google-Smtp-Source: ABdhPJwF5Z0qifZ+R713hR8BYnr5TnlNuW9dl3JcuTRFW2OTp6HK+8V3W0AthW2B8aSWxFErNNFFkg==
X-Received: by 2002:a62:ce46:: with SMTP id y67mr28023468pfg.118.1593716017127; 
 Thu, 02 Jul 2020 11:53:37 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id q29sm9206587pfl.77.2020.07.02.11.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2020 11:53:36 -0700 (PDT)
Subject: Re: [PATCH 3/3] target/nios2: Use gen_io_start around wrctl
 instruction
To: Wentong Wu <wentong.wu@intel.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, marex@denx.de, crwulff@gmail.com,
 peter.maydell@linaro.org
References: <20200629160535.3910-1-wentong.wu@intel.com>
 <20200629160535.3910-3-wentong.wu@intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3260735e-05ab-2d42-f7e4-914ad804f543@linaro.org>
Date: Thu, 2 Jul 2020 11:53:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200629160535.3910-3-wentong.wu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jul 2020 18:53:42 -0000

On 6/29/20 9:05 AM, Wentong Wu wrote:
> wrctl instruction on nios2 target will cause checking cpu
> interrupt but tcg_handle_interrupt() will call cpu_abort()
> if the CPU gets an interrupt while it's not in 'can do IO'
> state, so add gen_io_start around wrctl instruction. Also
> at the same time, end the onging TB with DISAS_UPDATE.
> 
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> ---
>  target/nios2/translate.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
> index 83c10eb2..51347ada 100644
> --- a/target/nios2/translate.c
> +++ b/target/nios2/translate.c
> @@ -32,6 +32,7 @@
>  #include "exec/cpu_ldst.h"
>  #include "exec/translator.h"
>  #include "qemu/qemu-print.h"
> +#include "exec/gen-icount.h"
>  
>  /* is_jmp field values */
>  #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
> @@ -518,7 +519,11 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
>      /* If interrupts were enabled using WRCTL, trigger them. */
>  #if !defined(CONFIG_USER_ONLY)
>      if ((instr.imm5 + CR_BASE) == CR_STATUS) {
> +        if (tb_cflags(dc->tb) & CF_USE_ICOUNT) {
> +            gen_io_start();
> +        }
>          gen_helper_check_interrupts(dc->cpu_env);
> +        dc->is_jmp = DISAS_UPDATE;
>      }
>  #endif

This isn't right.  Not so much the gen_io_start portion, but the entire
existence of helper_check_interrupt.

The correct way to acknowledge interrupts after changing an interrupt mask bit
is to exit the TB back to the cpu main loop.
Which you are doing here with DISAS_UPDATE, so that part is fine.  (Although
you could merge that into the switch statement above.)

Looking at nios_pic_cpu_handler, there are two other bugs:

1) Get rid of env->irq_pending and use cpu_interrupt/cpu_reset_interrupt instead.

2) Do not check env->regs[CR_STATUS] & CR_STATUS_PIE.  That variable does not
belong to the pic and should not be checked there.  The check belongs in
nios2_cpu_exec_interrupt, and is in fact already there.


r~

