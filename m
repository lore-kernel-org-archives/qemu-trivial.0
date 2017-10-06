Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cQT-0000QS-Ho
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:53:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQR-0000NZ-3H
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQQ-0006Jg-4A
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:03 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35189)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQK-0006Di-PQ; Fri, 06 Oct 2017 19:52:56 -0400
Received: by mail-qk0-x241.google.com with SMTP id w63so11297253qkd.2;
	Fri, 06 Oct 2017 16:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=P/cUAO12wpwS/gf8FMOaiId1KFNcT/9XDXvNKKjjZMI=;
	b=FExwCZAToglZKm/SPomyn9JS0Lyy4e+9sfmCKb/TtULv1pYGc5sW6WTr5mOq3q4lp/
	vhSnsJb0Hu8xgr4HPLb/p0RY+wjXw1w0kgapC6wiMusETk5mAw9yX3BJk3MszJoWL4cF
	5UrznbqoGTVWnlZo6JBZm6TrC8g/iXCfqPNqQn5xqThl0kRoZI2y+R3lexfzyuH2Uy6J
	ILzLWtcmJQdwNsdpH8pVaxW5GGFKQNT4colF1mTlDcNLXFz9IMrfveIemcCtSzN0nAoh
	2x3cjTweIL3Eked4XB5QmEn2DD61bJUWtsdLbo2+cSnHSC2NG+ueELPw6OBuN1T/0na1
	/bGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=P/cUAO12wpwS/gf8FMOaiId1KFNcT/9XDXvNKKjjZMI=;
	b=L2QhtkxgJ5I+o9nJiLDQTHUnNFwmcdgsRmQGNPvwfZsV1dXr6jRUvKFjr7E54tv/Gt
	4u8iPfJC/TnDFumpUOU/tqSS6d6NMXX2FZyNWB1Wf1xHeDdS/6IYcO27eVKAZxcydTxK
	VM+Z9WZ9ifb5Gh7Banl0RmhEH7Z+xe5QCwbIYQLO0XNRBiEqZo2U1xKUpK1naHeiztY7
	GYGYWrmNxD8QbKZVb61U+c/rd7DWjLpNm83dZHLVBXlhivRXoUjE5nUogmTmkZlmH4JC
	5MjfJWyKp18tbpeFDEis7ZmYZipxufYIUQehn/CIwDoYXz9QrnDqGT3Lf3HzBHuGqEuW
	BHlg==
X-Gm-Message-State: AMCzsaXFxvJZE5kbYlp+akYOFknNAYemuhy+yFL6allHE0hzXoqImACi
	c7im6uysoeIHUq41UwkuFWo=
X-Google-Smtp-Source: AOwi7QA+jeo0ORx1EiwqooNLSXQ6WHH6zEZU8ivvRIsm8T51hCdiWhL08LbADbuOnOFDw5HnySFFiw==
X-Received: by 10.55.127.70 with SMTP id a67mr696688qkd.90.1507333976226;
	Fri, 06 Oct 2017 16:52:56 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.52.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:52:55 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:49:36 -0300
Message-Id: <20171006235023.11952-42-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH 41/88] target/i386: use g_new() family of
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
X-List-Received-Date: Fri, 06 Oct 2017 23:53:04 -0000

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: added more changes and hax]
---
 target/i386/cpu.c     | 6 +++---
 target/i386/hax-all.c | 4 ++--
 target/i386/hax-mem.c | 2 +-
 target/i386/hyperv.c  | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 98732cd65f..236a4115cd 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -2344,7 +2344,7 @@ static void x86_cpu_definition_entry(gpointer data, gpointer user_data)
     CpuDefinitionInfoList *entry;
     CpuDefinitionInfo *info;
 
-    info = g_malloc0(sizeof(*info));
+    info = g_new0(CpuDefinitionInfo, 1);
     info->name = x86_cpu_class_get_model_name(cc);
     x86_cpu_class_check_missing_features(cc, &info->unavailable_features);
     info->has_unavailable_features = true;
@@ -2353,7 +2353,7 @@ static void x86_cpu_definition_entry(gpointer data, gpointer user_data)
     info->has_migration_safe = true;
     info->q_static = cc->static_model;
 
-    entry = g_malloc0(sizeof(*entry));
+    entry = g_new0(CpuDefinitionInfoList, 1);
     entry->value = info;
     entry->next = *cpu_list;
     *cpu_list = entry;
@@ -3933,7 +3933,7 @@ static GuestPanicInformation *x86_cpu_get_crash_info(CPUState *cs)
     GuestPanicInformation *panic_info = NULL;
 
     if (env->features[FEAT_HYPERV_EDX] & HV_GUEST_CRASH_MSR_AVAILABLE) {
-        panic_info = g_malloc0(sizeof(GuestPanicInformation));
+        panic_info = g_new0(GuestPanicInformation, 1);
 
         panic_info->type = GUEST_PANIC_INFORMATION_TYPE_HYPER_V;
 
diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
index 3ce6950296..8f4368fe01 100644
--- a/target/i386/hax-all.c
+++ b/target/i386/hax-all.c
@@ -155,7 +155,7 @@ int hax_vcpu_create(int id)
         return 0;
     }
 
-    vcpu = g_malloc(sizeof(struct hax_vcpu_state));
+    vcpu = g_new(struct hax_vcpu_state, 1);
     if (!vcpu) {
         fprintf(stderr, "Failed to alloc vcpu state\n");
         return -ENOMEM;
@@ -251,7 +251,7 @@ struct hax_vm *hax_vm_create(struct hax_state *hax)
         return hax->vm;
     }
 
-    vm = g_malloc(sizeof(struct hax_vm));
+    vm = g_new(struct hax_vm, 1);
     if (!vm) {
         return NULL;
     }
diff --git a/target/i386/hax-mem.c b/target/i386/hax-mem.c
index 27a0d214f2..826f7ca501 100644
--- a/target/i386/hax-mem.c
+++ b/target/i386/hax-mem.c
@@ -82,7 +82,7 @@ static void hax_insert_mapping_before(HAXMapping *next, uint64_t start_pa,
 {
     HAXMapping *entry;
 
-    entry = g_malloc0(sizeof(*entry));
+    entry = g_new0(HAXMapping, 1);
     entry->start_pa = start_pa;
     entry->size = size;
     entry->host_va = host_va;
diff --git a/target/i386/hyperv.c b/target/i386/hyperv.c
index a050c9d2d1..a427602e58 100644
--- a/target/i386/hyperv.c
+++ b/target/i386/hyperv.c
@@ -78,7 +78,7 @@ HvSintRoute *kvm_hv_sint_route_create(uint32_t vcpu_id, uint32_t sint,
     HvSintRoute *sint_route;
     int r, gsi;
 
-    sint_route = g_malloc0(sizeof(*sint_route));
+    sint_route = g_new0(HvSintRoute, 1);
     r = event_notifier_init(&sint_route->sint_set_notifier, false);
     if (r) {
         goto err;
-- 
2.14.2


