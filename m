Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k2fz2-0005ct-Up
	for mharc-qemu-trivial@gnu.org; Mon, 03 Aug 2020 15:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k2fz0-0005bK-PY
 for qemu-trivial@nongnu.org; Mon, 03 Aug 2020 15:18:50 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43720
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k2fyy-0001dT-IO
 for qemu-trivial@nongnu.org; Mon, 03 Aug 2020 15:18:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596482326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=+yt9QATeEJ5XHntrTPRR+DuhRTJE/vmVnKFUZskr0l8=;
 b=Fe1COTu64Srs9iWwv6LD6t1W/Sb7t9OMnAr0HYBGpOkcFITToPeK9nidJL6pKXzu+ifXCh
 W43eOvYPoVhs0x6biLsSoICnBf5KBIOdsdh2Ow+2Cq5iF95IOl+W2ZZhpj9VUbktPvCj37
 zynsdwGHMtjDl3gWTr6BUb6RBt0JIpM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-laGjP1v_MgWW-xNvXJ2W3g-1; Mon, 03 Aug 2020 15:18:42 -0400
X-MC-Unique: laGjP1v_MgWW-xNvXJ2W3g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5A171902EA0;
 Mon,  3 Aug 2020 19:18:41 +0000 (UTC)
Received: from thuth.com (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF6068A19B;
 Mon,  3 Aug 2020 19:18:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-trivial@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH] Get rid of the libqemustub.a remainders
Date: Mon,  3 Aug 2020 21:18:38 +0200
Message-Id: <20200803191838.14016-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/03 02:37:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 03 Aug 2020 19:18:51 -0000

libqemustub.a has been removed in commit ebedb37c8d ("Makefile: Remove
libqemustub.a"). Some remainders have been missed. Remove them now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Makefile                                | 2 +-
 scripts/coverity-scan/run-coverity-scan | 3 ---
 tests/test-util-sockets.c               | 3 ++-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index c2120d8d48..13dd708c4a 100644
--- a/Makefile
+++ b/Makefile
@@ -726,7 +726,7 @@ virtiofsd$(EXESUF): $(virtiofsd-obj-y) libvhost-user.a $(COMMON_LDADDS)
 	$(call LINK, $^)
 endif
 
-vhost-user-gpu$(EXESUF): $(vhost-user-gpu-obj-y) $(libvhost-user-obj-y) libqemuutil.a libqemustub.a
+vhost-user-gpu$(EXESUF): $(vhost-user-gpu-obj-y) $(libvhost-user-obj-y) libqemuutil.a
 	$(call LINK, $^)
 
 ifdef CONFIG_VHOST_USER_INPUT
diff --git a/scripts/coverity-scan/run-coverity-scan b/scripts/coverity-scan/run-coverity-scan
index 03a791dec9..6eefb4b558 100755
--- a/scripts/coverity-scan/run-coverity-scan
+++ b/scripts/coverity-scan/run-coverity-scan
@@ -403,9 +403,6 @@ echo "Configuring..."
     --enable-mpath --enable-libxml2 --enable-glusterfs \
     --enable-virtfs --enable-zstd
 
-echo "Making libqemustub.a..."
-make libqemustub.a
-
 echo "Running cov-build..."
 rm -rf cov-int
 mkdir cov-int
diff --git a/tests/test-util-sockets.c b/tests/test-util-sockets.c
index 2ca1e99f17..261dc48c03 100644
--- a/tests/test-util-sockets.c
+++ b/tests/test-util-sockets.c
@@ -64,7 +64,8 @@ int monitor_get_fd(Monitor *mon, const char *fdname, Error **errp)
     return dup(mon_fd);
 }
 
-/* Syms in libqemustub.a are discarded at .o file granularity.
+/*
+ * Syms of stubs in libqemuutil.a are discarded at .o file granularity.
  * To replace monitor_get_fd() we must ensure everything in
  * stubs/monitor.c is defined, to make sure monitor.o is discarded
  * otherwise we get duplicate syms at link time.
-- 
2.18.1


