Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nP6y0-0003qC-KM
	for mharc-qemu-trivial@gnu.org; Tue, 01 Mar 2022 13:11:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nP6xy-0003kt-4b
 for qemu-trivial@nongnu.org; Tue, 01 Mar 2022 13:11:18 -0500
Received: from [2607:f8b0:4864:20::42c] (port=45702
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nP6xv-0001XJ-Ln
 for qemu-trivial@nongnu.org; Tue, 01 Mar 2022 13:11:17 -0500
Received: by mail-pf1-x42c.google.com with SMTP id u16so14975049pfg.12
 for <qemu-trivial@nongnu.org>; Tue, 01 Mar 2022 10:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WSv86CyTrzuc5G0hbUYroOsjwedu26Y2vsvvkITy8IY=;
 b=iWeD1h0N1VPMm/k9uXfSDPZ2GheigwrkuoNiCe/oh7ywXR34TbAWicQ9bsKUduT6Fb
 oc5Po5/4rXSVM4jGVxBSzr6eOvSS6Ly94oAl0ANKOqev9FXN2il8+dVcheN6ecepI00X
 vNaW7Bjhcbb7KJYMJOrJujT46TZPpDeKDviFFaiJsy27tk65oZFciEUn7S8jMn6+0let
 e0UQQL+XeJZHi52n/gPGwhV2Clh2YspuQEG8IpiLPvFXE9V+l9IsLQEcjlqEeBCbXmon
 HbK+FZ2JvXoska4ucUB9XTliX/5AmFzA843DWdFVRakyceu80fSz2/faytzu0te+szW5
 covg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WSv86CyTrzuc5G0hbUYroOsjwedu26Y2vsvvkITy8IY=;
 b=YKDICal5Vs02FmvxPmxA5kBPlep27pQK/RXvCHyjLyc4H3D5J6yJBCHYpFYGM+mZK0
 Pq2M8jKmy1m3gkFMbPU3obSiCxy+SFYDBw1Tr7xYgGmBZvYci3qWyZASSfoF8IZjbNWN
 fDulFYcCssBk4AoW41cnK4/XfajkKSnPlFD9gAdhYw8niMjYjZccUozNUTATB3nGDfDd
 DgkOoZHIfTLzBkEMyDR+s4kmOU0H9V3gYKNpBshK3IgVhFlj/GYg1MH6hTeme0wB0g68
 6sh7xMXmNEdjsFq3cftDirhGB0HVuokYdvcjrObrI+6fgLEb2lRunh23bx9Vk4jJiM1/
 4IaQ==
X-Gm-Message-State: AOAM532na4c8m21MUpKr9pg/cdJq9/MUbi0ZxHAM2Jjf4smbtsijiNDc
 o5g0c69nC+TitewiiNYtE2ZRxg==
X-Google-Smtp-Source: ABdhPJyP+ygQiwEihkAoomCR85q/fcve5daMuDz5usbCNK5lktzweTp5vxXOLhvrQPMcpwBbZfWkMA==
X-Received: by 2002:a63:5758:0:b0:34e:b5da:7dac with SMTP id
 h24-20020a635758000000b0034eb5da7dacmr22571118pgm.515.1646158273634; 
 Tue, 01 Mar 2022 10:11:13 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 k7-20020a63ff07000000b00372dc67e854sm13470878pgi.14.2022.03.01.10.11.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 10:11:13 -0800 (PST)
Message-ID: <2372e6c2-b2e6-7893-fe55-7615bd958691@linaro.org>
Date: Tue, 1 Mar 2022 08:11:08 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tests/Makefile.include: Let "make clean" remove the TCG
 tests, too
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220301085900.1443232-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220301085900.1443232-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 01 Mar 2022 18:11:18 -0000

On 2/28/22 22:59, Thomas Huth wrote:
> "make clean" should clear all binaries that have been built, but so
> far it left the TCG tests still in place. Let's make sure that they
> are now removed, too.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   tests/Makefile.include | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

