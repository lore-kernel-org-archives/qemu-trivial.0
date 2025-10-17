Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6786CCD199
	for <qemu-trivial@archiver.kernel.org>; Fri, 17 Oct 2025 14:16:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v9lCm-0004mc-To; Fri, 17 Oct 2025 10:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9lCg-0004jk-2q
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 10:13:11 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9lCQ-0005hQ-Hq
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 10:13:09 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4711825a02bso8288385e9.2
 for <qemu-trivial@nongnu.org>; Fri, 17 Oct 2025 07:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760710370; x=1761315170; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WqDslS9NKjHnUWYR3Oq3CSi9/FfiBOz9NHEnZxcZS80=;
 b=GnkqAxWl1yv5KVAZIaDW+SjmxQd+0rEjWu2xOrJIel5hpX/lMXKyjNzd6aq6ELLgza
 4K2mMbfSpU4ng1Nil0rjcNVvrcYFG6Pg/p09GAilpcsXDbcSqfGDdM8C7O42Vh5G1exM
 XC4EHgswbFdziIzFoLN2f5vSTBeZIELMGUpdq6y2Pr5MbdGwJX3IZSb1YFNsw5e+S7LG
 nkF27u7Ju3Ih++XlRaKPn4EcnCEinWtVrDM48dnCgLHCpM21gY48XJdEXrR879XxAdQW
 GeIP4lV3+VB48Qi4N/NMuvjkJQy5H1Z6Jf5xe6E3/JvG/RuAPJ3AqJ3ji/xo+yuCNBEw
 6nBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760710370; x=1761315170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WqDslS9NKjHnUWYR3Oq3CSi9/FfiBOz9NHEnZxcZS80=;
 b=ERD9cEDH0qzv0e/q6g/NQe0D/OIBQZzglNawwRQ17luop19XzvMhfvwEvnNYjt8Cc6
 RWpO7Cpktor5m224YpY3KSfp2JM1NtEgCTawqUFsWAq1q3YOcqtcnjdz9hrFHrxLXM+V
 4QxLiANt5NWQF2noc/i0/txlCh8Yqzjcx3BA0I8eye5kUIsMiC+X2Kx6a+C+t2KeLajr
 7tZcxPWVUx7WyMqwBC1SecXRR0JlyLcLYHyw/I3+7PSpxkg4uq0mEQB6KYooI+7NTog9
 u2MP83fpF47K+vsdrbKCzmr4xxZPRb6r/XDzeKaBA76u0vzb8ydpg+JBuf/D48u3EWId
 klow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTR/xhoJY0AW9ysX4STlFrZvABGk5ox/HOwXuIBnyY8eIeOElLR/2WiuhbXDJqPlf5ctYMhbVHm2i8drM=@nongnu.org
X-Gm-Message-State: AOJu0YyIgFl3P4PPKZGLRCxOMaBwGJ54Z1wxbs/IRPd1p8LkrcOwMSCU
 N5ffkFFG8eQLWcIrGUWRBfsTHORj6eqtlhjR7lZfwEfhGBabk5cL98To
X-Gm-Gg: ASbGncs0QJ0KyAC8/Z12J9qZfWeE8RBWxAGpMOrqa6xQEvzuXLPrRDTm5Bx39Dx1vbj
 rv1y9Xv3U9YlMDHd+0cwhokzHUJZ12cDcV8jx9Wz5Pcm+Sgemmf4u40yMSdQ4O9Fw+NQoIu8Bt4
 KhFciWvjx00ktU9fozkdBmpYJE7o9oDkxCY2oqNj/D0NwehTvQnBPCzWJ5u7zOUn6+g4vb0RXmH
 bF1wY1txuu/eXYQkYV1wiDJKbemLqeB9pl3bINWP0Z388eIJIbxcFIo1/2nYyOAQlo8motn3XmP
 qnZGCBp9xQHPue2c9wVCHpu0whJueApa9b5x93vgFEuMiIT8fcJNJPyhwmP6cC+xYkLQCsJTCJU
 czD0heRgYr6WW4phc16F8sgprj7IOBSd4FL7DcLG7gsYLvK7lgf3Oc66t5TZEZ7ltpKViEC932t
 +N/mo7hmtoLRc0cElZGbw0B45TSOUa4tJK
X-Google-Smtp-Source: AGHT+IGYs584RAcS+bQviT9zSdPD1C3R1/CztDsteU1MEMn/nBmYwej5QPyS60IjXtCNMrEecg2MBA==
X-Received: by 2002:a05:600c:64cf:b0:46e:3b81:c3f9 with SMTP id
 5b1f17b1804b1-471178a80f7mr25809605e9.17.1760710370235; 
 Fri, 17 Oct 2025 07:12:50 -0700 (PDT)
Received: from archlinux (pd95edc07.dip0.t-ipconnect.de. [217.94.220.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710cb36e7csm51359675e9.2.2025.10.17.07.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 07:12:49 -0700 (PDT)
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
Subject: [PATCH v2 05/11] hw/rtc/mc146818rtc: Assert correct usage of
 mc146818rtc_set_cmos_data()
Date: Fri, 17 Oct 2025 16:11:11 +0200
Message-ID: <20251017141117.105944-6-shentey@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251017141117.105944-1-shentey@gmail.com>
References: <20251017141117.105944-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32c.google.com
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

The offset is never controlled by the guest, so any misuse constitutes a
programming error and shouldn't be silently ignored. Fix this by using assert().

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/rtc/mc146818rtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 5a89062b4c..8631386b9f 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -726,9 +726,8 @@ static uint64_t cmos_ioport_read(void *opaque, hwaddr addr,
 
 void mc146818rtc_set_cmos_data(MC146818RtcState *s, int addr, int val)
 {
-    if (addr >= 0 && addr < ARRAY_SIZE(s->cmos_data)) {
-        s->cmos_data[addr] = val;
-    }
+    assert(addr >= 0 && addr < ARRAY_SIZE(s->cmos_data));
+    s->cmos_data[addr] = val;
 }
 
 int mc146818rtc_get_cmos_data(MC146818RtcState *s, int addr)
-- 
2.51.1.dirty


