Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C66D46606
	for <qemu-trivial@archiver.kernel.org>; Thu, 15 Jan 2026 18:36:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vgSCs-00062h-NA; Thu, 15 Jan 2026 13:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vgSCr-00061w-WB
 for qemu-trivial@nongnu.org; Thu, 15 Jan 2026 13:36:30 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vgSCp-0001z6-Rg
 for qemu-trivial@nongnu.org; Thu, 15 Jan 2026 13:36:29 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-29efd139227so7775165ad.1
 for <qemu-trivial@nongnu.org>; Thu, 15 Jan 2026 10:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768502186; x=1769106986; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8ELARDn3gX0r3854l8gwpK/WRJqmhSYQJCs0LBOm/ek=;
 b=vS2SkliygWeoOljbAcvm6tTRDiUxCg58dGvjVCgLFOLA+kybVo1xOE9Lja5wtOvVnC
 GOfq+azc8SOIpMBSebpZmyLkvhaJoTy+7CPmJTeYfb+TNd402YhGGouzwZ13pLhs57mr
 daw9yAWLfgZ9FMa0/Dxiu2BGOYNDSPeD9woOVh8eZFJQqXnIEmBaLj9/D7Y/MWnZdY9a
 /S/RWzKb4yzppxlLbbGomKGqlhyZZaMpWMokFHrbxem865Eju75K1UWoRunhy81+viPH
 8KEE6yUxwlunLRGRoto2ijm7urJ48YJTDtgJLrz1Tt+cKIrJe3Zeo+SFhfNaZXC1oz9S
 u0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768502186; x=1769106986;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8ELARDn3gX0r3854l8gwpK/WRJqmhSYQJCs0LBOm/ek=;
 b=dRaVHmLzfxqXh+UCyKf8PfK2gsqkISD0ZGt1yhFUNyPKemNAEdpt9R1oKLWDq48rFJ
 HHKNtPhVBGpYdYKz1Ya/hWjivJ0vwnO7upKUkxIZZTvMbXh1wmjCL6OsC/UT2YA4BW05
 gYk55+ZpfE8eG4RqfEFjSHUJEs8N1NS6xs+Zz6Pk76jf3ktT98EL9SxHEIP2evGdV49a
 qrFGxru/vTpYyPgd2Exc2zWB2dfHQZTJ0mapqMdxQ9EB9EaBi9nNY8wGZsGD6eN2NjuJ
 hmnuny9t3nhXB3KFtpeRuOYKXn8dTGgm/Xu+d9+iB2m1KvSM4yVXThiFHcjROfWHXhsI
 Yc5Q==
X-Gm-Message-State: AOJu0YzTJl429Y6cHdBbKVhhfSOl23R4tNKzmfA4w6U5sukNWdX/ktv9
 yBUNWZUSweMj1dNsr7RX6sMBHF2NrQsshZI2A634A2H+PcZzxCjJwV0+XuWs2jDtkV0=
X-Gm-Gg: AY/fxX5dvQGm7pKbhKTfdaPSb9AOBF9k8LHhPm5o5OC6QtQKg2X0YL0uD6cr7LRsDOZ
 EQkVnzVmghPU79AQIBVvxsOCReZYqRQ8qgY/7JSVDDBySuU9yjoTqvmJb0lvU/E5OQT6zXNM2j9
 19C/518BBwmkpaHQu7MynnKVK06hq6j0cr+26X45y2TtS+TNv/Z7YUj5QGaP37axRVJRkFwPlBs
 PQ1cvEqzfEn6Mefg5DdfdSWitMrE/BPjgR7Uik3i5WJQxim1AtNQtOMZhHLA02e5e6rbxA3SlJe
 XqVVC2XPSwZUffheqo832z4h73C1SgMNI/+NEzDdU3EiRQ7jyu7y6a/0gVrCMIVIQC2ommsRymA
 50q1OxdsIqb7oVzoWHYIXfL7uTErmqQy4jG0oZHk5dJXfoNiQmIy3ei01TbHPcgauvjXbGMmd65
 NuTgyCGWzdRIzjPPk2UaFuxBWJCKp7BwC11Idrypqf9lu+1DPjmLV1qQeV
X-Received: by 2002:a17:903:2f4c:b0:2a0:8ca7:69de with SMTP id
 d9443c01a7336-2a718947edemr1391965ad.41.1768502186359; 
 Thu, 15 Jan 2026 10:36:26 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7193fd3d4sm161935ad.82.2026.01.15.10.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 10:36:25 -0800 (PST)
Message-ID: <ae956364-78e6-4067-b0eb-94213891a112@linaro.org>
Date: Thu, 15 Jan 2026 10:36:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/i386/nvmm: Include missing ramlist.h header
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Reinoud Zandijk <reinoud@netbsd.org>
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
References: <20260114083812.18496-1-thuth@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20260114083812.18496-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62d.google.com
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

On 1/14/26 12:38 AM, Thomas Huth wrote:
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
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

For what it's worth, I added netbsd build (was already doing freebsd 
builds) here:
https://github.com/pbo-linaro/qemu-ci/branches/all

This way, a future regression will be caught directly.

Regards,
Pierrick

