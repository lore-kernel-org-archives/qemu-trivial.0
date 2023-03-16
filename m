Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pciPs-00082z-Ga
	for mharc-qemu-trivial@gnu.org; Thu, 16 Mar 2023 03:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pciPl-00082E-1B
 for qemu-trivial@nongnu.org; Thu, 16 Mar 2023 03:52:45 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pciPf-0007ln-05
 for qemu-trivial@nongnu.org; Thu, 16 Mar 2023 03:52:42 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 c8-20020a05600c0ac800b003ed2f97a63eso2539157wmr.3
 for <qemu-trivial@nongnu.org>; Thu, 16 Mar 2023 00:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678953157;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BTrmkopY2tQw1IttF9YHuZpiFo3j08F1TAzT3W1WWLs=;
 b=ET4IWYg6r3Oq5oLFxoBSlMsnhxN/kQq9AGrfhYR8P5aojkorPurccZINch0Ai1UDek
 ulWz6p2z/E76JW/tbPIAJIhAVWaioUHwyrjR2Q3ykp6RLh9HCxFn5UFT6IQyZ3A+HkY1
 Vc4Kgh6pAkXTbLXMURWGRvjNu+7BckvZgAe3pUg0FB/4bFxhMFqEJaXhDzXwnFsfVUaY
 6i6aGrP0DbOuIsY5fn2lex5v6VDFLl/Gun5JNp6NQDImaur9gnlcLo5i1oZH1lwzrSxD
 QX8E9V/mX6w56cB47oJX15IfL/0HMx8jd43RtZb3nCqJ2qIPipvVyUkIFdUCJ0D2xZi+
 gcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678953157;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BTrmkopY2tQw1IttF9YHuZpiFo3j08F1TAzT3W1WWLs=;
 b=1KFJgsTYgtHcPKkeKC6zaC4X/fEhud4QoLmHY0+WL+rMoN6UP/a1G3cfLQQ7/Hs09r
 qTar0KeRbGpCM71Wr7kGGacwis/WhqL4BJDITik0zVc9qHiOVlSnHJtQfDJtDJq6ibqS
 J0CQLF5GeRvd8ndNoKW2SWnbkfKp9y194U1YpzW/hQlm0yL7eJbk4XcGJqzAtGoSWQRU
 xe/S8K3EzRpH6Z/uUni7EKy0/h7HBD7zj8djf/FubwcnYRoT7TzeOhVcZrOeX1bQAhpI
 KT6pUU7iYJuPT1ElZAUYWspMy3bgiP3mbfF+ku3s4kFZYxVd00qvgFOTkzHYa7GSznp2
 KSMw==
X-Gm-Message-State: AO0yUKU0z0Vy6Sm/xStwM3voT1l1E1FoLSm1b2e7Ad5pUF2BeNZNYqJJ
 FbNsFQfDV+U1g2WEF9oPsrgzNA==
X-Google-Smtp-Source: AK7set8/rWMpEXkBEaOJ0Ot+5pSA6ffLtoEqf2nm6yCpG+VyNMGhN5v7AH5OJlYCv9XeIGRvs/Emsg==
X-Received: by 2002:a05:600c:3591:b0:3e2:1dac:b071 with SMTP id
 p17-20020a05600c359100b003e21dacb071mr16915340wmq.13.1678953157301; 
 Thu, 16 Mar 2023 00:52:37 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c198e00b003ed29899dfdsm4361354wmq.21.2023.03.16.00.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 00:52:36 -0700 (PDT)
Message-ID: <c854655d-642c-21dc-61a5-4d93b98fc7b1@linaro.org>
Date: Thu, 16 Mar 2023 08:52:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2] target/sh4: Honor QEMU_LOG_FILENAME with QEMU_LOG=cpu
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230316003411.129462-1-iii@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230316003411.129462-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 16 Mar 2023 07:52:45 -0000

On 16/3/23 01:34, Ilya Leoshkevich wrote:
> When using QEMU_LOG=cpu on sh4, QEMU_LOG_FILENAME is partially ignored.
> Fix by using qemu_fprintf() instead of qemu_printf() in the respective
> places.
> 
> Fixes: 90c84c560067 ("qom/cpu: Simplify how CPUClass:cpu_dump_state() prints")
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
> 
> Resend of https://patchew.org/QEMU/20220725142854.177451-1-iii@linux.ibm.com/
> with a trivial rebase.
> 
>   target/sh4/translate.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


