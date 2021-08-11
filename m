Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mDsXe-00027K-9Y
	for mharc-qemu-trivial@gnu.org; Wed, 11 Aug 2021 14:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDsXc-000260-IL
 for qemu-trivial@nongnu.org; Wed, 11 Aug 2021 14:01:24 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:52147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDsXb-0004Yo-4C
 for qemu-trivial@nongnu.org; Wed, 11 Aug 2021 14:01:24 -0400
Received: by mail-pj1-x102d.google.com with SMTP id oa17so4783782pjb.1
 for <qemu-trivial@nongnu.org>; Wed, 11 Aug 2021 11:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A0RNL3HRRjud3Y+DX1SeogZjbb8DnZj3RGRkcKqaJI4=;
 b=RwD7D4+42VwIbAzOH7VbA5GWHJUv7ofgvqsU1tQ2y8v6jVqSgHg0lxCFhXvLNxgxW8
 GI53bgG0DXmQ8YImQMqxupQp2QsaBhlzH/sG+lGXGTQ9ekw2KfdkkSwktoOdmZ65/78V
 BbnmUAeB9lv5L6UUifw9fvUWH89+ix4Z0buYFmasReVVDKflGAZwpGrq2jL7QuRVDGhU
 lXw7WW/CKwg8YGcjlckqGJLSEoBcOcz9rYa9et7Ls7YGFdg1piYVNDiQcxERjuRyW5Jz
 za/o4VwGT1gdfrOeoH4RD4mGeNdfN3rq0yHpV8xkP7uFbHJQ/vCDr/tlKt7OXt0Ye+GU
 X3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A0RNL3HRRjud3Y+DX1SeogZjbb8DnZj3RGRkcKqaJI4=;
 b=Ugrvunpg3UEXnJJPPG0dDhIS1AwWupKAHBtr0CI4VKZh9KJyNyu5Z0R8L1+pUEHAuD
 ePX/yTO2Kr769YT2a8Qb1A+spJhHvDCSQFvN15sVkY2WPy6p7N1X6Y8nAjKux2w5VsVr
 FqSF+ANOJY7DNlGAqx0f3C8D8r18PAx7h1jAZ1mRj+xdQEYQLaQ1JuP9ZBRmg1WgQZYW
 QUb0s9Mc60gMkZ5Dy+KMbYpTydz4+3CO43wEJ7ScilrIPY4AibFyahtS0H1vF3S+bNlU
 fdxH1CKaLTCczgUzht77f9PiaerRlhHUEspzoOGhaKfQbtj/k38f698WbnEhr0wIWB56
 Sx/g==
X-Gm-Message-State: AOAM531gQhH/fk7xuQFsGBwP1oi8dJrnkgEzfNUdobt+JtVStb9oNtnJ
 9yvUiPXrIxSBjsFJzw2mhrTVnuSoE2F9sw==
X-Google-Smtp-Source: ABdhPJzIYL4NcRIpx25AK0YO22EtunpTMY9wgPuwxrFPZOlWdHGNqQCDsZDT5y89r+3/WBPjSMIhJA==
X-Received: by 2002:a05:6a00:2411:b029:3b6:2acf:6d16 with SMTP id
 z17-20020a056a002411b02903b62acf6d16mr35636pfh.44.1628704881352; 
 Wed, 11 Aug 2021 11:01:21 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id z24sm150004pfn.150.2021.08.11.11.01.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 11:01:19 -0700 (PDT)
Subject: Re: [PATCH] accel/tcg: remove redundant TCG_KICK_PERIOD define
To: Luc Michel <lmichel@kalray.eu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210811141229.12470-1-lmichel@kalray.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <72a05969-2859-1c4c-3a6c-4d0fa322a1dd@linaro.org>
Date: Wed, 11 Aug 2021 08:01:09 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210811141229.12470-1-lmichel@kalray.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 11 Aug 2021 18:01:24 -0000

On 8/11/21 4:12 AM, Luc Michel wrote:
> The TCG_KICK_PERIOD macro is already defined in tcg-accel-ops-rr.h.
> Remove it from tcg-accel-ops-rr.c.
> 
> Signed-off-by: Luc Michel<lmichel@kalray.eu>
> ---
>   accel/tcg/tcg-accel-ops-rr.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

