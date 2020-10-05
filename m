Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPSOn-0003AF-FY
	for mharc-qemu-trivial@gnu.org; Mon, 05 Oct 2020 11:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kPSOm-00038H-0B
 for qemu-trivial@nongnu.org; Mon, 05 Oct 2020 11:27:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kPSOj-0005K2-UE
 for qemu-trivial@nongnu.org; Mon, 05 Oct 2020 11:27:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601911652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ThhMUjjLg+/D2yAGmDv83K8pC0Dc18gDxERoM4qHJ1g=;
 b=Fnh3q3Rc57y5XW4FDROpa+Z6qPYMDIdsZMcp9N5I8QGXSPD6RjzQaTM3+M/i9rUoMlo6YX
 //8iy4MqDwpiiEZi+ri+gaot70iNU5GtnR2CCb5KrMD7LMjIwtSKsCxNTD+7UfhdZXAbQs
 pE2Dm4Tr4Em0h5dUdKVtmtwmt9JwE8M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-14KY5ABIO1irJCnrjZVEVA-1; Mon, 05 Oct 2020 11:27:29 -0400
X-MC-Unique: 14KY5ABIO1irJCnrjZVEVA-1
Received: by mail-wm1-f70.google.com with SMTP id u5so1840382wme.3
 for <qemu-trivial@nongnu.org>; Mon, 05 Oct 2020 08:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ThhMUjjLg+/D2yAGmDv83K8pC0Dc18gDxERoM4qHJ1g=;
 b=sOpNisAagV6Gi3uW6bEUGR2OJMiLbxr3KkU6uc0kHZ8T/1+2AN0FKvgFtbOBtrNaoR
 dJIB1M3LuIDgQ3DBGEtsQK/46e04pHm7OqKeNrMVTmSiEUowl42VixcVo8DoLJ5Q222+
 MxmBD1INFZ8EZ6H7ehAITDHCHc1a4GIU8McbZ/auj2mz+s2va85Cbd6oIrDPnOTseE9J
 wWGgHbJdgSY7oARhI14R0aQfZn1/jQ12qDuK4+Hy6AgHqz/Jhyg4/w46qnqFIzCiN5d2
 aQCfj7qzIkDubGQu1TEnl8fyfyI38d8Dwn6PTu+fGPAY726qYFNSFjRyv/DpnrJuV5i3
 bGcw==
X-Gm-Message-State: AOAM531XOnOayvETSEZcUS2miKDrwOSRcDRW/3e/VOrkg+dmEdPUG4d3
 ZG/farJ9ypXPfUnUtW64C3Or9f/HZgHvvOEafFQchLEGon6ov4/NugL817zfs4c7oFWFKF1Kqwf
 kD/e7Jt8jyiqYOBGt3Q==
X-Received: by 2002:a5d:630a:: with SMTP id i10mr17956445wru.137.1601911647825; 
 Mon, 05 Oct 2020 08:27:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoEDbNmaVqtq4LuuFziMdkP4O4nZd4TYjoG7erWESeywLb1BGqqQcWLru2VufEjnloXdmeNA==
X-Received: by 2002:a5d:630a:: with SMTP id i10mr17956419wru.137.1601911647578; 
 Mon, 05 Oct 2020 08:27:27 -0700 (PDT)
Received: from x1w.redhat.com (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id c4sm84612wme.27.2020.10.05.08.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 08:27:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] softmmu/memory: Log invalid memory accesses
Date: Mon,  5 Oct 2020 17:27:25 +0200
Message-Id: <20201005152725.2143444-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 02:11:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 05 Oct 2020 15:27:36 -0000

Log invalid memory accesses with as GUEST_ERROR.

This is particularly useful since commit 5d971f9e67 which reverted
("memory: accept mismatching sizes in memory_region_access_valid").

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/memory.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index fa280a19f7..403ff3abc9 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -14,6 +14,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "exec/memory.h"
@@ -1353,10 +1354,18 @@ bool memory_region_access_valid(MemoryRegion *mr,
 {
     if (mr->ops->valid.accepts
         && !mr->ops->valid.accepts(mr->opaque, addr, size, is_write, attrs)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
+                                       "0x%" HWADDR_PRIX ", size %u, "
+                                       "region '%s', reason: rejected\n",
+                      addr, size, memory_region_name(mr));
         return false;
     }
 
     if (!mr->ops->valid.unaligned && (addr & (size - 1))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
+                                       "0x%" HWADDR_PRIX ", size %u, "
+                                       "region '%s', reason: unaligned\n",
+                      addr, size, memory_region_name(mr));
         return false;
     }
 
@@ -1367,6 +1376,13 @@ bool memory_region_access_valid(MemoryRegion *mr,
 
     if (size > mr->ops->valid.max_access_size
         || size < mr->ops->valid.min_access_size) {
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
+                                       "0x%" HWADDR_PRIX ", size %u, "
+                                       "region '%s', reason: invalid size "
+                                       "(min:%u max:%u)\n",
+                      addr, size, memory_region_name(mr),
+                      mr->ops->valid.min_access_size,
+                      mr->ops->valid.max_access_size);
         return false;
     }
     return true;
-- 
2.26.2


