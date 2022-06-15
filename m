Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1S3q-0001kP-Bc
	for mharc-qemu-trivial@gnu.org; Wed, 15 Jun 2022 08:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o1S3p-0001h0-Fz
 for qemu-trivial@nongnu.org; Wed, 15 Jun 2022 08:23:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o1S3k-0002WI-DX
 for qemu-trivial@nongnu.org; Wed, 15 Jun 2022 08:23:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655295823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=X2G8SXWwjNWw4ujBpNZ7XcjGraCAfU1VBsDYJzYvNlo=;
 b=XI/CxZ+fDPuUHkZFMfD9iZ2RExulHKD/uJqusz5tHUb7oD/FDomV4NMfGZLaxoGLPa+lYN
 2TZA+oHGwQc9RcpxMMBQB7a2HS5m4N7PgLu2VaqlTLoZShxrQbJi+8JPFCa/zFSVn+qhii
 ID9jEaSmoUKo1DX2KDhWZdPMJtYwVus=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-F0IVdb1NNGamPsbzVx5YCg-1; Wed, 15 Jun 2022 08:23:40 -0400
X-MC-Unique: F0IVdb1NNGamPsbzVx5YCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D2D43817A61;
 Wed, 15 Jun 2022 12:23:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B665404E4C6;
 Wed, 15 Jun 2022 12:23:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B116F21E59D1; Wed, 15 Jun 2022 14:23:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	qemu-trivial@nongnu.org
Subject: [PATCH] MAINTAINERS: Add softmmu/runstate.c to "Main loop"
Date: Wed, 15 Jun 2022 14:23:38 +0200
Message-Id: <20220615122338.340426-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 15 Jun 2022 12:23:49 -0000

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4cf6174f9f..4c921c07db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2745,6 +2745,7 @@ F: softmmu/cpu-throttle.c
 F: softmmu/cpu-timers.c
 F: softmmu/icount.c
 F: softmmu/runstate-action.c
+F: softmmu/runstate.c
 F: qapi/run-state.json
 
 Read, Copy, Update (RCU)
-- 
2.35.3


