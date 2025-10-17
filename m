Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D74ECCD195
	for <qemu-trivial@archiver.kernel.org>; Fri, 17 Oct 2025 14:13:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v9lCU-0004dU-S8; Fri, 17 Oct 2025 10:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9lCT-0004cf-8v
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 10:12:57 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9lCM-0005f9-Dw
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 10:12:56 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47112a73785so14863325e9.3
 for <qemu-trivial@nongnu.org>; Fri, 17 Oct 2025 07:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760710366; x=1761315166; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CFuBYoXthwAAHQXYSal9xNPgZEHCC/OlTSTKqa/XfA4=;
 b=HBe/Q+M+FQqmcb19I6gB6NwtH0UfyQyIUB8Anp5N0O43ChilinCZGfdevtC3np6x6S
 BVyj4YlFL459Lk66CQ90szBu4J6ZBWxMdGMAgD0TPZrcSZqOwY6102qdLBaoD9KSONGc
 puEcoDN75mcguzhZhebEu41Nz3N83lKfGg+7LwgynXxRB4Z3vTXINzFIG6h0v0phiBui
 glGkSC7GLLBZ+efc3zPuRk9YVVpcLlHVIIbnIHfGgHzkBr0Cvv/xB5NmvZibDhcY9ueR
 VDmSkMQHi+WwqSek1s2Kzny0Y4HpgY8TWJNOXiVmemBB0G0VB/EsaH8hCGWXDfrkp5R2
 Gz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760710366; x=1761315166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CFuBYoXthwAAHQXYSal9xNPgZEHCC/OlTSTKqa/XfA4=;
 b=eFeOHZvY1iCnAdNjGnAuApfVLqFb5Hyeg5PBo6TmIxhQQPZ5MFy+0q5+DkU2ZdjZfr
 viIusQ5LsVttKoeFfz2OI6/nhY4aH73BdGllkwoRPZKsHNa+FZLNhG7yjYzp7QZl5fL5
 Bsxi/vmdoSxrMtuGCwp+fIJK7qU3JEQa6Q+wKbSwy/tFWsNXh31i4459NuGwnuI2p+iM
 C0gkfPFy8YjxegAlEhZqD+TADaMoUM3NqLcjPOUXHW7WFr9sUIzNvO6si56Suaj7hEse
 g+2jZUnRNl+VnKgkF6IXbpzMrDdC5eqyBOngiWkSeR3QHjF1gql7eYY1MMY1ebCHVjs/
 re/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvq3LQEH0r6eIUJHaKLS4G5I0tlugv2f7mMH8QrFbVSQUNIkfCGIGgJX57aLbPiEk/8MTJDjSWU28C5EM=@nongnu.org
X-Gm-Message-State: AOJu0Yx+0xL7GDalFVy+YvhSR3fOjBK5cyNx79WEOaUo9v/k3SITEFy0
 CMvtW6duQWtChpDeZbd/Kbl3vg9dxmuFiLHRed9IvhNabkynYDS/DjeV
X-Gm-Gg: ASbGncslVTrIomts2+1KB/5kDvJKpGBgSSn+pu40xZB671VDaYRKlwNK0dntycXs7yU
 4nrkPn4OvfbjqJkTdaiYj3oMovITR4dy47cYry/ZOI0NC39CQfFo7AA3lw2poFthn1a3By0gGRo
 Gf2ASTIjSZhHBOpxNYDwDntMVsBcPA2CPqrxe6l+6qNJafeQ/ZduXCzTl/u3DzBJEYgbS72k28C
 WOMU1YamUg9nr89r7Tt0y7bnETV7DNAh9UXXdOBEUgNlg/C2dGPJ+Eb5Nz2/wNh2m22lHdc3dg+
 gBESGYovC7A2ERGTir+KmoJ7s6NnzrLrx8ChER8IYJk1gOQLTxRkWt0oiVdZ/wHhJ7pmGqcxoz5
 iaIXYur11iPCDhFG2SmeOKLpdn++ppB5EoPH8JLHHhgGKXYpWYuoqInwu1Qpy5RD5ydA0WYK+47
 3v2Q3cRRtXmqyuSDba8yp/0iVfKLVGKv2m
X-Google-Smtp-Source: AGHT+IGHj5C2eusACsFwArx+C7dtue7Nn7sN6TxgdAb/eWFrYxY0hNIfyjFi65Oo95iq3W/yO2xXEg==
X-Received: by 2002:a05:6000:1865:b0:425:8bd2:24de with SMTP id
 ffacd0b85a97d-42704d145c9mr2514261f8f.9.1760710365572; 
 Fri, 17 Oct 2025 07:12:45 -0700 (PDT)
Received: from archlinux (pd95edc07.dip0.t-ipconnect.de. [217.94.220.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710cb36e7csm51359675e9.2.2025.10.17.07.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 07:12:45 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>, Cameron Esfahani <dirty@apple.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Phil Dennis-Jordan <phil@philjordan.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 John Snow <jsnow@redhat.com>, kvm@vger.kernel.org,
 Laurent Vivier <lvivier@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 01/11] hw/timer/i8254: Add I/O trace events
Date: Fri, 17 Oct 2025 16:11:07 +0200
Message-ID: <20251017141117.105944-2-shentey@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251017141117.105944-1-shentey@gmail.com>
References: <20251017141117.105944-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Allows to see how the guest interacts with the device.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/timer/i8254.c      | 6 ++++++
 hw/timer/trace-events | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c
index 4b25c487f7..7033ebf50d 100644
--- a/hw/timer/i8254.c
+++ b/hw/timer/i8254.c
@@ -29,6 +29,7 @@
 #include "hw/timer/i8254.h"
 #include "hw/timer/i8254_internal.h"
 #include "qom/object.h"
+#include "trace.h"
 
 //#define DEBUG_PIT
 
@@ -130,6 +131,8 @@ static void pit_ioport_write(void *opaque, hwaddr addr,
     int channel, access;
     PITChannelState *s;
 
+    trace_pit_ioport_write(addr, val);
+
     addr &= 3;
     if (addr == 3) {
         channel = val >> 6;
@@ -248,6 +251,9 @@ static uint64_t pit_ioport_read(void *opaque, hwaddr addr,
             break;
         }
     }
+
+    trace_pit_ioport_read(addr, ret);
+
     return ret;
 }
 
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index c5b6db49f5..2bb51f95ea 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -49,6 +49,10 @@ cmsdk_apb_dualtimer_read(uint64_t offset, uint64_t data, unsigned size) "CMSDK A
 cmsdk_apb_dualtimer_write(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB dualtimer write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_dualtimer_reset(void) "CMSDK APB dualtimer: reset"
 
+# i8254.c
+pit_ioport_read(uint8_t addr, uint32_t value) "[0x%" PRIx8 "] -> 0x%" PRIx32
+pit_ioport_write(uint8_t addr, uint32_t value) "[0x%" PRIx8 "] <- 0x%" PRIx32
+
 # imx_gpt.c
 imx_gpt_set_freq(uint32_t clksrc, uint32_t freq) "Setting clksrc %u to %u Hz"
 imx_gpt_read(const char *name, uint64_t value) "%s -> 0x%08" PRIx64
-- 
2.51.1.dirty


