Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B25D1CDC6
	for <qemu-trivial@archiver.kernel.org>; Tue,  9 Dec 2025 07:11:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vSrsq-0006PZ-UJ; Tue, 09 Dec 2025 02:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vSrsU-000671-8X
 for qemu-trivial@nongnu.org; Tue, 09 Dec 2025 02:11:22 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vSrsR-0002qD-Vy
 for qemu-trivial@nongnu.org; Tue, 09 Dec 2025 02:11:17 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42f9ed40b8fso162692f8f.0
 for <qemu-trivial@nongnu.org>; Mon, 08 Dec 2025 23:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765264272; x=1765869072; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ga4ajJPzcJ+zzds3qHHuanskpvSQ8dhYi5pekiD4Is0=;
 b=gcsbx0uSMdvugM7U8CB46ywHevfWtx51cKH527bzVQVxvsG1TzpJIYYA3Re34ikwKL
 7ISa3s7hmISagpGS47iiiBX/67BmDdPdYT4jtZZpOL6LNF4KSbc8ru6yPV0WtkDhqO8p
 LByKMa+qcjz0YYN5hLuxJo3X2HdrOkQH7/Q/a/V06YeB9ZH6sv9e/kp2rRJxevgn+B2R
 mN3Z6KQmTkpaGQrIG0CeuS1sixxkEldftZ3Gv1+b/mdjuE2pyCNCaun+W7973mJKR1O3
 XiL9g8wm7Wb/Zawcos/pUX8Cbu905cpyO1NvfxaWpnA47wShdoQKiTuCh8zwQW3L21B7
 6ZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765264272; x=1765869072;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ga4ajJPzcJ+zzds3qHHuanskpvSQ8dhYi5pekiD4Is0=;
 b=FW90HjNofNw4DyKiSACZfxQvoLuf4b2A4GJEzZQeDLdgWM8cN/LjgE0HDFnXuWIPnV
 3agZTnAnYBJGDjtaygDeMRFaqG8fq3KWgqSE9uau3eZ3kROci4ufaSTRtTAZDmW8wutf
 G89U2dQQXwFJnGXAONvV8tYrhDW05tu6EDrE9HARM1V/Efub6v8sgBgP7V9Xm8SmaidM
 ZIPS9mE88fW8EtJ0dmf9F+p47cs0IFfIEq0Bcs++4ZrL17ZStWphDDXT2wi+wiY37hxa
 NQqP5q8i395hwsxBKX6PkzUEIZP5t0G5h/D+KBsDU7XcEiwjN5sR+eoH4GlK2ftqFG+F
 Ovnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsOk+bo3t5nYc9+aN8moPdBj6wkEzmWy4iuD0T7+J/zFjVwFx2swR1QR5hz+mIWxaROgInLWUmBskmtmM=@nongnu.org
X-Gm-Message-State: AOJu0YywcsSzpBU279xr/UKS9C2X6fmfWEdsJUlzw9mKuOQttlgCDUE4
 Ygw+Ns5RYrjSSK9AHLdF39l5W1iuwnFGPot25qYVQOv21s69LC8e7aOsxhrlF9WjhM8=
X-Gm-Gg: ASbGncuvUOgy+OhX7taZV4wFp86oUDKK7Yp7T2PxHv5dkQfaqOfqv1cwdBM7pR7wkqd
 dkdVneQ5CMvrHe6DpAEhJf73anzj4wHQtpmMFaiTKchYaWgVtaSRHiAiR5wXpfeNhgKm84ZunZq
 steBLSNjnZrJpDNnuVMcp7AdBf2Akm36Wjnuq6hONesh8cDrLtWacgfw4xHJt18s+8OJre1gaXU
 7PG41uFhUTwnMVxNR0o0N9IAbD1sXqbzEqQoAU7oZqTdwRPgIze09sb0vMdTVj+AdHdCrbJRD6e
 30rvYONFgWRSzVbHbKyrghNRGxXPxx+lHRDO801csGRaGDRax9qJkHBoW6zab5N/7z1EhiPaf5t
 lvPJBoxKx5UnjFPP6BAX3GQRitgJkpxhuOHjrQxrhKghPDktn/3tQbUXgPMm8pZgdIL0N2USOlC
 yHsYjrM188iULxuldazb4cZVpE25IKzPmGbf8Yj0BHkPbXGYKLeJ7SbA==
X-Google-Smtp-Source: AGHT+IFoEVjiAJnrbvYg/Nl/dg/F3h/QIDdxNmC+mo39ioiPd6z8p9JtUGoSMI9EhiLwk8YUH2o53g==
X-Received: by 2002:a05:6000:2211:b0:42f:8816:a507 with SMTP id
 ffacd0b85a97d-42f89f639fbmr10522044f8f.60.1765264272250; 
 Mon, 08 Dec 2025 23:11:12 -0800 (PST)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe9065sm29888851f8f.8.2025.12.08.23.11.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 23:11:11 -0800 (PST)
Message-ID: <dd541a44-4d84-40e8-b8e3-82951039036b@linaro.org>
Date: Tue, 9 Dec 2025 08:11:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/qemu-iotests: Fix check for existing file in
 _require_disk_usage()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Fiona Ebner <f.ebner@proxmox.com>, qemu-trivial@nongnu.org
References: <20251208075320.35682-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251208075320.35682-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 8/12/25 08:53, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> Looks like the "$" has been forgotten here to get the contents of
> the FILENAME variable.
> 
> Fixes: c49dda7254d ("iotests: Filter out ZFS in several tests")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qemu-iotests/common.rc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


