Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B89CCD184
	for <qemu-trivial@archiver.kernel.org>; Sun, 19 Oct 2025 21:06:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vAaZ2-0007QX-QE; Sun, 19 Oct 2025 17:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vAaYy-0007Nu-G5
 for qemu-trivial@nongnu.org; Sun, 19 Oct 2025 17:03:37 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vAaYw-00020r-MF
 for qemu-trivial@nongnu.org; Sun, 19 Oct 2025 17:03:36 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-63c09ff13aeso6721140a12.0
 for <qemu-trivial@nongnu.org>; Sun, 19 Oct 2025 14:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760907813; x=1761512613; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HtQk0GJuCq/JgD3T73Q/ujEtbCnLstw5lfgjKUjPFqo=;
 b=aAA8+gX6R/9tKpIDsefUJKgfN1QjO3XBKsLwlPBIrV+92Pc6eRjs8xdErmJo5mHgYM
 xMko4V2v+A4zOZEbYU29bZLHPqXWTgogreSxDcjEvu7M5MzaGWCwd8hghr8xPA76bvd/
 Jj6EOKPWxM2mtpUELd504kMLw+wTk/BPl0DMeBbWRCGAWKP/IAP2w7c5VMOYUlyykiXD
 7Nw5zyYiCa0yY1902MwnxF7fJcA6in1GOr908PJbgqUNurYd4C5xShHheT0MwLbGLYVs
 iDScGqanfQ0AFw8MKXpFBdro4p1ijHywl6U8ty4D6doLK3L40vEylMC6jEvUytqQlGN1
 jMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760907813; x=1761512613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HtQk0GJuCq/JgD3T73Q/ujEtbCnLstw5lfgjKUjPFqo=;
 b=BQexzElTd/6CaGJyynU8mwIiux3mpSTXnEbOh0F/Ix5YvwCqGEfEjTIm3XoO6MCZYk
 G+jrVf8aNSOECHVZ7dt1DdYkwxSjljl36wQKzHH3qqxBS7P7Rd7R/0hmCP3h5yvndPNU
 T/FxWH8nphCcGGQVkGzNz+E+5ab1UkdfwJj8dplzlsW2wv4fKB+pr1hg7b1bonA7y4iL
 fMTQBYxBPJnrB0ZJq8xGOK+/14rQaZAOP1s31kSSP147rBl2lEqHA/7XtUZ4ARZ+Le54
 aBgNkISnwU2y+5ugapgYa1+4YTaasSs/SLcYXc/o8p2wKabX1HBKzTvk0oJA88hAwD8O
 iQuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLZa1CrPMgDN+Twunxp9WOUJA87uZ3MYX/DHg14AEEqneYqce8D9ldN5v377+Q1PV5X6pXZeA95R/S2UM=@nongnu.org
X-Gm-Message-State: AOJu0YxUsd3ysG60FWDHeWSsDxotj8WKOBKuXB6F5gy65ILdupOyoyaF
 1ZzwEgFzeZ4sdp5JS/X+ZJIva8ZcQWp2N17FGcNz2J9rxB4U/ZWgpYdV
X-Gm-Gg: ASbGncvQvpxNcEymcj9vMG5Yn/aNeLPDUrdyNG5V4/yB4Fj8cGc5TwMuHrYRaS2ROUu
 7dTnuJltGNs0bpdjvCf+x304U2XyJ8GiwbBRbD7C3lUjw6CEvQVnXzmlbTPi7qRwnIPjaBgxAqV
 wt+ddQOR+aFb6oCag/nETnd/qTfuSPYBpZ/OS1qpOaLV6c8UDi0hkVoVsYJB5LpEAtg5/3UXFEL
 KRbs7IzHfqcOx4AZZB/C44MttaHrR2XIcVp7l89JPxupkzgE9lsQYppQRwmsV2wJebe5n0na8Zs
 xbcbyAhTqyxyjmYiXFHl1N2w97A5AsmMRSFwPzBZByLRThxUEF+pKN8DkJRwqHm7FpIeIBz0HuX
 68tgohW+D5cXA6FIjmo7PuIuXxgUpuI4Qn10U3v4C6bR2KPzGUi/RRtiloXe38ua8oGsBQh+JtB
 ha+gDGfcm6mwREfS8ZXUFV264jZv7ud86P9QWB+3ft5TfUIpsvgxWLMWbUBHHMHr82SNuR
X-Google-Smtp-Source: AGHT+IHY1dRS1/AWHrm1rZJe4vZW5z0gZL042o9tHw8kn9F5IjQFgcfvzYbj4kRdNYLhXWOzFUb3tQ==
X-Received: by 2002:a05:6402:5189:b0:63c:3efe:d970 with SMTP id
 4fb4d7f45d1cf-63c3efeee6emr6840546a12.31.1760907813103; 
 Sun, 19 Oct 2025 14:03:33 -0700 (PDT)
Received: from archlinux (dynamic-002-245-026-170.2.245.pool.telefonica.de.
 [2.245.26.170]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c4945f003sm5107655a12.27.2025.10.19.14.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Oct 2025 14:03:32 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Zhao Liu <zhao1.liu@intel.com>,
 kvm@vger.kernel.org, Michael Tokarev <mjt@tls.msk.ru>,
 Cameron Esfahani <dirty@apple.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, John Snow <jsnow@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 04/10] hw/rtc/mc146818rtc: Use ARRAY_SIZE macro
Date: Sun, 19 Oct 2025 23:02:57 +0200
Message-ID: <20251019210303.104718-5-shentey@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251019210303.104718-1-shentey@gmail.com>
References: <20251019210303.104718-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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

Avoids the error-prone repetition of the array size.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/rtc/mc146818rtc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 61e9c0bf99..5a89062b4c 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -726,13 +726,14 @@ static uint64_t cmos_ioport_read(void *opaque, hwaddr addr,
 
 void mc146818rtc_set_cmos_data(MC146818RtcState *s, int addr, int val)
 {
-    if (addr >= 0 && addr <= 127)
+    if (addr >= 0 && addr < ARRAY_SIZE(s->cmos_data)) {
         s->cmos_data[addr] = val;
+    }
 }
 
 int mc146818rtc_get_cmos_data(MC146818RtcState *s, int addr)
 {
-    assert(addr >= 0 && addr <= 127);
+    assert(addr >= 0 && addr < ARRAY_SIZE(s->cmos_data));
     return s->cmos_data[addr];
 }
 
-- 
2.51.1.dirty


