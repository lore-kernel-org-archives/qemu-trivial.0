Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obeHg-0002bX-SG
	for mharc-qemu-trivial@gnu.org; Fri, 23 Sep 2022 04:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obeHU-0002Zc-Fw
 for qemu-trivial@nongnu.org; Fri, 23 Sep 2022 04:43:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obeHH-0004JB-GP
 for qemu-trivial@nongnu.org; Fri, 23 Sep 2022 04:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663922598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PFHPEzHNF61DftEcR9zBqqihkts4uB5LJG2Nv+G0PMw=;
 b=WvEwSsEzohN8Eof00kqU7yjWurp7dIFmaIQtaAVKRrjrZWhGiUO3O381xeqx57wm/9kmPR
 XuP3mL9n0VDSSxZXsuOd4BDxRUIBuarTFj5GBalNKa9rwCCFsqKcD1I8KaVtHRX1JN3OjX
 sm4iAlYtxCljBF34FQ9/mBmDYIsdm/k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-c2W0F9O8Nm2TV0NzDbnipA-1; Fri, 23 Sep 2022 04:43:15 -0400
X-MC-Unique: c2W0F9O8Nm2TV0NzDbnipA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FEAF3806659;
 Fri, 23 Sep 2022 08:43:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECCF71402BDC;
 Fri, 23 Sep 2022 08:42:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6932521E6900; Fri, 23 Sep 2022 10:42:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: elena.ufimtseva@oracle.com, jag.raman@oracle.com,
 john.g.johnson@oracle.com, pizhenwei@bytedance.com,
 arei.gonglei@huawei.com, mst@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, dgilbert@redhat.com, qemu-trivial@nongnu.org
Subject: [PATCH] Use g_new() & friends where that makes obvious sense
Date: Fri, 23 Sep 2022 10:42:54 +0200
Message-Id: <20220923084254.4173111-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 23 Sep 2022 08:43:32 -0000

g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
for two reasons.  One, it catches multiplication overflowing size_t.
Two, it returns T * rather than void *, which lets the compiler catch
more type errors.

This commit only touches allocations with size arguments of the form
sizeof(T).

Patch created mechanically with:

    $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
	     --macro-file scripts/cocci-macro-file.h FILES...

The previous iteration was commit a95942b50c.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/remote/iommu.c         | 2 +-
 hw/virtio/virtio-crypto.c | 2 +-
 migration/dirtyrate.c     | 4 ++--
 softmmu/dirtylimit.c      | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/remote/iommu.c b/hw/remote/iommu.c
index fd723d91f3..1391dd712c 100644
--- a/hw/remote/iommu.c
+++ b/hw/remote/iommu.c
@@ -47,7 +47,7 @@ static AddressSpace *remote_iommu_find_add_as(PCIBus *pci_bus,
     elem = g_hash_table_lookup(iommu->elem_by_devfn, INT2VOIDP(devfn));
 
     if (!elem) {
-        elem = g_malloc0(sizeof(RemoteIommuElem));
+        elem = g_new0(RemoteIommuElem, 1);
         g_hash_table_insert(iommu->elem_by_devfn, INT2VOIDP(devfn), elem);
     }
 
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index c1243c3f93..df4bde210b 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -710,7 +710,7 @@ virtio_crypto_handle_asym_req(VirtIOCrypto *vcrypto,
     uint8_t *src = NULL;
     uint8_t *dst = NULL;
 
-    asym_op_info = g_malloc0(sizeof(CryptoDevBackendAsymOpInfo));
+    asym_op_info = g_new0(CryptoDevBackendAsymOpInfo, 1);
     src_len = ldl_le_p(&req->para.src_data_len);
     dst_len = ldl_le_p(&req->para.dst_data_len);
 
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 795fab5c37..d6f1e01a70 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -119,9 +119,9 @@ static DirtyPageRecord *vcpu_dirty_stat_alloc(VcpuStat *stat)
     }
 
     stat->nvcpu = nvcpu;
-    stat->rates = g_malloc0(sizeof(DirtyRateVcpu) * nvcpu);
+    stat->rates = g_new0(DirtyRateVcpu, nvcpu);
 
-    records = g_malloc0(sizeof(DirtyPageRecord) * nvcpu);
+    records = g_new0(DirtyPageRecord, nvcpu);
 
     return records;
 }
diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
index 8d98cb7f2c..12668555f2 100644
--- a/softmmu/dirtylimit.c
+++ b/softmmu/dirtylimit.c
@@ -154,7 +154,7 @@ void vcpu_dirty_rate_stat_initialize(void)
 
     vcpu_dirty_rate_stat->stat.nvcpu = max_cpus;
     vcpu_dirty_rate_stat->stat.rates =
-        g_malloc0(sizeof(DirtyRateVcpu) * max_cpus);
+        g_new0(DirtyRateVcpu, max_cpus);
 
     vcpu_dirty_rate_stat->running = false;
 }
@@ -198,7 +198,7 @@ void dirtylimit_state_initialize(void)
     dirtylimit_state = g_malloc0(sizeof(*dirtylimit_state));
 
     dirtylimit_state->states =
-            g_malloc0(sizeof(VcpuDirtyLimitState) * max_cpus);
+            g_new0(VcpuDirtyLimitState, max_cpus);
 
     for (i = 0; i < max_cpus; i++) {
         dirtylimit_state->states[i].cpu_index = i;
-- 
2.37.2


