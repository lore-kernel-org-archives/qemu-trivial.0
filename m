Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6d48-0007cX-Bo
	for mharc-qemu-trivial@gnu.org; Fri, 14 Aug 2020 13:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6d47-0007ZH-Bs
 for qemu-trivial@nongnu.org; Fri, 14 Aug 2020 13:00:27 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:35305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6d45-0004y5-Oi
 for qemu-trivial@nongnu.org; Fri, 14 Aug 2020 13:00:27 -0400
Received: by mail-pl1-x642.google.com with SMTP id r4so4447132pls.2
 for <qemu-trivial@nongnu.org>; Fri, 14 Aug 2020 10:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LaQnMd/v1rT6PcQaUnfYZD4JQvrryfBQS7qC7ebCMu0=;
 b=LDAxjfyqvqPDAbHmgKE9N4t7reU/Cmy4UWpKaUZjk0qVdRrelZZQS7ai+ENfrl3SOU
 Wp5Og9RNctezt6KAqOQl/88wt7WobMfxZantpcTDho2OYE+54zsGZSJh6MRnQ/2L3XRU
 tek+rpy5oKY8JnXjyKva++5bv3MqiNYQs3RQdoRnPVETv5BUmDm4UgycMZLduEw/XsUt
 EPcFOxbjPTpDo0L9iRxgqZDQytqX/0P/mj4R+IF1FHGp0S1W5m9R6AQGXNyg8XKJzc/T
 OpMLcvptvGA/GF5htbLzkDgUcg7V/ksWzW7BSgePaDWqWSw2y+Eyjrg4jrT6L+juXID+
 ibvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LaQnMd/v1rT6PcQaUnfYZD4JQvrryfBQS7qC7ebCMu0=;
 b=oK39UizwxOHwVnVYy6/ng1O60oqnXG89ltRc5zCwIiuH9xMuABT4DmMr36V+Ctdwxc
 fUZAhLrIxD4+a2rjHqoDWEAI9x4teOEwZIfppXzeEIPNqH+cVKETslJN7MfD5Mqxbl6r
 xsb99h6qP/IPFKsP2mmB70tlwytSZHldqkmYFrZFVwXZiBFBx2boAant8oEG62PnELae
 WqzIJCzhljGgefcSbgIfoUKSJI+CMGgXfWa+q/KH9JfBo6bDUNdgIVbtLegGuEZ2MXjc
 Qou6B2dog4Fix4KJjR+cwN8fGasYWihDOV4s0LL5WYMAr+YpqZkGIXejt+xn8ff+Chwk
 5CcA==
X-Gm-Message-State: AOAM533Sudqv11oY3EGcvsyo6brW0N0ltdHOMtxzMlsdxqkwLNrFSk0K
 ZvvM3eiPkMMiJD1u61QIMBDbWA==
X-Google-Smtp-Source: ABdhPJxOrp3oykmB2RaLSNOARvd8uTLaZNqlB57kCzG7OE2wE5Gko9YatqPQTpr2U6UV9aGNWBuiPQ==
X-Received: by 2002:a17:90a:c505:: with SMTP id
 k5mr2881905pjt.188.1597424424396; 
 Fri, 14 Aug 2020 10:00:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x127sm9933590pfd.86.2020.08.14.10.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 10:00:23 -0700 (PDT)
Subject: Re: [PATCH 6/7] hw/ide/pci: Replace magic '512' value by
 BDRV_SECTOR_SIZE
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20200814082841.27000-1-f4bug@amsat.org>
 <20200814082841.27000-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b22d8f32-7bb2-74b7-cc92-9f1ca53ba77b@linaro.org>
Date: Fri, 14 Aug 2020 10:00:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814082841.27000-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 14 Aug 2020 17:00:27 -0000

On 8/14/20 1:28 AM, Philippe Mathieu-Daudé wrote:
> Use self-explicit definitions instead of magic '512' value.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/ide/pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


