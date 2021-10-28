Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mg7mq-0005Ar-MR
	for mharc-qemu-trivial@gnu.org; Thu, 28 Oct 2021 11:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7mk-00052D-1w
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 11:57:46 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:40598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7mi-0004W4-43
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 11:57:45 -0400
Received: by mail-pg1-x529.google.com with SMTP id l186so6796638pge.7
 for <qemu-trivial@nongnu.org>; Thu, 28 Oct 2021 08:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XDDkQeHZ0dijGtSKlhGqjNUEl29/r8+MY+SRNPeDCrg=;
 b=iyCPo4L2ip3tRO/molwyZg9mVUEzrWwGaEEPrJ/GUqS4lMESbwuTM3VbeYsl1bnkXZ
 txewQdHGw927iCEwKyurt1NFIXAsc2N8ndEdp7kVhb2siiXo45+JvioLlasW0yKO9WxT
 AmfC9bM9PEIcJRVTAX6yEAh2yb4swZ2iBaYil8zJtMTuPYVTYnPH0Go3VZbPpryicor7
 jfalwDz+7bFKlMhHPFzrd/sBKIp9DfdLiHdKtxYlU3nZwpjEaygtM9X3EXM/T8jHz8X9
 ZEuqGYfvTltae6eX0hefG3di94FCHGtFkQs6uUSY8mFOaa6ZQ9AdhAGbUs7PtjIsgAb5
 huxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XDDkQeHZ0dijGtSKlhGqjNUEl29/r8+MY+SRNPeDCrg=;
 b=2H3100DKjw06sb79bZgDO58HFybQ1pzxnq8YWq3ftK/dG5T+6DPht79bP6fVUsFo5f
 1HOf+h16S8Qs08QcHqPUCOi3qrDe5odZV06222gzrHLAJNH1HW4+o8UK50hy8+Sg9uup
 MZAeaUhZL0ZLvBd2g8HmzYyyoPcDQwl+Hg9bjkvMfSakYQgs2nSkmyrIX/NzR4XTm1X+
 KGsCcB0OvHOQyNPyOT6uVSPR320lglr+QQdRpuZ2JwIlYcj1vqmNuwIeaAdMwWlI6pIU
 sWeJBssHztU4uPJTNWc6bEt0rVfIH8unfC8dtj5OpLQL9BGo2U+oLi2DTyX0Z+rUwvL7
 G8cg==
X-Gm-Message-State: AOAM530ibQLZJYQzWioIQt9Jy6r66g6ZULUr5xWAQZJUzPNqQ+Ywl3zP
 K/reKE+jehFrcDPxice/DSow3A==
X-Google-Smtp-Source: ABdhPJzHt8V+FBFCwkJFGAjwVhotNpolupuYxjsEsjXvvCcvmj/IQ0J3+gvAKWOhW/Y8lDqCdW8ezw==
X-Received: by 2002:a05:6a00:1a4c:b0:44b:1fa6:532c with SMTP id
 h12-20020a056a001a4c00b0044b1fa6532cmr5053934pfv.64.1635436662468; 
 Thu, 28 Oct 2021 08:57:42 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id 11sm3813499pfl.41.2021.10.28.08.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 08:57:42 -0700 (PDT)
Subject: Re: [PATCH 13/24] bsd-user/arm/target_arch_thread.h: Routines to
 create and switch to a thread
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Klye Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-14-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a7bd5ecc-8949-c7ae-6af7-9494eace94e0@linaro.org>
Date: Thu, 28 Oct 2021 08:57:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-14-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 28 Oct 2021 15:57:46 -0000

On 10/19/21 9:44 AM, Warner Losh wrote:
> +    regs->spsr = ARM_CPU_MODE_USR;
> +    if (entry & 0x1) {
> +        regs->spsr |= CPSR_T;
> +    }

(1) Why are you setting SPSR not CPSR?
(2) Changes to CPSR cannot be made manually; you need cpsr_write.


r~

