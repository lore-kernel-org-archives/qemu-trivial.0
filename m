Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F458CCD199
	for <qemu-trivial@archiver.kernel.org>; Fri, 17 Oct 2025 14:15:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v9lD1-0004za-4m; Fri, 17 Oct 2025 10:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9lCz-0004xQ-9a
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 10:13:29 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9lCW-0005kC-Qu
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 10:13:26 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-471076f819bso16193605e9.3
 for <qemu-trivial@nongnu.org>; Fri, 17 Oct 2025 07:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760710376; x=1761315176; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gteGWnMF2R6W+vB6CRlq0+Co1hdivkhTuMvbx2i6MfQ=;
 b=ZR4fW23XGM2+G+3K5ABqqtNSbg0uIIE9kVb7wVT963pPkwfnvyS/UnVm6Ia9vPjmuC
 cFyQHlK+if8y8vEXxYYcPoWxElr7ILpmnfcF5V+PgtDUr5hlusqOs81/Dx4WWcOUGH+l
 VNIvrEODLBbsvjutCjz8WTmAxO47jAHhQunkexJLuOFC5CiaQ1OEvwr+WtpJFMmVlZTO
 1mtSJiunWFH2xOARmnroxL+Aa9MxY2TqdKpmxesIn478m8VyJJGrlWiBys+3COIiqYuB
 sXQl1cqAdQsvxFN68fdS2k34NZ4HThJGquqXwZz/079dfLmicsfvi9sn8e5Bq81J9xiw
 ddVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760710376; x=1761315176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gteGWnMF2R6W+vB6CRlq0+Co1hdivkhTuMvbx2i6MfQ=;
 b=TKUlZTs85a/iRsCa68ksO9wb5dGFuf3qeaFHmRTu4VK/9z0swg/b46bPI2hdJ2IIol
 eSQ8uw5DzORPrvSJF9N8G9eaaZwhHCpEGi4QroDR9jbFpkZoDFNVBlF7pBHaAxhFJS0P
 CvUmgCYf/S7qWIWMqjLRfVpsJJJeOP5R/UCg9/Y5wzhaIb28y8ROgLYy8Y4ZxH2PglWO
 CGW1ZApO/o73LQ9R+gk2bwGJh8DexaHqBjZQYITzHUaS6p3PGljuP50U/y8SEDaHxW0m
 I59XpgO6Y7XG10e6GASCxo3uEOdlPFAAlHd486iAxXBhxp81M7oZ/R2BqdRM0s5ejZJT
 +oGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAV3GTmaHSJlcXR/wxvwPAyviCJI62nI3C+mElcvsQMdc5oXoe3ZH9fcR1yrgzTGTaTNb1iXV4Xhu8VUI=@nongnu.org
X-Gm-Message-State: AOJu0Yw1CgTJiwBb5/9+ijpTkfAlxFRwOD+fT9mlambwvdVww0fV90iA
 BKNWNv33DCNic5CXQipq+jC3DyI4YCk4XgOkXmipaPuvODTMqVWW2acN
X-Gm-Gg: ASbGncvkVIRDduUGM5e7p03w5JYtfIuNkfoNnYvlO3iK9zIhwz2/Q/GctbMJ6niiPd5
 f4as8Lz9NToo+rznQC3l5YjHvmkvfPRAiMRjBToAKpYLmDLHvQCOJ95MbNlfMb6MQf1osdrLCIk
 c1LGFnLP8QI6kaLBum4lyljovvig/Cxd5mDvj45otAZrmudi9qxtsGNfvm7WO6fAE/NGxXoFMWd
 jGA66MOldYuBICfqFa7W/G6KbH1DoG38cRq4MlleVTpK8E7Ah3ozlAd/B1evOHJMI+fRoLKlRyB
 cDJ1C84XcVdO3RWy6WFr8K8h8fwLMtc295X7TAyufayGjPyolV3sKtUhqpnl0Y+plsf6dJDXFSm
 flqpgk+2UTR6T77teMTW9k2VvPzixNdL+ZjP4AuQ03BKB+GpEnAyXJXd5nBFKLTuAsI87Uocx0o
 fMVgI92utfFuRfFFeIKbXcnDIKdimaEBcgC7GeFqvspQ8=
X-Google-Smtp-Source: AGHT+IF0gmmFJZZWMtm31nH8oxPWJUvDxjlKcg/T2Pi9eXPhQiM4NczNuxSbXUqG5YCCifXib1OY9A==
X-Received: by 2002:a05:600c:3541:b0:46d:a04:50c6 with SMTP id
 5b1f17b1804b1-4711791934dmr28602455e9.30.1760710376471; 
 Fri, 17 Oct 2025 07:12:56 -0700 (PDT)
Received: from archlinux (pd95edc07.dip0.t-ipconnect.de. [217.94.220.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710cb36e7csm51359675e9.2.2025.10.17.07.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 07:12:56 -0700 (PDT)
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
Subject: [PATCH v2 10/11] hw/i386/x86-cpu: Remove now unused
 cpu_get_current_apic()
Date: Fri, 17 Oct 2025 16:11:16 +0200
Message-ID: <20251017141117.105944-11-shentey@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251017141117.105944-1-shentey@gmail.com>
References: <20251017141117.105944-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

No users are left for cpu_get_current_apic(), so remove it.

As a further benefit, it removes one use of the `current_cpu` global.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/i386/apic.h |  3 ---
 hw/i386/x86-cpu.c      | 10 ----------
 2 files changed, 13 deletions(-)

diff --git a/include/hw/i386/apic.h b/include/hw/i386/apic.h
index 6a0933f401..1b0b26e4c5 100644
--- a/include/hw/i386/apic.h
+++ b/include/hw/i386/apic.h
@@ -23,7 +23,4 @@ int apic_msr_read(APICCommonState *s, int index, uint64_t *val);
 int apic_msr_write(APICCommonState *s, int index, uint64_t val);
 bool is_x2apic_mode(APICCommonState *s);
 
-/* pc.c */
-APICCommonState *cpu_get_current_apic(void);
-
 #endif
diff --git a/hw/i386/x86-cpu.c b/hw/i386/x86-cpu.c
index 1a86a853d5..86a57c685b 100644
--- a/hw/i386/x86-cpu.c
+++ b/hw/i386/x86-cpu.c
@@ -85,13 +85,3 @@ int cpu_get_pic_interrupt(CPUX86State *env)
     intno = pic_read_irq(isa_pic);
     return intno;
 }
-
-APICCommonState *cpu_get_current_apic(void)
-{
-    if (current_cpu) {
-        X86CPU *cpu = X86_CPU(current_cpu);
-        return cpu->apic_state;
-    } else {
-        return NULL;
-    }
-}
-- 
2.51.1.dirty


