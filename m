Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p5kiR-0008Ix-PX
	for mharc-qemu-trivial@gnu.org; Thu, 15 Dec 2022 04:39:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p5kiO-0008G3-Qm
 for qemu-trivial@nongnu.org; Thu, 15 Dec 2022 04:39:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p5kiN-0000d8-6t
 for qemu-trivial@nongnu.org; Thu, 15 Dec 2022 04:39:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671097182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8lyK5jWTjCJAgRQLnodHZvbuyoizfgIifPcdRmMqw2Q=;
 b=Y/jDygxeUPJbtEA0Jxy8seY/5etx7DXG58ZTJ0cuMxk5zniaxpDK7jsp3uZKtZebNv52jJ
 4RDCTSsgvVj765mljRp2wyNGpmQ9BfXlNPedgbxcgeHXgrF5rWWNYgo9D7KueiWVdsoG2x
 CyiRimKife76uoeacIYQgvORZqUT8Ws=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-6UR14apIMkSRkzeXXqIKEA-1; Thu, 15 Dec 2022 04:39:39 -0500
X-MC-Unique: 6UR14apIMkSRkzeXXqIKEA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0DF53813F2B;
 Thu, 15 Dec 2022 09:39:38 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57E3640C2064;
 Thu, 15 Dec 2022 09:39:36 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Fam Zheng <fam@euphon.net>
Subject: [PULL 14/19] migration: Add pss_init()
Date: Thu, 15 Dec 2022 10:38:44 +0100
Message-Id: <20221215093849.4771-15-quintela@redhat.com>
In-Reply-To: <20221215093849.4771-1-quintela@redhat.com>
References: <20221215093849.4771-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 15 Dec 2022 09:39:45 -0000

From: Peter Xu <peterx@redhat.com>

Helper to init PSS structures.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 571d780987..d81bf7b183 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -542,6 +542,14 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
 static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss,
                                      bool postcopy_requested);
 
+/* NOTE: page is the PFN not real ram_addr_t. */
+static void pss_init(PageSearchStatus *pss, RAMBlock *rb, ram_addr_t page)
+{
+    pss->block = rb;
+    pss->page = page;
+    pss->complete_round = false;
+}
+
 static void *do_data_compress(void *opaque)
 {
     CompressParam *param = opaque;
@@ -2650,9 +2658,7 @@ static int ram_find_and_save_block(RAMState *rs)
         rs->last_page = 0;
     }
 
-    pss.block = rs->last_seen_block;
-    pss.page = rs->last_page;
-    pss.complete_round = false;
+    pss_init(&pss, rs->last_seen_block, rs->last_page);
 
     do {
         again = true;
-- 
2.38.1


