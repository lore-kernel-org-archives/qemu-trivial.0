Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llNcY-0003Y8-5K
	for mharc-qemu-trivial@gnu.org; Mon, 24 May 2021 23:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llNcV-0003TD-TI
 for qemu-trivial@nongnu.org; Mon, 24 May 2021 23:20:39 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llNcS-0004E0-FQ
 for qemu-trivial@nongnu.org; Mon, 24 May 2021 23:20:38 -0400
Received: by mail-pj1-x102c.google.com with SMTP id ot16so14080296pjb.3
 for <qemu-trivial@nongnu.org>; Mon, 24 May 2021 20:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w/awsc6h2IX5+sCqsOgOq5m/wMi0jeGEcOPhDdvCV0I=;
 b=ps7cBkRHXJcBX6YqMpVWj8MJt/Yesrs6p1s14V3tkhW2Nq9J2T5YAWXz0bJIpkvKhY
 CEGRgCZswmrw+DuBrBZi/i08JXlcJK8fyFBXmqYlvhGYSt+GksRRUh09osuDvB/hzDhN
 QvqP+pdXtnDrd31w4+zx7jr58/F1tflcDuX5U4Qb3RVcloHRGkDBcCLlYi5CCSDEu62W
 Rv0igs0Mir9h502kGkGFG6s7ij3O/1MpO7Yb6S5qVymBhfL3jHpAUkEjS4WGzZhL9c4A
 X4OfZ1sL2ik6XmwLu0emOGTECHx+xQrtyC9hnMtrXsvEOgVBJgID4KW177tK/BYCUiRa
 zhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w/awsc6h2IX5+sCqsOgOq5m/wMi0jeGEcOPhDdvCV0I=;
 b=d0L+siLlDsxkMEhWF6nYgii3CND48Po1GcoDaoUGqdPdQvRdAiL7PrlQro45zbO4mb
 RCCDL7AF4yXyZmaBjQlbRhyoHnrJTYrgdtGak0FDIOXMGJeJep4c7RAgbAkZd4IQHYxn
 DWCMitxC1Z9ctAA/FNuRaTSFyusv0TiFK8gn4zppyleTLttKM27YNprF5t2AQwtox5Bc
 5cMgmPZLn58mMIr16qeC/DP2LI1OmIx4aD2ru0uIU27SYIn7ambxF0KearTBmJw9UjKg
 2RS0r3iLTt/86yEQjrMUIhMBk5I7fuS5CCQ4KxVDvVh01FNUfVUfBvmhBLefmUwxqIab
 BUQA==
X-Gm-Message-State: AOAM533RlcFwqBKBSUu+azMp2x48zbvv+SQRNeSWAI/xhMwOgwR507Bk
 nUncZaN6xMrI/ICadY/p8bFyGmzAUd33IA==
X-Google-Smtp-Source: ABdhPJz4LpPX5EIaWTsrXZXDXzuamGNOYFCJ+eb8B7eq+/TvNzN+IeBbvmkWB0SbmlIEAVVN+y916Q==
X-Received: by 2002:a17:90a:a60d:: with SMTP id
 c13mr2513527pjq.172.1621912832624; 
 Mon, 24 May 2021 20:20:32 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 b12sm661880pjd.22.2021.05.24.20.20.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 20:20:32 -0700 (PDT)
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Swetha Joshi <swethajoshi139@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
Date: Mon, 24 May 2021 20:20:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210525025823.3208218-1-swethajoshi139@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 25 May 2021 03:20:40 -0000

On 5/24/21 7:58 PM, Swetha Joshi wrote:
> Signed-off-by: Swetha Joshi <swethajoshi139@gmail.com>
> ---
>   target/arm/kvm64.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

You're still missing the commit message.

> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index dff85f6db9..47a4d9d831 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -1403,7 +1403,10 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>       hwaddr paddr;
>       Object *obj = qdev_get_machine();
>       VirtMachineState *vms = VIRT_MACHINE(obj);
> -    bool acpi_enabled = virt_is_acpi_enabled(vms);
> +    bool acpi_enabled = false;
> +#ifdef CONFIG_ARM_VIRT
> +    acpi_enabled = virt_is_acpi_enabled(vms);
> +#endif /* CONFIG_ARM_VIRT */
>   
>       assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
>   
> @@ -1426,12 +1429,13 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>                */
>               if (code == BUS_MCEERR_AR) {
>                   kvm_cpu_synchronize_state(c);
> -                if (!acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
> -                    kvm_inject_arm_sea(c);
> -                } else {
> +#ifdef CONFIG_ACPI_APEI
> +                if (acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
>                       error_report("failed to record the error");
>                       abort();
>                   }
> +#endif /* CONFIG_ACPI_APEI */
> +                kvm_inject_arm_sea(c);
>               }

Otherwise the actual patch looks ok.

I'm a bit surprised that you need the second hunk.  I would have expected the 
entire block to be optimized away with the 'acpi_enabled = false' being 
propagated into the outermost IF.


r~

