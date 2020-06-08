Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiNfP-0006LX-Ab
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jun 2020 15:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jiNfO-0006KD-5C
 for qemu-trivial@nongnu.org; Mon, 08 Jun 2020 15:42:42 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:52812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jiNfN-0003iQ-2X
 for qemu-trivial@nongnu.org; Mon, 08 Jun 2020 15:42:41 -0400
Received: by mail-pj1-x1043.google.com with SMTP id k2so278706pjs.2
 for <qemu-trivial@nongnu.org>; Mon, 08 Jun 2020 12:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kR4X4nQrt8s0VeEPyMSy+BZ8jmyJmBfxjB/bXUbkqn0=;
 b=OL+qxbLpb9pD+9oXGegycN2dp5fikrcRFKvEt8ccy5Rq5HO0dlErmx57Oenv3Epe/u
 g8zsx5pjIoLN1UvQRzC6xG/hyQne57Lh54nB8B9hRRfKeOTKByi3vF6xVvKgOS0007AE
 gxoMe7d9vPI3spGJEWf1f7ch5N9hZb9fF+AjKui+1e3TjvpwMXUPW9HE+twsAAHXMes/
 aQxYPHxSk5yven6JoZjXYBb09yUBESCnE6B1uA56PNKD7DHIKszTt6w7OxLaTtUMtOmb
 sc92hiBdd9oYf94B2m7yj0RW6QYE3fWafMqcymXCIisTjmz29KIlaW8V5jTIAz+xKKu3
 dIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kR4X4nQrt8s0VeEPyMSy+BZ8jmyJmBfxjB/bXUbkqn0=;
 b=Tf0R1WFH1SGffhISkKPJRYRe53il5lCodS7Yvk0D+o+cUl08ujnyJs3bL1N1WHXj01
 XNFesMAL3ZhxUGu8nD/tJe7bh6WLSmPT1Jqxyyo7zw0lU+u6NR9YKkvkhTy61ZG5ghrf
 Hn3lOuRh7ZsR9J1IL/BmvPdiFzoT0aTIddx/IQiex5qsZObhpD1WKL0jh3+t4eWntrOh
 FXpbDeillMZhGt3YlkVWVu76LGEoQ1ELmPKNBIJrYb7gFAnhlQ5Q3JCippbxW8lkVDVq
 9UmxetXma68RWXUgB0N/cyyfBzlM1+CVqLfm3ZuVLc6/QrlnL/mFRmJKZTT3L1hND8pn
 l7sA==
X-Gm-Message-State: AOAM5328SYrwDdnMoljAH3bdlVgTDF9wFu7C0l2kcM0QgJvLzpwL0Jrc
 LMTFZV46gC7Bx4EFLTrvP85djA==
X-Google-Smtp-Source: ABdhPJzOyxOk7BgBAhwjNkti3P1+JR4YO0HwSvjwx8cblfDYHfQPW/c/oLwY7utfkvHFqhERBVgIKg==
X-Received: by 2002:a17:90b:ece:: with SMTP id
 gz14mr824900pjb.93.1591645359627; 
 Mon, 08 Jun 2020 12:42:39 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id c2sm7935955pfi.71.2020.06.08.12.42.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 12:42:38 -0700 (PDT)
Subject: Re: [PATCH v2] hw/openrisc/openrisc_sim: Add assertion to silence GCC
 warning
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Martin_Li=c5=a1ka?= <mliska@suse.cz>,
 Eric Blake <eblake@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Jia Liu <proljc@gmail.com>, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, 1874073@bugs.launchpad.net,
 Christophe de Dinechin <dinechin@redhat.com>,
 Stafford Horne <shorne@gmail.com>
References: <20200608160611.16966-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9646f888-9e8f-b4f9-9aa0-bd3b0951a7e4@linaro.org>
Date: Mon, 8 Jun 2020 12:42:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608160611.16966-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 08 Jun 2020 19:42:42 -0000

On 6/8/20 9:06 AM, Philippe Mathieu-Daudé wrote:
> When compiling with GCC 10 (Fedora 32) using CFLAGS=-O2 we get:
> 
>     CC      or1k-softmmu/hw/openrisc/openrisc_sim.o
>   hw/openrisc/openrisc_sim.c: In function ‘openrisc_sim_init’:
>   hw/openrisc/openrisc_sim.c:87:42: error: ‘cpu_irqs[0]’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>      87 |         sysbus_connect_irq(s, i, cpu_irqs[i][irq_pin]);
>         |                                  ~~~~~~~~^~~
> 
> While humans can tell smp_cpus will always be in the [1, 2] range,
> (openrisc_sim_machine_init sets mc->max_cpus = 2), the compiler
> can't.
> 
> Add an assertion to give the compiler a hint there's no use of
> uninitialized data.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1874073
> Reported-by: Martin Liška <mliska@suse.cz>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Tested-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: Fixed typo in subject (eblake)
> Supersedes: <20200608071409.17024-1-philmd@redhat.com>
> ---
>  hw/openrisc/openrisc_sim.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

