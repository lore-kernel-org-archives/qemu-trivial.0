Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qInn1-0002pV-SM
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jul 2023 06:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qInmq-0002m4-L7
 for qemu-trivial@nongnu.org; Mon, 10 Jul 2023 06:06:36 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qInml-0003DB-9x
 for qemu-trivial@nongnu.org; Mon, 10 Jul 2023 06:06:30 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3142a9ffa89so4935418f8f.0
 for <qemu-trivial@nongnu.org>; Mon, 10 Jul 2023 03:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688983586; x=1691575586;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YTzpxqQ3tcZCyathxE1IsYFNxLxQSDOOexQYope2eqs=;
 b=bym79lapWd+0Zyy8XxJzIP7fyCspr3/J4surZAtKdVEfjRvI8h+xDdBM1CAIj/DJFO
 Sb0hGY8nEqstkvSVFamiEDSpX7TC6C8o7NWnxqUhCAkgvmBeXrvszGWwbUqf/riob/Or
 kgUfftwjhIQ9Oo0nAJ0H6N3n9rYychpHp+VucqYbJMZjhqHB/IR8ov9pJhZKuh3aEIdP
 FAmR1GFp0vNYyj/sTg+08b4fVcvYvj59zeTk6FlO+f9dfXHdW6XTEC6NpCXvDYLE3NDw
 54H0HBQmy205V3+JwAJ7AVhO3pbu6kaQrI/33Z3WwQaxsTbyL9L0a1Nb+oJ2ijKLB7sU
 sGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688983586; x=1691575586;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YTzpxqQ3tcZCyathxE1IsYFNxLxQSDOOexQYope2eqs=;
 b=ImE+HMg4E6Khm3zbTkRgiZdTMyPHXnVaTU3fRGa6Go47w8Hya6Uew2A8AcmsfNjHSK
 XhxwbUmrytkaJCVrf4MXYcWfNByiS3T9umOwFgsiNVRpPRaUcPXFP7F95ZjSgVlLF/k1
 z6e/yOMbMqBHdh1DpRtjfurfEkapdUrrlNmwt1X0SPS8TfWTw9dl7Wdv3uXCQdn1yywr
 Uqhc9Q44fSMJGqR79ryBxA4gi39+FOgGnPBADFaAPdPtqZsLan/whjyNNTB5z7zRTWj0
 3qnLvqUNXkqqFmlRVIz3Yrr8LGyk7gBBzwve/0G+WaE2Uqli+ni8BlSEINYSFpssHXAN
 ulXA==
X-Gm-Message-State: ABy/qLYG7NnqVOcIdWcfkXm0KIzWmvhe7PDEmwmb8yXv8cQmYj9nxblL
 oYIiUugtr2+c0Rfs+sqnavAwWw==
X-Google-Smtp-Source: APBJJlF5l7vEzNxca9/ndr6MlTs2MFlRwegaesLbGp7ScjPWEpibwgsD2uQQ3qTp4pvDor2yDZbfSQ==
X-Received: by 2002:adf:ee07:0:b0:315:a190:d110 with SMTP id
 y7-20020adfee07000000b00315a190d110mr329090wrn.28.1688983585966; 
 Mon, 10 Jul 2023 03:06:25 -0700 (PDT)
Received: from [192.168.229.175] (70.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.70]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d4742000000b0031434936f0dsm11251899wrs.68.2023.07.10.03.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 03:06:25 -0700 (PDT)
Message-ID: <d12fc73a-1e8d-5234-9b3d-ad2005cff3db@linaro.org>
Date: Mon, 10 Jul 2023 12:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] docs/devel: Fix coding style in style.rst
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Markus Armbruster <armbru@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Konstantin Kostiuk <kkostiuk@redhat.com>
References: <20230710092638.161625-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230710092638.161625-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 10 Jul 2023 10:06:41 -0000

On 10/7/23 11:26, Thomas Huth wrote:
> As defined earlier in this file, the opening curly brace of
> functions should be placed on a separate line. So we should
> do it in the examples here, too.
> 
> Reported-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> Fixes: 821f296756 ("docs: document use of automatic cleanup functions in glib")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/devel/style.rst | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


