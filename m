Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0598CD31A3A
	for <qemu-trivial@archiver.kernel.org>; Wed, 14 Jan 2026 09:44:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vfxQW-0007Um-6o; Wed, 14 Jan 2026 04:44:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vfxQU-0007UC-5w
 for qemu-trivial@nongnu.org; Wed, 14 Jan 2026 04:44:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vfxQS-0007wB-Pu
 for qemu-trivial@nongnu.org; Wed, 14 Jan 2026 04:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768383866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+Ne9lO7lMSPFbplNVYF3LrkrUxqDveNKML1ML9YTQy8=;
 b=bUUpZRafVE3rY0JMq9dYxS8fmWGBayuC6c3+cS/CpUmpUSmbfIcl/JPB0mA8Kj7vIl33YG
 fA/ztoTMs+h1klWHND8V0oYh8wk9MnS9es4IYfsNCDSU/WgCELuyBo0GAlNi1ang7DCFw3
 JwUkitpd/V7oFIhnoXhCTCMdQy/3njI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-1LII6wODOQW7lgcIIKDEog-1; Wed, 14 Jan 2026 04:44:24 -0500
X-MC-Unique: 1LII6wODOQW7lgcIIKDEog-1
X-Mimecast-MFC-AGG-ID: 1LII6wODOQW7lgcIIKDEog_1768383863
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47d5bd981c8so57771615e9.0
 for <qemu-trivial@nongnu.org>; Wed, 14 Jan 2026 01:44:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768383863; x=1768988663;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Ne9lO7lMSPFbplNVYF3LrkrUxqDveNKML1ML9YTQy8=;
 b=mQhH/EHT6tnTEUZtqvKdrC1ISLkcFTd/1q+Hnr/kxEbiOPdADKYmP47oiIEZ9eSCHf
 ChiySaooXirQvs0ZWAnOSKnUFZ5gsJTgwkluH/w9LP9h+DmXwvIid5P0a0pneDK+ldgJ
 xgMxGWdzzBH7hcJsSMFZEMb8Bj8SB4uOMtDB+BcH02QQsmE6ft63/MTYEfwoEn2Mu8H9
 DfhghjapqC7Pi2hBTjWpEVokVDCVBn6DaweJcmIkApjAQ6UzDYKf6rzxxiSIXl8IQ/Br
 nHwabJkgG0wrkrsh0STqbX/us444jYNxct8o4oDxiBpXpkSxPHGIiCEn1xA18WLAxRla
 qzUA==
X-Gm-Message-State: AOJu0YzMUqeAAsfs6RZMoXCoj5A6tHT0yxCEbV2sxj6iuSnIrG4zj5Uj
 B+vhRMhbzU7bIklZ/qhAR4ZezelxP4RX7SY4jnf53bUJIunMxgYQBNDWUCuIqPYguWymOrKeQKR
 bzW2IZzL6c2evyomUDN03LjUIeLkqQ1MKqiaoNQzu5dswL3/KvSvHN9wTVgM=
X-Gm-Gg: AY/fxX6yROwRHTtUnpJj4SVD5Obf2uBjGnjzXp9z808COzV/aJ6yl4+kXcPIvJyiTLL
 HNw1v+7wThjEG17M02PPD5H5f9InzxWFlDXJ5LvzsdHuHyAHqUmeSb1YpUOladSuFHLLP/OlokX
 0ZmIkfSJAx48t+lKOgpXS5CLGDbMs4P3c59RE/W7B/q/Yjv4ngf+0NhDKNtMK1Po/kAsSrIN2m8
 GZISghuf5KFJEx7Noiqkn7nUpxu0hA4ek4Y7x5i1uy+qtbPVufPNWaUOzJlkAQBQapbwd2Zzlwu
 rZ/F7J9JYiaeHwNpuKBdSsdWLUTjT5pJvElY+91fEPyLWShO5ELtRKi7JXa7DDsMe5Jko7r4rIS
 z80rXeeh7MzYMjsZA99yxRvEgOvhoVypKkPMnc7ZEiXJ1g88Pb6ETjMfqW4Yz4xhfzyrwI26j+b
 tFEY16FnUU3GiBBw==
X-Received: by 2002:a05:600c:1e1c:b0:477:b734:8c41 with SMTP id
 5b1f17b1804b1-47ee3318ffcmr25498755e9.1.1768383862987; 
 Wed, 14 Jan 2026 01:44:22 -0800 (PST)
X-Received: by 2002:a05:600c:1e1c:b0:477:b734:8c41 with SMTP id
 5b1f17b1804b1-47ee3318ffcmr25498635e9.1.1768383862550; 
 Wed, 14 Jan 2026 01:44:22 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-47ee7d58f09sm7970785e9.12.2026.01.14.01.44.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 01:44:21 -0800 (PST)
Message-ID: <ceee5815-0ff7-4c82-b23c-f47c6b19766f@redhat.com>
Date: Wed, 14 Jan 2026 10:44:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/i386/nvmm: Include missing ramlist.h header
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Reinoud Zandijk <reinoud@netbsd.org>
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
References: <20260114083812.18496-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20260114083812.18496-1-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hLWeXMPYi-Y2Usdp-o77URtE6aZTGmUAPM9IoIlMcdw_1768383863
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/14/26 09:38, Thomas Huth wrote:
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

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


> ---
>   target/i386/nvmm/nvmm-all.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
> index f808828d492..8a1af35ed32 100644
> --- a/target/i386/nvmm/nvmm-all.c
> +++ b/target/i386/nvmm/nvmm-all.c
> @@ -16,6 +16,7 @@
>   #include "system/nvmm.h"
>   #include "system/cpus.h"
>   #include "system/memory.h"
> +#include "system/ramlist.h"
>   #include "system/runstate.h"
>   #include "qemu/main-loop.h"
>   #include "qemu/error-report.h"


