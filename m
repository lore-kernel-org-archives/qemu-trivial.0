Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFBBD39013
	for <qemu-trivial@archiver.kernel.org>; Wed, 14 Jan 2026 21:34:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vg8UY-0008OE-NW; Wed, 14 Jan 2026 16:33:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vg8Ty-000824-MX
 for qemu-trivial@nongnu.org; Wed, 14 Jan 2026 16:32:58 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vg8Tw-0004ep-1p
 for qemu-trivial@nongnu.org; Wed, 14 Jan 2026 16:32:50 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-64d02c01865so352574a12.1
 for <qemu-trivial@nongnu.org>; Wed, 14 Jan 2026 13:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768426366; x=1769031166; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i9xncA7JKGs1I/utGEtJI6wz0W3vuJ9YSRzEAnheVoU=;
 b=bVefVtLeSWpe28JB0btyuAO3Xz1wbpTwHnyfhKzYNsovE8ZH8KKLzWUY363r7QIX75
 bmeJfHFBkjy0EZoKZ39R34/0fTQg0UtLIjUlKzAhyW5DW+3Oz36qOEYqV7ox9b4HR7+B
 n8pvPSb5QX6vyZkeRFbXSYviE57Kn6BypLRuiBt1tA5p5Tbt+ShinWZl+msk6whh/gq1
 iJi0fFYfMJVRJCnJWoVqag5+b65jh1/2o13BTOKUP5XUQ5aZe/0bgtvyl2eK9Xu8pgrw
 GT0p5nd1zLt4eG49Cy9mw//2Oyed7oSKm50NCXuu6NxfBl7p4E9GlsehrO9Uhg9Akn3g
 EG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768426366; x=1769031166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i9xncA7JKGs1I/utGEtJI6wz0W3vuJ9YSRzEAnheVoU=;
 b=J5PgVbBarbWlp1Cl3GATYJ5/iXN4gmnsMfgJX7+TmViXpx+9qskEbv7XlAWvhx9M0K
 g/RYxDHOAvrbxo+yjYKiLm5GOtmgPBe4VbWRSdr0Qq98TkgLJN9Q9WENdM4Ie8njrg+W
 DmZs3Rt+VnWvX+W080XoMY3YD6cG/fdeWUVMKaCZEVa1/l6qgfx58y8eKib2chApodK+
 2CdT82hRcD5CdChDuH3lG3e/ITSVjd7tWS7tJEt1+wQsIbTqxz4FY3sh3qG4qh1HMfcM
 5Oz5/8IdJkj9RT5CMG6rRLhGORtefv5fWqmZKvrvkrZSs8LsH0s88S9lEbMgcja22W+X
 p6Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrQRb+U43b8bkBDK9prg0eZ1y4gcksSHyMC8qBKuCQ5XeWqzglhYD5a74b1mqWXAbN58yw/DdDcQeNvCQ=@nongnu.org
X-Gm-Message-State: AOJu0Yx93X+9gQQ2nX79r635H/sfk6uBai0H7QxF78rwu5wlR+xg3Q84
 qMXkcK1wW8jppER5EHiob93psLqN4l1CDx5htCdoSUf8UwUqB/P+CWn++pweuE4Z
X-Gm-Gg: AY/fxX7lQyqUKLCc9QgS+EPG3d1Njik8egYA0WWw5kB8M5ueRTBKsHHvi6SSJdmGTJr
 P5xMU+c7lM27t69MTjebm6iu4zsfC0queTWxvcufPbMfBV0AVPyfoxtUTACDUAJtGeI5uqmV0DA
 m+ixweIdciNYMDTjK5DeqDwKTj7q7nO0OQCXBMmMygLvB6jnx2bxsEYz0pn+qPeXvEu5el0wYI7
 A1KZ+ASA1dRb5YnVMYPT8lSD0J6dFxEAZT156g0pkJ6PcQJrw2gkEU9eRRR3FkBxoZM3krzH2RK
 Bf2qXgl/N0nNe0NMcA+sJMxQ0MxBWeDL2KtPxcx7E/17hpsCWvBdBQyMyiVasoLcD9DaQ+40sjp
 dYLRNQK8xV7xDQHGbhguv3PZELJMXIzf7f767OGVKPSMDdSCC8uBFRtYnUfA8anh+NAynR+XKsT
 DNO0Lcoo2rKADRim1pWvojKR9QzQgr5oGtdZqDFYh/1bxhPuShq9SMi5DISMWNFO1AHJabRw==
X-Received: by 2002:a17:907:3e0f:b0:b87:1edc:5a27 with SMTP id
 a640c23a62f3a-b8760fd83dfmr306594466b.1.1768426366280; 
 Wed, 14 Jan 2026 13:32:46 -0800 (PST)
Received: from archlinux (dynamic-089-012-235-150.89.12.pool.telefonica.de.
 [89.12.235.150]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87124e1a1esm1081252566b.48.2026.01.14.13.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 13:32:45 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 1/2] hw/arm/imx8mp-evk: Provide some defaults matching real
 hardware
Date: Wed, 14 Jan 2026 22:32:26 +0100
Message-ID: <20260114213227.3812-2-shentey@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114213227.3812-1-shentey@gmail.com>
References: <20260114213227.3812-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Having four CPUs and 6 GiB of RAM matches real hardware. Fix the machine
defaults to make its use more ergonomic and less error-prone.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 docs/system/arm/imx8mp-evk.rst | 2 +-
 hw/arm/imx8mp-evk.c            | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/imx8mp-evk.rst b/docs/system/arm/imx8mp-evk.rst
index 75c8fbd366..79600cf39a 100644
--- a/docs/system/arm/imx8mp-evk.rst
+++ b/docs/system/arm/imx8mp-evk.rst
@@ -54,7 +54,7 @@ Now that everything is prepared the machine can be started as follows:
 
 .. code-block:: bash
 
-  $ qemu-system-aarch64 -M imx8mp-evk -smp 4 -m 3G \
+  $ qemu-system-aarch64 -M imx8mp-evk \
       -display none -serial null -serial stdio \
       -kernel Image \
       -dtb imx8mp-evk.dtb \
diff --git a/hw/arm/imx8mp-evk.c b/hw/arm/imx8mp-evk.c
index 0af5aad583..b84ac91a17 100644
--- a/hw/arm/imx8mp-evk.c
+++ b/hw/arm/imx8mp-evk.c
@@ -117,8 +117,10 @@ static void imx8mp_evk_machine_init(MachineClass *mc)
 {
     mc->desc = "NXP i.MX 8M Plus EVK Board";
     mc->init = imx8mp_evk_init;
+    mc->default_cpus = 4;
     mc->max_cpus = FSL_IMX8MP_NUM_CPUS;
     mc->default_ram_id = "imx8mp-evk.ram";
+    mc->default_ram_size = 6 * GiB;
     mc->get_default_cpu_type = imx8mp_evk_get_default_cpu_type;
 }
 
-- 
2.52.0


