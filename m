Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r2Zoh-0000ZD-BH
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2023 11:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r2Zof-0000Yu-6m
 for qemu-trivial@nongnu.org; Mon, 13 Nov 2023 11:29:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r2Zod-0006Ra-Ij
 for qemu-trivial@nongnu.org; Mon, 13 Nov 2023 11:29:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699892972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vGgybPJ+iHUFFtwNgOyMGMw7qVJDoU7xjqnoePoJmgQ=;
 b=hnUjs6Iq4oaRv+GKTO1OTk+nDYwyS9VEQzXqDzwqdJiC/iwm/iLI3T7ZafBonAp6ADfiAN
 o5Lq5vg79/rYzyeRqq/LcxtSfmjzTIw1C85HvjRnxXCkanhIKdJdbIjYiMc4Sr+h1bO6tw
 mEB91pfpMB14dZ0hhlNYwlzKIQYBL7g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-KNxr0bGxNruBZBY3tjLzDA-1; Mon, 13 Nov 2023 11:29:31 -0500
X-MC-Unique: KNxr0bGxNruBZBY3tjLzDA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27EBB811E7D;
 Mon, 13 Nov 2023 16:29:31 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBA8D492BE0;
 Mon, 13 Nov 2023 16:29:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] qapi/pragma.json: Improve the comment about the lists of QAPI
 rule exceptions
Date: Mon, 13 Nov 2023 17:29:28 +0100
Message-ID: <20231113162928.54551-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 13 Nov 2023 16:29:37 -0000

Let's use more inclusive language here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qapi/pragma.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/pragma.json b/qapi/pragma.json
index 7f810b0e97..0aa4eeddd3 100644
--- a/qapi/pragma.json
+++ b/qapi/pragma.json
@@ -3,8 +3,8 @@
 
 { 'pragma': { 'doc-required': true } }
 
-# Whitelists to permit QAPI rule violations; think twice before you
-# add to them!
+# Entries in these lists are allowed to violate the QAPI rules (for
+# historical reasons); think twice before you add to them!
 { 'pragma': {
     # Command names containing '_'
     'command-name-exceptions': [
-- 
2.41.0


