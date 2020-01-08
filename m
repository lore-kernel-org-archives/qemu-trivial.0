Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ip2Fq-0000zF-IJ
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jan 2020 22:43:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46426)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ip2Fo-0000z5-Mu
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 22:43:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ip2Fn-0000YM-Bj
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 22:43:32 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:52738)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ip2Fn-0000Xk-5J
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 22:43:31 -0500
Received: by mail-pj1-x1043.google.com with SMTP id a6so462451pjh.2
 for <qemu-trivial@nongnu.org>; Tue, 07 Jan 2020 19:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n4KRq0iVYMZ1ZUExiPG20dlEc9tkNUHT9Cu9seAfTfs=;
 b=Cr2FzRNjA/Blb6c0Sinrdtr0wyaZ3cHF+c9aQ5Vq3UM4YXMeDAvUblcxvJcxjf8LeN
 QMSMvfe9rUW9636zMcwqXnS0cmiGxKOwfHBMYFJqNcaLVZx05XnzQN60U1LNio6WsLhx
 CBaSvNM00ttJplnWrqcQtDnesYdy2lpApsUuyNbRSAruLLFlCMTe4rMnTL62PirJ5V/c
 wZYuom9RW1gLGBNDiPqKqXnnfAYiPv7/EIyFJsJcyCbCfXVZc2ZHU6OZstyr5338UPAz
 y+lT//Viu8ODJ7SbEDqM+zfR/ipN2Gc/A+Bt7LJtTRQa3d4Mco+s81T25kZ7WELpcet0
 Ne3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n4KRq0iVYMZ1ZUExiPG20dlEc9tkNUHT9Cu9seAfTfs=;
 b=hwGjoxrMl3qp2m2oWNqANRjwxmqPZDRQnyotKWJFJ2U7DtWGRVl4ekIetUSpyDrpIB
 liXYAr2/NkcWaGb5dbYOnGH/mcmRsN+PCy9svzW/ihg3mn/XImB35+ljzTwGooptGah+
 8ROAHKxdWZd88+MjHPHOeg/EnmuiSUIkys7z6AwObseHd0OztZP7UyAh/grBmT3yc19Y
 8M32WqGbEeFOfQzGem7ehIEP5VmlsZdB0oIZTfRxZpEdbiNFEGgB1klwuV6ehN6GuJOx
 vncM7hqsBw4kqec04iyPWxVG78GxkmpiB/BZe+AzB6J+QbCaoB3YyIzZCiKNP3Jo4LkI
 LmBg==
X-Gm-Message-State: APjAAAX8YDzWnO/Mipp7sTEIRd00Y1NTiV92yZTTwGARRSzkWKoN2qa6
 3zRWfrqWKH9BvsMpGZMQMF9ejg==
X-Google-Smtp-Source: APXvYqxkW5J1QX7FPiii7GhLBDVZw2J4tqeaIAx+/JCNb13jbWfUXjbnA+P60neWfeP2ywY5E7AoLQ==
X-Received: by 2002:a17:90a:20aa:: with SMTP id
 f39mr2134589pjg.35.1578455010013; 
 Tue, 07 Jan 2020 19:43:30 -0800 (PST)
Received: from [192.168.15.12] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id 203sm1101880pfy.185.2020.01.07.19.43.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 19:43:29 -0800 (PST)
Subject: Re: [PATCH v2] arm/translate-a64: fix uninitialized variable warning
To: pannengyuan@huawei.com, peter.maydell@linaro.org
Cc: zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Euler Robot <euler.robot@huawei.com>
References: <20200108023915.52288-1-pannengyuan@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f024c3a8-6685-e37a-c53f-44c6116d3268@linaro.org>
Date: Wed, 8 Jan 2020 13:43:23 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200108023915.52288-1-pannengyuan@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
X-List-Received-Date: Wed, 08 Jan 2020 03:43:33 -0000

On 1/8/20 12:39 PM, pannengyuan@huawei.com wrote:
> From: Pan Nengyuan <pannengyuan@huawei.com>
> 
> Fixes:
> target/arm/translate-a64.c: In function 'disas_crypto_three_reg_sha512':
> target/arm/translate-a64.c:13625:9: error: 'genfn' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>     genfn(tcg_rd_ptr, tcg_rn_ptr, tcg_rm_ptr);
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> qemu/target/arm/translate-a64.c:13609:8: error: 'feature' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>     if (!feature) {
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> ---
> Changes v2 to v1:
> - add a default label to fix uninitialized warnings(suggested by Richard Henderson)
> ---
>  target/arm/translate-a64.c | 2 ++
>  1 file changed, 2 insertions(+)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Given that you are using -O2, this should probably also be reported as a GCC bug.


r~

