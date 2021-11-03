Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi7Gs-0002U4-IO
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 23:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7Gr-0002RJ-O1
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:49:05 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:43672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7Gp-0005US-Uk
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:49:05 -0400
Received: by mail-qk1-x72d.google.com with SMTP id bp7so1078889qkb.10
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 20:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6RB6LVYvytbPHiqlzVm/4rG3RyTmZGg5H6EF1SeoaG0=;
 b=BaKfr9OR1LffpX8iB740+7XJr6MmJOnYZDRwAOLe4/ORoledovWPtcbJwPp7JDuoNx
 uTjblTQ1G2y07uSHr2CVJOfGrhOlI06J8qm64kSXdOxemPuoKmBNXC+2oDhi1KrlJBIU
 84iv7ldI3naEPM0KoZK9+3x3rz4iNB5o9Bz7SYV8hbCidPE1lr4+2xwZOR3uX4UBithg
 c1o860y5JLayCXs3J+Hx2Fq4Yt3wnaaqKEMrGj0AYAExFvLOrW+afXnH1tNDkdOc9LaW
 Lb6+do2MVraZFrj2ZSNTNxNX6zPxA0mVPT60Ie8tv+X3FQFqAEwORPjotIABZdhJpukZ
 F5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6RB6LVYvytbPHiqlzVm/4rG3RyTmZGg5H6EF1SeoaG0=;
 b=DsXEiBVkwBtJoIOJR289HDtoKbXaDga2x/1tqnkN0EKDyLr12o0kotD4oUAWzf47wm
 SpPMTdjfCTdpBwFkLlTdziJTblOTp/uyUiLtDbTqFw7t4yjt09WxepSTLBmro38g3CVy
 hfBm0oxzvNWkxNA0pCgDAJT+WP72rsTPfx/9OSVAUNc3RgOKkDb6KOFGKf5gmHPwi4pD
 UXZm6C9gYwtwuepqf1IHmUSrELvX36z/Py+AboTcUP2qwhBek1HV32xiHQinFRUlsv1E
 LoO2TNcGIrWJvKnSc3dO/9g7h0hLK3W3VTdiXElWmVEIrfe80BeSQr6fYTI6Ze9Mk/CQ
 4pNA==
X-Gm-Message-State: AOAM531IzI7ElIlUr/hX1tShMFErfutjBRFN2SYxjKaJH1ns3JO0uCFb
 fjfEiyg50zHb+6UZsAJF0NmYj8TN0Qzcug==
X-Google-Smtp-Source: ABdhPJz+l9X0NCEzyyfnuIDwCFPFkyPRcbB9KLhoWHZgQNd4kcINB9oWimAw71QPGysPjZokWvy4Bg==
X-Received: by 2002:a37:e117:: with SMTP id c23mr16322545qkm.166.1635911343055; 
 Tue, 02 Nov 2021 20:49:03 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id h125sm670820qkc.29.2021.11.02.20.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:49:02 -0700 (PDT)
Subject: Re: [PATCH v2 30/30] bsd-user/x86_64/target_arch_signal.h: use new
 target_os_ucontext.h
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Kyle Evans <kevans@freebsd.org>,
 Laurent Vivier <laurent@vivier.eu>
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-31-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <907b80d7-a1fd-19f3-0518-e9a737116d8f@linaro.org>
Date: Tue, 2 Nov 2021 23:49:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-31-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
X-List-Received-Date: Wed, 03 Nov 2021 03:49:06 -0000

On 11/2/21 6:52 PM, Warner Losh wrote:
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/x86_64/target_arch_signal.h | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

