Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1laQvF-0000fi-Fw
	for mharc-qemu-trivial@gnu.org; Sat, 24 Apr 2021 18:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laQvE-0000fJ-UD
 for qemu-trivial@nongnu.org; Sat, 24 Apr 2021 18:38:44 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:36608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laQvC-0008Fx-BM
 for qemu-trivial@nongnu.org; Sat, 24 Apr 2021 18:38:44 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so3075968pjh.1
 for <qemu-trivial@nongnu.org>; Sat, 24 Apr 2021 15:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JyOjC4hnuqpZs4dLJ2oDGWTASNQw4MiSTPeP8nSRLU8=;
 b=ZB1D2ugfow0fItNEc7bImTRx+1Q+f2e6jSr7re6hY0M7UGta0SgjISmDiXFuJ0oODA
 YUM/r7FVGrKESZYKNjf8piVmNOmehyx9QIwx5g8vZVMozpprWGrZ7zsI+Ql9RrYwhFKF
 bHoygcNwK5VARpQdT0pvmey8kRMFWVYl1i5u90IeUEoNpycu2G4Lo0thDJXhNSofG//t
 ZgTBFRwKAqcn8phHevDpOpDzNfdXyQlNY6o8wnWC7dPYqn2DubgdcGpbufCuoCHzZzlg
 QkisPeFSTkQqK2RRc5zF4N5rHwIZcISzuWBFcEXrUfb4N2Wv2QUcD0Bvz7xYe4OT9Uld
 e2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JyOjC4hnuqpZs4dLJ2oDGWTASNQw4MiSTPeP8nSRLU8=;
 b=gY+GmbsBYoe9s4QyCDWKxiF2PyFanz0HKuL7ixVkap/mGsvrhcsO3YkFnIK6IOOz7W
 WLMaTc5BJPL1WP9cccULUhqmU23m3hLsKaTBp8yKY+AqkTzxUIOyQpVtemZjx6mIE59W
 HezE7VaqrETweqV0SngGD3uSvKu0HZ5LXYNEF8klalZPq2S+Qyp0qBEuYgpRchfp26Ck
 T0INJCUzKzzZXOJuE14VHHm0qOPElQh8bnGBou91DF8rNaZJ8XvM74jjNq1pWAyMct4t
 YMUT7jDmPUNCjI8kgBbxO6hAft3iG2lCi+MX35oZIa6uTvXqvnukazwhCJovuobXGe30
 mdXA==
X-Gm-Message-State: AOAM5332xrjT72mIjmwYvIo/W1+WGzIQmBK7TWdKS4TEzMMyZnOKcXLO
 vTTYjaAvjKLPMtunxrnsx2CB7A==
X-Google-Smtp-Source: ABdhPJz6JpH5zWB/TRFQpbepuVTQnroY7Rn33VTgj4R75UbgHzxlxkIjaao9HnuCeVewtMmcsuS0zg==
X-Received: by 2002:a17:90b:1b0d:: with SMTP id
 nu13mr12905976pjb.149.1619303920738; 
 Sat, 24 Apr 2021 15:38:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id ne22sm10848393pjb.5.2021.04.24.15.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 15:38:40 -0700 (PDT)
Subject: Re: [PATCH 0/3] hw: Restrict PCMCIA to ARM target
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Miroslav Rezanina <mrezanin@redhat.com>, John Snow <jsnow@redhat.com>
References: <20210424222057.3434459-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <951882f8-c12b-fffd-44f6-9697c52b8de0@linaro.org>
Date: Sat, 24 Apr 2021 15:38:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424222057.3434459-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sat, 24 Apr 2021 22:38:45 -0000

On 4/24/21 3:20 PM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (3):
>    hw/arm/pxa2xx: Declare PCMCIA bus with Kconfig
>    hw/ide: Add Kconfig dependency MICRODRIVE -> PCMCIA
>    hw/pcmcia: Do not register PCMCIA type if not required

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

