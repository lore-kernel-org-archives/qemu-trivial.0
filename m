Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ouuo9-0003qG-4j
	for mharc-qemu-trivial@gnu.org; Tue, 15 Nov 2022 07:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouuo7-0003pT-W4
 for qemu-trivial@nongnu.org; Tue, 15 Nov 2022 07:12:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouuo5-0004YD-PD
 for qemu-trivial@nongnu.org; Tue, 15 Nov 2022 07:12:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668514369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KqEMNGfO+9FCgLhL/tSP3g81IW8o7xa3Zcbo6/dqmM0=;
 b=gyYuxPYBkJFuV+H5WXJ3vFu2N1zJGNk5O+5gBjal9qy3ns72LgROhI0leluSLmNk3H0FWg
 GDCyOIAGBkN4cYhJxQKZBQr30I2dWx/rjX6XGgFoBxgtFwe09t5nKznkF/PCuIcben8PR5
 TRED7ixgqzRgOPe2F8kRd/cPiUIgfOU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-Od0KXGPrMlqUFeZCAylMkg-1; Tue, 15 Nov 2022 07:12:44 -0500
X-MC-Unique: Od0KXGPrMlqUFeZCAylMkg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8314485A59D;
 Tue, 15 Nov 2022 12:12:43 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D57FF492B05;
 Tue, 15 Nov 2022 12:12:40 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH 02/30] migration/multifd/zero-copy: Create helper function for
 flushing
Date: Tue, 15 Nov 2022 13:11:58 +0100
Message-Id: <20221115121226.26609-3-quintela@redhat.com>
In-Reply-To: <20221115121226.26609-1-quintela@redhat.com>
References: <20221115121226.26609-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
X-List-Received-Date: Tue, 15 Nov 2022 12:12:52 -0000

From: Leonardo Bras <leobras@redhat.com>

Move flushing code from multifd_send_sync_main() to a new helper, and call
it in multifd_send_sync_main().

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 586ddc9d65..509bbbe3bf 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -566,6 +566,23 @@ void multifd_save_cleanup(void)
     multifd_send_state = NULL;
 }
 
+static int multifd_zero_copy_flush(QIOChannel *c)
+{
+    int ret;
+    Error *err = NULL;
+
+    ret = qio_channel_flush(c, &err);
+    if (ret < 0) {
+        error_report_err(err);
+        return -1;
+    }
+    if (ret == 1) {
+        dirty_sync_missed_zero_copy();
+    }
+
+    return ret;
+}
+
 int multifd_send_sync_main(QEMUFile *f)
 {
     int i;
@@ -616,17 +633,8 @@ int multifd_send_sync_main(QEMUFile *f)
         qemu_mutex_unlock(&p->mutex);
         qemu_sem_post(&p->sem);
 
-        if (flush_zero_copy && p->c) {
-            int ret;
-            Error *err = NULL;
-
-            ret = qio_channel_flush(p->c, &err);
-            if (ret < 0) {
-                error_report_err(err);
-                return -1;
-            } else if (ret == 1) {
-                dirty_sync_missed_zero_copy();
-            }
+        if (flush_zero_copy && p->c && (multifd_zero_copy_flush(p->c) < 0)) {
+            return -1;
         }
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
-- 
2.38.1


