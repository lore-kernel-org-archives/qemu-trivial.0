Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mg7x8-0001bA-6Y
	for mharc-qemu-trivial@gnu.org; Thu, 28 Oct 2021 12:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7x1-0001Wc-3e
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 12:08:26 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:45938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7wz-00068J-N1
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 12:08:22 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so5115517pjb.4
 for <qemu-trivial@nongnu.org>; Thu, 28 Oct 2021 09:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TvCdERh+x8g+DqB6s8ObpiiAxjXBc694VA9Qi0i43kA=;
 b=IW27pPJT3VMd0CnvcxxZw1mpyqN9NqJTrgJ0OWHThc14dY/mKA/ZnZdRI21Q1bu94Q
 XDYvVYvUtmVt30MHhHbenhMwVJOqpBKR7yneyDtULMIxPCCgavKRYfoNS/NA9KtqPZbe
 qKHYxFqsSsq+cREyT0nATcKkAsAiSNrqHFKqpwiNikLUvdsgcgO8M8JsXGnCrVmbWSr2
 lIzcks7RiCLAs0b33uGW4xisXtoSFZm+YyVt+Q7PpVvdkudp1qJZaLFOWwvXM3mrqHs7
 vS5NbgPf0/6HN+iemPa516S5s6JIPMWaqfP0/MdoYDL0DxduXDd0ectCcdW8pExYAEPM
 z30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TvCdERh+x8g+DqB6s8ObpiiAxjXBc694VA9Qi0i43kA=;
 b=GjNsNajFpL2O6+fqL1JNOnBUbYWzNYmBAA+7T4Ec0XJiL5g6u9GsN2F/PYKv/LAnGS
 x24gL1iVIesZcO7bpbpOnO0MTjj6Gsd0h9pkxu5w0EeMLgViA1ztYowWoOVSaB/HxqN8
 KD43Jo5KnD6yukCGx7Y9gMJdiWAwwqYfLIRAvvpr8DX7cjlWrGQtuuwl5asUraXZ2hIf
 wVe2qrPA1WPlfk5pwL65Z8urP25HnWUiJu1R/rLoT0fQbJN/RZq1FqUwOFwlKgRAV2yL
 1G9mS7rzfje9QEb8fTFf4eE6ZK72DnPxXF/3VOvkqkN17vqHCzx92+u+Sji9VTkNF32i
 KkfA==
X-Gm-Message-State: AOAM531ZiLmyjMoWV1M0F+caC7J5J5EbWd7ynJbxQzKxwRGU9MXvloik
 hJgAJf5HDtx+R7T+VYj9fEjI+A==
X-Google-Smtp-Source: ABdhPJxuZa2D/jGdk6NrAE40qEmS4t7oWOVYWqw2j70dGGy9reg5kOYxCfS76ap01Gv/cYE8ilHaEw==
X-Received: by 2002:a17:90a:bb12:: with SMTP id
 u18mr5510351pjr.44.1635437299929; 
 Thu, 28 Oct 2021 09:08:19 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id a19sm3150612pgh.24.2021.10.28.09.08.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 09:08:19 -0700 (PDT)
Subject: Re: [PATCH 16/24] bsd-user/arm/target_arch_elf.h: arm get_hwcap2 impl
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Klye Evans <kevans@FreeBSD.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-17-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <da72bf36-d4c1-0828-71f9-2b6cbd538ce1@linaro.org>
Date: Thu, 28 Oct 2021 09:08:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-17-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Thu, 28 Oct 2021 16:08:29 -0000

On 10/19/21 9:44 AM, Warner Losh wrote:
> Implement the extended HW capabilities for HWCAP2.
> 
> Signed-off-by: Klye Evans<kevans@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_elf.h | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

