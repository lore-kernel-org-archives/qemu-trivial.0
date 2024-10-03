Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1swOHl-0004yz-Jk
	for mharc-qemu-trivial@gnu.org; Thu, 03 Oct 2024 12:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swOHC-0004hm-Ky
 for qemu-trivial@nongnu.org; Thu, 03 Oct 2024 12:02:06 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swOH8-0006GI-AO
 for qemu-trivial@nongnu.org; Thu, 03 Oct 2024 12:02:00 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42cafda818aso11211045e9.2
 for <qemu-trivial@nongnu.org>; Thu, 03 Oct 2024 09:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727971314; x=1728576114; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wsMiMT8c5c05sktyAKnP1D1u7YYmXbDWu2JfmLDGnWA=;
 b=hDhbG7pTLe+3KOapXpSNviCYvZ2nx8nU82G2vxMsPpkvK0hESOcwfPVRfNP7/qtuaG
 NT5xrNv15KCkqLmqa4diY/s2Bh5BkWbJ8BxyCC7QBEpce4+6A67iX7a+piDT+8x13PmM
 oNNwGYT3uFqd/W0yuk/b3ZHrC4KcfJFqWdy89Nw7LCOwK5uyYYIbciWZAO2CBNd+cN+a
 iYobL3ZvU9pGdEjn8B0w0p801DYsSXeLGDeh6kpOzOQf7aI2BPxqiIRnUkAn5nL2q908
 f5REmrBNzu+4OOCSffPkYZ2JXofvT4PmVUbjxHrni+bRhU49meqg8PH4i5sZuvshhSo9
 IQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727971314; x=1728576114;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsMiMT8c5c05sktyAKnP1D1u7YYmXbDWu2JfmLDGnWA=;
 b=qswC2NTz/LyFVWR6bRuM14K7XRqyLG1sxeAiIr2tydJVNAhzgF3HoXFTaiVcGnVpeU
 rGbuKpks1HWey3Jz3h1+6XG05GAt3BTejl2/2+N1LBJWmqHk7B6fqj69Lxfkqh2fL7va
 JOK1K+sXi5Q9he4szoWUiBTz6tXlCWldGXb1/G4CRQL5l2JpbxFVNkGG1nzHDdUtBHe9
 Ohqj0m0mPJi5rWOlsT5I84C/x5R7aRxZD9Kmw8Ebo++uHK6QQ0Lj5GDUEVcIp6bUbaJB
 qQUv5eXn2uOuJAqB2q0/2AXhhVSdgBp9ckxgEsBCvvqv/hq4B+yzWGQ5IBP8tn+YHznC
 +9Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOXoa4es/W28F3ot08um1IaDue3wDEcHVKD6P656RKjJMoywqJe7t8i7btmi7nL3tIESx4GBCVSwC4QHw=@nongnu.org
X-Gm-Message-State: AOJu0Ywthy8ajr668Mwdb23aLj2rUPuMN84d2LREiWYSmtVHTYW43Mix
 XfF/U8w+vGjoya1x4kD8Oa67a0KF8cAreFkTZQ07MzAtr83HWinZ0MvXEz3R+MQ=
X-Google-Smtp-Source: AGHT+IHi5aZ/ZhfgjVyFeor97ZAo0syDX9O5zVgmtO+9Xf2s9L46XBuik74YNKKxuvkkoXiwepLJJQ==
X-Received: by 2002:a05:600c:41c6:b0:42c:e0da:f13e with SMTP id
 5b1f17b1804b1-42f77947e1dmr57384515e9.18.1727971314021; 
 Thu, 03 Oct 2024 09:01:54 -0700 (PDT)
Received: from [192.168.13.175] (49.red-88-29-183.dynamicip.rima-tde.net.
 [88.29.183.49]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f7a02eadbsm48374415e9.39.2024.10.03.09.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 09:01:53 -0700 (PDT)
Message-ID: <bc7f9c41-2b69-4536-bc5a-218c1efeba87@linaro.org>
Date: Thu, 3 Oct 2024 18:01:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/devel: Mention post_load hook restrictions where we
 document the hook
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Cc: Paolo Bonzini <pbonzini@redhat.com>
References: <20241003143401.1676548-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241003143401.1676548-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-List-Received-Date: Thu, 03 Oct 2024 16:02:15 -0000

On 3/10/24 16:34, Peter Maydell wrote:
> Accessing another device in a post_load hook is a bad idea, because
> the order of device save/restore is not fixed, and so this
> cross-device access makes the save/restore non-deterministic.
> 
> We previously only flagged up this requirement in the
> record-and-replay developer docs; repeat it in the main migration
> documentation, where a developer trying to implement a post_load hook
> is more likely to see it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This came up in an IRC discussion.
> 
>   docs/devel/migration/main.rst | 6 ++++++
>   docs/devel/replay.rst         | 3 +++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/docs/devel/migration/main.rst b/docs/devel/migration/main.rst
> index 784c899dca6..c2857fc2446 100644
> --- a/docs/devel/migration/main.rst
> +++ b/docs/devel/migration/main.rst
> @@ -465,6 +465,12 @@ Examples of such API functions are:
>     - portio_list_set_address()
>     - portio_list_set_enabled()
>   
> +Since the order of device save/restore is not defined, you must
> +avoid accessing or changing any other device's state in one of these
> +callbacks. (For instance, don't do anything that calls ``update_irq()``
> +in a ``post_load`` hook.) Otherwise, restore will not be deterministic,
> +and this will break execution record/replay.
> +
>   Iterative device migration
>   --------------------------
>   
> diff --git a/docs/devel/replay.rst b/docs/devel/replay.rst
> index effd856f0c6..40f58d9d4fc 100644
> --- a/docs/devel/replay.rst
> +++ b/docs/devel/replay.rst
> @@ -202,6 +202,9 @@ into the log.
>   Saving/restoring the VM state
>   -----------------------------
>   
> +Record/replay relies on VM state save and restore being complete and
> +deterministic.
> +
>   All fields in the device state structure (including virtual timers)
>   should be restored by loadvm to the same values they had before savevm.
>   

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


