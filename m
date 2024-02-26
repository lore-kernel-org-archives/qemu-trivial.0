Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1reWKn-0000Wg-M7
	for mharc-qemu-trivial@gnu.org; Mon, 26 Feb 2024 03:27:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1reWKl-0000WR-Rn
 for qemu-trivial@nongnu.org; Mon, 26 Feb 2024 03:27:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1reWKk-0005HR-H9
 for qemu-trivial@nongnu.org; Mon, 26 Feb 2024 03:27:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708936053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=r1lKxg2kVFZHoOaa1CBiUCuMgw8lKO9GM2yy8gBe+8Q=;
 b=c5wGMcD0y/sjFENR6YgyPWUD3/3WBy30PCnYNFg8LQRCx+A9ej5C5yyDO2g/3jKHPDw76O
 LBKubFzYPLxSf09O5nRMgE97n5vGiGkypAbtK3OOzVRjehXH0UKVU26MId4c0X6UiXvYNp
 gzRSqGAKEb5Tsg1jksSJG8aSbjpIOO4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-YSqhj0wcPZWGdHCqjegFGQ-1; Mon, 26 Feb 2024 03:27:32 -0500
X-MC-Unique: YSqhj0wcPZWGdHCqjegFGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B42BD85A5A6;
 Mon, 26 Feb 2024 08:27:31 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03652112131D;
 Mon, 26 Feb 2024 08:27:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-trivial@nongnu.org
Subject: [PATCH] tests/unit/test-util-sockets: Remove temporary file after test
Date: Mon, 26 Feb 2024 09:27:28 +0100
Message-ID: <20240226082728.249753-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.097,
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
X-List-Received-Date: Mon, 26 Feb 2024 08:27:36 -0000

test-util-sockets leaves the temporary socket files around in the
temporary files folder. Let's better remove them at the end of the
testing.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/unit/test-util-sockets.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/unit/test-util-sockets.c b/tests/unit/test-util-sockets.c
index 63909ccb2b..4c9dd0b271 100644
--- a/tests/unit/test-util-sockets.c
+++ b/tests/unit/test-util-sockets.c
@@ -326,6 +326,7 @@ static void test_socket_unix_abstract(void)
         test_socket_unix_abstract_row(&matrix[i]);
     }
 
+    unlink(addr.u.q_unix.path);
     g_free(addr.u.q_unix.path);
 }
 
-- 
2.43.2


