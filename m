Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A95D44C6B
	for <qemu-trivial@archiver.kernel.org>; Thu, 15 Jan 2026 16:01:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vgPmq-0005Gv-OL; Thu, 15 Jan 2026 11:01:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vgPmp-0005G7-AT
 for qemu-trivial@nongnu.org; Thu, 15 Jan 2026 11:01:27 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vgPmn-0008CN-Qo
 for qemu-trivial@nongnu.org; Thu, 15 Jan 2026 11:01:27 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47ee301a06aso10185905e9.0
 for <qemu-trivial@nongnu.org>; Thu, 15 Jan 2026 08:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768492884; x=1769097684; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UweMaXfqR+dZPDI/i6nvrt2jpmeu3EtAdjeZkf9SSNQ=;
 b=Rlj1Obyx/CW7f0eFqMPRGysPyab8HB9g85X4lh6gxwBAr9LJO+fRD5Dxvm3q/alo2V
 /YbMmdJUcvDlMOQinn9ngRYmG/cPcuTYHQADVk6WHt/XMXYEGwycJq570JhFKvFttrrQ
 mF9eyVxCgSL88l5/FqxOuYE07+SStd0Iek9vcyKymRc5N8Din5nD+jr0NCAi/Vfg7Q1i
 sOxW4rj8+4kdr98BtHsooQKzP+gzmBVG68atAyw1oxC3Qf8skA34+3pm7p/siPhamcJs
 FThzL2+O0gVNcuVUFdWwTSbIW82J9lS+/qHq72bmAPKRH2MNw6KUbbMUDMwyj8F7wLXP
 fpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768492884; x=1769097684;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UweMaXfqR+dZPDI/i6nvrt2jpmeu3EtAdjeZkf9SSNQ=;
 b=wyumjHa7dbLcTXzEDd7bh5W+Uo8I5inBkLyhNOPC0Nq7E5+YbrvK8Wm8uYjsSjavs7
 fpLnqtTg3tj/jGvIPbuu9R0/tCLbwj1wUFdv4RHQztsnP4q1aX43zkfMlujDFLb2lppt
 KxcUQUW/At449Yew5JVScVqbVQPMkKKl9rnP/C9gpc1+q5dNrMYReJGYvfeMMWDTa6vC
 V7cynaJ3NdRoBm4lyBqP/422zhQ1h1wrh4QpHAlb5MZ7P9OPzAJUvtsbikN/hPTcXWxv
 Ra9dCyqd7dyy87gcSLWaFeZiJK/BTbGH7fCp+cAmaUsiQg3NJ97tJlqs27hZBW/hvJm4
 KkEQ==
X-Gm-Message-State: AOJu0YyM9zpLi4POIIsoKTRuHr4cLMNjecfo1u/g9a2TZrP02ZZlHB4O
 VA5v090b2TZQ1O6zu/oi0Vbz8OGUK3jNEpwf6nGJc5Z6lnz99BKgylYg+ywRpMnEnsE=
X-Gm-Gg: AY/fxX4HZ1ERy2tg5/muXlJ1hwca3GuCjU2A59aHVzHu6mH4yn911mp3ZS3WHP/+6Wu
 ilx50VAqSGM55ruQ/Dq0i3lJY04bLc2tXlAGV+xIlm+VJvcWYvmcQUNlS7/buHNbPUBZn4saomr
 +98JNbKjfmC11GpoIISbWRiu6HVdm4uXqf+xS0yJ5txMBbxE1NDqmxya6u1jYwSLX6GshLyEuk1
 6+yUQhWoKqxD4q8AdWqrF7FSpKZtM9/qyfEBfpfgsag/PtV8W2Pvftju+kOiO+HuhU5OVNwRHM9
 xXVtyvyzqD3b7OUcug+SUbsl5D41jE4wvkPSVvAOmhjMywOIy1SCcuQ6p8DZm1qejzdDzo+chs+
 6XTXcOojt+qr2vCF4rLo29x7TB3p0yeEJjphg8osu2LGhVik+BIlIMfIKypzH2IXpwtQoZFyJY5
 K1rSqk4Q5E3JE=
X-Received: by 2002:a05:600c:3495:b0:47e:e87f:4bba with SMTP id
 5b1f17b1804b1-4801e344232mr3374685e9.29.1768492882074; 
 Thu, 15 Jan 2026 08:01:22 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af653560sm6838015f8f.10.2026.01.15.08.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 08:01:21 -0800 (PST)
Message-ID: <604f2e51-81e9-4e97-ac89-0b783f27e97f@linaro.org>
Date: Thu, 15 Jan 2026 17:01:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/i386/nvmm: Include missing ramlist.h header
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Reinoud Zandijk <reinoud@netbsd.org>
Cc: qemu-trivial@nongnu.org
References: <20260114083812.18496-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260114083812.18496-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 14/1/26 09:38, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> Compiling on NetBSD currently fails with:
> 
>   ../src/target/i386/nvmm/nvmm-all.c:1136:22: error: unknown type name 'RAMBlockNotifier'
>    1136 | nvmm_ram_block_added(RAMBlockNotifier *n, void *host, size_t size,
>         |                      ^~~~~~~~~~~~~~~~
>   ../src/target/i386/nvmm/nvmm-all.c:1152:15: error: variable 'nvmm_ram_notifier' has initializer but incomplete type
>    1152 | static struct RAMBlockNotifier nvmm_ram_notifier = {
>         |               ^~~~~~~~~~~~~~~~
>   ../src/target/i386/nvmm/nvmm-all.c:1153:6: error: 'struct RAMBlockNotifier' has no member named 'ram_block_added'
>    1153 |     .ram_block_added = nvmm_ram_block_added
>         |      ^~~~~~~~~~~~~~~
>   ../src/target/i386/nvmm/nvmm-all.c:1153:24: error: 'nvmm_ram_block_added' undeclared here (not in a function)
>    1153 |     .ram_block_added = nvmm_ram_block_added
>         |                        ^~~~~~~~~~~~~~~~~~~~
> 
> Include the right header to get this fixed.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   target/i386/nvmm/nvmm-all.c | 1 +
>   1 file changed, 1 insertion(+)

Tested-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

