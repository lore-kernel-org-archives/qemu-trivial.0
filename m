Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cQB-0000BI-Rc
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:52:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQ9-00008E-4o
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQ8-00066W-BN
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:45 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34137)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQ3-00061R-Rd; Fri, 06 Oct 2017 19:52:39 -0400
Received: by mail-qk0-x242.google.com with SMTP id b124so10271806qke.1;
	Fri, 06 Oct 2017 16:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=M4IUFxRt43tOeleQ/oW6MuO4gBsc7lh2yeWA0NF33bg=;
	b=iUTEL3c8eWVb91OABhBwtGEQm04vpilaNKCqJiHidInOUUf3dAoUTnBMzh9UXXGLaZ
	x932PrO4SERgHuehgpRvNS8J2lEFBksh8lVM+otGMKih4F9DLaEebBSRw0h07MsbRFHV
	1DOhU+zX52+9mPSmYEgccQD01AHTRSPmUjOx6NvaTRGG6IZGTbMhtd4bReYnka5UK7/X
	gnd636+Fq721H2kzxh8KtKGpDz3hr3bRbgq6goymWuZcgusvNXdu2sdAFkJfOf/BQ7lC
	3C7R2UJ5G6jYvMccHiV/GnvupY0N4CaM2Y6sqJ+yG6XJfYY7wKBsc/GxJyiq96wHskw6
	We9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=M4IUFxRt43tOeleQ/oW6MuO4gBsc7lh2yeWA0NF33bg=;
	b=QRWxMPfHlPO8Vprb7GcU/7ujBmarYl27mCmcw4W8xim4M7LuFGeLASJmOYwscc2vHc
	umgwHsaekPnniB6fKFtrLy1CiPocTJXhHLdfVX6JWfqhXjP0dBlydSYymXAFUqPu+LTD
	3xT6JPREDiANLr/L1tN73kBQ9o22w657C1GnuD0tADO1Rj8Kqn9752ilX4TQVT7Lwbir
	DMayXDDu3YOEHsoEmAkzgMTu6ARVPzL3+gHgr/BTfh814Z2SschzYBP4J0+uMmkUrqD9
	vH9kffzpyn+OiWJuhZFuK1lWkEaoFzUoWnLRwLwfYBc1xzpUu8olDthrP5lxOJiPQwMV
	ptpA==
X-Gm-Message-State: AMCzsaVd5tiJCT5TwfbBLcyQ8+rd+FPyeMwEzMNHynm7B7qO6IEzDYHg
	QMz2COcG4QdZ1lEi3/iuEcA=
X-Google-Smtp-Source: AOwi7QAmS3cIH6a6Fg1iuKr/rHfs3SguHJ3n2PLMH1CzZvuctkmsMMBJLHCmx2szyPog6rGGuCE3sg==
X-Received: by 10.55.91.69 with SMTP id p66mr692259qkb.167.1507333959328;
	Fri, 06 Oct 2017 16:52:39 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.52.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:52:38 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:32 -0300
Message-Id: <20171006235023.11952-38-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 37/88] TCG: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:52:46 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: avoid use of g_malloc0() in cpus.c]
---
 cpus.c    | 18 +++++++++---------
 tcg/tcg.c |  4 ++--
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/cpus.c b/cpus.c
index c9a624003a..6dea1c7041 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1666,8 +1666,8 @@ static void qemu_tcg_init_vcpu(CPUState *cpu)
     static QemuThread *single_tcg_cpu_thread;
 
     if (qemu_tcg_mttcg_enabled() || !single_tcg_cpu_thread) {
-        cpu->thread = g_malloc0(sizeof(QemuThread));
-        cpu->halt_cond = g_malloc0(sizeof(QemuCond));
+        cpu->thread = g_new0(QemuThread, 1);
+        cpu->halt_cond = g_new0(QemuCond, 1);
         qemu_cond_init(cpu->halt_cond);
 
         if (qemu_tcg_mttcg_enabled()) {
@@ -1706,8 +1706,8 @@ static void qemu_hax_start_vcpu(CPUState *cpu)
 {
     char thread_name[VCPU_THREAD_NAME_SIZE];
 
-    cpu->thread = g_malloc0(sizeof(QemuThread));
-    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
+    cpu->thread = g_new0(QemuThread, 1);
+    cpu->halt_cond = g_new0(QemuCond, 1);
     qemu_cond_init(cpu->halt_cond);
 
     snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/HAX",
@@ -1726,8 +1726,8 @@ static void qemu_kvm_start_vcpu(CPUState *cpu)
 {
     char thread_name[VCPU_THREAD_NAME_SIZE];
 
-    cpu->thread = g_malloc0(sizeof(QemuThread));
-    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
+    cpu->thread = g_new0(QemuThread, 1);
+    cpu->halt_cond = g_new0(QemuCond, 1);
     qemu_cond_init(cpu->halt_cond);
     snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/KVM",
              cpu->cpu_index);
@@ -1742,8 +1742,8 @@ static void qemu_dummy_start_vcpu(CPUState *cpu)
 {
     char thread_name[VCPU_THREAD_NAME_SIZE];
 
-    cpu->thread = g_malloc0(sizeof(QemuThread));
-    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
+    cpu->thread = g_new0(QemuThread, 1);
+    cpu->halt_cond = g_new0(QemuCond, 1);
     qemu_cond_init(cpu->halt_cond);
     snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/DUMMY",
              cpu->cpu_index);
@@ -1931,7 +1931,7 @@ CpuInfoList *qmp_query_cpus(Error **errp)
         info->value->has_props = !!mc->cpu_index_to_instance_props;
         if (info->value->has_props) {
             CpuInstanceProperties *props;
-            props = g_malloc0(sizeof(*props));
+            props = g_malloc(sizeof(*props));
             *props = mc->cpu_index_to_instance_props(ms, cpu->cpu_index);
             info->value->props = props;
         }
diff --git a/tcg/tcg.c b/tcg/tcg.c
index dff9999bc6..d5c1c75aa7 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -342,8 +342,8 @@ void tcg_context_init(TCGContext *s)
         total_args += n;
     }
 
-    args_ct = g_malloc(sizeof(TCGArgConstraint) * total_args);
-    sorted_args = g_malloc(sizeof(int) * total_args);
+    args_ct = g_new(TCGArgConstraint, total_args);
+    sorted_args = g_new(int, total_args);
 
     for(op = 0; op < NB_OPS; op++) {
         def = &tcg_op_defs[op];
-- 
2.14.2


