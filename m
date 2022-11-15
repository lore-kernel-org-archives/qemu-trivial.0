Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ouxzs-0006eW-JN
	for mharc-qemu-trivial@gnu.org; Tue, 15 Nov 2022 10:37:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouxz6-0006Aq-QT
 for qemu-trivial@nongnu.org; Tue, 15 Nov 2022 10:36:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouxz5-0008Sn-Cn
 for qemu-trivial@nongnu.org; Tue, 15 Nov 2022 10:36:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668526582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zZyCXKLYLrpw6dr0uW+L3vfIKuXZhrWxjl11Z1i2PBY=;
 b=XNq3bHjgDEJlxiOjWz4ygOUCHKKBZfiGxRFoggIDhE/QcChWKIK4t2QH3fJ1x0xc8cqNue
 Cv5QHrVBpTQ5q+9BTn5sKNPhzs4duto4LwjbvVRRs100N/gF+5GsGlWN80FyxKbM2HxUVL
 T8bruJ24PUFNLT9mnQa3HNsrOXwz7IA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-G9BUEXc9NGGTCPDsoz-xdQ-1; Tue, 15 Nov 2022 10:36:19 -0500
X-MC-Unique: G9BUEXc9NGGTCPDsoz-xdQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC9313C0F7F0;
 Tue, 15 Nov 2022 15:36:18 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C2C22166B2B;
 Tue, 15 Nov 2022 15:36:15 +0000 (UTC)
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
Subject: [PULL 18/30] migration: Trivial cleanup save_page_header() on same
 block check
Date: Tue, 15 Nov 2022 16:35:02 +0100
Message-Id: <20221115153514.28003-19-quintela@redhat.com>
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
X-List-Received-Date: Tue, 15 Nov 2022 15:36:42 -0000

From: Peter Xu <peterx@redhat.com>

The 2nd check on RAM_SAVE_FLAG_CONTINUE is a bit redundant.  Use a boolean
to be clearer.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 9ded381e0a..42b6a543bd 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -689,14 +689,15 @@ static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
                                ram_addr_t offset)
 {
     size_t size, len;
+    bool same_block = (block == rs->last_sent_block);
 
-    if (block == rs->last_sent_block) {
+    if (same_block) {
         offset |= RAM_SAVE_FLAG_CONTINUE;
     }
     qemu_put_be64(f, offset);
     size = 8;
 
-    if (!(offset & RAM_SAVE_FLAG_CONTINUE)) {
+    if (!same_block) {
         len = strlen(block->idstr);
         qemu_put_byte(f, len);
         qemu_put_buffer(f, (uint8_t *)block->idstr, len);
-- 
2.38.1


