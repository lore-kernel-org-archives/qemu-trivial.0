Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgUPT-00033F-9S
	for mharc-qemu-trivial@gnu.org; Fri, 29 Oct 2021 12:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgUPP-00030u-4m
 for qemu-trivial@nongnu.org; Fri, 29 Oct 2021 12:07:11 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:35655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgUPB-00041T-HA
 for qemu-trivial@nongnu.org; Fri, 29 Oct 2021 12:07:09 -0400
Received: by mail-pl1-x635.google.com with SMTP id n18so7153604plc.2
 for <qemu-trivial@nongnu.org>; Fri, 29 Oct 2021 09:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7ns362gp5sK83spmRPbeiyp8Oz8WXfk9dJsN9mwgWH8=;
 b=CI7iOi7c/GUDVt5f3UefO0Ivh7Tb49a0X35CeuX5ZoOloiGsFSZnF7PMQ531gTaOEC
 0wQvMmtU6+ly6Jk8is5SSorlwhhcE4xlGVuyRqtayh47chaPq/G6Cn0K1hmLBrno5I2Y
 FVIXoFfAxsexeU7B+knjz0HmEEhnmOmsw7E18GXJm3U6dbV2RQQQqFoPgRV0L//so0Ws
 SPxsl4PPC5+mhQxQ3gkM7X81r6KV94pIdKFQpT3Z8CkyyhwPg016CqH4UxLP/OPtZ0MG
 nPYZyQZBZbqVsRkKZ5TrPBAuTYBbKW/oxW8UbusKGt8OWYshlARSPzm7agHNKpIIxkNB
 3m0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7ns362gp5sK83spmRPbeiyp8Oz8WXfk9dJsN9mwgWH8=;
 b=d6kllHgqFQJJFMCEjaGMJ1ba0VUrTNwvcQaMV1RKSCz8w57HZ2X3juuD7Ct65zlaS0
 ioIABfvsrh9e+l14FKSRQU089lrnhCHz80Qb+P3B4DiSuLMrq8mcFtmNo5gCT6sCxana
 fJtu8dvIVumU0BJk8/mMdODLPhFBUO35D7wfyWiyxzrQ+LaoxLjUXZeQES3yzWegeG2Q
 FGPc+lep2wx/Ifrq9Majyaknt4Po0Pdo2XR7AcepRN+AbSwMesbmPlewuKNxFa5QkoLF
 ghPsKhwz9PlP0MiOSA33PmyS/PR7sNDxQsmk+usjonfDL9+O4vQBFNoMEi49UCHl3Esa
 +n3Q==
X-Gm-Message-State: AOAM530Cq0U2Trr1Ov4FkILOt8OoKQ+RsjqZ6rr4A1i5WqC5e2KIldvK
 UMkfyt4VlfdHUL55ws9zdT0t1w==
X-Google-Smtp-Source: ABdhPJz2Fa6StlsW66F/fXHXQaE+4LbNrSQrGLzrQyTYwoRDYH8guiNWIar0E3nXHC0rI0fINWxFMg==
X-Received: by 2002:a17:902:e789:b0:140:801:1262 with SMTP id
 cp9-20020a170902e78900b0014008011262mr10606102plb.42.1635523614167; 
 Fri, 29 Oct 2021 09:06:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id ml14sm2663781pjb.43.2021.10.29.09.06.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 09:06:53 -0700 (PDT)
Subject: Re: [PATCH 13/24] bsd-user/arm/target_arch_thread.h: Routines to
 create and switch to a thread
To: Warner Losh <imp@bsdimp.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Stacey Son <sson@freebsd.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Klye Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-14-imp@bsdimp.com>
 <a7bd5ecc-8949-c7ae-6af7-9494eace94e0@linaro.org>
 <CANCZdfqmiH0V+TLzNY0tL4_DHUXkYLJwOn-UtNvHdjrZcWarBA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <509097c0-54ce-0a67-229c-83467ddc2a6a@linaro.org>
Date: Fri, 29 Oct 2021 09:06:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CANCZdfqmiH0V+TLzNY0tL4_DHUXkYLJwOn-UtNvHdjrZcWarBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
X-List-Received-Date: Fri, 29 Oct 2021 16:07:12 -0000

On 10/28/21 12:45 PM, Warner Losh wrote:
>     (2) Changes to CPSR cannot be made manually; you need cpsr_write.
> 
> 
> So would
> 
> +        cpsr_write(env, cpsr_read(env) | CPSR_T, CPSR_T, CPSRWriteByInstr);
> 
> cover what's needed here?

You can use

     cpsr_write(env, CPSR_T, CPSR_T, CPSRWriteByInstr);

because the mask takes care of not changing other bits.


r~

