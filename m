Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r3A7O-00049a-Pj
	for mharc-qemu-trivial@gnu.org; Wed, 15 Nov 2023 02:15:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r3A7M-00046o-P1
 for qemu-trivial@nongnu.org; Wed, 15 Nov 2023 02:15:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r3A7E-0001gU-OY
 for qemu-trivial@nongnu.org; Wed, 15 Nov 2023 02:15:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700032512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lB6udpVYL4COw12qJTP2y8H2h3HHViZAGllMmJe3eSo=;
 b=Ohs4Chb47yCajBg0i5WmcE6+nvn+0wz8t19uni0pLF3LXUNlsIXmdEpjSSXIcb6otux1/Z
 mVtHotOddnaJa4eTldNUu/qOwSX7IVdaajngOLfVClqdA4fJgDkFHytbDuhEnUiHcHf53m
 596q6aUm/aPZQFg/hR7kJuxBEOoAR28=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-UEpnmfw5M6utYGXTcUdBGg-1; Wed, 15 Nov 2023 02:15:10 -0500
X-MC-Unique: UEpnmfw5M6utYGXTcUdBGg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9e28d82339aso417689466b.2
 for <qemu-trivial@nongnu.org>; Tue, 14 Nov 2023 23:15:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700032509; x=1700637309;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lB6udpVYL4COw12qJTP2y8H2h3HHViZAGllMmJe3eSo=;
 b=JrhXq9ZJl0vpD8XxC/efgdXxZEBocsCgDLPr8TomaILjFxNh5NgGeG631VseE9x1ev
 Lfcq4/gzdCxCl0+9tl6BZkT08fr3oYuvuGiwK1bN7GC2JAdymQqNN0uK1G3ELzc5tJa9
 NSny050ICgd1maKl7peaCgi+TF7wNeqtsT1Bpt53cVRF5JiDUdY+OVjvurbUJ/0aaROp
 t963J6HYaeebXw+yZTciluVS4r4rhQ9GZtb6ToUIKxyfFMgMveOaOf2o3YIW/cC8VWgH
 sdoRFzU5e+Pu9nUsVD8jqQa59NQntYzIXo7B6pfTP9uO31XJR8VqM+YZRNNq/K0pcuBB
 RMww==
X-Gm-Message-State: AOJu0YyBwwaSMFQFwceN3EvmSfsy4731+fTozche3PfGTWNoAYiQNrIH
 I4zQoiZB7cQ13VJdO0qgqV+svDyb0FHOjk1LoTv5Mv6nZsCU3SPhKKudYPQFJusJSTLvpAFZ8vU
 4FGdfmJFqPpf24B5CxA==
X-Received: by 2002:a17:906:4757:b0:9e7:192b:81a9 with SMTP id
 j23-20020a170906475700b009e7192b81a9mr7675170ejs.45.1700032509616; 
 Tue, 14 Nov 2023 23:15:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgpiwCLNBOzv1ercXter90EHQ/8EhMr6HuBVCkVGp6jC+vuMQQC5LADv5yMCqy5HOACIaw+g==
X-Received: by 2002:a17:906:4757:b0:9e7:192b:81a9 with SMTP id
 j23-20020a170906475700b009e7192b81a9mr7675158ejs.45.1700032509339; 
 Tue, 14 Nov 2023 23:15:09 -0800 (PST)
Received: from [192.168.0.6] (ip-109-43-176-122.web.vodafone.de.
 [109.43.176.122]) by smtp.gmail.com with ESMTPSA id
 lt7-20020a170906fa8700b009a1a5a7ebacsm6554420ejb.201.2023.11.14.23.15.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 23:15:08 -0800 (PST)
Message-ID: <7b042607-6296-4693-9390-d3cd94770182@redhat.com>
Date: Wed, 15 Nov 2023 08:15:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH trivial 17/21] target/riscv/cpu.h: spelling fix: separatly
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Rajnesh Kanwal <rkanwal@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20231114165834.2949011-1-mjt@tls.msk.ru>
 <20231114165834.2949011-18-mjt@tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231114165834.2949011-18-mjt@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 15 Nov 2023 07:15:21 -0000

On 14/11/2023 17.58, Michael Tokarev wrote:
> Fixes: 40336d5b1d4c "target/riscv: Add HS-mode virtual interrupt and IRQ filtering support."
> Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   target/riscv/cpu.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index bf58b0f0b5..d74b361be6 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -214,13 +214,13 @@ struct CPUArchState {
>   
>       /*
>        * When mideleg[i]=0 and mvien[i]=1, sie[i] is no more
> -     * alias of mie[i] and needs to be maintained separatly.
> +     * alias of mie[i] and needs to be maintained separately.
>        */
>       uint64_t sie;
>   
>       /*
>        * When hideleg[i]=0 and hvien[i]=1, vsie[i] is no more
> -     * alias of sie[i] (mie[i]) and needs to be maintained separatly.
> +     * alias of sie[i] (mie[i]) and needs to be maintained separately.
>        */
>       uint64_t vsie;
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


