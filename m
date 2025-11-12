Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416A0CCF9F8
	for <qemu-trivial@archiver.kernel.org>; Wed, 12 Nov 2025 07:17:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vJ569-00038k-Bp; Wed, 12 Nov 2025 02:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJ54D-0001Q2-63
 for qemu-trivial@nongnu.org; Wed, 12 Nov 2025 02:14:59 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJ54B-0005d1-Mb
 for qemu-trivial@nongnu.org; Wed, 12 Nov 2025 02:14:56 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47117f92e32so3471985e9.1
 for <qemu-trivial@nongnu.org>; Tue, 11 Nov 2025 23:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762931694; x=1763536494; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1Rut/nRnvwL2ZP6wW7ld1iTjQqI//SAAwPnCfO4q95o=;
 b=rYaWxRK9rjUfjyA4PQkqyIEmIfkZURhLSFz+ldTl/SjjnPjS/IqLR/n/E12G1IahUt
 MORARnCw0iFcs9NzTzHJZ8by8Ocpyml70nde4708WRj8lgKecrY+a/FpUIIrcSuj4Qo8
 QnsMYUtviclkDgaI3a4G+D0oL6k0gMZPctOXRqsaCyDp7ghL+EiRJ5PxDSzp4SlaWq5T
 mu/hT4U/ZDhfCKdKrKYNrDROm8c1YV7XXWSPrDMr+ZEpFUhwHuDVNFyWU3Dy135Xlna5
 tTZXiefPYZSqRYOIa411JqqyCP1w4Y4wvkUxQ8gXCT+UGy82ITfR0D8cR5nUeWJEvSpu
 oGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762931694; x=1763536494;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Rut/nRnvwL2ZP6wW7ld1iTjQqI//SAAwPnCfO4q95o=;
 b=sLcauz7yZgXNGe7jKxSI3O+9s81uFCJrmF5BlxuT1EB5E8BN6MmHgV9MjNoBP8BxVH
 DkZYYQuGM7MfvbfEVCRmo1Q/pWnlvQzWLd5018NDIRtGFu8muPjwKVpe8h3dMuQwReel
 3AXsBgkna89ENTcOHV+zPAK+GKU5YprV1GqusI7LfLnJdOPRvbu2I/gFoewRMGb2lnsX
 7BPDoV+0rlQzys6oKNLQyqNbvklxvorFHuvyehwmmWHB66+Pv3XVFbRQt6+mLkmFq18E
 WjNhOM+lgCK6pzMlTg+zUuduRJf9kewcu3VCXCgvArcTCiBnc2d0ITVI+YfKcT6MFUpg
 ofWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGsZAgxukfqY1UGdngP7y8QeY5fyPrTO64qK4ohn+WOBDu3IXPcMKk/DO9bGMOArPOs6Oof47WGM5XDpQ=@nongnu.org
X-Gm-Message-State: AOJu0YwcptwvuAGES8fh9Z1Dgcr/6hOpm4Qk10B+kdQC0HnYYS8zSWEl
 ltfqYiKeJg08hP8egMCtJvvrKt0Vc2xuH7mh4EZ+7rHVMrkVv4fFXqvnsZ2PcEZLbf0=
X-Gm-Gg: ASbGncsnJKJsjFZSghkPGjEjS9R3HfNZIHjS8nxQwMoUZqATSTsZ83oTDfezmA2cA7h
 pfDN0Eg+vv5aSYt9VDx/9eRqrGA4rbLxvpZBY6habtkqAiyWk4t7n/osprWITHW0oP9B7bRqgzS
 ouNtP+7h/FsN9buDS4LVCZBdfVPD0sywif2zHKoDYJqu+rXP6IPC7sBBrYpRsTULT/j2m/ADdRZ
 5EP1S/2zybO1eUoqACnIjJvR+2GqUTYsdQ8GcEX5J/TwNMUm6wYLGLlkNnCRaGoghQOyX2zOKOp
 S6JDGAlFL3q1jnUdbhZc2/Flq/81ZGq84d5UL6M5OUdPi4mb2jnV1dzUdQY7fDx7E9ILqCPv5cU
 el261olSwnCdrjSHX4YcN8Rjnac65ja06nO4X7hzvao3xp274UwHrKgQawbwttGoTDgewjSaRs0
 vbGB3y9BVWLuDpkCx3AJNwcgKhLWoxWMUpx1soZwA3a/fTD2Fv4ECPgQoXVb0=
X-Google-Smtp-Source: AGHT+IEQRIXjklu5kIt7vQNus1CaEu/EoX5LfUlH/1pG1PlGzZ5htAnTHKOCq7SUudiau5AmtRvNBQ==
X-Received: by 2002:a05:600c:350d:b0:471:989:9d85 with SMTP id
 5b1f17b1804b1-47787095d77mr17391855e9.19.1762931693967; 
 Tue, 11 Nov 2025 23:14:53 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e953e3sm19272975e9.14.2025.11.11.23.14.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Nov 2025 23:14:53 -0800 (PST)
Message-ID: <11781df4-ef38-4ba4-811e-8da50aa586a9@linaro.org>
Date: Wed, 12 Nov 2025 08:14:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i386/tcg/svm: fix comma operator typo
Content-Language: en-US
To: Nicholas Mosier <nmosier@stanford.edu>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org
References: <20251111-i386-svm-vmexit-typo-fix-v1-1-49f0414472cd@stanford.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251111-i386-svm-vmexit-typo-fix-v1-1-49f0414472cd@stanford.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 11/11/25 22:57, Nicholas Mosier wrote:
> A comma operator inappropriately terminates an expression
> in svm_helper.c. Replace it with a semicolon.
> 
> Signed-off-by: Nicholas Mosier <nmosier@stanford.edu>
> ---
> As an apparent typo, line 742 in target/i386/tcg/system/svm_helper.c
> ends with a comma operator, rather than a statement-ending semicolon.
> This doesn't introduce any functionality bugs as the code is currently
> written, but could easily introduce bugs in the future if a new line
> of code is added following the comma operator.
> 
> This patch replaces the comma with a semicolon, as the original author
> probably intended.
> ---
>   target/i386/tcg/system/svm_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


