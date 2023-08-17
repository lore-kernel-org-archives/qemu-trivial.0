Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qWf7Z-0007aG-Cj
	for mharc-qemu-trivial@gnu.org; Thu, 17 Aug 2023 11:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qWf7P-0007ZU-1B
 for qemu-trivial@nongnu.org; Thu, 17 Aug 2023 11:41:04 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qWf7K-0003Qo-PO
 for qemu-trivial@nongnu.org; Thu, 17 Aug 2023 11:41:02 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5288906a69fso852563a12.1
 for <qemu-trivial@nongnu.org>; Thu, 17 Aug 2023 08:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692286856; x=1692891656;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l0Fz2WrUf3bONXgAttf4NwSw/olxFcTK2slf9hWwYSs=;
 b=dtG5yi1oy1VCgVmknlPkHiFJouShzPTzPGaPVs4Ywg5vMP9rXYwiLV15E1DVOCQ20E
 ky2WrUPgCtajjd6TueqG3a4jfE87Xz1BwaH0GqgDShKFrYJiyzJHKqv5TUunwEyaP2P4
 CkTwdZ59vwyBwl6vZsgzn2n6AtH1KZgeYYQAR9eivlMxcLi69eMgB/GLEYk4JzQePlRd
 9xO3hc8FMLutw0JdNZ+Z3RMGMAU9a8ZRUqmZ3uyLXHcX/sFY/Ba5O2ldTIuXwdAOWliT
 /vsDOCnwXCw5K+ISs/G1MDSPbyb1bruEqHEZNmWQoFLyNjOwl8qtOth+wwAYT4B5kBtz
 sOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692286856; x=1692891656;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l0Fz2WrUf3bONXgAttf4NwSw/olxFcTK2slf9hWwYSs=;
 b=dBL1l8x0V1HJFGLDcNBrVi8KZspt1M/pw7UXGOHudGEv/Yt3DoUZzMO9yw2WnIsxrr
 Mz2fPggJklywoX1y18CL3jvuDhqCfR3ZS5Ima6qKGU4qAUFrXORzLBoSq6taEJlH5rYJ
 /1naYkh3mwL8hbhtTrMPkrCdkTPoIzwGE63IfDx62IyD68JC+WGRsGiKXFdseSSLeIqE
 /774HZRAvD10urTL+YLU9bfoW3Gz9EQiRE57Gdl54HyiE3oTc3Ge2fjWNYJ2Q5Y+l9te
 nvh2BnitoVg6nT4GonFSEBkDHVU5nbbo/2oZtcs9f5CEp8R7ntViZVEHQQS9zqMX81Tx
 lAsg==
X-Gm-Message-State: AOJu0YxoDdM5dI+4w/dBwOl8zjOFmh2bWbqbMhMdRFvOo0SQBMxAGoEa
 zLA7mGEJz/hS6gool+BQR82m7g==
X-Google-Smtp-Source: AGHT+IE98ldEHmu1+LhLZVdSSjbOB551lE4n/+5c8zl0vRtfA/KOOG6OU0TTYPOuhq9xXwNUt1vj0Q==
X-Received: by 2002:a05:6402:350e:b0:522:582f:91af with SMTP id
 b14-20020a056402350e00b00522582f91afmr3900349edd.9.1692286856357; 
 Thu, 17 Aug 2023 08:40:56 -0700 (PDT)
Received: from [192.168.69.115] (mek33-h02-176-184-23-56.dsl.sta.abo.bbox.fr.
 [176.184.23.56]) by smtp.gmail.com with ESMTPSA id
 h5-20020a50ed85000000b005257580f5ddsm3945253edr.71.2023.08.17.08.40.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Aug 2023 08:40:55 -0700 (PDT)
Message-ID: <52c4b408-75e0-d132-d3b9-70e267134d10@linaro.org>
Date: Thu, 17 Aug 2023 17:40:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH] hw/net/vmxnet3: Fix guest-triggerable assert()
To: Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang
 <jasowang@redhat.com>, qemu-devel@nongnu.org
Cc: pjp@fedoraproject.org, qemu-trivial@nongnu.org, qemu-stable@nongnu.org
References: <20230817125600.1440195-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230817125600.1440195-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.01,
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
X-List-Received-Date: Thu, 17 Aug 2023 15:41:04 -0000

Hi Thomas,

On 17/8/23 14:56, Thomas Huth wrote:
> The assert() that checks for valid MTU sizes can be triggered by
> the guest (e.g. with the reproducer code from the bug ticket
> https://gitlab.com/qemu-project/qemu/-/issues/517 ). Let's avoid
> this problem by simply logging the error and refusing to activate
> the device instead.
> 
> Fixes: d05dcd94ae ("net: vmxnet3: validate configuration values during activate")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/net/vmxnet3.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> index 5dfacb1098..6674122a7e 100644
> --- a/hw/net/vmxnet3.c
> +++ b/hw/net/vmxnet3.c
> @@ -1439,7 +1439,10 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>       vmxnet3_setup_rx_filtering(s);
>       /* Cache fields from shared memory */
>       s->mtu = VMXNET3_READ_DRV_SHARED32(d, s->drv_shmem, devRead.misc.mtu);
> -    assert(VMXNET3_MIN_MTU <= s->mtu && s->mtu <= VMXNET3_MAX_MTU);
> +    if (s->mtu < VMXNET3_MIN_MTU || s->mtu > VMXNET3_MAX_MTU) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "vmxnet3: Bad MTU size: %d\n", s->mtu);

mtu is uint32_t, otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +        return;
> +    }
>       VMW_CFPRN("MTU is %u", s->mtu);
>   
>       s->max_rx_frags =


