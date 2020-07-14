Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jvLCH-00061m-Po
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jul 2020 09:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jvLCG-00060L-GI
 for qemu-trivial@nongnu.org; Tue, 14 Jul 2020 09:42:12 -0400
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41]:33366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jvLCE-0001L8-SH
 for qemu-trivial@nongnu.org; Tue, 14 Jul 2020 09:42:12 -0400
Received: by mail-qv1-xf41.google.com with SMTP id h17so7486596qvr.0
 for <qemu-trivial@nongnu.org>; Tue, 14 Jul 2020 06:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=65qUOt+pMEbQFzLQ25l1SuoFfwVW3zku4qERNetHfmA=;
 b=Sb5Ue6zhl0KxTJgpnuJUTXaEkWrdy9hLP5T6r22JhG86CPQi37IFRa48CFj4/RVUeN
 6LIQ3hGjjfL6NjhJjyV+fVTDrz29z/NKfxAL37XAnqeUEVgBBoO+4wzKAQn6eql9nBKV
 idmCuCxy60fQvjz8stdGD5NT9Zqn/mywPlqW75wWDcTDOSF5YCl+E3k9ZfpBxLE3msmY
 H7mKlZ5SJ7WZkH2A8N/IndjOrbK7EyLDhvvhB1JStxt9O0Xk2yZEyUUljifalFZJIbOd
 og/4cTQ4B71TuccdbMqNGgQ6Dqum4/w+gbUsjrX0C+zffIHrWqviwVmX1/lIgXLmWQOf
 Y6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=65qUOt+pMEbQFzLQ25l1SuoFfwVW3zku4qERNetHfmA=;
 b=dXkb3EaDa8571iCeD6HAt7BiL40hgPg0+4WSo0MH4aLluX3TlpeC3O0UjC4PWAdYvS
 ASdgpVSk3A7QfXAMQnr9oEQlsEmNfoPbu/zEQoSnjD1rD8X8lGSws2V/5UVw2QkjpzaZ
 7Dtpz2zE7dFxcB1nmhRtxJb+ludZFyTnhCGtSgekXY8jED5pp4shjSiFniILIX0oP1kZ
 6OUtj82vK62lnsQpw6cVi64w/9KFAPdBR7YBhv70rtSYVNeerm5gWvXa7v4/8u0MQRGs
 5VvZ64j2G+rpAjbLdW9zo8IjNJfcyUKksttzeRa1MzmXU4lHxJjt/RQ8L+OYK9GB1PSB
 Stxg==
X-Gm-Message-State: AOAM530S4KbWfiH5phcZsprp4LrvyLsR+UDiXis/Zz8FLrN0RrW1PBEG
 OGwW8bJyA9ozRd9rF5v9FoWkfgxmVgM=
X-Google-Smtp-Source: ABdhPJx5B8sBTH1jUAR3gOhYKgrvpSs7hT4W7Oun6VjbQ/MB2tdh/hZo6phV+GyBAluBm2q8hmqFuw==
X-Received: by 2002:a17:902:7688:: with SMTP id m8mr115836pll.12.1594734120997; 
 Tue, 14 Jul 2020 06:42:00 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id e6sm17190359pfh.176.2020.07.14.06.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 06:41:59 -0700 (PDT)
Subject: Re: [PATCH] target/ppc: Remove superfluous breaks
To: Yi Wang <wang.yi59@zte.com.cn>, qemu-devel@nongnu.org
Cc: Liao Pingfang <liao.pingfang@zte.com.cn>, wang.liang82@zte.com.cn,
 xue.zhihong@zte.com.cn, qemu-trivial <qemu-trivial@nongnu.org>
References: <1594600412-22887-1-git-send-email-wang.yi59@zte.com.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7d0d9d34-eef4-4ec0-8be5-83a6b2651325@linaro.org>
Date: Tue, 14 Jul 2020 06:41:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594600412-22887-1-git-send-email-wang.yi59@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f41;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 14 Jul 2020 13:42:12 -0000

On 7/12/20 5:33 PM, Yi Wang wrote:
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
> 
> Remove superfluous breaks, as there is a "return" before them.
> 
> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
> ---
>  target/ppc/misc_helper.c | 5 -----
>  1 file changed, 5 deletions(-)

Cc: qemu-trivial
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

