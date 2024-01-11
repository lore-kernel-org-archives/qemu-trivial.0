Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rNtm6-0002sW-R8
	for mharc-qemu-trivial@gnu.org; Thu, 11 Jan 2024 07:03:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rNtly-0002oD-AX
 for qemu-trivial@nongnu.org; Thu, 11 Jan 2024 07:02:58 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rNtlv-0007Lt-LF
 for qemu-trivial@nongnu.org; Thu, 11 Jan 2024 07:02:57 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3367632ce7bso3727575f8f.2
 for <qemu-trivial@nongnu.org>; Thu, 11 Jan 2024 04:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704974572; x=1705579372; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pZ+Rk66u59cimifcoy3fRichLBCz2Ca8YjXNADwDWao=;
 b=UJSH7zgeVXaBghWOpUxn5/HMliyj6vWy/9Fax/5Z4VyVUWVoCjAWRtDwL7fOCGAWtr
 TPyc4E+AzEr401hL3gQ6RcTongOxYITnUNPdB8sN3yOYHEcoGjD7E0muUuvLYzlVrzkv
 2zpeGV+6AvKPcboJB495bUAZ5EJQndkusTyBjrgZ4U8fNoW4AJ0dJWaiGEW6M2J45985
 U0HvhUFoYoTMelydsSkw1D7Y7BiHx4TRtfj2Zc9y0bOPWNKpVjfET6HCzRQhf5WuZfCx
 6tgle1XAUITWKMOnsEFS3CB7Prscv35WKwDLfsmEMY4FfSbAIDSpbtLRN3Ozy/T4RUbc
 6ymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704974572; x=1705579372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pZ+Rk66u59cimifcoy3fRichLBCz2Ca8YjXNADwDWao=;
 b=Ig85+ORiFu3ILqohdMyGmBrf7kVdy3eBj48ERUBr/hP01K1adLka/oEbOMy8Zsl3cr
 6G4SuU4/o+CD62LGzpXeLb4qcUjO7FCM8onX5/49wMk3cUtG1t8IlUjNZpmMgFoveCl4
 xVIXbJJM6ObdUeb0okqVGrF/uBOvjBV8Tj3iWkBtyDVfoygULhkVvxkUZBQuE5g/GzKU
 f9dvwQ5xeAr26Qbg4YrR1ugodApTJvKSjeVZTLIne62GUAciYDyCHGBBdxmlQVwCh4fe
 WmSn9nFj8yGH7e/urcAkzAgiARj0Z4kCUoVfMt6jhO9A6FlQTCMy5IbTYEJfnL3i5OHU
 s60A==
X-Gm-Message-State: AOJu0Yx9pIXbiLP2WiB2bs+qpL2t4hQxfpz5jl3k82ocDS/gNxno77Sn
 YhMAQxrFzmE4oiIDpHhkhuoYwMWKLeZKmw==
X-Google-Smtp-Source: AGHT+IFjPXsyB08Y1eRcYbIW/MFzO5v7OwfM1FFtqTC9MGr4pukRGYPSAXI82nsmvO/Xd1bIObIM8g==
X-Received: by 2002:a05:6000:507:b0:336:8ddc:a470 with SMTP id
 a7-20020a056000050700b003368ddca470mr686899wrf.43.1704974572389; 
 Thu, 11 Jan 2024 04:02:52 -0800 (PST)
Received: from m1x-phil.lan (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr.
 [176.184.43.236]) by smtp.gmail.com with ESMTPSA id
 d15-20020adf9c8f000000b00336c43b366fsm1082920wre.12.2024.01.11.04.02.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Jan 2024 04:02:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-trivial@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <laurent@vivier.eu>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/5] target/i386: Rename tcg_cpu_FOO() to include 'x86'
Date: Thu, 11 Jan 2024 13:02:20 +0100
Message-ID: <20240111120221.35072-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240111120221.35072-1-philmd@linaro.org>
References: <20240111120221.35072-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 11 Jan 2024 12:02:59 -0000

The tcg_cpu_FOO() names are x86 specific, so rename
them as x86_tcg_cpu_FOO() (as other names in this file)
to ease navigating the code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/tcg/tcg-cpu.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 6e881e9e27..e56489caea 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -114,18 +114,18 @@ static const struct TCGCPUOps x86_tcg_ops = {
 #endif /* !CONFIG_USER_ONLY */
 };
 
-static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
+static void x86_tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
 {
     /* for x86, all cpus use the same set of operations */
     cc->tcg_ops = &x86_tcg_ops;
 }
 
-static void tcg_cpu_class_init(CPUClass *cc)
+static void x86_tcg_cpu_class_init(CPUClass *cc)
 {
-    cc->init_accel_cpu = tcg_cpu_init_ops;
+    cc->init_accel_cpu = x86_tcg_cpu_init_ops;
 }
 
-static void tcg_cpu_xsave_init(void)
+static void x86_tcg_cpu_xsave_init(void)
 {
 #define XO(bit, field) \
     x86_ext_save_areas[bit].offset = offsetof(X86XSaveArea, field);
@@ -147,25 +147,25 @@ static void tcg_cpu_xsave_init(void)
  * TCG-specific defaults that override cpudef models when using TCG.
  * Only for builtin_x86_defs models initialized with x86_register_cpudef_types.
  */
-static PropValue tcg_default_props[] = {
+static PropValue x86_tcg_default_props[] = {
     { "vme", "off" },
     { NULL, NULL },
 };
 
-static void tcg_cpu_instance_init(CPUState *cs)
+static void x86_tcg_cpu_instance_init(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(cpu);
 
     if (xcc->model) {
         /* Special cases not set in the X86CPUDefinition structs: */
-        x86_cpu_apply_props(cpu, tcg_default_props);
+        x86_cpu_apply_props(cpu, x86_tcg_default_props);
     }
 
-    tcg_cpu_xsave_init();
+    x86_tcg_cpu_xsave_init();
 }
 
-static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
+static void x86_tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
 
@@ -173,18 +173,18 @@ static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
     acc->cpu_target_realize = tcg_cpu_realizefn;
 #endif /* CONFIG_USER_ONLY */
 
-    acc->cpu_class_init = tcg_cpu_class_init;
-    acc->cpu_instance_init = tcg_cpu_instance_init;
+    acc->cpu_class_init = x86_tcg_cpu_class_init;
+    acc->cpu_instance_init = x86_tcg_cpu_instance_init;
 }
-static const TypeInfo tcg_cpu_accel_type_info = {
+static const TypeInfo x86_tcg_cpu_accel_type_info = {
     .name = ACCEL_CPU_NAME("tcg"),
 
     .parent = TYPE_ACCEL_CPU,
-    .class_init = tcg_cpu_accel_class_init,
+    .class_init = x86_tcg_cpu_accel_class_init,
     .abstract = true,
 };
-static void tcg_cpu_accel_register_types(void)
+static void x86_tcg_cpu_accel_register_types(void)
 {
-    type_register_static(&tcg_cpu_accel_type_info);
+    type_register_static(&x86_tcg_cpu_accel_type_info);
 }
-type_init(tcg_cpu_accel_register_types);
+type_init(x86_tcg_cpu_accel_register_types);
-- 
2.41.0


