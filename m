Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jdyPV-0004pn-WE
	for mharc-qemu-trivial@gnu.org; Wed, 27 May 2020 11:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jdyPU-0004nZ-Id
 for qemu-trivial@nongnu.org; Wed, 27 May 2020 11:56:04 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44054
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jdyPS-0007hI-9n
 for qemu-trivial@nongnu.org; Wed, 27 May 2020 11:56:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590594960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YdePEd4ybfyY7U2+FqOlke5L5yf8ZLMowP5ujKzP0WI=;
 b=EC2fKd8FUtbduNX1okCzNMyfa1OVEfm69C0F3o73Ow3oA+Vuf/JpqrM73rQUNH5/wRLa84
 9Jc73JNNFWSElFKIUVEiE/JtjMhPJpf4uFkCRIrVO/i4QxV1zpGDlHRFs96UJJcJ3oXWgS
 o8Lt8za9hLS4+1Gb1lhhbUQxR/ojZoQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-ihYuwqjuOcChIY5gkuZaXA-1; Wed, 27 May 2020 11:55:59 -0400
X-MC-Unique: ihYuwqjuOcChIY5gkuZaXA-1
Received: by mail-ed1-f71.google.com with SMTP id c10so10214491edw.17
 for <qemu-trivial@nongnu.org>; Wed, 27 May 2020 08:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YdePEd4ybfyY7U2+FqOlke5L5yf8ZLMowP5ujKzP0WI=;
 b=JwanLawsQOnl0akslnMn047SDHkVnOPqFk6j+HcqzyCBra/DckpbzhrJYJJ0xfpCdp
 IxFUrUAJchdXTdPtk/T3lW+8eQbUW/TchFFdfdq6I/xcQP2TwAqJw2R7VC6J5/sNgvZ1
 kwHwHOUKihjkky0ygTtxKxAKXH1MKNUpRig1Y3OZ+0HxJiB23995N+6urCT2Ms5K4mDj
 SISvxCJ12QtT5Jtj95k/GvbjMIBp+VKRWp1fT40eQR6vDWeD0SWPnKoHSFIKf3Zdjs8s
 UBJlf91DOVOxuCTZ5/5d4w/5h7RTeTTbldmjRrAz4Y7V8Oan/L8zeu4x9KBbxdWnAwqP
 Tu0g==
X-Gm-Message-State: AOAM5300qmcixQizvfOJ6RMDtFyn3FE0hzwPo8REQlzE8AnLxX0FR3PN
 +HB/8ndlWawB3JA102eG1XqwlwYU9BRdH5iTvgldiQMaWgGW7dlpMFRNezbN28OIP39zX0Ko7pm
 evHBjFCWxlBnn+egNRg==
X-Received: by 2002:a17:906:410a:: with SMTP id
 j10mr6530643ejk.378.1590594957874; 
 Wed, 27 May 2020 08:55:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBGdK4EJtBkeOhyS+VANinAUc/7ASWpLH8aEoWX0wolUEL5Btx8kwCDOLQc3uLP64e48b8Xg==
X-Received: by 2002:a17:906:410a:: with SMTP id
 j10mr6530632ejk.378.1590594957632; 
 Wed, 27 May 2020 08:55:57 -0700 (PDT)
Received: from x1w.redhat.com (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id y19sm2194116edq.54.2020.05.27.08.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 08:55:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-trivial@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2] hw/vfio/common: Trace in which mode an IOMMU is opened
Date: Wed, 27 May 2020 17:55:55 +0200
Message-Id: <20200527155555.6833-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 00:45:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 27 May 2020 15:56:04 -0000

One might want to check which IOMMU version the host kernel
provide. Add a trace event to see in which mode we opened
our container.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: Only display string description (Eric)

Supersedes: <20200526173542.28710-1-philmd@redhat.com>
---
 hw/vfio/common.c     | 19 ++++++++++++++-----
 hw/vfio/trace-events |  1 +
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 0b3593b3c0..f24450472e 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1157,15 +1157,24 @@ static void vfio_put_address_space(VFIOAddressSpace *space)
 static int vfio_get_iommu_type(VFIOContainer *container,
                                Error **errp)
 {
-    int iommu_types[] = { VFIO_TYPE1v2_IOMMU, VFIO_TYPE1_IOMMU,
-                          VFIO_SPAPR_TCE_v2_IOMMU, VFIO_SPAPR_TCE_IOMMU };
+    static const struct {
+        int type;
+        const char *name;
+    } iommu[] = {
+        {VFIO_TYPE1v2_IOMMU, "Type1 (v2)"},
+        {VFIO_TYPE1_IOMMU, "Type1 (v1)"},
+        {VFIO_SPAPR_TCE_v2_IOMMU, "sPAPR TCE (v2)"},
+        {VFIO_SPAPR_TCE_IOMMU, "sPAPR TCE (v1)"}
+    };
     int i;
 
-    for (i = 0; i < ARRAY_SIZE(iommu_types); i++) {
-        if (ioctl(container->fd, VFIO_CHECK_EXTENSION, iommu_types[i])) {
-            return iommu_types[i];
+    for (i = 0; i < ARRAY_SIZE(iommu); i++) {
+        if (ioctl(container->fd, VFIO_CHECK_EXTENSION, iommu[i].type)) {
+            trace_vfio_get_iommu_type(iommu[i].name);
+            return iommu[i].type;
         }
     }
+    trace_vfio_get_iommu_type("Not available or not supported");
     error_setg(errp, "No available IOMMU models");
     return -EINVAL;
 }
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index b1ef55a33f..d3f1e48618 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -115,6 +115,7 @@ vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Devic
 vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
 vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
 vfio_dma_unmap_overflow_workaround(void) ""
+vfio_get_iommu_type(const char *type) "IOMMU type: %s"
 
 # platform.c
 vfio_platform_base_device_init(char *name, int groupid) "%s belongs to group #%d"
-- 
2.21.3


