Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36B6D1CDC6
	for <qemu-trivial@archiver.kernel.org>; Tue,  9 Dec 2025 13:14:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vSxXG-0006SM-Ic; Tue, 09 Dec 2025 08:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vSxXF-0006R1-5q
 for qemu-trivial@nongnu.org; Tue, 09 Dec 2025 08:13:45 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vSxXD-0001Lq-Op
 for qemu-trivial@nongnu.org; Tue, 09 Dec 2025 08:13:44 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-477632d9326so37933355e9.1
 for <qemu-trivial@nongnu.org>; Tue, 09 Dec 2025 05:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765286022; x=1765890822; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1uSP2RAP26b4ooMhvc4xzs5OpZA9d6YqSiTwp0gN/WM=;
 b=LdUSpapGIctWvMqV2XECJmJzjGoQqJDLrJpcVtNHxCuOBfUiIgOM2YbBDGIKnZWXJ8
 G2WfQioIFepEcQjom733uCLKj28xunrV4lwGgZHqJZiUeMICtNo/3oxxHZUBitKT9aBP
 +2607+JduBVdLbkKv+OhfeDJcR7KKq1LPevXDQ3xOmXwiw/tDJ2Q6s7/Ao7TImYE006H
 rtmsk9c2Nu5grURvc44ZRihu1nmroU0pgR/VR70KYedmzqjwjKHhb08wNQNG1nhPALNV
 iMH0SrYn3afyPUijuvj8snucsGRhl3/ZO+FGCKJ/DPBZUoQUS6z4jDSqpuJaTdLZbAfQ
 S9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765286022; x=1765890822;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1uSP2RAP26b4ooMhvc4xzs5OpZA9d6YqSiTwp0gN/WM=;
 b=ZZZmGxc8RR1ORG8uFVVICQ4Ve0B8tQoBmom+HXh8SDnzdJphrsJ8YEzgZDDDwUCDba
 vxn5LProoJEyrTFYbOY0SxB1AHv8x6nOkX3mPd0VWAh+H/jcJvmqEzOFjmgCA9sPeTtU
 sfhRSl/idThap2Rsvanay0Dn7yToANxLBcC/x2bC/mCF0hu8ENTCILKFnA6sub33gy9T
 Nley/4c6uBroHNwzu37pVUzHh682EVk9WYmI0qRly09tt4xpP3RKgw0BhixSSutrydRZ
 lVXNLMAkaHJ5frFr/p1kr/hlllUfvtsyDJiz6TmPqw7JNW+XU00u3wDCT7GaFDqnTLgt
 vcbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ/R5jvbfOWh/eobbKxXmBNHCqhnuLCByBNMY5pyGoJP1kiKPdjmyjgKlPJCV8/3kmfIQvYDbqtjocrKw=@nongnu.org
X-Gm-Message-State: AOJu0YxKtOL9PdNr2kEEo/4jHyojf2IozrOxu2hRfZ1FdeYo/rwDCnE/
 1PK9wNqrxiJP1lWun5SuOK7wfH+ze+4eAm7+ViHbha7oEIbvGTdCcRh4o925ao4yWuA=
X-Gm-Gg: ASbGncvAcNBO6QShTP70jEJE4G2+Ts3Q9LCHf4+6Gxd5SUcfgROceYqBP2KFef/YhNz
 tVW94MGXsdHwTRazXvTTexSseuA1Y7Y2ZiVGk17lgoR8DkQIY9haCG7XU9Mmhj/WTblLGK22NJp
 8kAIq5GPji1ZylezJHNnxNlpyfNgV+O19Qw7BYoKDft/as1tVtYCrJSQIR38tA39P0wi2hvvopX
 48WiP15S7hs2303Kc72G80mBWO7IVfBflapkHHuNn/jRnxyryM1bfye8xNFMey3TVivTvwOE4s7
 Ww/6xpdYaTNsrNYdF51iyB7rB3S4jzFwTlDg6i28fh8DaFoNGzT59jVsNSqX+ZErStwMVqJci44
 x0SyM2uqUIe8RLD9Gt81wFgVVMEmLhLTX0fzeawZCQPrHp1r8E+HdAzF3J51fdQgmJ2f1b5AmjH
 nMliqQhZHzMLsr50PPWF0K/xvC5VmBH7OGWzb6LUouEUQmYvVAM/vDmg==
X-Google-Smtp-Source: AGHT+IFdYSRkOARYOXcqXvqWGrl8KTtiQO/fDmGCq3L1YyxTlpXbYzvI8dme8vaCOL2XF1BVgIidyg==
X-Received: by 2002:a05:600c:a013:b0:477:9ce2:a0d8 with SMTP id
 5b1f17b1804b1-47939c8bc7dmr127610225e9.0.1765286021875; 
 Tue, 09 Dec 2025 05:13:41 -0800 (PST)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a7d9243b2sm18707835e9.1.2025.12.09.05.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 05:13:41 -0800 (PST)
Message-ID: <bbbc3d36-5679-4be0-b8b0-d1bb300b91db@linaro.org>
Date: Tue, 9 Dec 2025 14:13:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.2] Fix typo in documentation
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20251209125759.764296-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251209125759.764296-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 9/12/25 13:57, Stefan Weil via wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   include/hw/pci/pci.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


