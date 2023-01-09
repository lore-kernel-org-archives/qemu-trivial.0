Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pEujP-0003Oj-Fj
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2023 11:10:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEujN-0003N1-CU
 for qemu-trivial@nongnu.org; Mon, 09 Jan 2023 11:10:38 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEujK-0002Qd-PY
 for qemu-trivial@nongnu.org; Mon, 09 Jan 2023 11:10:37 -0500
Received: by mail-pl1-x62d.google.com with SMTP id d3so9991022plr.10
 for <qemu-trivial@nongnu.org>; Mon, 09 Jan 2023 08:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WXWtiELz+9v87ReMcNR5qnXsLmL0CPSMu48poXSrAqI=;
 b=O9Eya10NgLm4WhB+L4M0l3ZW1afO7rRvMiANZzYFlWbQF2R8d5iVzt/hs5Ha1EzBZW
 6zLuN75rcjA7YicPN4O8zOXqQPrd5Nb9rcDfxqG8SRzmjSb88QT/BiMF4oh4ho/zNvRA
 OCnO9n8WF1g7IeEzgsApGX3gzmG51Im+BjclH3WmQQppDvMp0+K5qwYfOKLLBtKyT+Cg
 IyhQexsOp6YbamiA/LC1Yr1GmP5R7hNjWEucaKcvViH0NZpfwar0G7YFB3HZuMFAD/sN
 J34AKmhWR4VcaDg9Hu+Aw3FwkyVXYgZ7uHKK7eFyqfJ2g7RrmygCOx4hYKgnLJ7kErJH
 UZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WXWtiELz+9v87ReMcNR5qnXsLmL0CPSMu48poXSrAqI=;
 b=7zG048e/9MqwBzBzF9UpnNhg/WGBn3UJzv5lG/WeoHWpNCPYrh00/aOEaO9quHYNLF
 a3zwpnMtEI4WYtTIODlbFPjqJpdyp68tYk6NymmzTajioq7CTuwjJra9uKCYZ6F/GzVJ
 t4DttPWmngHdLNUJscQxAJtMvB79UusOHy9B/6CjmmQXTSZAo1ZG89FaJPbk6MgHvaHT
 RDKKKaO6y76U1WqDdRcwWjpY8ar1Lr0ukCdyscd4Z43H6+axQYdpGNOlzgt1FP1acKtp
 uqiIWq//ZwdSPmEQPdLDxrA3KasP1/r3/i66aDcLASyS018llztvE/3p6KeekFxQaIDF
 yqbg==
X-Gm-Message-State: AFqh2kokeTfFnkZIVRj04xMB+Hm7g+hBfCzxhxZ7KbwyaR2HxuIGyL21
 KW7E/EPV1kc1TIcznpVrv2xxEw==
X-Google-Smtp-Source: AMrXdXuWNuJ/p+OWHMB7vZ3urpgn5akTAxP0zwI3zpuwTW2UvClCjcMiul32xLkzMG9x+Q3CHwfWpA==
X-Received: by 2002:a17:902:f791:b0:192:5ec4:6656 with SMTP id
 q17-20020a170902f79100b001925ec46656mr66901294pln.3.1673280632126; 
 Mon, 09 Jan 2023 08:10:32 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a170902f7c500b0019337bf957dsm1699570plw.296.2023.01.09.08.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 08:10:31 -0800 (PST)
Message-ID: <dee15a77-3fd6-4368-6c1a-c65e8d1da2e1@linaro.org>
Date: Mon, 9 Jan 2023 08:10:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/5] hw/i2c/bitbang_i2c: Convert DPRINTF() to trace events
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
References: <20230109084121.72138-1-philmd@linaro.org>
 <20230109084121.72138-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109084121.72138-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 09 Jan 2023 16:10:38 -0000

On 1/9/23 00:41, Philippe Mathieu-Daudé wrote:
> Convert the remaining DPRINTF debug macro uses to tracepoints.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i2c/bitbang_i2c.c | 18 ++++++------------
>   hw/i2c/trace-events  |  4 ++++
>   2 files changed, 10 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

