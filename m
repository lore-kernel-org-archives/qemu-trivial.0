Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8324EEA8541
	for <qemu-trivial@archiver.kernel.org>; Sun,  8 Mar 2026 20:37:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vzKqa-0007Fd-8K; Sun, 08 Mar 2026 16:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzKqY-0007Dc-Gx
 for qemu-trivial@nongnu.org; Sun, 08 Mar 2026 16:35:30 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzKqW-00044N-Ue
 for qemu-trivial@nongnu.org; Sun, 08 Mar 2026 16:35:30 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439d8dc4ae4so1042860f8f.2
 for <qemu-trivial@nongnu.org>; Sun, 08 Mar 2026 13:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773002127; x=1773606927; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TBkN0OXRGFMvrV2S5QZAiH2Wv1UWYT7/qi+m9sCjHKk=;
 b=CNcGv54lNxDSE3yue3N8ztXgTI5tmdLJLt8CbOQcipY8ChC4K4G9XnVz6qVLAFxZ5T
 FAJw7eziMcQ8Q1PQkebRtEEfj50pEtTnnhmKhX5FWxVPd+NEMvXRXMOpfnjkX6BtihwD
 NKT1n/vjaOiZCApN7OwfN+6Qd40nTGWVImXYUJaPMcWWPP8FARljh5L3mP4MUPAyy4rs
 MwHL3LXigJ3RV5jUaNp3KdGZd++RgJz4L++r9TA2fLVvfupJg0FQZDUpiH/JxC4EUhRD
 qSodm+FnnaWh2zr/FFmO43G9tf6uEVjYuBqoEClT0RmsqDQWTLxPqWiadTn47mWpJTXM
 0ktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773002127; x=1773606927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TBkN0OXRGFMvrV2S5QZAiH2Wv1UWYT7/qi+m9sCjHKk=;
 b=Sb+kcb1Iw7w/m7TAX0wYkVTjjtUuHrL78uMUoOq5d+WLwGnqOXO/myxewaCibMFnRz
 8bDb1yNMZMTrazSpJhTYXude8YQm4OkKnfSYr1HwP8QFdmypaXS2bptftxI8flQpo2sg
 b4Qo5cGKZXuicByRzocS36TH11TPUiYVl9JPtzofAkxATMOGOO9ozmm7vhCL8mZPs7cP
 QlqUHZLOttNHNQgmG/vI12wq4aNDZiUlNBKUOWlznnRwIACSI5nAUHlYbpJv85QA4bvy
 +sbeNkSnFFqCfYxoEcV+dstx5G0zFIXn5T6iLwV0Wht0xjRltGtQPSx9QQuOFs0Rqfs2
 sFsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVxf0ffkhyd/2q16j+QWd9nssj78MmBMXKdeD7dE7RyagV7seXLdEynSf4SMpxlDH1bMpR1szCx5gEllc=@nongnu.org
X-Gm-Message-State: AOJu0YzFDtdc/nupZXC5dNDoWFqtWPzoXfr9+Fdq0WuzxeKRSWld8ezF
 rptPHtqMCNjPy3oHOaC6yjYO60qjgqi0WgkoUF0QDJQApJxkbWQqEK3f
X-Gm-Gg: ATEYQzxkP7rl3g9sr9ynKVauFFDTyEQzglYi+HcEamVdF/S/NcI2D9LxFh5gS4QF3j/
 lc7HsTl9UIrKXgcuHmugv0p9YHeEqz7T4Dirn2UgMNjPMTFjvNp1ZbqyrpWAh+EFg+/EosTjEng
 XoTeyIGZ4OCEaDBTWg6SrR90ly4ChnLi3B+i9AeINKsR8jbr6hsJ+FsmvhxmMCtMqy/YQN++0mY
 VDg3N/0m7ZONI0EGtRSjgFIm4w/Olv/T9oaGSlyjkaeuT2KGdO8F1JBcCAjpKsNlq0jFe/+6+lR
 v0OnlNZiqMhcoY77ew10SaCsZrYOeM2/FRA5nlGIQMjy7N9z2H4QuWdQ9fpsuKSFQOLrB6TqOoq
 zYlR2Dt0WiK6BRlYpRfoL/zr/KbsbQCDAPvBpSqJ5bdkb319GQJHwvUswfP9jLcCEzh+X4/f5Ei
 NGyQYqJrUUQYx8p16nxA2eYbnXj2I3tNdGOPAFwFBPTizYa8LGvQ7QGZl0vBGUonSIojuJ1xz8f
 IySYV4lqoqUfUpFNCKrKMRKIu5RKDkgyFJ5y07l/Q==
X-Received: by 2002:a5d:5d06:0:b0:439:b886:20d3 with SMTP id
 ffacd0b85a97d-439da35f64dmr16113282f8f.15.1773002127220; 
 Sun, 08 Mar 2026 13:35:27 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-25c6-8f00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:25c6:8f00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2bdf8sm20995508f8f.25.2026.03.08.13.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 13:35:26 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Subject: [PATCH 2/5] hw/arm/fsl-imx8mp: Fix parent of ocram memory region
Date: Sun,  8 Mar 2026 21:35:13 +0100
Message-ID: <20260308203516.160103-3-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308203516.160103-1-shentey@gmail.com>
References: <20260308203516.160103-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Rather than having a NULL parent, let the containing SoC object be the
parent. This cleans up the QOM composition tree a bit.

Fixes: 1aaf3478684f ("hw/arm/fsl-imx8mp: Add on-chip RAM")
cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/fsl-imx8mp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
index 0119a18416..839c925e4a 100644
--- a/hw/arm/fsl-imx8mp.c
+++ b/hw/arm/fsl-imx8mp.c
@@ -671,7 +671,7 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
                     fsl_imx8mp_memmap[FSL_IMX8MP_PCIE_PHY1].addr);
 
     /* On-Chip RAM */
-    if (!memory_region_init_ram(&s->ocram, NULL, "imx8mp.ocram",
+    if (!memory_region_init_ram(&s->ocram, OBJECT(dev), "imx8mp.ocram",
                                 fsl_imx8mp_memmap[FSL_IMX8MP_OCRAM].size,
                                 errp)) {
         return;
-- 
2.53.0


