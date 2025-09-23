Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E6BCAC5A7
	for <qemu-trivial@archiver.kernel.org>; Tue, 23 Sep 2025 12:19:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v11za-0004jz-4W; Tue, 23 Sep 2025 08:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v11zX-0004ik-7e
 for qemu-trivial@nongnu.org; Tue, 23 Sep 2025 08:19:31 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v11zQ-0006fH-MB
 for qemu-trivial@nongnu.org; Tue, 23 Sep 2025 08:19:29 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3ee1221ceaaso3176333f8f.3
 for <qemu-trivial@nongnu.org>; Tue, 23 Sep 2025 05:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758629953; x=1759234753; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mtUtxOYte546DTIBwSJ4GxuCOojA4ezq+akkecOlHyY=;
 b=T9rREt0KtwXkjJnbQss4trBYBbiVVVyHyDaL5gGLUJGa1AtvEoSFyCaEwwNznA8Pbj
 wP4X37eEx12NbzinUG9WTi6G1qFDGii0wqamso/pluqLlCLZ3v36PB5GPYi7M+HrwDAk
 7c0P/ZBHVFZJFz6h3IaNZBYWtEiqLdagqp2zEdFvuhXSSFgxVl215etzeZsD+DKn3WpX
 JOH1n6GaV/c6MnBCFcr3vYUqsx1uPi4QN8QbH3k2PtzQsyPJN2gtEcWdzoU4pEZij3J5
 Nuy6IHSK3yRnAUcCtGLhlR0v7dDygnBEWS+X/Sd/hZ1XinSg6FoeML4wANEx4rfGAJaB
 6Cig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758629953; x=1759234753;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mtUtxOYte546DTIBwSJ4GxuCOojA4ezq+akkecOlHyY=;
 b=ekKejyqgMXNf3R5OuCTlkW07sLXOtV2rfCcmSKgAqbM/PiqIcfroEDSe25uUgfBuCw
 UfCuA50NT2H3gCuS2CCuqowAbJ2lw86fEISaW/nUNbkyu2yNXPiV4hdKbVZWeHtt6ijv
 yHg89lInX6BV2Lo3+YJhJUXPErPDtuevrActGZqULhaJf1Qz0CWfbH9AEnsY0R4O005B
 FWBv1tUQyqS/iSsvoqRno+xEGwj8aiKxpvfRvAjhQj5WPWOSo4OonnrjqyWTm6Ou0itD
 uoakhkT92mQEFAN5AZtfVBAYnSd10UN+qro882nfa+6mdGNdj/11ANv9m7sozh8Sx8KA
 jTZw==
X-Gm-Message-State: AOJu0YxomMxpdMM61hmxShtGJnUQvHTi5W4EPiNqFwhzsQrMmL2+FiNi
 t0NLKIE30fV3eXt7exn48SQJO3KF4K6t1gl51RSEz/xUbRHGL64w6wPnAid0uy/vYJQ=
X-Gm-Gg: ASbGncvtXfAPwKO3PVhOQbSzQYnJdjH6Ov8L+v8ccbft+AwARDlZddrPBFOQa3KWZx4
 keetYQq540lN7ycvC/XwU5EOF1C9OZK3Vib5Fd6OMp6TLPRy2BdKZZFlHPD3+cHNu9EE4b3whCR
 aW2Qrak43w1Hd9r6wo68lOtJQc+55bStIOBa6xD1hX4SbRZxLVvyS1QaI+KHEkqrOmvsx523Uf3
 6+p2XsrLWvmC4189kf+2T69E7hlbssT4OAFu8merI7lxk6Y47Q/1kEBbjG+nDoX4afIJvBQopce
 UkcEr8h//dI/S4wKa4drvp8TQpTX3EnyMu6u81TtMk61BKIUUfgio23k6m8ETYQMIDt+ybZw6nx
 SOG9jYgrwHOu4uLieiiBykNBsAaNZC8uAVij/BY3eza2vn+qPuc80cKBh9Wkq1lDFGA==
X-Google-Smtp-Source: AGHT+IEV805tL9JEr5LGyZjVLPqHZMTuLQmT65L5nc8vRarrS/nVjqBNQE98wqBfps+IS3k5meyooQ==
X-Received: by 2002:a05:6000:200b:b0:3ea:6680:8fa0 with SMTP id
 ffacd0b85a97d-405c5bd8627mr2011290f8f.14.1758629953138; 
 Tue, 23 Sep 2025 05:19:13 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46dea20f833sm72665415e9.10.2025.09.23.05.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 05:19:12 -0700 (PDT)
Message-ID: <8c99f4b6-3ce1-414c-92fe-6e2118599550@linaro.org>
Date: Tue, 23 Sep 2025 14:19:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/specs/spdm.rst: Fix typo in x86_64 architecture name
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20250923120118.858581-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250923120118.858581-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 23/9/25 14:01, Peter Maydell wrote:
> The spdm.rst docs call the 64-bit x86 architecture "x64-64".
> This is a typo; correct it to our canonical name for the
> architecture, "x86_64".
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/specs/spdm.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


