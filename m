Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F48C88E50
	for <qemu-trivial@archiver.kernel.org>; Fri, 11 Sep 2026 22:05:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1x59M6-00022g-Eu; Fri, 11 Sep 2026 18:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x59M3-00021o-VI
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2026 18:04:20 -0400
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x59M2-0001fh-BE
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2026 18:04:19 -0400
Received: by mail-pz2-x10.google.com with SMTP id
 41be03b00d2f7-cc4d04d73b8so36924a12.1
 for <qemu-trivial@nongnu.org>; Fri, 11 Sep 2026 15:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789164256; x=1789769056; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/bQdpjDG+G12Pai++NRjc9q7QopvOalG3cCiOY4dzYU=;
 b=GE6aYFXpYjqkZshgVl6vh5hpZPDTOaZ3sVDHqIFDQ7NcTC23EkUzrkaT9fT0FpkjOa
 VxLTZczjk5czU94bQWwD1SBYxuL+xDOzx+4xBM8IZOmwGRTiIx1TtbMxbkZL4U+hm1tJ
 aRLUrK6y8ReuEFbXuIKi6hT2qq0axqxXLtQ5DXgSS2t8rrJpqwX8ek3anJfqHaV1E1j7
 dNj1Mo3bSCZuGjcgM7zSoHZWhziN/orbLe08HFry/tHqIalNdz463KpTb1Cw634c8tP6
 RuJuI7w5fa2frv7yAjlTzZWMpdKrPot5BnLHInzcvvJMPgwYukW/ApfSqyk9dT3wJ0o9
 oyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789164256; x=1789769056;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/bQdpjDG+G12Pai++NRjc9q7QopvOalG3cCiOY4dzYU=;
 b=BbqGvqCZA2FRwLT90atalzAZTNSGAWmfnT/5uKShOCmgfkH4/39n54WuwPq73JmbXO
 q8OPoByGrqXFxZrk94y0UgqO0TOVmMBTwkuw51TPtLYRqO6z9YWSZvMepsZJSmCWmLrA
 iTDx+iym7y6nR3GfmSkMe6ugiZYO7KcW4Fd+zRpXMY+RTExaafTbM0MDDVxvBAS7GMwu
 6wRlm3hTcqm7gpuPGBQbLX8dyZk8McWiUPKP0S2sNqhkTl7iECYlY0Oy0zD4ouuZJohB
 UxHvkHZYTIhhBXVolxlQe+lIQEQSt4LUCwxP+IBI37c7yshVANC1M8Z8BNeVhbAw/Tjb
 sYAQ==
X-Gm-Message-State: AFuF++mI9c/ZPAEF9yGvnMLvwJCmq6XpQlNm8eDo67cdRn36hft66vkb
 dcygEbK5cGFCBZ+RuQszQz9l/WSTM7KN/t+PUQ0tMzKqW8dUQwCSOP6LgD+iQ0SqQZE=
X-Gm-Gg: AYBFou0wk8Ouy1RDERsjGl2+mUOEmp7eYb9Gs0aWGVXgFjZib4DoAdBKWtuKcgojCBE
 xhpK7UVWDdYAkfx6cB3jm7cUwjX9wV1gf0x0EpMWOLohiAr/QGTM/9J38dmJzg8vji9qtnzcfSb
 YBMjb/YoSWbCByiDcNMsHfegcTAWB/1ZPRZc1thcFGSXmCLuO+qiqAf+XqfT/u187JEZVh4/9HP
 m3/JKnhuEtg7Ze8yn7rIQVN5hBupwhHwZ/9/H4spPl3lKX8bCjMCGHgxyMshvNJe8EO6+K5bOt9
 Kpp9DLL/3qZqmtqr7IznNvZAlCS5A1Jic9sdGEYd5F0VEJeAQytCyIGtTQbawhTp99yZ57wsN2t
 bOiWGQiyKSRp2zBPeDR1/Xr+Ij5dcAtugQYn/mAJv0N+9iGWa8vWiEcNyPZMIAkgkt2fJ2ZsLen
 RhYzP4mqk79P3As7qEUwPW15kJ4XcpfsSRpMuqOOKAgw09MXKdj3QC9zrJ8vcQ0x4i4ya91MBYt
 YC/FOAMBbGd4KJz0KZFXIgxHN2PqF8U6kPL744vRv3uEY+qMGHXltKJ92iOC4u5u49NZQ==
X-Received: by 2002:a17:90b:5904:b0:393:288:29e3 with SMTP id
 98e67ed59e1d1-39dbc0cdea9mr333083a91.10.1789164255671; 
 Fri, 11 Sep 2026 15:04:15 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:20b:7d3e:6a30:1f63?
 ([2603:800c:7900:ed00:20b:7d3e:6a30:1f63])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33ba4e5182fsm8959582eec.9.2026.09.11.15.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 15:04:15 -0700 (PDT)
Message-ID: <3fbf8cc2-34e4-4726-9b90-5849e02ad38f@linaro.org>
Date: Fri, 11 Sep 2026 12:04:12 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 0/4] Trivial patches for 2026-09-11
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20260911105635.955937-1-mjt@tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260911105635.955937-1-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::10;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x10.google.com
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

On 9/11/26 00:56, Michael Tokarev wrote:
> The following changes since commit 92c82d0d2e71ab6e39fd799b035bae98b375bfd5:
> 
>    Merge tag 'linux-user-pull-request' ofhttps://github.com/hdeller/qemu-hppa into staging (2026-09-10 20:59:05 -1000)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches
> 
> for you to fetch changes up to 4b93253f6d15642c934e33fbd96bf761a2f0efd9:
> 
>    hw/ppc/vof: Use qemu_tolower() instead of tolower() (2026-09-11 12:07:44 +0300)
> 
> ----------------------------------------------------------------
> trivial patches for 2026-09-11
> 
> Just 4 small changes, the rest went through other trees.

Applied, thanks.

r~

