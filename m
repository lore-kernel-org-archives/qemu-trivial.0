Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4DDD68BE7
	for <qemu-trivial@archiver.kernel.org>; Thu, 18 Dec 2025 07:51:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vW8mh-0005Yw-B7; Thu, 18 Dec 2025 02:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vW8md-0005Y6-Q7
 for qemu-trivial@nongnu.org; Thu, 18 Dec 2025 02:50:48 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vW8ma-00044e-I5
 for qemu-trivial@nongnu.org; Thu, 18 Dec 2025 02:50:46 -0500
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-430f9ffd4e8so681759f8f.0
 for <qemu-trivial@nongnu.org>; Wed, 17 Dec 2025 23:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766044243; x=1766649043; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BNuBMvcfRMJftO6hvS2QM/ySAK+YceG+Do76sWoYe0o=;
 b=BtIQ0N2s6GmdMwlx4WHBvMbrEbJnSRhjjilIUn3GAWZ8lq9Ok2bn0qaTJQaRVIaXIQ
 8LPtp1vF5P0rfMlgWV/F4vA8Mcuc7ATg98M4I5qxSP3zEBw0vRZS38noY7HMruaFxB0k
 kSE4FxO8BQvGfK8tQ2wSbgBk7IrKNnDmgEz2sWgwLqyhuWuL4+i9X3kHp8RhT4FJXBJz
 QqiY0tjk3LFzs4Xw7JTp493H+0W+blmVl0x15MSqXNVo+PRJuYgjFF506khICm17kTHj
 WTIWnvy4THp/0QweH1YP+t/cRYeIvzModeJjSICwt1zpSakhtHrEWCGGaMv5/X/qrHoS
 1aLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766044243; x=1766649043;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BNuBMvcfRMJftO6hvS2QM/ySAK+YceG+Do76sWoYe0o=;
 b=FRRHs29pAkeZ2b4q0KIS3sYUVnhFdZ1Zzo65UtAwGPoKlQqMivnUglpPzud1pp+Zd/
 xDhTmiQhxgEtx65ZztHpvO/tSBR+31KccQIFowEkwLeDIYpPD42yKI/Fu1JBBjzaVSOI
 9oVQwGN5oY9f+13uEkmpurvfOpm87sCUMSGum6duJwYDwf2OzsufYGFbvs0XENwyJ3mW
 ERY314SPQYzc2uHlSpFj10frSmqNXDD1JA7ROG8DHC8Z79jpAQmwARRxwhyPdDMvqwxd
 xFRx20pT63GsGvwwJxr3VJ1JVtxEi9ec/loGHY6oD1XWh34SCL//BToDRrdDule8hrp6
 NLJA==
X-Gm-Message-State: AOJu0Yzobm4iJBzjCAVl5RJ1miPQlQfGXYQMu3NLYoXMlnsaZ9JUJTL3
 qzGwV0RZXWc9IT4d3Fzzp8234Zs5GYHzNl1AN86pJkGDGXrgxNnKf/ev9PuvXpv3XB/kf4q4hh+
 RoWIePtTfzg==
X-Gm-Gg: AY/fxX5QRoGczmPgdEdDVkZIo89cFEnL34Rl+KctYvL/Nk1wGkLR7cRVGJ4ComfqHOm
 NJStMRXU22brhjzFovPRCV1gjAODBN1XfTwjj1dGYHSZxyBeTHtHoiKOxcSdt4v5H8qzyb616Ds
 X1Z+GkaUToADGb0Oe1Et2f11AYjLQ+awRgcs4Jvrz+7maC7T/9yawMjD9aV06e9YgG5vmjUDDGP
 gLFU4ymfn5xPwNUIYYLBZv+PEesk3Kq0EVtlQxMj9x9pW7SrgCdpnQUnucecwVfynY7ZGl6c70v
 ioXNVDPGiK8o94whze/CrGdSHLpnpjgZghtMImaPYSgtOxu2SnBsShqtWdVluoG/4zcq3XSw38W
 JO2CT0Zwh97f6M0dtm68i05r6PRG2UlO9qLeWp7S43eeTwXtNdjrw1YBSW2wSwdclbyxj864k3V
 Qd9vBkYXNf6r6pbx/tXGWhgKP5KtZRmSEbQBVCLZ1I8/Vqy+wkU7t4DA==
X-Google-Smtp-Source: AGHT+IE/sk/Zaxi6Kn05S/nIUD/VoHHTMkLi7wP2/3qnhVmfuSDi3wxqB+seCrnUYZruKllxei1iRQ==
X-Received: by 2002:adf:e588:0:b0:431:1c7:f967 with SMTP id
 ffacd0b85a97d-432447ac138mr2019724f8f.17.1766044242575; 
 Wed, 17 Dec 2025 23:50:42 -0800 (PST)
Received: from [192.168.69.202] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324493fd7esm3574073f8f.10.2025.12.17.23.50.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 23:50:40 -0800 (PST)
Message-ID: <ae1c0c21-a464-4893-ac11-c0e831056df9@linaro.org>
Date: Thu, 18 Dec 2025 08:50:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] qemu-options.hx: use KiB, MiB, GiB for power-of-2 units
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20251218073208.160482-1-mjt@tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251218073208.160482-1-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 18/12/25 08:32, Michael Tokarev wrote:
> Use MiB &Co instead of MB &Co when the talk is about
> power-of-two-based sizes, in qemu-options.hx.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3222
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   qemu-options.hx | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


