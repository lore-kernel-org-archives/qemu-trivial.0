Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF88CCF9E3
	for <qemu-trivial@archiver.kernel.org>; Tue,  4 Nov 2025 15:02:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vGIY2-0001Cc-9I; Tue, 04 Nov 2025 10:02:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vGIY0-0001CC-MF
 for qemu-trivial@nongnu.org; Tue, 04 Nov 2025 10:02:13 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vGIXx-00005m-PH
 for qemu-trivial@nongnu.org; Tue, 04 Nov 2025 10:02:12 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-640e9f5951aso1268663a12.1
 for <qemu-trivial@nongnu.org>; Tue, 04 Nov 2025 07:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762268528; x=1762873328; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8YrPqtB0uXKz1t9IvP+s95mIq963aJoroAXuyt+ap5A=;
 b=Z50uDRWWMynT2VjJP4eXV/zK67jrBhvd9w7dxBO9ysDjTUHP/6I1nvIk/4zIAqCG1t
 0+PwLbAiJWbguPCMmoIuWavJlGri75G55i3XQoItC8TZSx7KGWi52p24fNw2VMTLVWKE
 QFeAnXzep2sjxaRYTVTLTGZtQi7oD4pVtSWGHWjjIte5Q672CNARhZsXmNikJYoMT8el
 tOw/PDterxAgJEY5Rbn9jYfSYq+ZFhbgfGLLFWQjW/ucDfjNX0VJvrPi4FzYW7q77LCG
 thNEuskDtHyST3nMJmz3I9W4UGyMGYzbouI+QlSYVzReowUzl5vXra3sE1FCZcFSvIdn
 OvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762268528; x=1762873328;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8YrPqtB0uXKz1t9IvP+s95mIq963aJoroAXuyt+ap5A=;
 b=HNNFM6hHlxr6UUQh3L8yACnfOgvE/zbI3QI7U133FUpndwAUg7DbjI5SumZupFN+93
 Hznka/C30FWTmNJn5TMJXeBfj5F/N9Z5v5DItEQuh9ClknTYdbJEZVEH21yrHN3k2f4h
 Qyq90rIbWtvUwebM2wViHHro9VZZZYVVfSxH1KbPdVegh6doGZdnJ/16gwugn3n9pVe2
 hXNKX5DCQnBbcfl2rJkTBcvMT+75XBHX2OYR1OSCYQ7D+XKKwnEe8Kel8vsRzqa6Fruk
 M0eXSiKNnx+0DGzpKQBQ02SUnFBiRl3uf2NnMZJvSaZu1oCaL+bVHltOOwm/4/KTiG1h
 /lCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1ghU43jHItpiq/ZCO6S25gkIwTqIJsE0t/YokQi4lvLCGpn+lXy6FimTRC5APftfR4QA/KYm/A9rnSvQ=@nongnu.org
X-Gm-Message-State: AOJu0Ywa8jGQ8IlDmpm3DvcTHhiZmC0yEKZDveD6JF4mZTTX1FMnJLl4
 yHvVbHOT8eYlgFwWiBCnpiqqGL5xnA8+o0g67Q+f3uwipAc2XSxijIV84qAqmadhhgs=
X-Gm-Gg: ASbGnctABpA+vRqP4ewC3vyYIownRcwZ9mCmMzdFbW2G0MVrKnfWgJ4SiDgPCmZ3dkf
 fLwy5RoeT96Mc31hNbE+Ag2j3JcYLP+YAlN1TrANS3gfbDcfrH5D/Xxt4R6WMd0Y+DCdlbADkHG
 qmj60KK7fyTYFrGTj4t+ZD+sbphSDgUqna9mfJs5eKDewfQGb+Vb09czmSaWtg+II6/ebXlP7yK
 dGgI56qmZTUFtZNbGppKYvYzr7+ByKPA8Fh5K9zvZwWGzTNWscg2ufvaf1k8OcyUtwqsp0ldD9H
 YrqsWmVMUHjkN5aFKjfzXCJhV/gexiVsddg2VBHtWrmZhJ2HZVwwrUEzWoTRGsgbDW+9d1Fi8gR
 hjr2SAUb9m0TPN9b0J1ZWx5CTN32+DVIO3yxpuE/WsMFp9NhdI3FbRWP9f7p/UYPkxYiEw4MT5P
 Nl+JJ1CLKXLSzRSlJ3cjc=
X-Google-Smtp-Source: AGHT+IFNaobdt41g2d6MEuuU1HeZfeRFUQElLUAAZ6R5W4EjNt1tML/13Iy1X/8HqbZrp2YZru3mHA==
X-Received: by 2002:a17:907:868d:b0:b6d:6026:9f1d with SMTP id
 a640c23a62f3a-b72156a13f6mr370306566b.1.1762268527365; 
 Tue, 04 Nov 2025 07:02:07 -0800 (PST)
Received: from [172.20.148.75] ([87.213.113.147])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b723f6e2231sm231169666b.34.2025.11.04.07.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 07:02:06 -0800 (PST)
Message-ID: <5dfe6daf-b8d6-4371-a4a4-6cf98977349f@linaro.org>
Date: Tue, 4 Nov 2025 16:02:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional/mips64el: Silence issues reported by
 pylint
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-trivial@nongnu.org
References: <20251103192430.63278-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251103192430.63278-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x533.google.com
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

On 3/11/25 20:24, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> Drop unused imports, annotate imports that are not at the top, but done
> on purpose in other locations, use f-strings where it makes sense, etc.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/functional/mips64el/test_malta.py  | 15 ++++++++-------
>   tests/functional/mips64el/test_replay.py |  4 ++--
>   2 files changed, 10 insertions(+), 9 deletions(-)


> -    def test_mips64el_malta_5KEc_cpio(self):
> +    def test_mips64el_malta_5kec_cpio(self):

I don't see how helpful this warning is... Can't we disable it too?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


