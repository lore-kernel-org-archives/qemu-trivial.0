Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgVeQ-0007yh-JX
	for mharc-qemu-trivial@gnu.org; Tue, 11 May 2021 12:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgVeL-0007wT-GW
 for qemu-trivial@nongnu.org; Tue, 11 May 2021 12:54:26 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:39576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgVeH-00049x-Mc
 for qemu-trivial@nongnu.org; Tue, 11 May 2021 12:54:25 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 d25-20020a0568300459b02902f886f7dd43so4646268otc.6
 for <qemu-trivial@nongnu.org>; Tue, 11 May 2021 09:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rFZbjYExGF9Gj5m8oYEDnEjzAnWEc70HNqNg2/mm+jI=;
 b=BK0PlH/b3lTNPYj0lTzMBDt40u/bvfd8fxXQUPf6+NIQ0ppHQNbKIkzjpj96iyvhiz
 W7nCUgMw1Cqy9E/pKhlb5tGu3Dyn6KkpKse/7lAiYY4pLzI7IfDqfQBw2eRcDoIYhd0f
 cmtv6lDcH4IKEbAjGFD3Aa0979TAyZKdZPmOYxyaal68LjWjFeo5jDusWArAV/JSiebT
 BujR3e2fdeM+YMmHkFAzHXleEdMirtFmhsTa4ZeNSqiYt9v8H0C2U288Oz4Du5pNuP0A
 RUykjlefGIa084oMlt9LMQd9e7TqwYB7akUho2zT7qT7xi9nt0nsKBdyU8xGdY00a3xh
 Sy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rFZbjYExGF9Gj5m8oYEDnEjzAnWEc70HNqNg2/mm+jI=;
 b=LVA3biwS52UsmzpZA55gAx+FIYQmcYndzyKjlk323tTSJmgGPZk6SqmIb4a0l0Btj1
 SdKi5HA2z6KC9khPQfkU6JiyWTIlRfsNYNUfNBOEsLdfh7YoJ959z0Mif5dxPuxdAHHQ
 b2xfgw7pJG/qviP/W5xVyBS5yz20VU/tYlNk/BP19uORxq7EscrmeftsaRrvwix/QrRi
 hDlesMNULqWYoPSlpB94sYLkDIFlT9hZ5g//Sr/PVkpjjJ9zZT9wsAJSLdZ+VdT+98m+
 nY2QBRLdc2LIV8P/QmtdMHybozHsG9Dnq88QW/avAygJgYTo0BL7JlqKraG6dUq4nSTi
 jCAA==
X-Gm-Message-State: AOAM531vnZt+J7wsgeh6Df8EFLTTou/P/QUJuILTmFtURaDG1IxyMuOV
 q/bYX6ftNXqpklByy+l9kcOP6w==
X-Google-Smtp-Source: ABdhPJx5EqBlOWtkAJh+aGaow8sBE3Z2lCQmUPrMnzIxbJ2bknAC3LrPc6O8msnwP6XmyD2Qcc6ajA==
X-Received: by 2002:a9d:37a1:: with SMTP id x30mr21250690otb.141.1620752059834; 
 Tue, 11 May 2021 09:54:19 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id q2sm2955428ool.3.2021.05.11.09.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 09:54:19 -0700 (PDT)
Subject: Re: [PATCH 0/3] hw/virtio: Constify VirtIOFeature
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210511104157.2880306-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6a468e3d-2b48-a7fb-32f1-f280c72c8298@linaro.org>
Date: Tue, 11 May 2021 11:54:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511104157.2880306-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 11 May 2021 16:54:26 -0000

On 5/11/21 5:41 AM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (3):
>    hw/virtio: Pass virtio_feature_get_config_size() a const argument
>    virtio-blk: Constify VirtIOFeature feature_sizes[]
>    virtio-net: Constify VirtIOFeature feature_sizes[]

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

