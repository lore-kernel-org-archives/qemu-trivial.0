Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B9DC4452B
	for <qemu-trivial@archiver.kernel.org>; Thu, 23 Jul 2026 04:52:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wmlPi-0007AN-NW; Thu, 23 Jul 2026 00:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1wmlPd-0006mc-Ri
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2026 00:52:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1wmlPb-0004VJ-8y
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2026 00:52:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784782318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZZOkkDNzF4ftv+zU7W2icMZeYcFhXLiIhUIZUaO7VTU=;
 b=NoF818aE/AvVwcjrYiJ08qs3NpZpxxdrFJ5QdumAvBZ0ypVlGDNqneiZU3ATfSfWzpoWSN
 O8FX1FZ2ivLqswnf5OvS6ZCAxe67cOx8vFVMaf53EHYqhvZzEKr43RTBsdnQ7z77ShS75f
 n5WN1zylC75qEqdprn5fNuVMnJoRJjo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-99-yocJQpmlO5mJYrFHv20kUQ-1; Thu,
 23 Jul 2026 00:51:52 -0400
X-MC-Unique: yocJQpmlO5mJYrFHv20kUQ-1
X-Mimecast-MFC-AGG-ID: yocJQpmlO5mJYrFHv20kUQ_1784782309
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4E423190C40C; Thu, 23 Jul 2026 04:51:49 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.44])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F275E180029D; Thu, 23 Jul 2026 04:51:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Zhao Liu <zhao1.liu@intel.com>, Laurent Vivier <laurent@vivier.eu>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Alex Williamson <alex@shazbot.org>, zhenwei pi <zhenwei.pi@linux.dev>,
 Hanna Reitz <hreitz@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 linux-cxl@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Fabiano Rosas <farosas@suse.de>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-edac@vger.kernel.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, qemu-trivial@nongnu.org,
 Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH v2 21/44] qapi: convert intro sections for common.json
Date: Thu, 23 Jul 2026 00:47:42 -0400
Message-ID: <20260723044805.527643-22-jsnow@redhat.com>
In-Reply-To: <20260723044805.527643-1-jsnow@redhat.com>
References: <20260723044805.527643-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: 6K33K5EDy6natRtvsQ4JPhFLJSDt8DMgDMvEGaqII6E_1784782309
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: permerror client-ip=170.10.129.124;
 envelope-from=jsnow@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
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

(Trivial)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qapi/common.json | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/qapi/common.json b/qapi/common.json
index af7e3d618a7..1352e664b23 100644
--- a/qapi/common.json
+++ b/qapi/common.json
@@ -9,8 +9,7 @@
 
 ##
 # @IoOperationType:
-#
-# An enumeration of the I/O operation types
+#     An enumeration of the I/O operation types
 #
 # @read: read operation
 #
@@ -23,8 +22,7 @@
 
 ##
 # @OnOffAuto:
-#
-# An enumeration of three options: on, off, and auto
+#     An enumeration of three options: on, off, and auto
 #
 # @auto: QEMU selects the value between on and off
 #
@@ -39,8 +37,7 @@
 
 ##
 # @OnOffSplit:
-#
-# An enumeration of three values: on, off, and split
+#     An enumeration of three values: on, off, and split
 #
 # @on: Enabled
 #
@@ -55,10 +52,9 @@
 
 ##
 # @StrOrNull:
-#
-# This is a string value or the explicit lack of a string (null
-# pointer in C).  Intended for cases when 'optional absent' already
-# has a different meaning.
+#     This is a string value or the explicit lack of a string (null
+#     pointer in C).  Intended for cases when 'optional absent'
+#     already has a different meaning.
 #
 # @s: the string value
 #
@@ -72,8 +68,7 @@
 
 ##
 # @OffAutoPCIBAR:
-#
-# An enumeration of options for specifying a PCI BAR
+#     An enumeration of options for specifying a PCI BAR
 #
 # @off: The specified feature is disabled
 #
@@ -98,8 +93,7 @@
 
 ##
 # @PCIELinkSpeed:
-#
-# An enumeration of PCIe link speeds in units of GT/s
+#     An enumeration of PCIe link speeds in units of GT/s
 #
 # @2_5: 2.5GT/s
 #
@@ -120,8 +114,7 @@
 
 ##
 # @PCIELinkWidth:
-#
-# An enumeration of PCIe link width
+#     An enumeration of PCIe link width
 #
 # @1: x1
 #
@@ -144,8 +137,7 @@
 
 ##
 # @HostMemPolicy:
-#
-# Host memory policy types
+#     Host memory policy types
 #
 # @default: restore default policy, remove any nondefault policy
 #
@@ -164,9 +156,8 @@
 
 ##
 # @NetFilterDirection:
-#
-# Indicates whether a netfilter is attached to a netdev's transmit
-# queue or receive queue or both.
+#     Indicates whether a netfilter is attached to a netdev's transmit
+#     queue or receive queue or both.
 #
 # @all: the filter is attached both to the receive and the transmit
 #     queue of the netdev (default).
@@ -184,8 +175,7 @@
 
 ##
 # @GrabToggleKeys:
-#
-# Key combinations to toggle input-linux between host and guest.
+#     Key combinations to toggle input-linux between host and guest.
 #
 # @ctrl-ctrl: left and right control key
 #
-- 
2.55.0


