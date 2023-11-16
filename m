Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r3hAq-0004XI-4M
	for mharc-qemu-trivial@gnu.org; Thu, 16 Nov 2023 13:33:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r3hAk-0004IY-Jf
 for qemu-trivial@nongnu.org; Thu, 16 Nov 2023 13:33:02 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r3hAi-0002ZE-Fh
 for qemu-trivial@nongnu.org; Thu, 16 Nov 2023 13:33:02 -0500
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5bdf5a025c1so847423a12.0
 for <qemu-trivial@nongnu.org>; Thu, 16 Nov 2023 10:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700159578; x=1700764378; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VZ6GM2dKcS6mkSmOYBXd+y+aSuA3VKtwauyHooCA7zM=;
 b=FYxPfUnaQbtD9nX6/3zIW1dZf74NYsSJKijLcfxmdBbgL4uogDy0UylSkt32HTcfvV
 DRUcfNrjhiwK82DVdqyAFvvAG0tkuqbC0Bp6ZdUEprdPAEzXYQAcfoLL9UqUApGXyoNv
 P3TDb5+4fSnE4IAmQLE+HWdvasp6bCDzQs6wFzG2JkGckFZRWaHGCgkScocSon6UaJxL
 IlkCnPG9QbZLMNhaUq0icvw/2qki/eFkskaCk81pPv18NDsO6l5ARGbB78hZSrc5tISX
 KQpSSbe1PDE8X1r0HGn/dQXPljCP5+GqoUjz7MARM/FODb04Q6/TwJaHHeHHenjE86c1
 TTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700159578; x=1700764378;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VZ6GM2dKcS6mkSmOYBXd+y+aSuA3VKtwauyHooCA7zM=;
 b=YZ3OlY6DC2kCvLFrjiEMDrIucZMTa6DK0DFG3kdbmQaIj60c2KCHe5bbi8l4+Ekm/w
 wIPgwROTTpHv7s+2QxaJ29oRTcFZrbVtu4jMuZDLLft86zZZnCmZgbwOsux67oznF6ne
 GAKE0mfcBDBzUYYs9adIExmQnAhhztXe3s29AzW4r04GJgN9RDlYDk2ZCEL6staP9HBn
 uapNaKqk1NPvp5I6y4EEpoRU4YIl+09WDGxWaDlnqAfm3ngAJxCTWsRC1g79b9m+1+Dk
 sKId/+EvX+Z4aPe2aqL7/ezS+9ARUJA80yAWtoIjk70vhKEn5psejtddHfv4r01KCwyd
 JLKg==
X-Gm-Message-State: AOJu0YyWHKPIy4v8f5FmXc9ZMharG1XQwxKybPZSS7vNuFTX1p8lg7Wb
 +srbe/9UVHocAFXT+pNGWdCKVg==
X-Google-Smtp-Source: AGHT+IHRrtIFZTvM013J6SRW+W20a8RhF86w+Xx8dmb86TgIdCxmZSiyI5afZXbi8W3nE/c6z+sTPg==
X-Received: by 2002:a05:6a20:1611:b0:188:39e:9054 with SMTP id
 l17-20020a056a20161100b00188039e9054mr26520pzj.6.1700159578637; 
 Thu, 16 Nov 2023 10:32:58 -0800 (PST)
Received: from ?IPV6:2804:7f0:bdcd:fb00:6501:2693:db52:c621?
 ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 m63-20020a625842000000b006bdd1ce6915sm36435pfb.193.2023.11.16.10.32.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 10:32:58 -0800 (PST)
Message-ID: <e97bf3de-12d8-42ca-b728-4f9edcbc50e2@ventanamicro.com>
Date: Thu, 16 Nov 2023 15:32:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix SiFive E CLINT clock frequency (#1978)
Content-Language: en-US
To: =?UTF-8?Q?Rom=C3=A1n_C=C3=A1rdenas?= <rcardenas.rod@gmail.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org
References: <20231116120702.53170-1-rcardenas.rod@gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231116120702.53170-1-rcardenas.rod@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 16 Nov 2023 18:33:03 -0000

I believe you forgot to add your Signed-off-by tag. Without it we can't accept
the patch hehe

Since you'll need to send another version with the S-o-b, please change the commit
title to

"riscv: Fix SiFive E CLINT clock frequency"

That way other people will quickly identify which sub-tree this patch belongs. The Gitlab
bug number you put it in the end of the commit msg in a tag:

On 11/16/23 09:07, Román Cárdenas wrote:
> If you check the manual of SiFive E310 (https://cdn.sparkfun.com/assets/7/f/0/2/7/fe310-g002-manual-v19p05.pdf?_gl=1*w2ieef*_ga*MTcyNDI2MjM0Ny4xNjk2ODcwNTM3*_ga_T369JS7J9N*MTY5Njg3MDUzNy4xLjAuMTY5Njg3MDUzNy42MC4wLjA.), you can see in Figure 1 that the CLINT is connected to the real time clock, which also feeds the AON peripheral (they share the same clock).
> 
> In page 43, the docs also say that the timer registers of the CLINT count ticks from the rtcclk.
> 
> I am currently playing with bare metal applications both in QEMU and a physical SiFive E310 board and I confirm that the CLINT clock in the physical board runs at 32.768 kHz. In QEMU, the same app produces a completely different outcome, as sometimes a new CLINT interrupt is triggered before finishing other tasks.
> 
> You can check issue #1978 on GitLab for more information.
>

Like this:

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1978


The rest of the commit msg and the code looks good to me. Thanks,



Daniel

  
> ---
>   hw/riscv/sifive_e.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 0d37adc542..87d9602383 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -225,7 +225,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
>               RISCV_ACLINT_SWI_SIZE,
>           RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
>           RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
> -        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
> +        SIFIVE_E_LFCLK_DEFAULT_FREQ, false);
>       sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
>   
>       /* AON */

