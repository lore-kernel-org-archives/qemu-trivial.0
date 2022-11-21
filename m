Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ox6rX-0000ym-Ap
	for mharc-qemu-trivial@gnu.org; Mon, 21 Nov 2022 08:29:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox6qf-0000SX-Di
 for qemu-trivial@nongnu.org; Mon, 21 Nov 2022 08:28:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox6qX-0004or-NV
 for qemu-trivial@nongnu.org; Mon, 21 Nov 2022 08:28:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669037261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mwG7VmeQ4OSrYdmnU8HIXq4U+zlJC1ZXAM3D1p/Nf8Q=;
 b=aWAiOFZiISaPwdu+zvnrO19iDPYrMgH3ILGNXBHYPAqPcyByDvRH3uaW753STF1A0GvG+m
 b9ky2lwGJIWyUSJGrcYCCN0xrgYs9SbUX0E52T2bOqXtleJvKJGFZA59uGmBXIjsTbyCvd
 TnTBQeFqFGqH80iLSuwt/Q/+oZToe6M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-VUpRjAEiNYeajmOJ_9y2_A-1; Mon, 21 Nov 2022 08:27:40 -0500
X-MC-Unique: VUpRjAEiNYeajmOJ_9y2_A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3B00185A79C;
 Mon, 21 Nov 2022 13:27:39 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54D504B3FC6;
 Mon, 21 Nov 2022 13:27:37 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 05/19] migration: Take bitmap mutex when completing ram
 migration
Date: Mon, 21 Nov 2022 14:27:03 +0100
Message-Id: <20221121132717.63070-6-quintela@redhat.com>
In-Reply-To: <20221121132717.63070-1-quintela@redhat.com>
References: <20221121132717.63070-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 21 Nov 2022 13:29:06 -0000

From: Peter Xu <peterx@redhat.com>

Any call to ram_find_and_save_block() needs to take the bitmap mutex.  We
used to not take it for most of ram_save_complete() because we thought
we're the only one left using the bitmap, but it's not true after the
preempt full patchset applied, since the return path can be taking it too.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 8aad17c429..cc72c24c18 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3406,6 +3406,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         /* try transferring iterative blocks of memory */
 
         /* flush all remaining blocks regardless of rate limiting */
+        qemu_mutex_lock(&rs->bitmap_mutex);
         while (true) {
             int pages;
 
@@ -3419,6 +3420,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
                 break;
             }
         }
+        qemu_mutex_unlock(&rs->bitmap_mutex);
 
         flush_compressed_data(rs);
         ram_control_after_iterate(f, RAM_CONTROL_FINISH);
-- 
2.38.1


