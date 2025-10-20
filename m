Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82ED4CCD1A2
	for <qemu-trivial@archiver.kernel.org>; Mon, 20 Oct 2025 14:14:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vAqe6-0004og-Qv; Mon, 20 Oct 2025 10:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAqe2-0004l9-Bn
 for qemu-trivial@nongnu.org; Mon, 20 Oct 2025 10:13:55 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAqdu-0007Zz-QF
 for qemu-trivial@nongnu.org; Mon, 20 Oct 2025 10:13:51 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-471076f819bso35452615e9.3
 for <qemu-trivial@nongnu.org>; Mon, 20 Oct 2025 07:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760969624; x=1761574424; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=351SVBpLy2g1x/Yb4uUyI5EfdhoG2Sv9bMqbCCtarL8=;
 b=X0EswNQmIjMDiX7ihhKC97SJJAwI7NWKx/CDhqGzB/00AxSa4u293MLy8AGqWQkgF1
 iHIYlNlKryNaHSKTOvPGKia1HzQCwhiyAhId9qDk+9E4bPJyrNmdBDJf4JF0bKVGeiLc
 cwslPHYBm0DpwzzoLwJA/rM7QeoPZRdPzCTzJPA6qnkqQmbusBH5EzyKpM461i88Dz7R
 H/+6Bf5RDxwGT0gLbYthFf1D2FgbXJpbvqVxfgt4yqly+dB9cjVGqn3h5tEnCm6AWSg/
 Nse8lBwUpTlB7JnJlKm3u4sb+cHlFmvbqSZG93qwTy4OxmBBH+kdPz4Wx3RxmWlu/7ZT
 Bodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760969624; x=1761574424;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=351SVBpLy2g1x/Yb4uUyI5EfdhoG2Sv9bMqbCCtarL8=;
 b=hTXNXPeBN1M+rEArqlU0cfkuaE/0kQpuKbQEab5EwvYcK0UOAnp6vdoy3XLXiV4VnJ
 XjCYPnGoSj3nXFRYMYUEp0QzZyQWk/mlyp1JHrou9cs8esCproz4shMzXnC31HdHwzdT
 4p++wubAOvPO6IbdrhuKInRCiygQMynfl+ExV0EsN5F8Mn5v0VuiHrNkV38OczX6v07Q
 CoAS7KToi9FPXA1u0wkj8pPKH4QPO00DZSNBT/yTI37d2zhPALTEWEi+LyOmWWJVoshO
 rzgTrPRRcqmvNtfx0rbJXnXBbrWmYrtXr9DRPxPIBUIqs0HPxXeI14+6kmwLG66lnFu+
 +LZg==
X-Gm-Message-State: AOJu0YxnrtSPrEZW7BA/3DiJ+f70BZReSteevx01+bceH3oPMqgScoTD
 iFwQbzhCkwMY6xjoQUN9jQKUr49EKwGEPZwcntpcpu7sBX7rSjhXZcmT6rqef6r3eK8=
X-Gm-Gg: ASbGncsr0ZPzSq6d9Y0tJYMLdOmPlxQngA7vpwpn6CJQj3Ic+M0akCF9G6sZtY+JNIY
 9NrnvbjfrOkjX7mim0Zcu561X/N9vD3H+vGeLdjtkPB9H+/JaKzfwWIk0+Dyji7t0rJQyr3BRe1
 B0K9VzysxQKPP4P1QgWLpVd7BheUUiqiS4dsvvjE9qvtRZeLCEp3+uJJ6ZxfpXr4WpNn7luW5ep
 KoyOqmUytg7nwmhTm/WDfpIRpsKM501wrOGbEv2WTMknUqh8i6Xi/dGsFMgVdkVPnkCZA0Gywz4
 K+lCCQEnxpDSE5uwgW7u6jLowmHXbbxhweyL3Eot/jxeEXDLBe/MzvOl5ZGZFMpZPNyvpGwmL1b
 LPTTGRivmE2SZTioF9An4NxHo/EOm05uXHYBtCIJQwXLNCz42jU2b0pPvo42AK5WisGBB/lso63
 j7b8vcO4p7aQ7MXu5ri2jh0IHR/v9vd23UrChpOaKo3aEfysXjLKyTsw==
X-Google-Smtp-Source: AGHT+IGjgBGunb1VWdfhh6E+AnRfpT0ryRxQf4QPUK2nTQSKbx27VajkCiOxz83JXQrcayTknCyIcA==
X-Received: by 2002:a05:600c:3541:b0:46d:a04:50c6 with SMTP id
 5b1f17b1804b1-4711791934dmr99998145e9.30.1760969624104; 
 Mon, 20 Oct 2025 07:13:44 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710cb49051sm113101675e9.1.2025.10.20.07.13.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 07:13:43 -0700 (PDT)
Message-ID: <8ca49a7e-6727-4647-9deb-51433765820e@linaro.org>
Date: Mon, 20 Oct 2025 16:13:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add missing machine name in the Alpha section
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20251020140425.45003-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251020140425.45003-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 20/10/25 16:04, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> Without a machine name here, get_maintainers.pl uses the "-----..."
> separator for describing what the maintainer is taking care of:
> 
>   $ scripts/get_maintainer.pl -f hw/alpha/dp264.c
>   Richard Henderson <richard.henderson@linaro.org> (maintainer:--------------)
>   qemu-devel@nongnu.org (open list:All patches CC here)
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


