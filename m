Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cPd-00089I-7Q
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:52:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPY-00086P-9f
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPX-0005dB-0L
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:08 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:56002)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPU-0005a7-0g; Fri, 06 Oct 2017 19:52:04 -0400
Received: by mail-qt0-x243.google.com with SMTP id x54so34275627qth.12;
	Fri, 06 Oct 2017 16:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zfbpJ4ayrIcxqNafJhnmF66HmGbvKJkRDV+xKWxI+YU=;
	b=gWIALCC5+UCjG38R6wSfE1mEsBlu5tkxxBUjIZ7iEKmt3B9mwg/M3o0WW4Vy/g6pIc
	4RfCyb+c+6iLqdh/RfqoWr7MAS1AT756Jz5t0TxRJeyBpf8ojsRJKUCJbssXVF7cPlGC
	4yGRdBfA/TchjAOoCVunajQcCgwjnQdFDy2HntoejVtbdF9BkYyuwO738B5ipL7gcSkE
	Rp3R9hidRJsg8oecdqcge6SX+Tf5L6kQN9yYzdc8HNMhqmwDG48q24LfcQGXACSJtTFU
	QH33WoJ69seUYCd63j4Ak3G7Wb/fy9yK7bKnSCrOwLERW/7fKWIbe9cKzqHvS0Xvjf19
	OTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=zfbpJ4ayrIcxqNafJhnmF66HmGbvKJkRDV+xKWxI+YU=;
	b=D1cGhqHLkZcCH1+yveq2jhH56lfphqqXz71JPHbMk2g/1e0BBktc/oRs0ZeBYp3Ikx
	2ggF4Qe0sg+Bh42biahD4pCffiupUfI806g8iAQHQXpeTaRMi93qVUap2EngnLqDbmlu
	bGoNOtjAAU17KDt7UR3ok9rU/Up3kRPKDpmpMAkE85xUjAeUUiriKK7uCjhtWihpB28V
	rLDocIfLg8JHnG7fZZ1r+tTviQEi9yekZ6ZoJ1EcjKZ6chdfvm5vOs9HadQnbdxLOqK0
	CfyH6SL+56DI55IDJjxB2KbqvUdk3Ixy57xkFbsKkYuYXMNkNroItVHfEdVBepuDp7lE
	vbTQ==
X-Gm-Message-State: AMCzsaUhrynwHbkxW22RKacMP0IEd5chcnlTvBHJ39cAVhWGRdaPXOXR
	6KbnsLa7cF6IQy1ngy/yKrs=
X-Google-Smtp-Source: AOwi7QD1Syqy2xWvMGxxNvLdDS5QS5CLfD6byDyXWJx4pMG1QOxclV505NLQ579adRPEOabSxixyVg==
X-Received: by 10.237.36.125 with SMTP id s58mr5557076qtc.24.1507333923366;
	Fri, 06 Oct 2017 16:52:03 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.51.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:52:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Alexander Graf <agraf@suse.de>, Richard Henderson <rth@twiddle.net>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>, qemu-s390x@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:21 -0300
Message-Id: <20171006235023.11952-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 26/88] S390: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:52:11 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: more changes in hw/s390x/css.c, added target/s390x/cpu_models.c]
---
 hw/s390x/css.c            | 10 +++++-----
 hw/s390x/s390-pci-bus.c   |  4 ++--
 target/s390x/cpu_models.c | 12 ++++++------
 target/s390x/diag.c       |  2 +-
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 35683d7954..b6d4fcaf06 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -488,7 +488,7 @@ int css_create_css_image(uint8_t cssid, bool default_image)
     if (channel_subsys.css[cssid]) {
         return -EBUSY;
     }
-    channel_subsys.css[cssid] = g_malloc0(sizeof(CssImage));
+    channel_subsys.css[cssid] = g_new0(CssImage, 1);
     if (default_image) {
         channel_subsys.default_cssid = cssid;
     }
@@ -1778,7 +1778,7 @@ void css_undo_stcrw(CRW *crw)
 {
     CrwContainer *crw_cont;
 
-    crw_cont = g_try_malloc0(sizeof(CrwContainer));
+    crw_cont = g_try_new0(CrwContainer, 1);
     if (!crw_cont) {
         channel_subsys.crws_lost = true;
         return;
@@ -2185,7 +2185,7 @@ void css_subch_assign(uint8_t cssid, uint8_t ssid, uint16_t schid,
     css = channel_subsys.css[cssid];
 
     if (!css->sch_set[ssid]) {
-        css->sch_set[ssid] = g_malloc0(sizeof(SubchSet));
+        css->sch_set[ssid] = g_new0(SubchSet, 1);
     }
     s_set = css->sch_set[ssid];
 
@@ -2206,7 +2206,7 @@ void css_queue_crw(uint8_t rsc, uint8_t erc, int solicited,
 
     trace_css_crw(rsc, erc, rsid, chain ? "(chained)" : "");
     /* TODO: Maybe use a static crw pool? */
-    crw_cont = g_try_malloc0(sizeof(CrwContainer));
+    crw_cont = g_try_new0(CrwContainer, 1);
     if (!crw_cont) {
         channel_subsys.crws_lost = true;
         return;
@@ -2498,7 +2498,7 @@ SubchDev *css_create_sch(CssDevId bus_id, bool is_virtual, bool squash_mcss,
         }
     }
 
-    sch = g_malloc0(sizeof(*sch));
+    sch = g_new0(SubchDev, 1);
     sch->cssid = bus_id.cssid;
     sch->ssid = bus_id.ssid;
     sch->devno = bus_id.devid;
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 96116b7d1e..e7a58e81f7 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -240,7 +240,7 @@ static void s390_pci_generate_event(uint8_t cc, uint16_t pec, uint32_t fh,
     SeiContainer *sei_cont;
     S390pciState *s = s390_get_phb();
 
-    sei_cont = g_malloc0(sizeof(SeiContainer));
+    sei_cont = g_new0(SeiContainer, 1);
     sei_cont->fh = fh;
     sei_cont->fid = fid;
     sei_cont->cc = cc;
@@ -416,7 +416,7 @@ static S390PCIIOMMU *s390_pci_get_iommu(S390pciState *s, PCIBus *bus,
     S390PCIIOMMU *iommu;
 
     if (!table) {
-        table = g_malloc0(sizeof(S390PCIIOMMUTable));
+        table = g_new0(S390PCIIOMMUTable, 1);
         table->key = key;
         g_hash_table_insert(s->iommu_table, &table->key, table);
     }
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 07ef8a3b6e..8c2d8851ae 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -392,7 +392,7 @@ static void create_cpu_model_list(ObjectClass *klass, void *opaque)
 
     /* strip off the -s390-cpu */
     g_strrstr(name, "-" TYPE_S390_CPU)[0] = 0;
-    info = g_malloc0(sizeof(*info));
+    info = g_new0(CpuDefinitionInfo, 1);
     info->name = name;
     info->has_migration_safe = true;
     info->migration_safe = scc->is_migration_safe;
@@ -412,7 +412,7 @@ static void create_cpu_model_list(ObjectClass *klass, void *opaque)
         object_unref(obj);
     }
 
-    entry = g_malloc0(sizeof(*entry));
+    entry = g_new0(CpuDefinitionInfoList, 1);
     entry->value = info;
     entry->next = *cpu_list;
     *cpu_list = entry;
@@ -574,7 +574,7 @@ CpuModelExpansionInfo *arch_query_cpu_model_expansion(CpuModelExpansionType type
     }
 
     /* convert it back to a static representation */
-    expansion_info = g_malloc0(sizeof(*expansion_info));
+    expansion_info = g_new0(CpuModelExpansionInfo, 1);
     expansion_info->model = g_malloc0(sizeof(*expansion_info->model));
     cpu_info_from_model(expansion_info->model, &s390_model, delta_changes);
     return expansion_info;
@@ -585,7 +585,7 @@ static void list_add_feat(const char *name, void *opaque)
     strList **last = (strList **) opaque;
     strList *entry;
 
-    entry = g_malloc0(sizeof(*entry));
+    entry = g_new0(strList, 1);
     entry->value = g_strdup(name);
     entry->next = *last;
     *last = entry;
@@ -609,7 +609,7 @@ CpuModelCompareInfo *arch_query_cpu_model_comparison(CpuModelInfo *infoa,
     if (*errp) {
         return NULL;
     }
-    compare_info = g_malloc0(sizeof(*compare_info));
+    compare_info = g_new0(CpuModelCompareInfo, 1);
 
     /* check the cpu generation and ga level */
     if (modela.def->gen == modelb.def->gen) {
@@ -713,7 +713,7 @@ CpuModelBaselineInfo *arch_query_cpu_model_baseline(CpuModelInfo *infoa,
     bitmap_and(model.features, model.features, model.def->full_feat,
                S390_FEAT_MAX);
 
-    baseline_info = g_malloc0(sizeof(*baseline_info));
+    baseline_info = g_new0(CpuModelBaselineInfo, 1);
     baseline_info->model = g_malloc0(sizeof(*baseline_info->model));
     cpu_info_from_model(baseline_info->model, &model, true);
     return baseline_info;
diff --git a/target/s390x/diag.c b/target/s390x/diag.c
index 82a623948d..dbbb9e886f 100644
--- a/target/s390x/diag.c
+++ b/target/s390x/diag.c
@@ -144,7 +144,7 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3)
             program_interrupt(env, PGM_ADDRESSING, ILEN_AUTO);
             return;
         }
-        iplb = g_malloc0(sizeof(IplParameterBlock));
+        iplb = g_new0(IplParameterBlock, 1);
         cpu_physical_memory_read(addr, iplb, sizeof(iplb->len));
         if (!iplb_valid_len(iplb)) {
             env->regs[r1 + 1] = DIAG_308_RC_INVALID;
-- 
2.14.2


