Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJqvf-00066i-UI
	for mharc-qemu-trivial@gnu.org; Tue, 09 Mar 2021 23:58:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJqve-00064e-5X
 for qemu-trivial@nongnu.org; Tue, 09 Mar 2021 23:58:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJqvZ-0000LG-V3
 for qemu-trivial@nongnu.org; Tue, 09 Mar 2021 23:58:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615352313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KDGSB/F5q1mF4vCxZ0IcFIyOROaqif8GR3QUq10S0HQ=;
 b=G6n20brSERB78zrSRAxirLSNdVXgN/jPE/oxVRH68S2rUXCAFyrBgcTrEdz6ck17SFoSx8
 ydeZyMo4MG+ebXlisWZttR0xVxZm8ZnLksDbkNkK3z0JCSRG5k2IfW+vhM6VUlzrQOr5vi
 Q4KF8i4h8THD97PY+l0YxFfUActiYrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-lo03C3VQNOeiNVdCnhUkuQ-1; Tue, 09 Mar 2021 23:58:29 -0500
X-MC-Unique: lo03C3VQNOeiNVdCnhUkuQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 619A81005D4A;
 Wed, 10 Mar 2021 04:58:28 +0000 (UTC)
Received: from thuth.com (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5ABF60CED;
 Wed, 10 Mar 2021 04:58:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] docs: Fix removal text of -show-cursor
Date: Wed, 10 Mar 2021 05:58:21 +0100
Message-Id: <20210310045821.1004396-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 10 Mar 2021 04:58:38 -0000

We should say now when it was removed, not when it was deprecated.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/system/removed-features.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index f8db76d0b5..13f9dd3014 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -26,8 +26,8 @@ The ``-no-kvm`` argument was a synonym for setting ``-machine accel=tcg``.
 The ``-realtime mlock=on|off`` argument has been replaced by the
 ``-overcommit mem-lock=on|off`` argument.
 
-``-show-cursor`` option (since 5.0)
-'''''''''''''''''''''''''''''''''''
+``-show-cursor`` option (removed in 6.0)
+''''''''''''''''''''''''''''''''''''''''
 
 Use ``-display sdl,show-cursor=on``, ``-display gtk,show-cursor=on``
 or ``-display default,show-cursor=on`` instead.
-- 
2.27.0


