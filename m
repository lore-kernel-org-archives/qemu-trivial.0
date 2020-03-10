Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBjFx-0007oy-O8
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2020 14:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51672)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1jBjFu-0007ik-Tx
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 14:05:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1jBjFt-0005HH-Qn
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 14:05:26 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:49043
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1jBjFt-0005ED-LK
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 14:05:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583863525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=27otnlpCCc6Oj80P4U1wJDCLkbDt2NBJY+YO7yC4c2Q=;
 b=WKtF/toLgJwZP8bVQDAREgD32PLyP71anZgtzpm9Y/btamSuVtdFw3gH2iBQBpxsMWKO+t
 WwLEV/x4yzAVNNcXMe/Bc5I4ed/v5xZCHR+LoN5Tg3Fa8olvGqvOS2sxjKeHHDaRFND0RC
 FVC7eAdry+ahoN2lEnPOiA5Bs6S0Ve0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-7VVRL2bfPayd7ql-Cy4jzw-1; Tue, 10 Mar 2020 14:05:23 -0400
X-MC-Unique: 7VVRL2bfPayd7ql-Cy4jzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19FDC13EA;
 Tue, 10 Mar 2020 18:05:22 +0000 (UTC)
Received: from localhost.localdomain (ovpn-125-115.rdu2.redhat.com
 [10.10.125.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9688519C7F;
 Tue, 10 Mar 2020 18:05:20 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Cc: imammedo@redhat.com,
	mst@redhat.com,
	qemu-trivial@nongnu.org
Subject: [PATCH 2/2] hw/mem/pc-dimm: Fix line over 80 characters warning
Date: Tue, 10 Mar 2020 15:05:10 -0300
Message-Id: <20200310180510.19489-3-wainersm@redhat.com>
In-Reply-To: <20200310180510.19489-1-wainersm@redhat.com>
References: <20200310180510.19489-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Tue, 10 Mar 2020 18:05:28 -0000

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 hw/mem/pc-dimm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index 36edfcf467..6d62588fea 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -218,7 +218,8 @@ static MemoryRegion *pc_dimm_get_memory_region(PCDIMMDe=
vice *dimm, Error **errp)
=20
 static uint64_t pc_dimm_md_get_addr(const MemoryDeviceState *md)
 {
-    return object_property_get_uint(OBJECT(md), PC_DIMM_ADDR_PROP, &error_=
abort);
+    return object_property_get_uint(OBJECT(md), PC_DIMM_ADDR_PROP,
+                                    &error_abort);
 }
=20
 static void pc_dimm_md_set_addr(MemoryDeviceState *md, uint64_t addr,
--=20
2.24.1


