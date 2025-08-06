Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255C0C87FCB
	for <qemu-trivial@archiver.kernel.org>; Wed,  6 Aug 2025 10:02:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1ujayw-0005KX-DK; Wed, 06 Aug 2025 06:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ujaxb-0004jk-IE
 for qemu-trivial@nongnu.org; Wed, 06 Aug 2025 06:01:28 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ujaxY-0000VJ-Il
 for qemu-trivial@nongnu.org; Wed, 06 Aug 2025 06:01:27 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-459d44d286eso3460715e9.0
 for <qemu-trivial@nongnu.org>; Wed, 06 Aug 2025 03:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754474482; x=1755079282; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6yXJF+9CUMtCR+oiK/i9F6m4chse/rhEdFc+23H8168=;
 b=M28ExtMpcgv16XGs1fP0TzBg1nqRtksEE8LNO2Drb689FRhdvmSgrligTi4U3S/o+F
 C2ZOkyCZY5jBLoJIQShxzd4ynuDFRm0qa8nPCqs4FRVYTsebCZJTvXkKE1TZxO10E19h
 MT182v0te3hOPAXXA14jNLRpX5rRJ7kZpaHgNqb1FxX3iuX1I/w9hmimnkQUJROm/gL8
 hFvAeQENCGarPfsls7MVSKICdfDdpAF9Qn44yBHO5yb33WB5XFJ0SShmim0QzVqC/ze6
 S621uwElO1nQpnogmK0Y0mV0Co+Rr4yxA41K8lAxF3zw4RWf1uje2y8j6g3v/1IKRWkR
 gPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754474482; x=1755079282;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6yXJF+9CUMtCR+oiK/i9F6m4chse/rhEdFc+23H8168=;
 b=iiXF7oZ6AKwhTNwbLtZplLP7uxiQMpBDUwnAJ32jmx9SPI2bFOJKC7EqrI3B7uTG7B
 ZWfU62k7m694/4kcu24T6l4fqJkYZNA1ChFQMM3CKvIHkLp0no5Y58bFJagPVW9iq5rt
 P5oPZzEMeXuGUbMPmVPAhH+SsKzVjxO3cszqsq/SkAzz+iexK2W0s+bFPWd8AeViPB7j
 JnPTynvRktDCuIgEEoJs1+RIjIBqpeJ/ifV/4xJ8dWNKPxThG6SGpcQaeGWN9rkdF64F
 WKOXvRq0ICWOTHt4c5DIv52JXbXaEj4hH+wkUjMI0R6jNbIINsUechgJbHl5Php8lvmE
 80tw==
X-Gm-Message-State: AOJu0YyJ0uu1brvY2pOywKoUn2GrhkIR/IfLKYWB1zaL9qFG2iMjJrrm
 EisznSTAd4f4b5rCFiaf955gmugAnKtVzTqaADKICxv8m6a1IsrjZyXt96z6T0m0Wt0=
X-Gm-Gg: ASbGncs/7XcmQ+L81RvGibAFkbq1sRAXSlFhRo5my3YkjdyF1+KCOCIGdfUSt3VAObl
 T+BrGz4dQl7rzFBT6m9OuK4fZmLDCNYvvQquEkQaDbLJrqhLvzJbrS9/wnWUVcEHaHpPfhlLfxy
 iFidWOnb69hIyRC2YO6cCbObe1aB+6nvdQduftlq5E1j+WO3X6XM8yuQy/3TqGWIHOMHviszA5Q
 s9xGtcJoG1RVDFkXNmP3ETpouBkqGaAMhovtHsyGPJFqB96BPvsWC3hGI/4X4OzUClvzxNKdrnM
 wr/ZIPsEC/Tg43X3cMejMP7Hjw5Txt+8HtxxdzvzW7/FcnTsz92UN9EAtpmi9NNwQrsGG/psvMN
 YOuDTpfE604riyHUlshFxEtxuFn/ZWC/V0LPuVWwbUgWNIa0uaeIdI5bkRQq/7BXRoQ==
X-Google-Smtp-Source: AGHT+IFTEf454HebWuqioJACxAAJUB0ZM3gI3ZnJeHqGWUNd3vptzUbQcCGBuQo5g+A7f1LaPozNug==
X-Received: by 2002:a05:600c:1ca6:b0:456:1281:f8dd with SMTP id
 5b1f17b1804b1-459e70d842bmr18755595e9.12.1754474482452; 
 Wed, 06 Aug 2025 03:01:22 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453aeasm23151929f8f.40.2025.08.06.03.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 03:01:21 -0700 (PDT)
Message-ID: <d844430a-7b95-4b10-b7e5-7e268348efe6@linaro.org>
Date: Wed, 6 Aug 2025 12:01:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH trivial] tests/qemu-iotests/tests/mirror-sparse: actually
 require O_DIRECT
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20250806075635.3290-1-mjt@tls.msk.ru>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250806075635.3290-1-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 6/8/25 09:56, Michael Tokarev wrote:
> Commit c0ddcb2cbc146e introduced the test which uses cache=direct
> mode, without checking if the scratch filesystem supports O_DIRECT.
> A subsequent commit, afeb002e0ad49d, tried to fix that issue, but
> instead of checking for o_direct, it checked for
> `_supported_cache_modes none directsync`, which is not what the
> original mirror-sparse test uses.  Fix both by actually checking
> for o_direct.
> 
> Fixes: c0ddcb2cbc146e "tests: Add iotest mirror-sparse for recent patches"
> Fixes: afeb002e0ad49d "tests/qemu-iotests/tests/mirror-sparse: skip if O_DIRECT is not supported"
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
> This is what happens when rushing for last-minute
> pre-release fixes..  I'm sorry for this.

My bad actually :/

> 
>   tests/qemu-iotests/tests/mirror-sparse | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/tests/mirror-sparse b/tests/qemu-iotests/tests/mirror-sparse
> index 3b183eea88..ee7101bd50 100755
> --- a/tests/qemu-iotests/tests/mirror-sparse
> +++ b/tests/qemu-iotests/tests/mirror-sparse
> @@ -40,7 +40,7 @@ cd ..
>   _supported_fmt qcow2 raw  # Format of the source. dst is always raw file
>   _supported_proto file
>   _supported_os Linux
> -_supported_cache_modes none directsync
> +_require_o_direct
>   _require_disk_usage
>   
>   echo


