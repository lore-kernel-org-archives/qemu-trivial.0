Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jybwh-0001HJ-97
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jul 2020 10:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jybwe-0001Eb-Tf
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2020 10:11:36 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33664
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jybwc-0004YP-ED
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2020 10:11:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595513493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=RBXW0awEkUnYYNGiBtq/KkDITQNidMXBkbV69Zf7lhU=;
 b=OPqNcKZKREf4U+dNMvmDb2J1puQ+THV9uxKtjpAsskrdtpzk8Hy8uO8ycsE2Wkwop7W7aw
 3uhq8U3gXNaTOWUx1SKNx+HgvtBFFlBYTXxZI5sukKPauDHHk6wguSVHYnT6lTVQAVi5oR
 bNgtZ5S0qO+zfXtgdhQwpDS/Ofo57xs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-ZMA4AThiNhWKfA0xqhnyRQ-1; Thu, 23 Jul 2020 10:11:31 -0400
X-MC-Unique: ZMA4AThiNhWKfA0xqhnyRQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E944800C64;
 Thu, 23 Jul 2020 14:11:30 +0000 (UTC)
Received: from thuth.com (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C11805DA2A;
 Thu, 23 Jul 2020 14:11:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] configure: Allow to build tools without pixman
Date: Thu, 23 Jul 2020 16:11:23 +0200
Message-Id: <20200723141123.14765-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/23 02:26:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Thu, 23 Jul 2020 14:11:37 -0000

If pixman is not installed, it is currently not possible to run:

 .../configure  --disable-system --enable-tools

Seems like there was a dependency from one of the required source
files to pixman in the past, but since commit 1ac0206b2ae1ffaeec56
("qemu-timer.c: Trim list of included headers"), this dependency
should be gone. Thus allow to compile the tools without pixman now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 4bd80ed507..2acc4d1465 100755
--- a/configure
+++ b/configure
@@ -4065,7 +4065,7 @@ fi
 ##########################################
 # pixman support probe
 
-if test "$want_tools" = "no" && test "$softmmu" = "no"; then
+if test "$softmmu" = "no"; then
   pixman_cflags=
   pixman_libs=
 elif $pkg_config --atleast-version=0.21.8 pixman-1 > /dev/null 2>&1; then
-- 
2.18.1


