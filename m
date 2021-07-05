Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0JvO-0000Rd-BI
	for mharc-qemu-trivial@gnu.org; Mon, 05 Jul 2021 04:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0JvM-0000RR-OZ
 for qemu-trivial@nongnu.org; Mon, 05 Jul 2021 04:25:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0JvK-0002It-VF
 for qemu-trivial@nongnu.org; Mon, 05 Jul 2021 04:25:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625473550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aqYUzVIeP8fuiTyDe3JzpnIdSTp7rSjN6uByh8OgbwE=;
 b=cZpehZMyQwaMEe5PXnrw/vwMaccaQCx82dpBxhLPvX3+Z20/NXO8C9fNOE5wobnR5YJNV/
 unIZVDDUmzDg+hJT6HNrkxaDL/tl9tzzCmq0QPwj8ceyWXXW/24IXa6fpUkgEP5nJt7nli
 POvXamyTN3Wi2MrjdMz+oeeJF2HnnUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-8UVQk6IoPVS2mLn4QW8uBQ-1; Mon, 05 Jul 2021 04:25:49 -0400
X-MC-Unique: 8UVQk6IoPVS2mLn4QW8uBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1049800C78;
 Mon,  5 Jul 2021 08:25:47 +0000 (UTC)
Received: from thuth.com (ovpn-112-116.ams2.redhat.com [10.36.112.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57A4260C0F;
 Mon,  5 Jul 2021 08:25:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, Richard Zak <richard.j.zak@gmail.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH] Makefile: Remove /usr/bin/env wrapper from the SHELL variable
Date: Mon,  5 Jul 2021 10:25:42 +0200
Message-Id: <20210705082542.936856-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 05 Jul 2021 08:25:53 -0000

The wrapper should not be needed here (it's not the shebang line of
a shell script), and it is causing trouble on Haiku where "env"
resides in a different directory.

Reported-by: Richard Zak <richard.j.zak@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 30f19d33bb..6c36330eef 100644
--- a/Makefile
+++ b/Makefile
@@ -14,7 +14,7 @@ SRC_PATH=.
 # we have explicit rules for everything
 MAKEFLAGS += -rR
 
-SHELL = /usr/bin/env bash -o pipefail
+SHELL = bash -o pipefail
 
 # Usage: $(call quiet-command,command and args,"NAME","args to print")
 # This will run "command and args", and either:
-- 
2.27.0


