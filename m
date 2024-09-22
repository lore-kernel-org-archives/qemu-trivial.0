Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ssEJQ-0003F3-7J
	for mharc-qemu-trivial@gnu.org; Sun, 22 Sep 2024 00:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ssEJO-0003DL-8U
 for qemu-trivial@nongnu.org; Sun, 22 Sep 2024 00:35:06 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ssEJM-0007bX-F3
 for qemu-trivial@nongnu.org; Sun, 22 Sep 2024 00:35:05 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c4146c7d5dso4294281a12.3
 for <qemu-trivial@nongnu.org>; Sat, 21 Sep 2024 21:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726979702; x=1727584502; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VLt7zZYnCvXHyj2WLIUmKdIVQcyUAHHPI9LgFWgT2rw=;
 b=TugRfFdruMnN6cxfjQabfmzyvu4kpUMcp1o5J567cdSaDmGZUlW7FP4LVjusgIxvY+
 nJo7gYSFpURSbTpxBYZTG5rJlHDuaA+L8nwMJG67Dh4JDFkXrvrRgvQrfQVnrh7wNtNI
 4snsif8eDPfwIl67yLL6ERb7Px5fMSOH74oyXhT69/1Y7nhQIK+94FsWRNi5AflLcqlY
 +0XE6VjwPGS0G5CZJLZwpyEMhVmS3Ci4oCCM1hllfk6eARODXcTgdbD9Z4W2hpPKWWFi
 tYiPk3PlfVjpkvFzsEJo+EZmyeieTnPLo2IlEWOt/8h5ZDH5IEcNlTY6udMYNPE974c3
 fGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726979702; x=1727584502;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VLt7zZYnCvXHyj2WLIUmKdIVQcyUAHHPI9LgFWgT2rw=;
 b=FoIvkam0q2DUmafru/Yv+tKGdwwWPPS8u+OTi3mj6+7pZWziJAd9hCDQA403tZ8oI1
 nurEgfudF49CgdZxJqPGzDqYe+WCvN701dJw53MUaadrqVvXbLLOwLwut8yZKwAC1k5h
 v5+JcOjxFTzvaLSmLJ4OduRu2NX1D9gOaf2x1arv2LDqTS2E/xZ5TxGpvdTvZ01hUCkZ
 Cf0FCO8TIwA+PNM3V9PYxow4fY4yyBo2c0AvGz35mtwACqgHU3MjT5E2RmBj9wruL+4u
 0XlFMUbCHbfaQmAR+ZMatOWhRlb0IRihvWVGPHxAvxjk92gosGXdFLUHcfT/4lP9DK3l
 Hvug==
X-Gm-Message-State: AOJu0YxfVVF/fHAARbNrzqAARMjZOx0hYN9rfd5eQ7t2yRoNB0sPyPJM
 VMqnLrHvpR+VUPQouMnCIZLRIPPjz6QZ2A1MkUiGUcw0Oj7/0bzutKsfDzFUvXA=
X-Google-Smtp-Source: AGHT+IHMP5WpgxzGsUOSZCn+3OwDGfkjU5e0augtOX9msTJKVm+hwRwOnxVfxCKlWKEeCcLSZd/D9A==
X-Received: by 2002:a05:6402:380f:b0:5c3:c4d9:5e0f with SMTP id
 4fb4d7f45d1cf-5c464a41653mr6189666a12.16.1726979702320; 
 Sat, 21 Sep 2024 21:35:02 -0700 (PDT)
Received: from [10.5.50.249] (90-181-218-29.rco.o2.cz. [90.181.218.29])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb89e07sm8841392a12.76.2024.09.21.21.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Sep 2024 21:35:01 -0700 (PDT)
Message-ID: <dfd50fee-81d8-4208-9082-29efa5c6c830@linaro.org>
Date: Sun, 22 Sep 2024 06:34:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] configs: Fix typo in the sh4-softmmu devices config file
To: Thomas Huth <thuth@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20240920161045.84622-1-thuth@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240920161045.84622-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x533.google.com
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
X-List-Received-Date: Sun, 22 Sep 2024 04:35:06 -0000

On 9/20/24 18:10, Thomas Huth wrote:
> This is the config file for the little endian target, so there
> should not be a "eb" in here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   configs/devices/sh4-softmmu/default.mak | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/devices/sh4-softmmu/default.mak b/configs/devices/sh4-softmmu/default.mak
> index aa821e4b60..efb401bfb1 100644
> --- a/configs/devices/sh4-softmmu/default.mak
> +++ b/configs/devices/sh4-softmmu/default.mak
> @@ -1,4 +1,4 @@
> -# Default configuration for sh4eb-softmmu
> +# Default configuration for sh4-softmmu
>   
>   # Uncomment the following lines to disable these optional devices:
>   #

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

