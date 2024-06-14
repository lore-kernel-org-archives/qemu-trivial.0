Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sIEdC-0005Tm-4m
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2024 17:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1sIB30-0001mi-9m
 for qemu-trivial@nongnu.org; Fri, 14 Jun 2024 13:49:10 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1sIB2y-0001NC-OO
 for qemu-trivial@nongnu.org; Fri, 14 Jun 2024 13:49:10 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-70599522368so1874408b3a.2
 for <qemu-trivial@nongnu.org>; Fri, 14 Jun 2024 10:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718387347; x=1718992147; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DSstIyNLINljXew1LhEHJRICYF2flOq5uVlCCGe9IvI=;
 b=isKJKw1Vh7/HsO/gvUZlmyjgIZCje7Klcuff/8Jss7aLCci9PXdF6/PEdVx+cvsh+8
 +i5pK0/9TCo5CiYmEeJ+Siw5C9z5Ve14rbe4goJpwE2Rd2SzPMViQ0tT8KXgsDnm/1Fp
 uZMctz7Rhd//jxRgdp6dT1Os2MqGQSMCRSJ9DuWJyvlAE+12TVEKiV8O/zuhrtdFiVXY
 ghrpyQrbyYzDzdEdiGldITv0peCqitpWMIClTXfIfelQp2RE7+CZjAmJSIpwyAv4IEOJ
 FHX+6F6OOD3ijr/S/URSqEpkpAuyl8GhySncIXrRSgamoxBC/5fUnPwGNEOEdz6/lXQu
 Mq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718387347; x=1718992147;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DSstIyNLINljXew1LhEHJRICYF2flOq5uVlCCGe9IvI=;
 b=ZTZZYJpgfXphmGQfQPISgZ9Q31J5i25/vV9mhFbbQ1jQLRdGkOos4kidUplGF95XJD
 ejQ/SZURs9JdSYX8V5163xh/pAgMIvkYhb9S29dzGcPBkTBvJ4nXRawaS+x01+4xNE+o
 rEQvkNB5S/++uLD9ks/ToyeOzAv12KaUmcE4MaO8XwIBk4ldXFjK/hop+k//GwTOf/0N
 gI6gQizrv+EYY3tBtaVHm9hR0Ebmw4N5H9W9ryr/fCa7fZk9IfFZ+dL1h8JcSSA5O4aO
 eOGA55vve1U0xh7uFSCT1ZNczUIhwh/Ay9KeIEHYgRrTtQotwCuO/9fqKRlRqUMFSncN
 gavQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm8DVJ0ELybkeWwkKHkbjrE/yM5W55zzfIGupOBPIlv7KVwUV144YYDfw8mrdJcQg0g+Hh7/y1+JN5qS75NJLq5NPDW/dx0Q==
X-Gm-Message-State: AOJu0Yw0g16VgAdH0b6fiDd9EGFioJtBoQRTZ0n2VAc0+h27cZaN2p4a
 LAMbx+crCS4CDsuAXZZcH6uUmGHKmd5uKe/fzOTJxfe4FkoCeL5c+tlPwYUXMPc=
X-Google-Smtp-Source: AGHT+IHYJqZpp9oj0xE0sNK4OWP400qudps0+BRC3X45J4VYyPtYUKIxQK10HYQmvQU1fEEsTp0tYQ==
X-Received: by 2002:a05:6a00:2b1:b0:705:bd9d:a7c8 with SMTP id
 d2e1a72fcca58-705d70f71a9mr3150301b3a.4.1718387347155; 
 Fri, 14 Jun 2024 10:49:07 -0700 (PDT)
Received: from ?IPV6:2604:3d08:9384:1d00:5b09:8db7:b002:cf61?
 ([2604:3d08:9384:1d00:5b09:8db7:b002:cf61])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6fedcf36b7dsm2913677a12.6.2024.06.14.10.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 10:49:06 -0700 (PDT)
Message-ID: <baf59b50-c6b0-4904-839f-2e13565db92c@linaro.org>
Date: Fri, 14 Jun 2024 10:49:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpu: fix memleak of 'halt_cond' and 'thread'
Content-Language: en-US
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <3ad18bc590ef28e1526e8053568086b453e7ffde.1718211878.git.quic_mathbern@quicinc.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <3ad18bc590ef28e1526e8053568086b453e7ffde.1718211878.git.quic_mathbern@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 14 Jun 2024 17:38:44 -0400
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
X-List-Received-Date: Fri, 14 Jun 2024 17:49:10 -0000

On 6/12/24 10:04, Matheus Tavares Bernardino wrote:
> Since a4c2735f35 (cpu: move Qemu[Thread|Cond] setup into common code,
> 2024-05-30) these fields are now allocated at cpu_common_initfn(). So
> let's make sure we also free them at cpu_common_finalize().
> 
> Furthermore, the code also frees these on round robin, but we missed
> 'halt_cond'.
> 
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>   accel/tcg/tcg-accel-ops-rr.c | 1 +
>   hw/core/cpu-common.c         | 3 +++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
> index 84c36c1450..48c38714bd 100644
> --- a/accel/tcg/tcg-accel-ops-rr.c
> +++ b/accel/tcg/tcg-accel-ops-rr.c
> @@ -329,6 +329,7 @@ void rr_start_vcpu_thread(CPUState *cpu)
>           /* we share the thread, dump spare data */
>           g_free(cpu->thread);
>           qemu_cond_destroy(cpu->halt_cond);
> +        g_free(cpu->halt_cond);
>           cpu->thread = single_tcg_cpu_thread;
>           cpu->halt_cond = single_tcg_halt_cond;
>   
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index bf1a7b8892..f131cde2c0 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -286,6 +286,9 @@ static void cpu_common_finalize(Object *obj)
>       g_array_free(cpu->gdb_regs, TRUE);
>       qemu_lockcnt_destroy(&cpu->in_ioctl_lock);
>       qemu_mutex_destroy(&cpu->work_mutex);
> +    qemu_cond_destroy(cpu->halt_cond);
> +    g_free(cpu->halt_cond);
> +    g_free(cpu->thread);
>   }
>   
>   static int64_t cpu_common_get_arch_id(CPUState *cpu)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

