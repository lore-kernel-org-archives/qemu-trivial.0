Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qInAS-0008No-Az
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jul 2023 05:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qInAQ-0008ND-K9
 for qemu-trivial@nongnu.org; Mon, 10 Jul 2023 05:26:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qInAP-0001Ap-7E
 for qemu-trivial@nongnu.org; Mon, 10 Jul 2023 05:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688981208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=jkTO3dA2IkgSnJ9IDEhR0CcioIH9O1qcCGDPy5q+7wY=;
 b=gLEIcdUtMz19G4QTnwq3juxOxDJ9m1LA4j/Ljx2445jVfwKjnF3CKaA7IIcNBFrjx1TNpW
 nNwSN8PqAq1wkibdYoodreyBH0RyIbZPeyF9nCcM33p3eWQ5nIxgD9N/GbrAcwi0BIdE5y
 MeUe+t7By6/KJhCc/GOpKWrJ/f1XUs8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-YGuCxeiSMei8HuAYBN1lFA-1; Mon, 10 Jul 2023 05:26:42 -0400
X-MC-Unique: YGuCxeiSMei8HuAYBN1lFA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A69D8022EF;
 Mon, 10 Jul 2023 09:26:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 666F6111F3C7;
 Mon, 10 Jul 2023 09:26:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>
Subject: [PATCH] docs/devel: Fix coding style in style.rst
Date: Mon, 10 Jul 2023 11:26:38 +0200
Message-Id: <20230710092638.161625-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 10 Jul 2023 09:26:50 -0000

As defined earlier in this file, the opening curly brace of
functions should be placed on a separate line. So we should
do it in the examples here, too.

Reported-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Fixes: 821f296756 ("docs: document use of automatic cleanup functions in glib")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/style.rst | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index aa5e083ff8..3cfcdeb9cd 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -567,7 +567,8 @@ For example, instead of
 
 .. code-block:: c
 
-    int somefunc(void) {
+    int somefunc(void)
+    {
         int ret = -1;
         char *foo = g_strdup_printf("foo%", "wibble");
         GList *bar = .....
@@ -588,7 +589,8 @@ Using g_autofree/g_autoptr enables the code to be written as:
 
 .. code-block:: c
 
-    int somefunc(void) {
+    int somefunc(void)
+    {
         g_autofree char *foo = g_strdup_printf("foo%", "wibble");
         g_autoptr (GList) bar = .....
 
@@ -613,7 +615,8 @@ are still some caveats to beware of
 
 .. code-block:: c
 
-    char *somefunc(void) {
+    char *somefunc(void)
+    {
         g_autofree char *foo = g_strdup_printf("foo%", "wibble");
         g_autoptr (GList) bar = .....
 
-- 
2.39.3


