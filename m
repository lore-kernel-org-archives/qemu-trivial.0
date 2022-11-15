Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ouxzu-0006mP-FP
	for mharc-qemu-trivial@gnu.org; Tue, 15 Nov 2022 10:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouxzP-0006JH-68
 for qemu-trivial@nongnu.org; Tue, 15 Nov 2022 10:36:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouxzM-0000Aj-PP
 for qemu-trivial@nongnu.org; Tue, 15 Nov 2022 10:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668526600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EluQm/oTez6ahm2nd0eMnYBKfql0vE5ySiQGTIRw4dM=;
 b=dyYEkAqw6VBqqMzQODHTS7hdnd7/MkOyh9iCAaLYp0NPz6sQ4IHMtWJXLjy87N/k65AkQN
 8QCms7UGPPyD2+zqRy91znl3xaC5lyaSIkw0VoObrNPtrCximJ2zS7eUMtn/FnrU7oAfNz
 Hwggz7zO3oi/TDyZuu7pNODvU1t8WXo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-WjGN9nu8N7ORcbYUHnErNQ-1; Tue, 15 Nov 2022 10:36:37 -0500
X-MC-Unique: WjGN9nu8N7ORcbYUHnErNQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 995D73817A6A;
 Tue, 15 Nov 2022 15:36:36 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10A9F2166B2B;
 Tue, 15 Nov 2022 15:36:33 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>
Subject: [PULL 24/30] migration: Add pss_init()
Date: Tue, 15 Nov 2022 16:35:08 +0100
Message-Id: <20221115153514.28003-25-quintela@redhat.com>
In-Reply-To: <20221115153514.28003-1-quintela@redhat.com>
References: <20221115153514.28003-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
X-List-Received-Date: Tue, 15 Nov 2022 15:36:43 -0000

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
index fedd61b3da..a2e86623d3 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -570,6 +570,14 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
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
@@ -2678,9 +2686,7 @@ static int ram_find_and_save_block(RAMState *rs)
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


