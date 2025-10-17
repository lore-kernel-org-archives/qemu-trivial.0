Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA2ECCD19A
	for <qemu-trivial@archiver.kernel.org>; Fri, 17 Oct 2025 11:36:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v9iiu-0000jX-TB; Fri, 17 Oct 2025 07:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9iis-0000ii-MF
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 07:34:14 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9iik-00060O-4A
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 07:34:13 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4711f156326so4640075e9.1
 for <qemu-trivial@nongnu.org>; Fri, 17 Oct 2025 04:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760700841; x=1761305641; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HtQk0GJuCq/JgD3T73Q/ujEtbCnLstw5lfgjKUjPFqo=;
 b=L5S3gMOhGJk/y0aLQRV9tOioqwVF78P0Mq2DppWoJsiodn+hSvClkUaCNIJQlVlFkd
 aO25xRZLgyN0hcZGC5MYEDEPxT9qEBuJt2LWpPp9s9nwOP2y6NsV+VYVeP+JMmwsnxTQ
 A0cWPzMogKS9Uovc8A12oKjcMtCq/rcRzn9gG9XzbPl70WI/CQJCoO8n3s1EDQXwkUcz
 wgwCNdf/o0YB2RCUh/XfEG1UCGw6Ft6JFWCIYp6/n3vYvKliG6J/k0SGgunx8s8QcYEM
 0LSdgc3vSgub21czHuE6lmbQ7J7wgFAHh0VK5QmP3LsWMSck6RU7GhSgHHbr+4HF4kJC
 uq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760700841; x=1761305641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HtQk0GJuCq/JgD3T73Q/ujEtbCnLstw5lfgjKUjPFqo=;
 b=leQPmPUNhcOyF4i+D00EmaC905ZVFVdhsCTBpo7zzEyADOGxG8/WV2RNnhPLA9l9B1
 93JUj0MwKARNbClWy2lYUrz9xbHWUzJWtVjo6gFYdbrUgL8ea+C/Ndjyuwcbyt8lIAId
 RPmN/GGI+dihgJUzivBrV6cKxIwL/pL/Pq6Hc01VUrUMJrlIU9exsKTCwFs1lEFcZyFi
 sTMCKz2QwExLHOov1g5fmR4E7EkudbPPMVfxRmct3w5Md/hzXMwMr0gaWxjo12GFcaQZ
 NIXax6Zx0Etxfg8EBRjwMzyd703TE4TtXUlYwx/S503E0i2afJ382DX8VLCe/Z1o+Ddn
 htZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPHOI6XuJDwiYBf0Yf5KDXzqKh3ckSGFBHEGMNODgYH26NG8x3rLDkAlLsNkM3w6hDcY/CJni4kEjYX/M=@nongnu.org
X-Gm-Message-State: AOJu0YzmnXUkc24lQwqwD/h5ExCcleBpjVjrQ4KUQoOIw9jGlkIlq125
 VhV362gCuW0Z27/H8db/9LCXv3XZu4ZyiFvxJfIUCiCpXDVEBbns/VVd
X-Gm-Gg: ASbGncuk7JM8H7UrxPBOFmr6x/J1SHUTPeuvhzaw0jODH5A+fAV2tvoBmkvOJg67hDq
 NoqQGHkUjPy3MJucoA2VOfYgZaA+mkD+wf+wCPtY69Aog7pzmpGlT0q8eEeKKyubbGM/gB6N4ik
 WkExbAvK1QaGSu5pl3ohrIe0Azu6u7goWjWe6fqjD2/RufxmhxDFn239Y9Srvkw5PbtamTsmqeD
 0bcYcgGZMUYxMWGbEDKcxx/2ufFxeqBTxKkQhv4hosA3F09JafymC7hR1kABVOtSNrrcyjtR/0x
 OVJXwKFnSFnUyVfUh7YbESyG2FecPFm9KrsXrQZEZ58Jmu44FPrjrZocFzaniGJYy3Q92/aNWYR
 jtUssE1yVMhQhqTbC8C3j1Emct7Xu0lEie9jlBZD+UFFlvYOjZEFDGqBzsOXQEu9ruswaQKIuYt
 WdYC6bspAPGcU/eNx7AzYCT+ovqHxhjM6mHRaXpFYh3YY=
X-Google-Smtp-Source: AGHT+IHnu+GakzzSeEi2iUO0tTroVaMAXrhyHBzxS5+N+mWFSMCsDYg1lzurYZznwJfsxWlWvCdE2A==
X-Received: by 2002:a05:600c:4e11:b0:471:c72:c807 with SMTP id
 5b1f17b1804b1-471179079c7mr26540505e9.22.1760700841253; 
 Fri, 17 Oct 2025 04:34:01 -0700 (PDT)
Received: from archlinux (pd95edc07.dip0.t-ipconnect.de. [217.94.220.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711444c8adsm80395435e9.13.2025.10.17.04.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 04:34:00 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <laurent@vivier.eu>, kvm@vger.kernel.org,
 Zhao Liu <zhao1.liu@intel.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 4/8] hw/rtc/mc146818rtc: Use ARRAY_SIZE macro
Date: Fri, 17 Oct 2025 13:33:34 +0200
Message-ID: <20251017113338.7953-5-shentey@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251017113338.7953-1-shentey@gmail.com>
References: <20251017113338.7953-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x333.google.com
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


