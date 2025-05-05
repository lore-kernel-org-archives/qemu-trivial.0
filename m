Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE48FCD6E49
	for <qemu-trivial@archiver.kernel.org>; Sat, 30 May 2026 15:25:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wTLYI-0004KP-Q3; Sat, 30 May 2026 11:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wTLY4-0004Id-2e
 for qemu-trivial@nongnu.org; Sat, 30 May 2026 11:24:29 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wTLY1-0004xq-Eb
 for qemu-trivial@nongnu.org; Sat, 30 May 2026 11:24:27 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-45ed18d8a1bso3154770f8f.0
 for <qemu-trivial@nongnu.org>; Sat, 30 May 2026 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780154656; x=1780759456; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0hqgiRMBKGtlNdV4BJds8dgSspVGSRdXfb8rAv6leL0=;
 b=H5BMwk4OgexdR2KlxKhCSYvWQa7ytRllv7ql3H7kBZja9aBLpL/aJToxQS8qGRqPwu
 7HzRQuyfkrmMKeHeCzJQToPdaS8slUJUIePeFRpTL0pGjyv1sdTmLBi+2pvUnJOPGara
 fz8/aX//J+zwFbG6uQ25yz6fOxyMcFsVIMQzy+og6v8i53EYe/FWIs5nxG7ThaWvDDg2
 HFa7eqIys7LR+0InKzVmWsFaopbTshY3uTT6n2DuQK1CUv8fv5YlmgdWYPmD6kv4gUko
 i5Je0eKgPoxSBTurDW/gZEaQV6nN8AEj83ZJDiWembFgHBJHYGFu0hsHTLPDH4ShHUh2
 OFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780154656; x=1780759456;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0hqgiRMBKGtlNdV4BJds8dgSspVGSRdXfb8rAv6leL0=;
 b=dogo0RNzImKba8+SzfOIdzO04RrtM1XFs1hUzWwFmJw5rb/clmKHP2qqaGVfFo0DEN
 ltaqbDhq73caUo5TPvl2lwXkHTltcERNPxMdwCdqEl+7+f4JdVxrJvEh3uXD95cWiubX
 3MB0inmMitxCKFgS//VLR52wrHWS3iBTxA0kaeq8rA9hQkM3gaBLG6U4BfImOUGnWPlI
 SZN2MwOYbvxJSX9mM4Mq3AnSgQ/c4eDDrP5/j1HYV1fhAGejh73ot7qgz77tY/UAUlge
 wZOYEC/UgjdISie/pqiqrE8Uebc9gfi9PtbsidVnbo2dWUsGG7JtQTPYFVt1JJgZd6u4
 GdCg==
X-Gm-Message-State: AOJu0YzpLDKDpOryI+/QttyLkWQu+NlYgyYc49wUrodwvN8Zj8XaZiK9
 jvEHiD4enUi4VtfrdXn1a4Jw8ajGGc5UgGzVGg8BfslsLWdJ9gKVWiQNucwNW1XlhaM=
X-Gm-Gg: Acq92OGEow++E/wOhCQUccMmQjBKefJdRvKmvql/Z/IiEmItVpSyQDWS1l+Cp/FCWJb
 KBe3zbXpKVpBg+jUyDhnJEC1Vy/wwxMGICqm7oEOnyIdEJmdyx6H9CjY55T31AxOWBfOmhzeBHC
 NS0TakSuuni6ZpjR58G1YEyEFlknOnP8drC8i0+6qAfdYTU9U7X+fnMQiI8+BtvBlc0h6W9bsn7
 BT6wNPo2s7JdgDIoiPyLKosGgOJIEpshJhKZdSwSK2WzYgxDbR6ArWLcaq0waZghJyUnA6StvW4
 QbRTTYLG0A6WM3DkfrxpqsKcOJa5dRbvLEpkTXiiBkR+MAKfERelm/j1gkWgGb8hMEMdB4OGtzH
 TQ1zX0OGZ7NP2jxQpIJ041+RvPeSFtuVLmPf6PAg0j6gdfvy69c18LkWvoVfwRD7xFoP61uGTvs
 wGYS7b2mHgv3apo0+6ZlBjH22NUBBxIE8esQjqe/IsBOMyNIe01GoMC1Lb5ouWJX2fcF5r1rB9g
 W63
X-Received: by 2002:a5d:6e11:0:b0:45e:f28e:a00d with SMTP id
 ffacd0b85a97d-45ef6b3aa6cmr5930135f8f.16.1780154656193; 
 Sat, 30 May 2026 08:24:16 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34b47eesm12638888f8f.9.2026.05.30.08.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 May 2026 08:24:15 -0700 (PDT)
Message-ID: <69baf1f7-417b-4a57-bc72-177c7e1d85c9@linaro.org>
Date: Mon, 5 May 2025 08:49:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/i386/acpi-build: Fix typo in function name
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, alex.bennee@linaro.org
References: <20250504215639.54860-8-gustavo.romero@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250504215639.54860-8-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 4/5/25 23:56, Gustavo Romero wrote:
> Fix missing "i" in the name of the function responsible for adding the call to
> the PCI notification method (PCNT) in the ACPI table.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   hw/i386/acpi-build.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


