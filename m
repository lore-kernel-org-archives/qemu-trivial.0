Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kIb5c-0003ZC-MC
	for mharc-qemu-trivial@gnu.org; Wed, 16 Sep 2020 13:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kIb5b-0003Xw-QL
 for qemu-trivial@nongnu.org; Wed, 16 Sep 2020 13:19:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kIb5a-0000Eg-7j
 for qemu-trivial@nongnu.org; Wed, 16 Sep 2020 13:19:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600276765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CgW2KANwbVMp0WkfF4cdtdysL1MWg1LCa6COmzA9/Q8=;
 b=IzoBTsHleaPaidC1ZVIvRbD82mlEkl9HkuTpAEUkP2bogu9QJNMqiTTXohyOt5xmVMqfDX
 AJc4J9udxHGogMJm2YcKJvx/NEF9xqwFbbYWhIvGYE0NjL8fgyYzi1HUNazqCmIJrRPqnR
 jOoUNHz0/O1EAad/x52SaSkViLSDFcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-r6eNavfePB67cydZdInXlw-1; Wed, 16 Sep 2020 13:19:21 -0400
X-MC-Unique: r6eNavfePB67cydZdInXlw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30CC1186DD23;
 Wed, 16 Sep 2020 17:19:20 +0000 (UTC)
Received: from thuth.com (ovpn-113-19.ams2.redhat.com [10.36.113.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B963702E7;
 Wed, 16 Sep 2020 17:19:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] migration: Silence compiler warning in
 global_state_store_running()
Date: Wed, 16 Sep 2020 19:19:13 +0200
Message-Id: <20200916171913.148681-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 16 Sep 2020 17:19:28 -0000

GCC 9.3.0 on Ubuntu complains:

In file included from /usr/include/string.h:495,
                 from /home/travis/build/huth/qemu/include/qemu/osdep.h:87,
                 from ../migration/global_state.c:13:
In function ‘strncpy’,
    inlined from ‘global_state_store_running’ at ../migration/global_state.c:47:5:
/usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error: ‘__builtin_strncpy’ specified bound 100 equals destination size [-Werror=stringop-truncation]
  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

... but we apparently really want to do the strncpy here. Silence the
warning with QEMU_NONSTRING.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 migration/global_state.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/global_state.c b/migration/global_state.c
index 25311479a4..f1355d7d97 100644
--- a/migration/global_state.c
+++ b/migration/global_state.c
@@ -43,9 +43,9 @@ int global_state_store(void)
 void global_state_store_running(void)
 {
     const char *state = RunState_str(RUN_STATE_RUNNING);
+    QEMU_NONSTRING char *dest = (char *)global_state.runstate;
     assert(strlen(state) < sizeof(global_state.runstate));
-    strncpy((char *)global_state.runstate,
-           state, sizeof(global_state.runstate));
+    strncpy(dest, state, sizeof(global_state.runstate));
 }
 
 bool global_state_received(void)
-- 
2.18.2


