Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A7BCAC5B9
	for <qemu-trivial@archiver.kernel.org>; Tue, 30 Sep 2025 07:15:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v3UZb-0006dm-Na; Tue, 30 Sep 2025 03:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v3UZZ-0006de-Vz
 for qemu-trivial@nongnu.org; Tue, 30 Sep 2025 03:14:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v3UZL-0002mE-9q
 for qemu-trivial@nongnu.org; Tue, 30 Sep 2025 03:14:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759216469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8ugKGQb0SZBqGSS1btfqwrBNM6UCEs4CNTfxOOMGMTk=;
 b=SPD75PM2EMZXtD0UH7ZkR0h92wyZkdAu6J468cVltzT/eg0CXEMbSqSYBx2LdnWN8uBM+T
 AWvzIy7+qt5qXDTICvbd+e3VTlEOXdba5zM2fpU0tzNd8dXhD9gtSiOicHzCGX5lqsclxu
 DjKtzdTnzDDbYW5t+T4usN18Ao5sgS8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-468-C75KgIXiMseU2qkJ-ZR5tQ-1; Tue,
 30 Sep 2025 03:14:27 -0400
X-MC-Unique: C75KgIXiMseU2qkJ-ZR5tQ-1
X-Mimecast-MFC-AGG-ID: C75KgIXiMseU2qkJ-ZR5tQ_1759216463
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E6C971800578; Tue, 30 Sep 2025 07:14:22 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.33.89])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D932B30003BB; Tue, 30 Sep 2025 07:14:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-trivial@nongnu.org, qemu-stable@nongnu.org
Subject: [PATCH] ui/icons/qemu.svg: Add metadata information (author,
 license) to the logo
Date: Tue, 30 Sep 2025 09:14:18 +0200
Message-ID: <20250930071419.117592-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

From: Thomas Huth <thuth@redhat.com>

We've got two versions of the QEMU logo in the repository, one with
the whole word "QEMU" (pc-bios/qemu_logo.svg) and one that only contains
the letter "Q" (ui/icons/qemu.svg). While qemu_logo.svg contains the
proper metadata with license and author information, this is missing
from the ui/icons/qemu.svg file. Copy the meta data there so that
people have a chance to know the license of the file if they only
look at the qemu.svg file.

Closes: https://gitlab.com/qemu-project/qemu/-/issues/3139
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 ui/icons/qemu.svg | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/ui/icons/qemu.svg b/ui/icons/qemu.svg
index 24ca23a1e95..f2500de3391 100644
--- a/ui/icons/qemu.svg
+++ b/ui/icons/qemu.svg
@@ -918,7 +918,26 @@
         <dc:format>image/svg+xml</dc:format>
         <dc:type
            rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
-        <dc:title />
+        <dc:title>Kew the Angry Emu</dc:title>
+        <dc:creator>
+          <cc:Agent>
+            <dc:title>Benoît Canet</dc:title>
+          </cc:Agent>
+        </dc:creator>
+        <dc:rights>
+          <cc:Agent>
+            <dc:title>CC BY 3.0</dc:title>
+          </cc:Agent>
+        </dc:rights>
+        <dc:publisher>
+          <cc:Agent>
+            <dc:title>QEMU Community</dc:title>
+          </cc:Agent>
+        </dc:publisher>
+        <dc:date>2012-02-15</dc:date>
+        <cc:license
+           rdf:resource="http://creativecommons.org/licenses/by/3.0/" />
+        <dc:source>https://lists.gnu.org/archive/html/qemu-devel/2012-02/msg02865.html</dc:source>
       </cc:Work>
     </rdf:RDF>
   </metadata>
-- 
2.51.0


