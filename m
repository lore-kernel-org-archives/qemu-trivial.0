Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi71F-0004f7-3U
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 23:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi71D-0004dM-5k
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:32:55 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:38564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi716-00063d-5T
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:32:54 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id a24so1408745qvb.5
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 20:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gyFhxdmnvIuvu2wL+Cx/zC4iV/6FLmL2SKlKtWx6fww=;
 b=KyebPxcBKMbjWoSQZ11y9gkkiKt/1XJpkWaIVyoHhHokunGvwn9CkNUJO8BYL6e11Y
 1xY9OMYcyDQhmqxyz5JphJBdz1kz+j0yDKeZsgeuPiSvvXivn4w5VFFJE7dZSfICFY1S
 FqzidKLDDxxN2bfnjZmkkBcuvEtPrtgpL55jptyvcrvnfTAdL5GBMWuDzYpf40LsYR4f
 xFFXDluxjP1+X2Aov8wXHwAm232OF4qFGlGam3JMMu5yfHIN5UMmCO2JnhLUPSrfudb3
 bWhtVk+i7kYT60nHzDTDh2o2gh99T4a62F7EPkPo8RBOvDHU/lV/kL7LxthyzXKgX6y4
 jo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gyFhxdmnvIuvu2wL+Cx/zC4iV/6FLmL2SKlKtWx6fww=;
 b=I72zloZqSN3Nv3R4buZK2027ADveeJbo56V/2Qzc7M7AR91ePZ9Nb2zQMkI48hTuNn
 nlBN33m5eazg+/y73GnVammKp77q9hLNWxjE8bg6+UkcSG5e0n73NKR9d7trS9g9lsed
 3+BlDPwNHOC7aU0meAYP1Qm6a6DbbmCZBzdn0tDvK4GT4OVRFRUH0qZq1OL/Hmz1bjq1
 DL300+CuXZcF5kkQbmq6t9xxwg0TwKcbBuf46YUSfL1jWKSy+JcSs18cSXfMyokxIZiF
 s0PJ1+7nx27PCMc57cp0ESzX2jtYci5mkk5c2j/7OFqVH4vO0TXQgvtW3QYuwdGJtNkF
 zpWg==
X-Gm-Message-State: AOAM5304jSkghQHxWEGI9fIHWAUJusX9qJuRly/UHf+HgXraB2zIT5Na
 M64Qytl32DVIH5pQq12ek2ySbQ==
X-Google-Smtp-Source: ABdhPJyBGcgPwukGkB/upbdDsHEymAsxpUGDnGEPQZN+UVrtTXJuUUjFqowVNYPxTgSGt2jQO6fFpg==
X-Received: by 2002:ac8:7d0f:: with SMTP id g15mr36395330qtb.60.1635910367178; 
 Tue, 02 Nov 2021 20:32:47 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id j13sm681941qkp.111.2021.11.02.20.32.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:32:46 -0700 (PDT)
Subject: Re: [PATCH v2 18/30] bsd-user/freebsd: Create common
 target_os_ucontext.h file
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Kyle Evans <kevans@freebsd.org>,
 Laurent Vivier <laurent@vivier.eu>
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-19-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d56f6af4-4739-800e-b7b5-ecb8e4dab293@linaro.org>
Date: Tue, 2 Nov 2021 23:32:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-19-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 03 Nov 2021 03:32:55 -0000

On 11/2/21 6:52 PM, Warner Losh wrote:
> FreeBSD has a MI ucontext structure that contains the MD mcontext
> machine state and other things that are machine independent. Create an
> include file for all the ucontext stuff. It needs to be included in the
> arch specific files after target_mcontext is defined. This is largely
> copied from sys/_ucontext.h with the comments about layout removed
> because we don't support ancient FreeBSD binaries.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/target_os_signal.h   |  3 ---
>   bsd-user/freebsd/target_os_ucontext.h | 26 ++++++++++++++++++++++++++
>   2 files changed, 26 insertions(+), 3 deletions(-)
>   create mode 100644 bsd-user/freebsd/target_os_ucontext.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

