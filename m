Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mg7Bo-0001X3-IK
	for mharc-qemu-trivial@gnu.org; Thu, 28 Oct 2021 11:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7Bk-0001T4-RX
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 11:19:34 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:39566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7Bh-0002D0-Ee
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 11:19:31 -0400
Received: by mail-pg1-x535.google.com with SMTP id g184so6687759pgc.6
 for <qemu-trivial@nongnu.org>; Thu, 28 Oct 2021 08:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jzLdy2T9f1krzAH6izlZNYapwlNKhJWudWp4jBFMMto=;
 b=Aw0u5w+7KsQ0TiPVzPPxGV2EREySzp/LiosS4vXBVNY3N5VmCxxn3zvPMlOyf9tU5C
 tEh8M9oNn80eZQCaRs3gKobpiV51vCc6LLzy+uSscOmxD1DOyqLHrxu+2ugWS7N28LFn
 E7So2DZ7jX6/c5YUyMFkdlHFBO6UvjVrVeRw0TmoKiwldTrZ1tBaizh7RUFYUSNJrPKe
 Xw8ycVkbV0nApmE0fYuLYuDnQNLPcBn1xqtjCpweJYQRuA2dVBBBvdluPnHDIJMPUkbd
 yvwqPna3qu3hqTMMTv7w/VL+wabpNaPi98v24NlT+4QgjCIrK7cayWZ/ZlHEP0PpAK0c
 D1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jzLdy2T9f1krzAH6izlZNYapwlNKhJWudWp4jBFMMto=;
 b=Pjmp+HSlucB0uiQ4A6BRaGBreYn8r+7k2QjYol4kcqqXs2G0I7uDnT1ICrMr9NbLe8
 tJqYAIujsro+9BzPzJOLdYo4ERMzVkvX4F30hrLomnq1i8AX6Ge1G9jkDuPa9o2bNJyx
 IvLHYZmFMxXJhE6xvBlMGW4/iMqSKTkkgMAQ8P5ZAOP2Q786icf+Glomb6Nkk5xPpaRH
 b5r9yIJEf6ZBA+NCMuHd73RMDf1cZRW4qmEJncmiaPOPjH482A3/yBhVFUotn2s/IKU3
 L03SZly9g3nbxHb3NqDrCXSVH6tLiJzOoKoqywQzCxrUHuxe8QPXrLShLjVoxx+mv8PC
 PQRA==
X-Gm-Message-State: AOAM530wKBH4wjw5h+8NfRC0D3+XCJ8aTUkSdTbWzTIFGQTegAHJrdY8
 Nn0+vLegkoT8m9r2j/hFPpaHJA==
X-Google-Smtp-Source: ABdhPJyyforXBYZyt842pwWsJHbNPyQ/odp/7TjTJo96vfbLoc2Z8Z+y4vjYY6oLOcvgXHH1RTQ+5w==
X-Received: by 2002:a63:7742:: with SMTP id s63mr3651774pgc.375.1635434368120; 
 Thu, 28 Oct 2021 08:19:28 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id 141sm3128232pge.23.2021.10.28.08.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 08:19:27 -0700 (PDT)
Subject: Re: [PATCH 07/24] bsd-user/arm/target_arch_cpu.h: Implment trivial
 EXCP exceptions
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Klye Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, =?UTF-8?Q?Mika=c3=abl_Urankar?=
 <mikael.urankar@gmail.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-8-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bd450847-b625-75e9-4a65-a1c2829b7720@linaro.org>
Date: Thu, 28 Oct 2021 08:19:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-8-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
X-List-Received-Date: Thu, 28 Oct 2021 15:19:34 -0000

On 10/19/21 9:44 AM, Warner Losh wrote:
> +        case EXCP_DEBUG:
> +            {
> +
> +                info.si_signo = TARGET_SIGTRAP;
> +                info.si_errno = 0;
> +                info.si_code = TARGET_TRAP_BRKPT;
> +                queue_signal(env, info.si_signo, &info);
> +            }

Usually this gets si_addr set too.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

