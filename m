Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAB8CCD199
	for <qemu-trivial@archiver.kernel.org>; Fri, 17 Oct 2025 14:14:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v9lCo-0004oK-HO; Fri, 17 Oct 2025 10:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9lCm-0004mb-Uc
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 10:13:16 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9lCS-0005jO-Mb
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 10:13:16 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-470ffbf2150so17879395e9.1
 for <qemu-trivial@nongnu.org>; Fri, 17 Oct 2025 07:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760710374; x=1761315174; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WasMZ1F8t7Kg9KHdJ7LE0HpXXcmnjPD1fjMmZVQOLK4=;
 b=J8Y38dHibrktIqZygG2F4W/BLvMBYRIKeKBMJAw5jANBHk+9Wdlv/BqLu/QftRQ7Er
 AZYxQDnjMUDZ8XyxufIt98xp44h1dCOwgAZ24qoEgfBhnmaiBWstOyZgUm9GBlDobwwP
 OTGtTSd23gkUUTfD+X0PKLZ697tXGV2/7YJg9qle5yrwceo4l4trLRHOfCasdrqgmxvI
 L131PbJDWvwLp3LCznTVYfXm1NoXVPY91bcw0DssookZ3Fevpxmsf8Gh0nhgt9ZtFNLw
 Wt4BZijkpOGJeJa38a1h9m/1Rj0uUYldGo3dbDmA6Z+2PzlK3gCZfaf730Js2jsPJ8Lq
 dX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760710374; x=1761315174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WasMZ1F8t7Kg9KHdJ7LE0HpXXcmnjPD1fjMmZVQOLK4=;
 b=kpL6faG47Zj+my31oiyReHNHUArn4AGWllnpMcJ6o9GdDNIE9gfaTrIdh02XeHeY/2
 U1dYhgZr5kkAorngHA91GvXwefjQZHcE8zXPZDwV2xdkxL/nK1vkOTvq1i9YsIL0FD7Q
 l7hnoKnTuVURCNqha4raXd9J7CEsMaIt2UP0i9vw2w5YuxF1I3Ffj9IuPBdCBekYcy3P
 U+O9R79IOeftk173PGTfuq5rOdyBjkvXONGIrKfkywQwDFceRo2fiLkmaOogfXmTXEAj
 QqFn80F8SwwUb8WSJL75bIcbCLXsQSKCenm+y3rIjE/db6gpS7EeO7OlR66ye2Tl74Jg
 VlNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFvW6x7mRKpf0YONt8RSlV2AKGpb+ngnEhY74XnnVSX8KOOAGRUpA2IwKYuhVDFkKnEqqlRqV0+TeD0zI=@nongnu.org
X-Gm-Message-State: AOJu0Yy0cyCky7/F0jNRQLLncSz0muAZSQblciSX+62Ngw5K5JDI3xMN
 jFDEvNhMutaNfmaY4XqbEDG2PoQIY8mGR4icufPQR3MCP4EfDuPkeQyK
X-Gm-Gg: ASbGncvclzdFWgQBaDN0nB59JH9DfK4ug6latr9rYntZ5832OGitW7V2xQuc4aeQcNM
 WsjnaybWGBrX48LEBKSJTBQmiFktUAJKAQOdjoesiKtUhiCKwmaj8pjAnNVLC7n+xC6itIbGBF+
 dOLWkjkFGotA2OGq06zhJr6HJ211+nXxUXH/MBccLcuN83NxguJuYNWjGu1WglNAQN+9Rm87hgv
 7y8UqGDRedakZd9dLNZ+6p4hwXpAL2ePRnHcLwHOei51jeeOAPW8i9f1RzL6n79YAD5HIzkY2dq
 M/BCudk52CeWSKYkmcIKw0XKWNJ8g09obU3QEJGyYt7kJDzl/4VJZ8HZ34b5LiY1sh/6LKar9er
 aOw4oKd55CeyY+76q04AxWX4ajZStPit3wAlI2yE5LskFa+VbdZS4xSbzX654gqvPELo9EPF9Dv
 keP333G9VFnZSgslrNV2WszcIMCc/y0KHNbylE71WIThw=
X-Google-Smtp-Source: AGHT+IG6amwdU3JKUNT9VxbSRtbgM8Avy/BhQKgGnYnVbRSyWIQst1AQFp5GjR8o/1k5iR1G2og/Ww==
X-Received: by 2002:a05:600c:470b:b0:45d:dc10:a5ee with SMTP id
 5b1f17b1804b1-47117315a43mr32494655e9.15.1760710374055; 
 Fri, 17 Oct 2025 07:12:54 -0700 (PDT)
Received: from archlinux (pd95edc07.dip0.t-ipconnect.de. [217.94.220.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710cb36e7csm51359675e9.2.2025.10.17.07.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 07:12:53 -0700 (PDT)
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
Subject: [PATCH v2 08/11] hw/i386/apic: Ensure own APIC use in apic_msr_{read,
 write}
Date: Fri, 17 Oct 2025 16:11:14 +0200
Message-ID: <20251017141117.105944-9-shentey@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251017141117.105944-1-shentey@gmail.com>
References: <20251017141117.105944-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x336.google.com
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

Avoids the `current_cpu` global and seems more robust by not "forgetting" the
own APIC and then re-determining it by cpu_get_current_apic() which uses the
global.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/i386/apic.h               |  4 ++--
 hw/intc/apic.c                       | 10 ++--------
 target/i386/hvf/hvf.c                |  4 ++--
 target/i386/tcg/system/misc_helper.c |  5 +++--
 4 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/include/hw/i386/apic.h b/include/hw/i386/apic.h
index 871f142888..6a0933f401 100644
--- a/include/hw/i386/apic.h
+++ b/include/hw/i386/apic.h
@@ -19,8 +19,8 @@ void apic_sipi(APICCommonState *s);
 void apic_poll_irq(APICCommonState *s);
 void apic_designate_bsp(APICCommonState *s, bool bsp);
 int apic_get_highest_priority_irr(APICCommonState *s);
-int apic_msr_read(int index, uint64_t *val);
-int apic_msr_write(int index, uint64_t val);
+int apic_msr_read(APICCommonState *s, int index, uint64_t *val);
+int apic_msr_write(APICCommonState *s, int index, uint64_t val);
 bool is_x2apic_mode(APICCommonState *s);
 
 /* pc.c */
diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index cb35c80c75..ba0eda3921 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -881,11 +881,8 @@ static uint64_t apic_mem_read(void *opaque, hwaddr addr, unsigned size)
     return val;
 }
 
-int apic_msr_read(int index, uint64_t *val)
+int apic_msr_read(APICCommonState *s, int index, uint64_t *val)
 {
-    APICCommonState *s;
-
-    s = cpu_get_current_apic();
     if (!s) {
         return -1;
     }
@@ -1079,11 +1076,8 @@ static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
     apic_register_write(index, val);
 }
 
-int apic_msr_write(int index, uint64_t val)
+int apic_msr_write(APICCommonState *s, int index, uint64_t val)
 {
-    APICCommonState *s;
-
-    s = cpu_get_current_apic();
     if (!s) {
         return -1;
     }
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 8445cadece..33f723a76a 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -527,7 +527,7 @@ void hvf_simulate_rdmsr(CPUState *cs)
         int ret;
         int index = (uint32_t)env->regs[R_ECX] - MSR_APIC_START;
 
-        ret = apic_msr_read(index, &val);
+        ret = apic_msr_read(cpu->apic_state, index, &val);
         if (ret < 0) {
             x86_emul_raise_exception(env, EXCP0D_GPF, 0);
         }
@@ -638,7 +638,7 @@ void hvf_simulate_wrmsr(CPUState *cs)
         int ret;
         int index = (uint32_t)env->regs[R_ECX] - MSR_APIC_START;
 
-        ret = apic_msr_write(index, data);
+        ret = apic_msr_write(cpu->apic_state, index, data);
         if (ret < 0) {
             x86_emul_raise_exception(env, EXCP0D_GPF, 0);
         }
diff --git a/target/i386/tcg/system/misc_helper.c b/target/i386/tcg/system/misc_helper.c
index 9c3f5cc99b..360e0e71f0 100644
--- a/target/i386/tcg/system/misc_helper.c
+++ b/target/i386/tcg/system/misc_helper.c
@@ -132,6 +132,7 @@ void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
 void helper_wrmsr(CPUX86State *env)
 {
     uint64_t val;
+    X86CPU *x86_cpu = env_archcpu(env);
     CPUState *cs = env_cpu(env);
 
     cpu_svm_check_intercept_param(env, SVM_EXIT_MSR, 1, GETPC());
@@ -299,7 +300,7 @@ void helper_wrmsr(CPUX86State *env)
         int index = (uint32_t)env->regs[R_ECX] - MSR_APIC_START;
 
         bql_lock();
-        ret = apic_msr_write(index, val);
+        ret = apic_msr_write(x86_cpu->apic_state, index, val);
         bql_unlock();
         if (ret < 0) {
             goto error;
@@ -477,7 +478,7 @@ void helper_rdmsr(CPUX86State *env)
         int index = (uint32_t)env->regs[R_ECX] - MSR_APIC_START;
 
         bql_lock();
-        ret = apic_msr_read(index, &val);
+        ret = apic_msr_read(x86_cpu->apic_state, index, &val);
         bql_unlock();
         if (ret < 0) {
             raise_exception_err_ra(env, EXCP0D_GPF, 0, GETPC());
-- 
2.51.1.dirty


