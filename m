Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tODTq-0005GU-G3
	for mharc-qemu-trivial@gnu.org; Thu, 19 Dec 2024 05:10:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tODTh-0005Ey-VR
 for qemu-trivial@nongnu.org; Thu, 19 Dec 2024 05:10:00 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tODTf-0000ff-RU
 for qemu-trivial@nongnu.org; Thu, 19 Dec 2024 05:09:57 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso5740225e9.2
 for <qemu-trivial@nongnu.org>; Thu, 19 Dec 2024 02:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734602993; x=1735207793; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G44sjWScclXWFU1Kar6tCC+bW6+DUC78F/r2qGeOD/U=;
 b=gUaFrejluJsPNIg2KBzkF88CCMY5wI6RECEEK66Nxrr/wJB7u3HzjFYnhd/w5B72pJ
 Itt4Kzu7q8pKs2y9ZeX8QZojMkU1pNnj/u5G1t+ZurNG6gd/oAgdmlsj7/qzIOVwLXce
 x8yfaKXT+cbgQ2sOhwsNy02cKXYHePg8wpTpgL/O3A1v59THRXls0+Guma78wXEDqe5/
 +bMOkPSgngAbXcJossQlZrNyHAjs+rF+xyzJ6NnXWhceBfEDX1bjNmGWzW+GA5DEhaz/
 zzPyD0F4TDBY+s4Vqe97myOzdyBQULwMlmUZl8hb/lmt3j7T+3ApL1IJe7czjmkM6NM+
 U07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734602993; x=1735207793;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G44sjWScclXWFU1Kar6tCC+bW6+DUC78F/r2qGeOD/U=;
 b=pKkGKQcAHM6pE4X/C4F30tnDS3dmjhw6f6SVvcsDcV1NUj+EUn+pBMHtkvwejc1Agc
 PIfLcBbBajZBLNqDZy8KQOUFiS8GIKdtVO1HOutb8SpMISTbgUiJl0IYA7VkcHtjuO7x
 anJZgzQLxksD2A8g6N4f7DL3L6Hxo3L1tZTixY0qloq8z1uoX39ejgf9/yJxWmWMvErm
 6M+usxRFuqWTjP4vWnkrQ3yjpHJjswkhKRu9UgpVbDupBw544XPDq3+UcsNy+4nbIqMk
 Fd6doh5/MAAUJsc7SH9xuudJwaml6WXXGz2qh1HmKqd81WhIc1LFyBLLEmL799zgeWEn
 LOBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCULb/iO7bVLDpsjDJEWajNY4PRA0w4SeecLpntCvmlAalLKZt/EYkXULca2xT5oxWavaRjpJsOK7tpeL1g=@nongnu.org
X-Gm-Message-State: AOJu0Yw+fU48wpXsWfqZAvfTtbmjmiYI+ASA3yQ0QElTZ0Mej4O07l7B
 FOAaZmv/9smahnGFJgDzQNteXAkRTEnDH6P66h8BcmDD5s3aWAIgab/7XqZjDnA=
X-Gm-Gg: ASbGncvNKySzC39Je9lgbmUEHqb8IfhjVi6hmLbbIW5DyHBP8y10qciA2rhoG0+2axM
 9N0Ca3xrUlmL3XitXHhcGtKMWzYJbQaHXGAUcVmCf8p2ti3SHsRw2MmCuALdcBPOwF3KPExeqtI
 kEyHQGlzqguaxsjhXCM0z8OCiuOU7RQM4J++BkhgpT9YiF1ytoHP/ANjQsRuqMHg8nElNc37Q3U
 bVZAwQPEnER6VE4bxpFVuPf0wOGb3fWz1Ywxby0PSYOR3xT0QuYP8qe/AxxyKCgKJM=
X-Google-Smtp-Source: AGHT+IEMx3VVDNyttIDt5PRM8AHIJsCPXwsQ/OWZGXl6hBymKCmQlps978WP7C2smuGSJYjuCdSoqQ==
X-Received: by 2002:a05:600c:19d2:b0:434:ff25:199f with SMTP id
 5b1f17b1804b1-436553f4ff3mr44733565e9.26.1734602992856; 
 Thu, 19 Dec 2024 02:09:52 -0800 (PST)
Received: from [192.168.1.117] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656a0b361sm47713145e9.0.2024.12.19.02.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 02:09:52 -0800 (PST)
Message-ID: <be91046d-dbe0-4701-9346-09521bdc5c4c@linaro.org>
Date: Thu, 19 Dec 2024 11:09:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/i386/cpu: Fix notes for CPU models
To: Han Han <hhan@redhat.com>, qemu-trivial@nongnu.org
References: <20241219085141.1857343-1-hhan@redhat.com>
Content-Language: en-US
Cc: Chenyi Qiang <chenyi.qiang@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241219085141.1857343-1-hhan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 19 Dec 2024 10:10:01 -0000

On 19/12/24 09:51, Han Han wrote:

Fixes: 644e3c5d812 ("missing vmx features for Skylake-Server and 
Cascadelake-Server")

> Signed-off-by: Han Han <hhan@redhat.com>
> ---
>   target/i386/cpu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 5253399459..820571761d 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -3691,6 +3691,7 @@ static const X86CPUDefinition builtin_x86_defs[] = {
>               },
>               {
>                   .version = 4,
> +                .note = "IBRS, EPT switching, no TSX",
>                   .props = (PropValue[]) {
>                       { "vmx-eptp-switching", "on" },
>                       { /* end of list */ }
> @@ -3825,7 +3826,7 @@ static const X86CPUDefinition builtin_x86_defs[] = {
>                 },
>               },
>               { .version = 4,
> -              .note = "ARCH_CAPABILITIES, no TSX",
> +              .note = "ARCH_CAPABILITIES, EPT switching, no TSX",
>                 .props = (PropValue[]) {
>                     { "vmx-eptp-switching", "on" },
>                     { /* end of list */ }


