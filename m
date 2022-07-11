Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oAqAi-00046W-VK
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jul 2022 05:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oAqAg-00044a-Qp
 for qemu-trivial@nongnu.org; Mon, 11 Jul 2022 05:57:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oAqAf-0002ZT-Dg
 for qemu-trivial@nongnu.org; Mon, 11 Jul 2022 05:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657533460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cYfqIzcTPzzHczM/cCsbXr8F8ofMSQwwH76979W4h2U=;
 b=ex+jlkutg6jQUqA0kxXAaNTEy4sFNB4pBH/rzl1otCQhXh/h0Cer1ZTXA+0e1Ag6Eknsdd
 JS4s2zTtR7VXiDGeC7XW5eVHM2haCMNm1RNxGUbkBaWulYUrdQVkAoh3+rvKBMyMPDTpRB
 w2ZpNw391/w9T7Wn4y8GRbw8pF9MBXY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-alty69JtNma5Tg9K_skX7w-1; Mon, 11 Jul 2022 05:57:25 -0400
X-MC-Unique: alty69JtNma5Tg9K_skX7w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D45F0811E80;
 Mon, 11 Jul 2022 09:57:24 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2FA81415117;
 Mon, 11 Jul 2022 09:57:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	qemu-trivial@nongnu.org
Subject: [PATCH] python/qemu/qmp/legacy: Replace 'returns-whitelist' with the
 correct type
Date: Mon, 11 Jul 2022 11:57:21 +0200
Message-Id: <20220711095721.61280-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 11 Jul 2022 09:57:43 -0000

'returns-whitelist' has been renamed to 'command-returns-exceptions' in
commit b86df3747848 ("qapi: Rename pragma *-whitelist to *-exceptions").

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 python/qemu/qmp/legacy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/python/qemu/qmp/legacy.py b/python/qemu/qmp/legacy.py
index 03b5574618..1951754455 100644
--- a/python/qemu/qmp/legacy.py
+++ b/python/qemu/qmp/legacy.py
@@ -50,7 +50,7 @@
 
 # QMPMessage can be outgoing commands or incoming events/returns.
 # QMPReturnValue is usually a dict/json object, but due to QAPI's
-# 'returns-whitelist', it can actually be anything.
+# 'command-returns-exceptions', it can actually be anything.
 #
 # {'return': {}} is a QMPMessage,
 # {} is the QMPReturnValue.
-- 
2.31.1


