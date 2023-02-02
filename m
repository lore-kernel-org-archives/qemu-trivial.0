Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNi7B-0005Ok-2j
	for mharc-qemu-trivial@gnu.org; Thu, 02 Feb 2023 17:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pNi75-0005OI-CT
 for qemu-trivial@nongnu.org; Thu, 02 Feb 2023 17:31:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pNi73-0005ms-Sa
 for qemu-trivial@nongnu.org; Thu, 02 Feb 2023 17:31:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675377085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dlxbrqSgqWlHQwX4L++ere1S3yl17s5ly82INIgoz1U=;
 b=dvS+H6RQua1v/HUtpevHE67VVWVSbq/ipq94x8yCscK0kzd4JuiJirNXWhtteTvC1/RmAu
 Ofd0yvOt0yq+to/d5TUFuUGWxgUzABATroB8ma7foV5v2FVrNhKCj5yDL2R3SsiB6H0H8t
 0RGz5gQFsVJSMwMq7JQZyNSmZhbfy6Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-k2Mnt6Y3NM27id-A4dhWXg-1; Thu, 02 Feb 2023 17:31:22 -0500
X-MC-Unique: k2Mnt6Y3NM27id-A4dhWXg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDA42886462;
 Thu,  2 Feb 2023 22:31:21 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5E3E2026D4B;
 Thu,  2 Feb 2023 22:31:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v2] qemu-options.hx: remove stray quote
Date: Thu,  2 Feb 2023 17:31:21 -0500
Message-Id: <20230202223121.252073-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
X-List-Received-Date: Thu, 02 Feb 2023 22:31:31 -0000

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index d59d19704bc..52d477547f5 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1606,7 +1606,7 @@ SRST
 
     .. parsed-literal::
 
-        |qemu_system_x86| -drive file=a -drive file=b"
+        |qemu_system_x86| -drive file=a -drive file=b
 
     is interpreted like:
 
-- 
2.39.0


