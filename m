Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qtaCu-0005Kx-MR
	for mharc-qemu-trivial@gnu.org; Thu, 19 Oct 2023 17:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaCt-0005KT-VF
 for qemu-trivial@nongnu.org; Thu, 19 Oct 2023 17:05:27 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaCs-0001lS-0p
 for qemu-trivial@nongnu.org; Thu, 19 Oct 2023 17:05:27 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40839652b97so837605e9.3
 for <qemu-trivial@nongnu.org>; Thu, 19 Oct 2023 14:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697749524; x=1698354324; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zFl2ji8+//0+81DwhPVsjK2/39szvGMxC3Hhtp31NgM=;
 b=SuiFlYM0gD0N7+G3elVz2vTIXCN6n82Qk8hdxpVS9kqMSwhXXnVGThQldFhrmM7be1
 EbeZmkPZvrE1RQe2EB8bpfgznCGu9G733T0v+dyg6SFIoxFNCLmuJCm5YeFQqUrS72yG
 hbH1lm8u1H1g2Spfkgz1G3CKk7KGz7VVHWtSg5PYX9kb2sytmx9c4l9YNhkiueRsXmaO
 J02iL6bLaGkYpQ8S1ANIEMsnsBO22BCTiIRXD0IEsEcnGb0N+XkOB2sNDYVU1sL1zXAz
 9XoCn/LmHYa6Es2I+AzQAaqCl5ypapkzxwrJBLWTTGRe1qHSMu+VPnOx1HlX2BYelEZK
 qnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697749524; x=1698354324;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zFl2ji8+//0+81DwhPVsjK2/39szvGMxC3Hhtp31NgM=;
 b=evgoYsb5WrB5xxKgAiu8X26YtakKGIczHlYsT6NL9PL57cq4NLwjp6mRABwSX1VmiF
 SkeK0R2ON7yBxceo86hpWrPTtGfkGBQUuAczPQ/X7QrW9mM1RQRdfaOdl9Ijt8wGKTXS
 0Xh/T+JkT3jWAdlNTRWBTGSvz2QrWvGZfch98wBONDO9DtVYFOe8xfa6PA3frxek10pP
 J4uoNpQJUpv6xBf20fvEvuyDwvWvMqhQ8TbEscqY2M7dqaIZ0+fTQq3wOfC2crLdoD7H
 8tFNrcMMy0u8D0kg+Khyd8U5vrVE5/JlmmgT6aAmaOtOB23NGFxpyIvkUd86SdF+V/5R
 LxNg==
X-Gm-Message-State: AOJu0YyDvyEnoFDipBoZS2JKGWTnD2ot2iVwPFWFPqjHmyqayVaLThN9
 pW4aBkadZmrwCO8OS5Lv9plPeQ==
X-Google-Smtp-Source: AGHT+IHnTBHbkAra7LUivzWxIbnQLba1h5TAalAD5eZInlbSwcTbFqqu2lHhmVn4Osx0daFML/Mjsg==
X-Received: by 2002:a05:600c:350f:b0:405:75f0:fd31 with SMTP id
 h15-20020a05600c350f00b0040575f0fd31mr32970wmq.31.1697749523959; 
 Thu, 19 Oct 2023 14:05:23 -0700 (PDT)
Received: from [192.168.69.115] (176-131-216-177.abo.bbox.fr.
 [176.131.216.177]) by smtp.gmail.com with ESMTPSA id
 o15-20020adfcf0f000000b00327de0173f6sm188210wrj.115.2023.10.19.14.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 14:05:23 -0700 (PDT)
Message-ID: <dd245160-3921-ff85-dc40-b2a9e01a26a9@linaro.org>
Date: Thu, 19 Oct 2023 23:05:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] semihosting: fix memleak at semihosting_arg_fallback
Content-Language: en-US
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: bcain@quicinc.com, alex.bennee@linaro.org, qemu-trivial@nongnu.org
References: <ebb2ec1150da633507c2b735ca8ea1cab05ec92a.1697740364.git.quic_mathbern@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ebb2ec1150da633507c2b735ca8ea1cab05ec92a.1697740364.git.quic_mathbern@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-List-Received-Date: Thu, 19 Oct 2023 21:05:28 -0000

On 19/10/23 20:32, Matheus Tavares Bernardino wrote:
> We duplicate "cmd" as strtok may modify its argument, but we forgot
> to free it later. Furthermore, add_semihosting_arg doesn't take
> responsibility for this memory either (it strdup's the argument).
> 
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>   semihosting/config.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/semihosting/config.c b/semihosting/config.c
> index 249a377ae8..32aa210460 100644
> --- a/semihosting/config.c
> +++ b/semihosting/config.c
> @@ -112,17 +112,19 @@ static int add_semihosting_arg(void *opaque,
>   /* Use strings passed via -kernel/-append to initialize semihosting.argv[] */
>   void semihosting_arg_fallback(const char *file, const char *cmd)
>   {
> -    char *cmd_token;

Preferably using g_autofree:

        g_autofree char *cmd_dup = g_strdup(cmd);

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +    char *cmd_token, *cmd_dup;
>   
>       /* argv[0] */
>       add_semihosting_arg(&semihosting, "arg", file, NULL);
>   
>       /* split -append and initialize argv[1..n] */
> -    cmd_token = strtok(g_strdup(cmd), " ");
> +    cmd_dup = g_strdup(cmd);
> +    cmd_token = strtok(cmd_dup, " ");
>       while (cmd_token) {
>           add_semihosting_arg(&semihosting, "arg", cmd_token, NULL);
>           cmd_token = strtok(NULL, " ");
>       }
> +    g_free(cmd_dup);
>   }
>   
>   void qemu_semihosting_enable(void)


