Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obhMM-0001o4-Vd
	for mharc-qemu-trivial@gnu.org; Fri, 23 Sep 2022 08:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obhMD-0001l0-Ji
 for qemu-trivial@nongnu.org; Fri, 23 Sep 2022 08:00:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obhMB-0000F4-Rf
 for qemu-trivial@nongnu.org; Fri, 23 Sep 2022 08:00:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663934434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M7P9/8xejzoLZcu/tfGY2sj5CXpWf4HB6MWxdifYEUc=;
 b=AT4aUTuFX+d2bL51eKVuXzCfTsinTsORXSKFjOTW118gw5AadA8ThGZ1gMBN2WXifd6Akh
 gqDOMO8rLui/6f45An5hRUtSZjUrEwEPyZXMT74BtcwrOekOaP2m77Ip4IzQXLkaajCQup
 4ApfAH9FGGgSbsFH5z788JYWBSN20Wo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-c6HX2ZJAMxerV-Q3dGna6Q-1; Fri, 23 Sep 2022 08:00:27 -0400
X-MC-Unique: c6HX2ZJAMxerV-Q3dGna6Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86299800186;
 Fri, 23 Sep 2022 12:00:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58C05140EBF3;
 Fri, 23 Sep 2022 12:00:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 24D3F21E6901; Fri, 23 Sep 2022 14:00:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH 1/3] hw/core: Tidy up unnecessary casting away of const
Date: Fri, 23 Sep 2022 14:00:23 +0200
Message-Id: <20220923120025.448759-2-armbru@redhat.com>
In-Reply-To: <20220923120025.448759-1-armbru@redhat.com>
References: <20220923120025.448759-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 23 Sep 2022 12:00:38 -0000

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/core/sysbus-fdt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
index edb0c49b19..eebcd28f9a 100644
--- a/hw/core/sysbus-fdt.c
+++ b/hw/core/sysbus-fdt.c
@@ -299,7 +299,8 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
     void *guest_fdt = data->fdt, *host_fdt;
     const void *r;
     int i, prop_len;
-    uint32_t *irq_attr, *reg_attr, *host_clock_phandles;
+    uint32_t *irq_attr, *reg_attr;
+    const uint32_t *host_clock_phandles;
     uint64_t mmio_base, irq_number;
     uint32_t guest_clock_phandles[2];
 
@@ -339,7 +340,7 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
         error_report("%s clocks property should contain 2 handles", __func__);
         exit(1);
     }
-    host_clock_phandles = (uint32_t *)r;
+    host_clock_phandles = r;
     guest_clock_phandles[0] = qemu_fdt_alloc_phandle(guest_fdt);
     guest_clock_phandles[1] = qemu_fdt_alloc_phandle(guest_fdt);
 
-- 
2.37.2


