Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cRZ-0001Qd-Er
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:54:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRT-0001NN-NL
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRS-0007Cs-HH
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:07 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:36755)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRP-0007B0-O3; Fri, 06 Oct 2017 19:54:03 -0400
Received: by mail-qk0-x242.google.com with SMTP id z14so12861984qkg.3;
	Fri, 06 Oct 2017 16:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/87O0wcJzkuMaVGLZDwjtPPj6/UloO+mmd50YR5m0nc=;
	b=YX5ExWtGijvlSpP7w1imZ4KX4neCw2fwm2aomGXoDJFBCcXzVX08aVpPiZbrrvTtmp
	MRrg2uqpcmUrgmfFEjxtCSsGOmbVQhViINEXsZQXayKfiSNKXQKgYCmyFtx6jPHSv2sq
	SXmYE1GyugBM888EMPirQ35UNJeeM/AVqPrj3brfq2haINFioWPdTE+ogPDdUGrNZZOU
	nVbq3bdZOVU+tnSTd4a6LCOu5gzUvDwAYwPDy2mKTK1pOULaDxH2Cm/PFQOUEZ9EhGVJ
	qluqgAHe416AEFne8oJsbLJp4Swmf43t3jRS8hvvfEMo+POb9TnzLowJ5i5wL/dWVgQg
	ZwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=/87O0wcJzkuMaVGLZDwjtPPj6/UloO+mmd50YR5m0nc=;
	b=AdnIrnTGZI0v0mXAV8ugxH7i6eNyKXBtq+9nE1UkZdpAnHeIGnfsCbBSqgVRWof5iY
	gJhVLf5+nUbk1DFBaa0MnCFtJrNJ1l/Tw/sOqcVz5+Era1lgN7KA0pn8H3Qcs2POWxsX
	HWOt3OzS3tQ//4oqRDrb8xOso6UCToQND3gC4aZ1Wzhg+U7z4B1L+VCA01eC6LXFq7XY
	vrTk8UmOmuOyk1SklIsS1W/nRQ2aDjviGxG9+DIqYmGDwo6Ai8fQqwwgMQw+AXb2YmUU
	8DA6Y8RTtNXVhi3scRFEo/dBGheJMW7edQMYHYHIlL+kb9Dl/f//CLU9igSyTklClR9i
	fbZw==
X-Gm-Message-State: AMCzsaVUO7/x7ZNeGA0GF2Ox2xiiNnsgK7+mfbonFnpLkT79XPuB1+lv
	VMp5kO032AW3maXDKrMC9OL6sleL2aE=
X-Google-Smtp-Source: AOwi7QA7zPDRJB/JvOtTIUjHwjoNTtZK6DwPRuKi0Y2KdKw6ob+vIOgETjl8IifOacAamhh7pGVleA==
X-Received: by 10.55.6.149 with SMTP id 143mr673395qkg.231.1507334043167;
	Fri, 06 Oct 2017 16:54:03 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.54.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:54:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Alexander Graf <agraf@suse.de>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>, qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:55 -0300
Message-Id: <20171006235023.11952-61-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 60/88] sPAPR: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:54:09 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: one more change in hw/ppc/spapr_events.c,
      added hw/intc/xics_kvm.c and tests/libqos/pci-spapr.c]
---
 hw/intc/xics.c           | 2 +-
 hw/intc/xics_kvm.c       | 4 ++--
 hw/ppc/spapr.c           | 2 +-
 hw/ppc/spapr_events.c    | 4 ++--
 hw/ppc/spapr_iommu.c     | 2 +-
 hw/ppc/spapr_pci.c       | 2 +-
 tests/libqos/pci-spapr.c | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/intc/xics.c b/hw/intc/xics.c
index cc9816e7f2..e7e1605a1c 100644
--- a/hw/intc/xics.c
+++ b/hw/intc/xics.c
@@ -603,7 +603,7 @@ static void ics_simple_realize(ICSState *ics, Error **errp)
         error_setg(errp, "Number of interrupts needs to be greater 0");
         return;
     }
-    ics->irqs = g_malloc0(ics->nr_irqs * sizeof(ICSIRQState));
+    ics->irqs = g_new0(ICSIRQState, ics->nr_irqs);
     ics->qirqs = qemu_allocate_irqs(ics_simple_set_irq, ics, ics->nr_irqs);
 
     qemu_register_reset(ics_simple_reset, ics);
diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
index 3091ad3ac2..e6742b0118 100644
--- a/hw/intc/xics_kvm.c
+++ b/hw/intc/xics_kvm.c
@@ -143,7 +143,7 @@ static void icp_kvm_realize(ICPState *icp, Error **errp)
                    strerror(errno));
         return;
     }
-    enabled_icp = g_malloc(sizeof(*enabled_icp));
+    enabled_icp = g_new(KVMEnabledICP, 1);
     enabled_icp->vcpu_id = vcpu_id;
     QLIST_INSERT_HEAD(&kvm_enabled_icps, enabled_icp, node);
 }
@@ -334,7 +334,7 @@ static void ics_kvm_realize(ICSState *ics, Error **errp)
         error_setg(errp, "Number of interrupts needs to be greater 0");
         return;
     }
-    ics->irqs = g_malloc0(ics->nr_irqs * sizeof(ICSIRQState));
+    ics->irqs = g_new0(ICSIRQState, ics->nr_irqs);
     ics->qirqs = qemu_allocate_irqs(ics_kvm_set_irq, ics, ics->nr_irqs);
 
     qemu_register_reset(ics_kvm_reset, ics);
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index ff87f155d5..53492595f2 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2988,7 +2988,7 @@ static sPAPRDIMMState *spapr_pending_dimm_unplugs_add(sPAPRMachineState *spapr,
      */
     ds = spapr_pending_dimm_unplugs_find(spapr, dimm);
     if (!ds) {
-        ds = g_malloc0(sizeof(sPAPRDIMMState));
+        ds = g_new0(sPAPRDIMMState, 1);
         ds->nr_lmbs = nr_lmbs;
         ds->dimm = dimm;
         QTAILQ_INSERT_HEAD(&spapr->pending_dimm_unplugs, ds, next);
diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index e377fc7dde..0ff4c2404f 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -437,7 +437,7 @@ static void spapr_powerdown_req(Notifier *n, void *opaque)
     struct epow_extended_log *new_epow;
 
     entry = g_new(sPAPREventLogEntry, 1);
-    new_epow = g_malloc0(sizeof(*new_epow));
+    new_epow = g_new0(struct epow_extended_log, 1);
     entry->extended_log = new_epow;
 
     v6hdr = &new_epow->v6hdr;
@@ -490,7 +490,7 @@ static void spapr_hotplug_req_event(uint8_t hp_id, uint8_t hp_action,
     struct rtas_event_log_v6_hp *hp;
 
     entry = g_new(sPAPREventLogEntry, 1);
-    new_hp = g_malloc0(sizeof(struct hp_extended_log));
+    new_hp = g_new0(struct hp_extended_log, 1);
     entry->extended_log = new_hp;
 
     v6hdr = &new_hp->v6hdr;
diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
index 5ccd785d5a..36cf3d6908 100644
--- a/hw/ppc/spapr_iommu.c
+++ b/hw/ppc/spapr_iommu.c
@@ -93,7 +93,7 @@ static uint64_t *spapr_tce_alloc_table(uint32_t liobn,
 
     if (!table) {
         *fd = -1;
-        table = g_malloc0(nb_table * sizeof(uint64_t));
+        table = g_new0(uint64_t, nb_table);
     }
 
     trace_spapr_iommu_new_table(liobn, table, *fd);
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 5049ced4e8..4ec31f65c5 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1825,7 +1825,7 @@ static int spapr_pci_pre_save(void *opaque)
     if (!sphb->msi_devs_num) {
         return 0;
     }
-    sphb->msi_devs = g_malloc(sphb->msi_devs_num * sizeof(spapr_pci_msi_mig));
+    sphb->msi_devs = g_new(spapr_pci_msi_mig, sphb->msi_devs_num);
 
     g_hash_table_iter_init(&iter, sphb->msi);
     for (i = 0; g_hash_table_iter_next(&iter, &key, &value); ++i) {
diff --git a/tests/libqos/pci-spapr.c b/tests/libqos/pci-spapr.c
index 2043f1e123..e3816ec29f 100644
--- a/tests/libqos/pci-spapr.c
+++ b/tests/libqos/pci-spapr.c
@@ -158,7 +158,7 @@ QPCIBus *qpci_init_spapr(QGuestAllocator *alloc)
 {
     QPCIBusSPAPR *ret;
 
-    ret = g_malloc(sizeof(*ret));
+    ret = g_new(QPCIBusSPAPR, 1);
 
     ret->alloc = alloc;
 
-- 
2.14.2


