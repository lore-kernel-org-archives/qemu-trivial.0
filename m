Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc82N-0000uK-Ot
	for mharc-qemu-trivial@gnu.org; Tue, 14 Mar 2023 13:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pc82L-0000rw-MX
 for qemu-trivial@nongnu.org; Tue, 14 Mar 2023 13:02:09 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pc82K-00056Z-3r
 for qemu-trivial@nongnu.org; Tue, 14 Mar 2023 13:02:09 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 bh21-20020a05600c3d1500b003ed1ff06fb0so5235157wmb.3
 for <qemu-trivial@nongnu.org>; Tue, 14 Mar 2023 10:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678813326;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5IRm3YZlwThVMhXnhMVS9Zy4d5EigIF+VlT2iswtqLY=;
 b=yHBITPYD2eFg1t/9S8PnyxIt7+Cy6iK2fAQmibjfyvcJSPIyvHAqPloYlFUQFetAeA
 hGyZTDIQ4jlaIqP3324V8wjPsWQPvxaxC7tmomV6GxHe/Oj/uVVVQuzjSRvTWsxjiq3b
 Fr3kEEGwEPFq8/hEttQ/VjpkGUyjVHEi5TiOCrsVkeCc85eQbfs5jmxFQKRPyLNjWsXv
 HWAZRbxWFbv3iEWNTUU2DTt9Cji/hBvX3RRnD1aK4Tdl23o1XURUBJzXOWePjSjNnI6D
 bG4qt0MI14kxmGNF3T7Ag44TVYUiRwujb/3HIz/I5iNnnrY7hB4dVRe+rV2odA1yZuh1
 R/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678813326;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5IRm3YZlwThVMhXnhMVS9Zy4d5EigIF+VlT2iswtqLY=;
 b=XJ92vovfoT7HGH0uEZguDX6pcwP9v9SF9YrBViho44+BrBLMwnd+pgGjbVdBeKNGfM
 xbr7KMvoNJG1KSajyYcwvyRR/22XZkH8ozmk1xxLUePSzhxVgfv3UxbaF/+4ddn7XiAK
 wxCFC7NGQzoD6WXolXBY7dYwC2iOv/vAv//g5aakduPNCRTU/5THxhWDTGPeTGGATwuN
 YUst+Paui1J3Gm8lsdk40rNVhO6zS5Uza4v9v67m7yeFU9erQZ1EnZxbAsH0AWrH64GB
 GmnPc374uiT3ORp8AYuJzRWoeizbZzHcLQHLTpqs5rMD3uA1tT3p/9vufCdveijmp11U
 PFbQ==
X-Gm-Message-State: AO0yUKWEyaYhkRUPOn1O5m+sU67oFto508eOwtlzDM82jmIu4kSwdYrU
 NG2qf1PW88+ppFBFJqNaz4otHA==
X-Google-Smtp-Source: AK7set8D6Hsnfej4QpHxq7vxTIyDkfQCggofXEzDH2Dg0nbdLcEUrmR6RvQGBmAhaFMgaItQplVQ8Q==
X-Received: by 2002:a05:600c:5398:b0:3ed:2b49:5c77 with SMTP id
 hg24-20020a05600c539800b003ed2b495c77mr3527431wmb.6.1678813325496; 
 Tue, 14 Mar 2023 10:02:05 -0700 (PDT)
Received: from [192.168.69.115] (lfbn-mon-1-678-16.w2-4.abo.wanadoo.fr.
 [2.4.247.16]) by smtp.gmail.com with ESMTPSA id
 x8-20020a5d60c8000000b002cea8664304sm2501492wrt.91.2023.03.14.10.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 10:02:04 -0700 (PDT)
Message-ID: <f8e7d037-18d7-d245-ab6e-936ec17610cc@linaro.org>
Date: Tue, 14 Mar 2023 18:01:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] scripts/git.orderfile: Display QAPI script changes before
 schema ones
Content-Language: en-US
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20230224214114.26464-1-philmd@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230224214114.26464-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 14 Mar 2023 17:02:09 -0000

Cc'ing qemu-trivial@

On 24/2/23 22:41, Philippe Mathieu-Daudé wrote:
> When modifying QAPI scripts and modifying C files along,
> it makes sense to display QAPI changes first.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Failed example:
> https://lore.kernel.org/qemu-devel/20230224155451.20211-3-philmd@linaro.org/
> ---
>   scripts/git.orderfile | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/git.orderfile b/scripts/git.orderfile
> index 8edac0380b..70adc1a74a 100644
> --- a/scripts/git.orderfile
> +++ b/scripts/git.orderfile
> @@ -22,6 +22,8 @@ Makefile*
>   *.mak
>   meson.build
>   
> +# qapi scripts
> +scripts/qapi*
>   # qapi schema
>   qapi/*.json
>   qga/*.json


