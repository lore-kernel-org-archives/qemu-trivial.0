Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qbs9l-0000Yy-Dr
	for mharc-qemu-trivial@gnu.org; Thu, 31 Aug 2023 20:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qbs9g-0000N8-Up
 for qemu-trivial@nongnu.org; Thu, 31 Aug 2023 20:36:57 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qbs9L-0003yW-TY
 for qemu-trivial@nongnu.org; Thu, 31 Aug 2023 20:36:56 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-273527a8fdeso13634a91.2
 for <qemu-trivial@nongnu.org>; Thu, 31 Aug 2023 17:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693528592; x=1694133392; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jG6ZCPZiU9m+IO+qPr5q8Xh7kOdEhSQ//hb0yLOiMcg=;
 b=do+nK/ENM30V6qRxqd9CJc4FqhytEb18dJmwUaSzCJ86Bu0KRxfrrTR8ZY5fYBwqmb
 Tuj6J1Ha/hqQ+25gOOw8ysTw3uLh1R2XceF+bFAz/SoSpl4xiL7wQiSNNQbTIzryGhS7
 sG0uxIzSX1WWoZWwt2oi7LtMZjbemj9g7cf1CDy319XGKIWLgi4VULTk/aLVUJcGusdu
 t+j9A2jdf2uUVPd+t/Xb4UpPquJfhjwhycuS0aUj/WerF/u2M2VcmLGyCu/HKMDifiHe
 M6jem22O8zsr3+selxkHlRt/tdRhoM+/eIcQa3fWSQjtylOoUMgwRM/WGF+hdAPxkpCc
 FlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693528592; x=1694133392;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jG6ZCPZiU9m+IO+qPr5q8Xh7kOdEhSQ//hb0yLOiMcg=;
 b=Dp25ueCn9fgmg6fCWjF6jf0Gc1PdiSt6OpeSZ/clYNfsYdz5DT8h0RxpTK+D6LKJI9
 mD4tFhJGDLNGHdqnsVE9p5tM48jB1Q+sXr7Aiqazw1HNoLDRzHDFsDVWW4TKQuPrYbZE
 pZ582EBBj4NlWyWrCt3cEQslAGEZRnbM07kfncVqNkdli8oGJTtf8pont7inEFnURhTr
 elCSwmL3eYdQzCTCGN0F3hW4uJXdduvh9jWX16zse7blmr52FSEIH/xX+ZOQCU1Fmqd8
 rimhdjBCUJX7U8J++2fbR4zPPsDBKHgpwD9McE1ZFYIuBgU1L8+OWATBYUXrkuT+kvqX
 Czzg==
X-Gm-Message-State: AOJu0YyZncjjFcbzwQQyhz3WZm8udn+0S5gzGHp5d8exK/gqyq6tkx2Z
 J0JCnVVA3nOvdSbkv04meAIFLg==
X-Google-Smtp-Source: AGHT+IGks/9QnTWTqH9/IwKnrpQme5JKpmjQJnyjOajqJkxRfMivGUwaU6cXgMWhc2k8VbSIx7Xr6A==
X-Received: by 2002:a17:90a:c688:b0:269:3771:7342 with SMTP id
 n8-20020a17090ac68800b0026937717342mr911835pjt.18.1693528592332; 
 Thu, 31 Aug 2023 17:36:32 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170902c20c00b001b8b1f6619asm1790758pll.75.2023.08.31.17.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 17:36:31 -0700 (PDT)
Message-ID: <4129dd8d-a626-d138-47fb-0cbb8f6ad4f4@linaro.org>
Date: Thu, 31 Aug 2023 17:36:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] arm64: Restore trapless ptimer access
Content-Language: en-US
To: Colton Lewis <coltonlewis@google.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>,
 qemu-trivial@nongnu.org, qemu-stable <qemu-stable@nongnu.org>
References: <20230831190052.129045-1-coltonlewis@google.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230831190052.129045-1-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.478,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 01 Sep 2023 00:36:58 -0000

On 8/31/23 12:00, Colton Lewis wrote:
> Due to recent KVM changes, QEMU is setting a ptimer offset resulting
> in unintended trap and emulate access and a consequent performance
> hit. Filter out the PTIMER_CNT register to restore trapless ptimer
> access.
> 
> Quoting Andrew Jones:
> 
> Simply reading the CNT register and writing back the same value is
> enough to set an offset, since the timer will have certainly moved
> past whatever value was read by the time it's written.  QEMU
> frequently saves and restores all registers in the get-reg-list array,
> unless they've been explicitly filtered out (with Linux commit
> 680232a94c12, KVM_REG_ARM_PTIMER_CNT is now in the array). So, to
> restore trapless ptimer accesses, we need a QEMU patch to filter out
> the register.
> 
> See
> https://lore.kernel.org/kvmarm/gsntttsonus5.fsf@coltonlewis-kvm.c.googlers.com/T/#m0770023762a821db2a3f0dd0a7dc6aa54e0d0da9
> for additional context.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>

Cc: qemu-stable@nongnu.org
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



r~

> ---
>   target/arm/kvm64.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 4d904a1d11..2dd46e0a99 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -672,6 +672,7 @@ typedef struct CPRegStateLevel {
>    */
>   static const CPRegStateLevel non_runtime_cpregs[] = {
>       { KVM_REG_ARM_TIMER_CNT, KVM_PUT_FULL_STATE },
> +    { KVM_REG_ARM_PTIMER_CNT, KVM_PUT_FULL_STATE },
>   };
>   
>   int kvm_arm_cpreg_level(uint64_t regidx)


