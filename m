Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lBZm8-00020x-A0
	for mharc-qemu-trivial@gnu.org; Mon, 15 Feb 2021 04:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lBZm7-000209-Kt
 for qemu-trivial@nongnu.org; Mon, 15 Feb 2021 04:02:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lBZm6-0003il-4r
 for qemu-trivial@nongnu.org; Mon, 15 Feb 2021 04:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613379753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d6sZd3RnFTDjg/UHSbpO0oB4GXbDciN1yqAcKcjXPs4=;
 b=NqnsvAMLQwz/3aAJcYqZy/TGX4+6ShLHqRs3h1hmCgmUQLaNYQ6AODw4NVi/iWDT9qIabf
 ObqiuewlssQWmSC12oB0F3LS3xsYP17A5fcR3ePiVAy73vrOi62BCXkJJic0W4tT7z1oE4
 gnrSQJGPXVOH1ZDIFCNJHLWF9KJ0oSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-qS48oCZSO1W8bvyrvaXp_Q-1; Mon, 15 Feb 2021 04:02:29 -0500
X-MC-Unique: qS48oCZSO1W8bvyrvaXp_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B95FA107ACC7;
 Mon, 15 Feb 2021 09:02:28 +0000 (UTC)
Received: from thuth.com (ovpn-112-80.ams2.redhat.com [10.36.112.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79D707048B;
 Mon, 15 Feb 2021 09:02:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	qemu-trivial@nongnu.org
Subject: [PATCH] net: Use id_generate() in the network subsystem, too
Date: Mon, 15 Feb 2021 10:02:25 +0100
Message-Id: <20210215090225.1046239-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 15 Feb 2021 09:02:35 -0000

We already got a global function called id_generate() to create unique
IDs within QEMU. Let's use it in the network subsytem, too, instead of
inventing our own ID scheme here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/qemu/id.h | 1 +
 net/net.c         | 6 +++---
 util/id.c         | 1 +
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/qemu/id.h b/include/qemu/id.h
index b55c406e69..46b759b284 100644
--- a/include/qemu/id.h
+++ b/include/qemu/id.h
@@ -5,6 +5,7 @@ typedef enum IdSubSystems {
     ID_QDEV,
     ID_BLOCK,
     ID_CHR,
+    ID_NET,
     ID_MAX      /* last element, used as array size */
 } IdSubSystems;
 
diff --git a/net/net.c b/net/net.c
index fb7b7dcc25..ca30df963d 100644
--- a/net/net.c
+++ b/net/net.c
@@ -43,6 +43,7 @@
 #include "qemu/cutils.h"
 #include "qemu/config-file.h"
 #include "qemu/ctype.h"
+#include "qemu/id.h"
 #include "qemu/iov.h"
 #include "qemu/qemu-print.h"
 #include "qemu/main-loop.h"
@@ -1111,8 +1112,7 @@ static int net_client_init(QemuOpts *opts, bool is_netdev, Error **errp)
 
     /* Create an ID for -net if the user did not specify one */
     if (!is_netdev && !qemu_opts_id(opts)) {
-        static int idx;
-        qemu_opts_set_id(opts, g_strdup_printf("__org.qemu.net%i", idx++));
+        qemu_opts_set_id(opts, id_generate(ID_NET));
     }
 
     if (visit_type_Netdev(v, NULL, &object, errp)) {
@@ -1467,7 +1467,7 @@ static int net_param_nic(void *dummy, QemuOpts *opts, Error **errp)
     /* Create an ID if the user did not specify one */
     nd_id = g_strdup(qemu_opts_id(opts));
     if (!nd_id) {
-        nd_id = g_strdup_printf("__org.qemu.nic%i", idx);
+        nd_id = id_generate(ID_NET);
         qemu_opts_set_id(opts, nd_id);
     }
 
diff --git a/util/id.c b/util/id.c
index 5addb4460e..ded41c5025 100644
--- a/util/id.c
+++ b/util/id.c
@@ -35,6 +35,7 @@ static const char *const id_subsys_str[ID_MAX] = {
     [ID_QDEV]  = "qdev",
     [ID_BLOCK] = "block",
     [ID_CHR] = "chr",
+    [ID_NET] = "net",
 };
 
 /*
-- 
2.27.0


