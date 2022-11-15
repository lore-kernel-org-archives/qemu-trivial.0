Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ouuoa-0004C8-O5
	for mharc-qemu-trivial@gnu.org; Tue, 15 Nov 2022 07:13:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouuoZ-00049A-Fe
 for qemu-trivial@nongnu.org; Tue, 15 Nov 2022 07:13:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouuoX-0004e1-9q
 for qemu-trivial@nongnu.org; Tue, 15 Nov 2022 07:13:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668514396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lv4vZEI7OQUfHArHUOc7UL/dhPGExU7enAwFsaFQkm8=;
 b=IfZ0gedZYV0GBaB/B4xFQGbDJ+0BmRGYHogO2YJOzciHzZqELZV7jgXpSQbqwtCe6FoEXv
 rNRktKBspFkVxP3BcFqRCE1J2d8qhUjT3ep/7wZl3mlavC/p3iwYMLW+1GEehPPVQhdZZj
 Wgo3/TuVjo7Ta68TtBUf3P3THBDKwaM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-K1RqAlkVPm2dDWalcZetkg-1; Tue, 15 Nov 2022 07:13:11 -0500
X-MC-Unique: K1RqAlkVPm2dDWalcZetkg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49148803481;
 Tue, 15 Nov 2022 12:13:11 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFCDE492B05;
 Tue, 15 Nov 2022 12:13:08 +0000 (UTC)
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
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: [PATCH 11/30] migration: Fix race on qemu_file_shutdown()
Date: Tue, 15 Nov 2022 13:12:07 +0100
Message-Id: <20221115121226.26609-12-quintela@redhat.com>
In-Reply-To: <20221115121226.26609-1-quintela@redhat.com>
References: <20221115121226.26609-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
X-List-Received-Date: Tue, 15 Nov 2022 12:13:19 -0000

From: Peter Xu <peterx@redhat.com>

In qemu_file_shutdown(), there's a possible race if with current order of
operation.  There're two major things to do:

  (1) Do real shutdown() (e.g. shutdown() syscall on socket)
  (2) Update qemufile's last_error

We must do (2) before (1) otherwise there can be a race condition like:

      page receiver                     other thread
      -------------                     ------------
      qemu_get_buffer()
                                        do shutdown()
        returns 0 (buffer all zero)
        (meanwhile we didn't check this retcode)
      try to detect IO error
        last_error==NULL, IO okay
      install ALL-ZERO page
                                        set last_error
      --> guest crash!

To fix this, we can also check retval of qemu_get_buffer(), but not all
APIs can be properly checked and ultimately we still need to go back to
qemu_file_get_error().  E.g. qemu_get_byte() doesn't return error.

Maybe some day a rework of qemufile API is really needed, but for now keep
using qemu_file_get_error() and fix it by not allowing that race condition
to happen.  Here shutdown() is indeed special because the last_error was
emulated.  For real -EIO errors it'll always be set when e.g. sendmsg()
error triggers so we won't miss those ones, only shutdown() is a bit tricky
here.

Cc: Daniel P. Berrange <berrange@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/qemu-file.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 4f400c2e52..2d5f74ffc2 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -79,6 +79,30 @@ int qemu_file_shutdown(QEMUFile *f)
     int ret = 0;
 
     f->shutdown = true;
+
+    /*
+     * We must set qemufile error before the real shutdown(), otherwise
+     * there can be a race window where we thought IO all went though
+     * (because last_error==NULL) but actually IO has already stopped.
+     *
+     * If without correct ordering, the race can happen like this:
+     *
+     *      page receiver                     other thread
+     *      -------------                     ------------
+     *      qemu_get_buffer()
+     *                                        do shutdown()
+     *        returns 0 (buffer all zero)
+     *        (we didn't check this retcode)
+     *      try to detect IO error
+     *        last_error==NULL, IO okay
+     *      install ALL-ZERO page
+     *                                        set last_error
+     *      --> guest crash!
+     */
+    if (!f->last_error) {
+        qemu_file_set_error(f, -EIO);
+    }
+
     if (!qio_channel_has_feature(f->ioc,
                                  QIO_CHANNEL_FEATURE_SHUTDOWN)) {
         return -ENOSYS;
@@ -88,9 +112,6 @@ int qemu_file_shutdown(QEMUFile *f)
         ret = -EIO;
     }
 
-    if (!f->last_error) {
-        qemu_file_set_error(f, -EIO);
-    }
     return ret;
 }
 
-- 
2.38.1


