Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kKzhX-000105-6d
	for mharc-qemu-trivial@gnu.org; Wed, 23 Sep 2020 04:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kKzhV-0000xx-4P
 for qemu-trivial@nongnu.org; Wed, 23 Sep 2020 04:00:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kKzhS-0001Rm-0M
 for qemu-trivial@nongnu.org; Wed, 23 Sep 2020 04:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600848023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=KPau7bBzBl5f3F4KL5bYKHIPMxBzz7zAQTF7c9YfQCg=;
 b=IdXpoVbsYaZ0smIMoU/M+5cTNTPXfWgNDyGxBSBUNET8vJ06LXBfWLdpj2aLx400oJeVSm
 NhIRjhgrbPDAo8vKFzzuYfQZ89YqU4MRYz9Fr3TUX2FhkBlAnlcIoss3IS3mP5DteQOQA6
 OErvXdqGN3up4j0/dhj3cmrHYJjGvCQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-USM66rTqM7-4pK7xTPIfgA-1; Wed, 23 Sep 2020 04:00:19 -0400
X-MC-Unique: USM66rTqM7-4pK7xTPIfgA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9277481CAFE;
 Wed, 23 Sep 2020 08:00:18 +0000 (UTC)
Received: from thuth.com (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75FF9614F5;
 Wed, 23 Sep 2020 08:00:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] docs/system/deprecated: Move lm32 and unicore32 to the right
 section
Date: Wed, 23 Sep 2020 10:00:15 +0200
Message-Id: <20200923080015.77373-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 00:53:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 23 Sep 2020 08:00:29 -0000

lm32 and unicore32 are softmmut targets, and not linux-user targets.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/system/deprecated.rst | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 0cb8b01424..e3dcf1f149 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -329,6 +329,22 @@ The ``compat`` property used to set backwards compatibility modes for
 the processor has been deprecated. The ``max-cpu-compat`` property of
 the ``pseries`` machine type should be used instead.
 
+``lm32`` CPUs (since 5.2.0)
+'''''''''''''''''''''''''''
+
+The ``lm32`` guest CPU support is deprecated and will be removed in
+a future version of QEMU. The only public user of this architecture
+was the milkymist project, which has been dead for years; there was
+never an upstream Linux port.
+
+``unicore32`` CPUs (since 5.2.0)
+''''''''''''''''''''''''''''''''
+
+The ``unicore32`` guest CPU support is deprecated and will be removed in
+a future version of QEMU. Support for this CPU was removed from the
+upstream Linux kernel, and there is no available upstream toolchain
+to build binaries for it.
+
 System emulator devices
 -----------------------
 
@@ -408,22 +424,6 @@ The above, converted to the current supported format::
 linux-user mode CPUs
 --------------------
 
-``lm32`` CPUs (since 5.2.0)
-'''''''''''''''''''''''''''
-
-The ``lm32`` guest CPU support is deprecated and will be removed in
-a future version of QEMU. The only public user of this architecture
-was the milkymist project, which has been dead for years; there was
-never an upstream Linux port.
-
-``unicore32`` CPUs (since 5.2.0)
-''''''''''''''''''''''''''''''''
-
-The ``unicore32`` guest CPU support is deprecated and will be removed in
-a future version of QEMU. Support for this CPU was removed from the
-upstream Linux kernel, and there is no available upstream toolchain
-to build binaries for it.
-
 ``tilegx`` CPUs (since 5.1.0)
 '''''''''''''''''''''''''''''
 
-- 
2.18.2


