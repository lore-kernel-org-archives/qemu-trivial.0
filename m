Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n0vmw-00017h-H0
	for mharc-qemu-trivial@gnu.org; Fri, 24 Dec 2021 20:23:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0vmt-000177-Tt
 for qemu-trivial@nongnu.org; Fri, 24 Dec 2021 20:23:55 -0500
Received: from [2607:f8b0:4864:20::62b] (port=35642
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0vms-0007Lk-9b
 for qemu-trivial@nongnu.org; Fri, 24 Dec 2021 20:23:55 -0500
Received: by mail-pl1-x62b.google.com with SMTP id n16so7514709plc.2
 for <qemu-trivial@nongnu.org>; Fri, 24 Dec 2021 17:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fvU3bHTlGLhtBjLwEyU1RY2Q3Pcnt61OHULbvQOO0OM=;
 b=iYhKowaclarCadeKKfzg8NtfDyukUSIG+GH7Cb4vUP0W0+7IjCfLbnM2YERv44WTQG
 HvenxFTVQ5jPvyePsSFoKur998ce+MKNVnb1eV+LECF0SG/neZocD2CG4CAVlyD6MQdU
 u0QIC7314DA8xwdFzhYnMg7bfkFwJwEEssAjtZVFYePKgiSctFTqYhgYLvMrle91V/9a
 O/PNOELYORZeB/eecWE4AGtuww3fSYcdtQMip4nGnj4On+JHkuFsLo3/2zeXG8XPOyFo
 vqqTGjZ38axy9xCM67wB7NCZfDvtvMQkTFz+oxlckiNABoIsgaGL7a32TH1Nm36IVhWa
 OotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fvU3bHTlGLhtBjLwEyU1RY2Q3Pcnt61OHULbvQOO0OM=;
 b=yBERYaXAE0pCWvSiZHI60PETWlEvl9heIRyBf/zsi9tPGij5fP9xTwJGgZxUiv6aQ7
 pTLbQEA8bfVbszRC4TqmpTTGs83PutvaY1HEr5GmyNo+haFjBHsowvX+P57VgrVvPPG8
 TNesiaJPtOIQoUKSXkzee83MPfLU4ush3FdnKyNHQkaIcF59A8F1WX4mIrWC9Qs7FCC8
 0GWFD84xBftFQDFfq0gGnF3VnWMiwEcu/wo8qt0B93h+8/kEG1m5eAst8pZg4zFZDbob
 Dr+rxl8JJbnoIMkGPdOQCkDYtrD9qSUPph9ox6oaxJ3cZqnArV/lAZN6rOpx9MZJXuVI
 16wQ==
X-Gm-Message-State: AOAM530R/PljGDpJvbBPJAyZR37sJjQm7EnoM5sloj/yidfEZN1LowqJ
 LHkx7+2EG6LfA618aSxf7xpRKA==
X-Google-Smtp-Source: ABdhPJyN7UvIRGi6plfGukpmAfXU5zz6NuBt9KQCV9JGZ1tlABF7tQ2+0Jg0uocNsr3z82sNzxA1yA==
X-Received: by 2002:a17:902:f68a:b0:149:51c0:60a1 with SMTP id
 l10-20020a170902f68a00b0014951c060a1mr8061631plg.31.1640395432768; 
 Fri, 24 Dec 2021 17:23:52 -0800 (PST)
Received: from [172.20.100.20] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id s30sm3320037pfw.195.2021.12.24.17.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Dec 2021 17:23:52 -0800 (PST)
Subject: Re: [PATCH] tests/unit/test-util-sockets: Use g_file_open_tmp() to
 create temp file
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>
References: <20211224234504.3413370-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2bc0b1f2-54ba-af6a-298b-0c86ac4d921f@linaro.org>
Date: Fri, 24 Dec 2021 17:23:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211224234504.3413370-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.133,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sat, 25 Dec 2021 01:23:56 -0000

On 12/24/21 3:45 PM, Philippe Mathieu-Daudé wrote:
> Similarly to commit e63ed64c6d1 ("tests/qtest/virtio-net-failover:
> Use g_file_open_tmp() to create temporary file"), avoid calling
> g_test_rand_int() before g_test_init(): use g_file_open_tmp().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/unit/test-util-sockets.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/unit/test-util-sockets.c b/tests/unit/test-util-sockets.c
> index 72b92465298..896247e3ed3 100644
> --- a/tests/unit/test-util-sockets.c
> +++ b/tests/unit/test-util-sockets.c
> @@ -305,9 +305,11 @@ static void test_socket_unix_abstract(void)
>       };
>       int i;
>   
> +    i = g_file_open_tmp("unix-XXXXXX", &addr.u.q_unix.path, NULL);
> +    g_assert_true(i >= 0);

Just g_assert.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> +    close(i);
> +
>       addr.type = SOCKET_ADDRESS_TYPE_UNIX;
> -    addr.u.q_unix.path = g_strdup_printf("unix-%d-%u",
> -                                         getpid(), g_random_int());
>       addr.u.q_unix.has_abstract = true;
>       addr.u.q_unix.abstract = true;
>       addr.u.q_unix.has_tight = false;
> 


