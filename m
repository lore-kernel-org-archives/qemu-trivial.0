Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jm4EY-0000Yd-Ob
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jun 2020 19:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jm4EX-0000UV-1i
 for qemu-trivial@nongnu.org; Thu, 18 Jun 2020 19:46:13 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:53705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jm4EU-0003rn-Ma
 for qemu-trivial@nongnu.org; Thu, 18 Jun 2020 19:46:12 -0400
Received: by mail-pj1-x1043.google.com with SMTP id i12so3299995pju.3
 for <qemu-trivial@nongnu.org>; Thu, 18 Jun 2020 16:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uLtkQnH7DuuSCEmEDthGipcO+ld6NjQx6IMKmRnCHbI=;
 b=IL+yCckYvyuMAMKhWiMCibrIY6t8miA1xyXS+tAcib1gwFiCuDiBvMSskJBU6n/X/P
 VWijBzePU4ZNYN0WHLCMR0R+Q6+v0m/ybSg7p9XF2B/0TSkjKSwbIFXXPMw1Tq3Xxw0H
 +2bUR8VGRxDal1iqDLIyH+D67A+gp2nb64uIipd1M9yAQwEIEnGWSd9WeisndqHIzsnA
 NrfmvGnxxQS8PGeOk/wmg1SQrdBNZnjKBZWC6SbdIdymA90p/AaMq6Ny1TzetiZJHqs1
 v1sX8n3q1j9OwWQu2YDPwIVx1AnW8F0pzyckmq3NNA2NHh8DGaeV8Ec8r7YhZme0n0UW
 AbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uLtkQnH7DuuSCEmEDthGipcO+ld6NjQx6IMKmRnCHbI=;
 b=bL/XFzyyDZZQYKkz6s2dTQPeF68TdTcaX/X1AunSxjox4Vse/8J1yf89jNnZvqZ1Gn
 tWYAfPNTAWx//YVtc2UU2KxFRjUH6eVHSGATSgmGyN22/z1JZIu4Tg51TIZ86/bNBqlw
 4DFm38pfLvtDT6+uNA0n4NSo8IGFRn+dZnrnmc64tYmWBzgRQ+0GDZcLYQlGHMSwr0QW
 iWrOR2v9dsC1Zmen+MtSsUBpCM3yHtxmiVDWqDtp6jobS2t1klRl9uqeUUkQ9qf41w1G
 N6hqdSI925rhUcHbSn987VZr171UtqNTqkCtbXGevVh9a0ILehtvO3AuzbLgkQwjcAQ8
 sg7A==
X-Gm-Message-State: AOAM533JgkUFrqAhy0Cs+orsCfVoOBZKkT2IjFTJOVFoC04Y+Sluq3if
 iPdwHXyrDK1vt61xLAYPYi65wxntZCw=
X-Google-Smtp-Source: ABdhPJz5BgbxrlKRruXF84WW+rQTnYajbeoq0L2XkYTfAAZTVxynePGofR7VreypzULQNdCWXP0mLA==
X-Received: by 2002:a17:902:222:: with SMTP id 31mr5813587plc.67.1592523968754; 
 Thu, 18 Jun 2020 16:46:08 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id f29sm3649440pgf.63.2020.06.18.16.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2020 16:46:08 -0700 (PDT)
Subject: Re: [PATCH 5/6] fix the prototype of muls64/mulu64
To: Lijun Pan <ljp@linux.ibm.com>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20200613042029.22321-1-ljp@linux.ibm.com>
 <20200613042029.22321-6-ljp@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-trivial <qemu-trivial@nongnu.org>
Message-ID: <e9e01473-251e-51ec-8f72-72ddd1a9ab2e@linaro.org>
Date: Thu, 18 Jun 2020 16:46:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200613042029.22321-6-ljp@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 18 Jun 2020 23:46:13 -0000

On 6/12/20 9:20 PM, Lijun Pan wrote:
> The prototypes of muls64/mulu64 in host-utils.h should match the
> definitions in host-utils.c
> 
> Signed-off-by: Lijun Pan <ljp@linux.ibm.com>
> ---
>  include/qemu/host-utils.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
CC: qemu-trivial.


r~

