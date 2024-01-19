Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rQpKr-0003ES-A4
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jan 2024 08:55:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hhan@redhat.com>) id 1rQpKp-0003EG-O2
 for qemu-trivial@nongnu.org; Fri, 19 Jan 2024 08:55:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hhan@redhat.com>) id 1rQpKo-0007Rs-5u
 for qemu-trivial@nongnu.org; Fri, 19 Jan 2024 08:55:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705672501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DomS3jxqOjp5zUcEiyMIREnIQCm6PaZ2rUd1k7yv22U=;
 b=DhxuYqc4r9Iq2l+ur8IOT7aEjM+kEfJb9VGw85Gn9TEBgwDSxC09GxZgyjzc4yg9qMONX0
 +9R6hKBkdkymbd6aR7EngdzFF2/v6pX/qSDi5Ec1/8cO/TqjT/eEtHnSvQ/MXjiSoeRVN2
 1vLCemwQ46ZMd3LwzjHlhQTB/eGRSu0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-Gzv4EzxyOMiFvB7PAaaPhw-1; Fri, 19 Jan 2024 08:53:46 -0500
X-MC-Unique: Gzv4EzxyOMiFvB7PAaaPhw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65B05185A782
 for <qemu-trivial@nongnu.org>; Fri, 19 Jan 2024 13:53:46 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.72.116.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13396492BE2;
 Fri, 19 Jan 2024 13:53:44 +0000 (UTC)
From: Han Han <hhan@redhat.com>
To: qemu-trivial@nongnu.org
Cc: Han Han <hhan@redhat.com>
Subject: [PATCH] qapi/migration.json: Fix the member name for
 MigrationCapability
Date: Fri, 19 Jan 2024 21:53:14 +0800
Message-ID: <20240119135341.279334-1-hhan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hhan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.519,
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
X-List-Received-Date: Fri, 19 Jan 2024 13:55:04 -0000

s/@compression/@compress/

Fixes: 864128df46

Signed-off-by: Han Han <hhan@redhat.com>
---
 qapi/migration.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index eb2f883513..1657b13314 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -534,7 +534,7 @@
 # Features:
 #
 # @deprecated: Member @block is deprecated.  Use blockdev-mirror with
-#     NBD instead.  Member @compression is deprecated because it is
+#     NBD instead.  Member @compress is deprecated because it is
 #     unreliable and untested.  It is recommended to use multifd
 #     migration, which offers an alternative compression
 #     implementation that is reliable and tested.
-- 
2.43.0


