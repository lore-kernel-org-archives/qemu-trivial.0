Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ryqgY-0001k6-Ip
	for mharc-qemu-trivial@gnu.org; Mon, 22 Apr 2024 06:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ryqgW-0001jW-Lj
 for qemu-trivial@nongnu.org; Mon, 22 Apr 2024 06:14:04 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ryqgU-0001EC-W3
 for qemu-trivial@nongnu.org; Mon, 22 Apr 2024 06:14:04 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41a55be31eeso5801435e9.0
 for <qemu-trivial@nongnu.org>; Mon, 22 Apr 2024 03:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713780841; x=1714385641; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CLW75xlvsYPL9LJjdoQ8rXDZwMHjs4XLaZaGvz/886E=;
 b=GdJxJK7/LUBC9Pz/7SZasfnwsQtikRW7xQkspu6FLsEXajv1ZB6I0HhlRWkypyxSwo
 3nK4DFnk8p/k1coCTBVn5vsTVHxP90kIQgDpcxpQIHdbE9jUQz/0mdVV8FKtgDXDO8cf
 wewrn5W3RXKSpqx0U/c2OnRKFdcyhmslrOfrYsT/NT1Jlak9rySbsxPU7nEKHKpMnXP2
 wFShsn+1ofqBMekH9nho2fop8SQK1RLSnrUaEmy9MnRfRvg//X7yVMIHixA3rX7VYgzO
 6qEyznXCOKWkW1z+WfRf3Uh8858ZpCaRh9ADRcPg8u3br9o1fGHRhjh1P8X3dwes2yFR
 a85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713780841; x=1714385641;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CLW75xlvsYPL9LJjdoQ8rXDZwMHjs4XLaZaGvz/886E=;
 b=XDnTK8uJqHnqQzdQPHE1Jyt+3hZ2kLZhL38OKvxT3DuEygCbD8rZ7BWEnOxbZVxUjQ
 EZbEq35CCPXPk/e617z0s2lrhOXBrONWbkuFpD2YixeUAKWI1D9HObg8TOfYCizuXCHL
 upwu0X24R7sB7IQDYRcML+G4QW13jlKIq01oKpHuIA8C0hzAF2+ZRTMZO6E9KaZJEiRj
 jL6368YF9wrYcR06rB2F5wKkB6WfZWKL4v+pOPIuUW7w7WL9Ni5WFibhYtIMwT79F+fu
 ddEhEU0NlfsGpLw94m4tQNogl2gUuYn/c+7QleRvfCbnkoaTF7h5l0dPJGS4zqsKmgav
 XhYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+PHxF7SIlfQs6wNct4m3a86dBDjIroqrJAT3a/t5qzzGCpingUQDk8rI4K0XrAD6p4Mqbw/Ml1hQGVfYoa6aKfNsskHsihg==
X-Gm-Message-State: AOJu0Yw+KwMIggRN87/kgy2X7fSkJ5nGqICT6Oedb1iodAc4BbMWyxl3
 VnulC7ZgJToywnIPtVMIKSbVDHBzPmDcUF/gqZ1rhHVt3Mwqnqpu/UBMM290Low=
X-Google-Smtp-Source: AGHT+IEp3/pLKp62Y+aCo5xQp+LU8wxqdTyb7foVv2853vge0c5c4H1kd8VszYshrWudPF7WZ8z5aw==
X-Received: by 2002:a05:600c:1d26:b0:418:5e80:b7af with SMTP id
 l38-20020a05600c1d2600b004185e80b7afmr6813830wms.36.1713780840990; 
 Mon, 22 Apr 2024 03:14:00 -0700 (PDT)
Received: from [192.168.1.28] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr.
 [83.193.250.196]) by smtp.gmail.com with ESMTPSA id
 hg12-20020a05600c538c00b00415dfa709dasm16001363wmb.15.2024.04.22.03.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 03:14:00 -0700 (PDT)
Message-ID: <361760cb-db04-4ca6-9264-1dba5787c8c0@linaro.org>
Date: Mon, 22 Apr 2024 12:13:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] backends/cryptodev-builtin: Fix local_error leaks
To: Li Zhijian <lizhijian@fujitsu.com>, arei.gonglei@huawei.com,
 pizhenwei@bytedance.com
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20240422085312.1037646-1-lizhijian@fujitsu.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240422085312.1037646-1-lizhijian@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-List-Received-Date: Mon, 22 Apr 2024 10:14:04 -0000

On 22/4/24 10:53, Li Zhijian wrote:
> It seems that this error does not need to be propagated to the upper,
> directly output the error to avoid the leaks
> 
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/2283
> Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
> ---
>   backends/cryptodev-builtin.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
> index a514bbb310..940104ee55 100644
> --- a/backends/cryptodev-builtin.c
> +++ b/backends/cryptodev-builtin.c
> @@ -23,6 +23,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "sysemu/cryptodev.h"
> +#include "qemu/error-report.h"
>   #include "qapi/error.h"
>   #include "standard-headers/linux/virtio_crypto.h"
>   #include "crypto/cipher.h"
> @@ -396,8 +397,8 @@ static int cryptodev_builtin_create_session(
>       case VIRTIO_CRYPTO_HASH_CREATE_SESSION:
>       case VIRTIO_CRYPTO_MAC_CREATE_SESSION:
>       default:
> -        error_setg(&local_error, "Unsupported opcode :%" PRIu32 "",
> -                   sess_info->op_code);
> +        error_report("Unsupported opcode :%" PRIu32 "",
> +                     sess_info->op_code);
>           return -VIRTIO_CRYPTO_NOTSUPP;
>       }
>   
> @@ -554,8 +555,8 @@ static int cryptodev_builtin_operation(
>   
>       if (op_info->session_id >= MAX_NUM_SESSIONS ||
>                 builtin->sessions[op_info->session_id] == NULL) {
> -        error_setg(&local_error, "Cannot find a valid session id: %" PRIu64 "",
> -                   op_info->session_id);
> +        error_report("Cannot find a valid session id: %" PRIu64 "",
> +                     op_info->session_id);
>           return -VIRTIO_CRYPTO_INVSESS;
>       }
>   

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


