Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4nLX-0003Hu-It
	for mharc-qemu-trivial@gnu.org; Mon, 12 Dec 2022 13:16:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4nLV-0003Hb-SY
 for qemu-trivial@nongnu.org; Mon, 12 Dec 2022 13:16:09 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4nLR-0001Zb-SX
 for qemu-trivial@nongnu.org; Mon, 12 Dec 2022 13:16:09 -0500
Received: by mail-ed1-x531.google.com with SMTP id s5so14113364edc.12
 for <qemu-trivial@nongnu.org>; Mon, 12 Dec 2022 10:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rmcd/T4V4SjMDzX976K/j6+F5P6q6tnRSzQ2Vom5NL8=;
 b=GPFMGHwirWmBQSFec5auQMfenZdo9q+RxTE5zOifAfP1ohEZEWmTsuBN0Qfn8k6dYN
 uFUBPHdyf7vzG8+q/0K6dcZNoaS6P0ReotTmsqhUUU2tB7JqHzpeU3tdXpb+p5ux4SN1
 gjVvjjz1jNJgUsFwKfsgq0OLtgTEZDAj2Vi2kGJHdkxEIMvy10/GaqNXBNj/hup3rKqo
 6xPPT7Tc43lybLLZvqGXuCqF6EFTrhhx4n0Ltg8yqkl5dY/g0NRDoGeQH17wVNi/Zegx
 SISN9iqMT3158jw4VZ8etE1ONnmHlc+4L5aFI5kxNgol+hRroLEEhh0371BQygfKqoNx
 Actg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rmcd/T4V4SjMDzX976K/j6+F5P6q6tnRSzQ2Vom5NL8=;
 b=6H5KRwv+TNUNPuIvAmWDF627/exFpQgIZ6NyC7XF1B6Kp/LbQNuSaNVCZFCagpBSWc
 pzd7NkdNJaxouDgKSv36hZLFntq2YduLchfd4pP77SRjfbtdLejsF+sVmZMsiV/hQa1e
 d2iu6a4i/JPfgvu+r3aTlOAw4hFnPhKetmolszBbI/ehkbAYs8KjYfURvahMIy7cJL83
 OTz03s4UWfBM5D/aLlsFwziIkqbRvt5uQVXkxNnJeVnYXnw0taZZT6NRdKMPBP8Lmtme
 /C8lDTDpR6f0vk+im0VV9ELrNRqYxsFVHjirF/kt7sXFEpX4c7PARUYoHWb+vIp2QU7A
 FCgg==
X-Gm-Message-State: ANoB5pmg29HPdXkdpSgFIJEeAuj6mxKDBvLoIWDDSetJuYwkXgq8ane6
 nDNgwDx3tpioZzztr5MglqA+kg==
X-Google-Smtp-Source: AA0mqf659nD22V4PEbdeZRvjP3BGEZZuEr09P+d95OEEtJDiLhdJqTPcp9v956JekPVb5+FciwiVwA==
X-Received: by 2002:a05:6402:e09:b0:467:91bc:f523 with SMTP id
 h9-20020a0564020e0900b0046791bcf523mr16416320edh.36.1670868963972; 
 Mon, 12 Dec 2022 10:16:03 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a170906748800b007be2687186fsm3563546ejl.21.2022.12.12.10.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 10:16:03 -0800 (PST)
Message-ID: <56c93019-8892-ef8c-146a-6321c0bff0ec@linaro.org>
Date: Mon, 12 Dec 2022 19:16:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] MAINTAINERS: Add documentation files to the corresponding
 sections
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20221212174841.201003-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221212174841.201003-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x531.google.com
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
X-List-Received-Date: Mon, 12 Dec 2022 18:16:10 -0000

On 12/12/22 18:48, Thomas Huth wrote:
> A lot of files in the docs directory do not have a maintainer according to
> our MAINTAINERS file, though they can be clearly associated with one of the
> sections in there. Add the files now so that our scripts/get_maintainer.pl
> script can output the right maintainer for them.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 20 +++++++++++++++++---
>   1 file changed, 17 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


