Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nP2Xv-00005T-B3
	for mharc-qemu-trivial@gnu.org; Tue, 01 Mar 2022 08:28:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nP2Xs-0008Vl-1s
 for qemu-trivial@nongnu.org; Tue, 01 Mar 2022 08:28:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nP2Xp-0002Ve-60
 for qemu-trivial@nongnu.org; Tue, 01 Mar 2022 08:28:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646141279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jLONn9iKrM5GUkxTd9wUq27gU2dq7a6agA3KB5biMqc=;
 b=A58snuX8VpZcmaZPcTLJSx++O3QWpuyAs8w8HrSMNw+ialogOdJvDf6LB3fLiNmt/nMW1V
 g5wgBWkekcpDI+JCko+lYYNGFO1drvNJXaxhjNEcdEh801XyBaD3ant78g8nAD5ngUrx8y
 vIfqhx8ia/2qOTWNT3AskDfGsTPCoHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-79KJqMCsNuuia0INh4CNBg-1; Tue, 01 Mar 2022 08:27:58 -0500
X-MC-Unique: 79KJqMCsNuuia0INh4CNBg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E0E71006AA5;
 Tue,  1 Mar 2022 13:27:57 +0000 (UTC)
Received: from thuth.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F35C2C2C3;
 Tue,  1 Mar 2022 13:27:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org
Subject: [PATCH] configure: Fix building on a ppc64 host with Clang
Date: Tue,  1 Mar 2022 14:27:54 +0100
Message-Id: <20220301132754.1483837-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 01 Mar 2022 13:28:05 -0000

Clang only supports the -mlittle-endian and -mbig-endian switches,
and not -mlittle / -mbig. Since GCC supports both, let's use the
long versions that are supported by both instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index c56ed53ee3..81618708e4 100755
--- a/configure
+++ b/configure
@@ -630,10 +630,10 @@ case "$cpu" in
   ppc)
     CPU_CFLAGS="-m32" ;;
   ppc64)
-    CPU_CFLAGS="-m64 -mbig" ;;
+    CPU_CFLAGS="-m64 -mbig-endian" ;;
   ppc64le)
     cpu="ppc64"
-    CPU_CFLAGS="-m64 -mlittle" ;;
+    CPU_CFLAGS="-m64 -mlittle-endian" ;;
 
   s390)
     CPU_CFLAGS="-m31" ;;
-- 
2.27.0


