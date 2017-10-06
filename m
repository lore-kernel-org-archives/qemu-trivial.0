Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cRK-0001DA-Gv
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:53:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRH-0001Ao-QZ
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRE-00071d-Ox
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:55 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34146)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRB-0006wM-SY; Fri, 06 Oct 2017 19:53:49 -0400
Received: by mail-qk0-x242.google.com with SMTP id b124so10272919qke.1;
	Fri, 06 Oct 2017 16:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JeQSNHXuKQzQ/GdktK/KDg07Hpoa0RCBsuEhP5sLZPc=;
	b=uFZM1GtwIg2Z2TNIXoDNhPUQBoWWbqxPnYwGDoNts6u7ZF5+cNOlCjR4gbmWp1ISYi
	koDMHuVx0U/YIAFfeJIFE06hLtcXMxyYThUuOB8CeI3dGolqBZGvvMt0PzSyUDafP8U1
	7YoWDcu50Xaj5X00GtfZyUd/UgPJca5HC9u67RqoiADRh1n2KcmU6nzh1A6wEqiaeIns
	nKGVV4hwSO6Mfqh+EolnfsCMPkMPSzRhFwTZDl+iRXvqc0JSLcoXopBOxYYHHErEv+wr
	ESfTkLS0StigYdFoIa7SltP/2ChBGu7cnztU3TXaYCEonCKURPbupzPGqWW6QTo1qJNr
	dirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=JeQSNHXuKQzQ/GdktK/KDg07Hpoa0RCBsuEhP5sLZPc=;
	b=pwiMB5rU9g3BaTgnDw9hnmlVAfh9yhpGQsRlz1aurj6gLNIG3w6HDyfgxFFTSnIKde
	WcDfUoF9VzEQBWlZkqa4x4aZ0YwUzHrDciV8rAM9E8TazrIaRAR/IecUWTSZsl4Gj6yQ
	y/E5JdyTxa8Q/A9d6Fe+GckfSnSVGExly+wQXXLl/cH/zkQYRJbXT8dYSvBcWegmlSva
	gLN4SevlcJeuxPhn4Qwmwqq6uwyjDK6PLKnXan5mIze1GPxJucNw3GhNaPMcFpILQqx7
	7gmWEWD528/SNAtUje3h6xS6ApP5UxDT+7zUvwdXrfEk6+hXEoci7ZufrE4I8UA5hPeK
	zEyw==
X-Gm-Message-State: AMCzsaWyNWSdtWwN0AAXitM9xGrVIyCS1QVXhWMqyjWbNA4RxwdnSzmi
	x4JL4kaJAiI5uDroW7s3D58=
X-Google-Smtp-Source: AOwi7QBDKIQB6tBFONb28dg5xuV1T4NfGKyztfr4Pbgsr/BSJ7L0/BT4YAorzZW7ZC8EyFnxJ5ebNA==
X-Received: by 10.55.19.146 with SMTP id 18mr660468qkt.33.1507334029303;
	Fri, 06 Oct 2017 16:53:49 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.53.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:53:48 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>, qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:51 -0300
Message-Id: <20171006235023.11952-57-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 56/88] PowerPC: use g_new() family of
 functions
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Oct 2017 23:53:57 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: one more change in target/ppc/translate_init.c, added target/ppc/kvm.c]
---
 hw/ppc/ppc.c                |  8 ++++----
 hw/ppc/ppc_booke.c          |  4 ++--
 target/ppc/kvm.c            |  2 +-
 target/ppc/translate_init.c | 14 +++++++-------
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 05da316e0b..647d70fc13 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -965,7 +965,7 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq)
     PowerPCCPU *cpu = ppc_env_get_cpu(env);
     ppc_tb_t *tb_env;
 
-    tb_env = g_malloc0(sizeof(ppc_tb_t));
+    tb_env = g_new0(ppc_tb_t, 1);
     env->tb_env = tb_env;
     tb_env->flags = PPC_DECR_UNDERFLOW_TRIGGERED;
     if (env->insns_flags & PPC_SEGMENT_64B) {
@@ -1224,10 +1224,10 @@ clk_setup_cb ppc_40x_timers_init (CPUPPCState *env, uint32_t freq,
     ppc_tb_t *tb_env;
     ppc40x_timer_t *ppc40x_timer;
 
-    tb_env = g_malloc0(sizeof(ppc_tb_t));
+    tb_env = g_new0(ppc_tb_t, 1);
     env->tb_env = tb_env;
     tb_env->flags = PPC_DECR_UNDERFLOW_TRIGGERED;
-    ppc40x_timer = g_malloc0(sizeof(ppc40x_timer_t));
+    ppc40x_timer = g_new0(ppc40x_timer_t, 1);
     tb_env->tb_freq = freq;
     tb_env->decr_freq = freq;
     tb_env->opaque = ppc40x_timer;
@@ -1332,7 +1332,7 @@ int ppc_dcr_init (CPUPPCState *env, int (*read_error)(int dcrn),
 {
     ppc_dcr_t *dcr_env;
 
-    dcr_env = g_malloc0(sizeof(ppc_dcr_t));
+    dcr_env = g_new0(ppc_dcr_t, 1);
     dcr_env->read_error = read_error;
     dcr_env->write_error = write_error;
     env->dcr_env = dcr_env;
diff --git a/hw/ppc/ppc_booke.c b/hw/ppc/ppc_booke.c
index 23bcf1b138..dafc6aa3fc 100644
--- a/hw/ppc/ppc_booke.c
+++ b/hw/ppc/ppc_booke.c
@@ -339,8 +339,8 @@ void ppc_booke_timers_init(PowerPCCPU *cpu, uint32_t freq, uint32_t flags)
     booke_timer_t *booke_timer;
     int ret = 0;
 
-    tb_env      = g_malloc0(sizeof(ppc_tb_t));
-    booke_timer = g_malloc0(sizeof(booke_timer_t));
+    tb_env      = g_new0(ppc_tb_t, 1);
+    booke_timer = g_new0(booke_timer_t, 1);
 
     cpu->env.tb_env = tb_env;
     tb_env->flags = flags | PPC_TIMER_BOOKE | PPC_DECR_ZERO_TRIGGERED;
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 171d3d8040..d8565fd4a3 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -364,7 +364,7 @@ struct ppc_radix_page_info *kvm_get_radix_page_info(void)
     if (kvm_vm_ioctl(s, KVM_PPC_GET_RMMU_INFO, &rmmu_info)) {
         return NULL;
     }
-    radix_page_info = g_malloc0(sizeof(*radix_page_info));
+    radix_page_info = g_new0(struct ppc_radix_page_info, 1);
     radix_page_info->count = 0;
     for (i = 0; i < PPC_PAGE_SIZES_MAX_SZ; i++) {
         if (rmmu_info.ap_encodings[i]) {
diff --git a/target/ppc/translate_init.c b/target/ppc/translate_init.c
index c6399a3a0d..850ff038ca 100644
--- a/target/ppc/translate_init.c
+++ b/target/ppc/translate_init.c
@@ -9341,13 +9341,13 @@ static void init_ppc_proc(PowerPCCPU *cpu)
             nb_tlb *= 2;
         switch (env->tlb_type) {
         case TLB_6XX:
-            env->tlb.tlb6 = g_malloc0(nb_tlb * sizeof(ppc6xx_tlb_t));
+            env->tlb.tlb6 = g_new0(ppc6xx_tlb_t, nb_tlb);
             break;
         case TLB_EMB:
-            env->tlb.tlbe = g_malloc0(nb_tlb * sizeof(ppcemb_tlb_t));
+            env->tlb.tlbe = g_new0(ppcemb_tlb_t, nb_tlb);
             break;
         case TLB_MAS:
-            env->tlb.tlbm = g_malloc0(nb_tlb * sizeof(ppcmas_tlb_t));
+            env->tlb.tlbm = g_new0(ppcmas_tlb_t, nb_tlb);
             break;
         }
         /* Pre-compute some useful values */
@@ -10442,11 +10442,11 @@ static void ppc_cpu_defs_entry(gpointer data, gpointer user_data)
     }
 
     typename = object_class_get_name(oc);
-    info = g_malloc0(sizeof(*info));
+    info = g_new0(CpuDefinitionInfo, 1);
     info->name = g_strndup(typename,
                            strlen(typename) - strlen(POWERPC_CPU_TYPE_SUFFIX));
 
-    entry = g_malloc0(sizeof(*entry));
+    entry = g_new0(CpuDefinitionInfoList, 1);
     entry->value = info;
     entry->next = *first;
     *first = entry;
@@ -10473,11 +10473,11 @@ CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp)
             continue;
         }
 
-        info = g_malloc0(sizeof(*info));
+        info = g_new0(CpuDefinitionInfo, 1);
         info->name = g_strdup(alias->alias);
         info->q_typename = g_strdup(object_class_get_name(oc));
 
-        entry = g_malloc0(sizeof(*entry));
+        entry = g_new0(CpuDefinitionInfoList, 1);
         entry->value = info;
         entry->next = cpu_list;
         cpu_list = entry;
-- 
2.14.2


