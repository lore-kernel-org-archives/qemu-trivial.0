Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nBuer-0000KE-0Y
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jan 2022 03:25:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBuei-0000Iq-50
 for qemu-trivial@nongnu.org; Mon, 24 Jan 2022 03:24:54 -0500
Received: from [2607:f8b0:4864:20::532] (port=35787
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBueg-0005j9-JU
 for qemu-trivial@nongnu.org; Mon, 24 Jan 2022 03:24:51 -0500
Received: by mail-pg1-x532.google.com with SMTP id p125so14721459pga.2
 for <qemu-trivial@nongnu.org>; Mon, 24 Jan 2022 00:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FrqiAYvVb60I0lurg+7juXBsIWokkKE9C1yvMv98Qr0=;
 b=j9CiAHL3p7axi5UiRA8dk1dXiAqOBk735AgdzZAih4xqMXODz+5NiAHjbUbb8T7Omv
 KbYUhcvIz3GI8HKCExlhXs0P7LHhJ5o8NtAASty7aUUpaW2E6TSzCQQFrXLq69PagkFC
 VFHJPXB8IBrF88c8lXFeQW8rDKmlBXl/qU5p56gsB+EVKAnMHkFKjufnDyUGcVTu+4xc
 1lycmnlaqQ0Bbw+nikkNWKGkGb7EyhM+Wy+mpYa4iM+EcV4aPFyV77jAaECyjcf+c3z8
 XZoEGBDhpl0hVezoeOHC7cwzRyIEZMAGK28EerH4Cp1DZtVo7xG0LU3eE6ni0Wh3T8Iy
 3FmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FrqiAYvVb60I0lurg+7juXBsIWokkKE9C1yvMv98Qr0=;
 b=LMyDGh9tgMH0llXUJ376X1Oe8ERGJ2qooYjvtimbQ0fb+nRgyoj/sagj03jum+SzTU
 xF8id1o7XRXl9jM2zh4dkvkQqtjRQC8WAE12p+hJm0c7xiyTlfcq1VxqroPCQQwfNB8/
 bfSyYtViiMJDFJcbxw77YGIHNQrCtx5COy0eHgtMdLS4woWQdYSXC+unshhBITiiAtwQ
 h7x5nK880SiqhYyzhylr4APTI3ezPEcxL4PIF9+P7Hsio7TLLu5Q5QVp6kYje3f8nslN
 QjmGncRXd3Zr4EVWT2Gftq89zAM+wlZalxqr9LOy4x6o7pTYot8BKR3/mkJ4Q7aHruKf
 miGA==
X-Gm-Message-State: AOAM531mNjHuprkRGvRd5OFIu2g6EjN2QKHUjaboL+DVSXiNlBoerNCs
 tg1GoKBS2y0dVdvdtvh0wtk4Rz54PHh5etHL
X-Google-Smtp-Source: ABdhPJw5zxzWv1zYSQV8rQ6M20IqWhnaMnIZpmigUs+9uyziLRuUWYJYRtdsNU1CSn/hCwpHRyu+6Q==
X-Received: by 2002:a05:6a00:987:b0:4c7:ac09:5430 with SMTP id
 u7-20020a056a00098700b004c7ac095430mr10068393pfg.67.1643012689019; 
 Mon, 24 Jan 2022 00:24:49 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id h10sm15330858pfc.103.2022.01.24.00.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 00:24:48 -0800 (PST)
Subject: Re: [PATCH] target/rx: Remove unused ENV_OFFSET definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-trivial@nongnu.org
References: <20220122002304.84016-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f33b39a6-1ed9-273e-a1eb-023729893ef2@linaro.org>
Date: Mon, 24 Jan 2022 19:24:43 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220122002304.84016-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 24 Jan 2022 08:24:56 -0000

On 1/22/22 11:23 AM, Philippe Mathieu-Daudé via wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/rx/cpu.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/target/rx/cpu.h b/target/rx/cpu.h
> index 657db84ef0..58adf9edf6 100644
> --- a/target/rx/cpu.h
> +++ b/target/rx/cpu.h
> @@ -116,8 +116,6 @@ struct RXCPU {
>   
>   typedef RXCPU ArchCPU;
>   
> -#define ENV_OFFSET offsetof(RXCPU, env)
> -
>   #define RX_CPU_TYPE_SUFFIX "-" TYPE_RX_CPU
>   #define RX_CPU_TYPE_NAME(model) model RX_CPU_TYPE_SUFFIX
>   #define CPU_RESOLVING_TYPE TYPE_RX_CPU
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

For the viewers at home, the last use of ENV_OFFSET was removed in 
5e1401969b25f676fee6b1c564441759cf967a43; the commit of target/rx came in just afterward.


r~

