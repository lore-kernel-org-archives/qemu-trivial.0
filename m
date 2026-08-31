Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F81C61DFD
	for <qemu-trivial@archiver.kernel.org>; Mon, 31 Aug 2026 20:24:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1x18YH-0005oE-Oj; Mon, 31 Aug 2026 16:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x18XY-0003AY-Up
 for qemu-trivial@nongnu.org; Mon, 31 Aug 2026 16:23:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x18XU-00086O-Lg
 for qemu-trivial@nongnu.org; Mon, 31 Aug 2026 16:23:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788207811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QP7QUbGEfuohezFKRNTIokfJyo/v9qvglGiwlHcfMr4=;
 b=En4MRYgCt8jzidQxVKKQiWkorm/Udj7Kkjk44XjFRl8yCeyvU8iC87Pv3ZKE7WtfA7IGQo
 2OGydSxXKLWT1eVDMBNEeAKhIbq9iJjRRL2Gsb0yz9SbsjMumcDAcS0XpyZlNmII6YPq4n
 gdLOBhidjLroxu+70Z8rcng8WA9/mBs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-17-2TTsUxsyMkqDJl8al62dtg-1; Mon,
 31 Aug 2026 16:23:29 -0400
X-MC-Unique: 2TTsUxsyMkqDJl8al62dtg-1
X-Mimecast-MFC-AGG-ID: 2TTsUxsyMkqDJl8al62dtg_1788207807
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EAC601945106; Mon, 31 Aug 2026 20:23:23 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.63])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 692CB1800577; Mon, 31 Aug 2026 20:23:16 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 zhenwei pi <zhenwei.pi@linux.dev>, Jonathan Cameron <jic23@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Jiri Pirko <jiri@resnulli.us>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 qemu-block@nongnu.org, Ani Sinha <anisinha@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, linux-cxl@vger.kernel.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Alex Williamson <alex@shazbot.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 linux-edac@vger.kernel.org, Michael Tokarev <mjt@tls.msk.ru>,
 John Snow <jsnow@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Zhao Liu <zhao1.liu@intel.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Eric Blake <eblake@redhat.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, qemu-trivial@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v4 21/43] qapi: convert trivial intro sections for sockets.json
Date: Mon, 31 Aug 2026 16:19:23 -0400
Message-ID: <20260831201945.287730-22-jsnow@redhat.com>
In-Reply-To: <20260831201945.287730-1-jsnow@redhat.com>
References: <20260831201945.287730-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: Jiy9TmKEG7W2YOytWX5g-P9wFJG49em0BatQ0GAbyXU_1788207807
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qapi/sockets.json | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/qapi/sockets.json b/qapi/sockets.json
index 473be2ac58a..210d07b5ef2 100644
--- a/qapi/sockets.json
+++ b/qapi/sockets.json
@@ -9,8 +9,7 @@
 
 ##
 # @NetworkAddressFamily:
-#
-# The network address family
+#     The network address family
 #
 # @ipv4: IPV4 family
 #
@@ -41,9 +40,8 @@
 
 ##
 # @InetSocketAddress:
-#
-# Captures a socket address or address range in the Internet
-# namespace.
+#     Captures a socket address or address range in the Internet
+#     namespace.
 #
 # @numeric: true if the host/port are guaranteed to be numeric, false
 #     if name resolution should be attempted.  Defaults to false.
@@ -98,8 +96,8 @@
 
 ##
 # @UnixSocketAddress:
-#
-# Captures a socket address in the local ("Unix socket") namespace.
+#     Captures a socket address in the local ("Unix socket")
+#     namespace.
 #
 # @path: filesystem path to use
 #
@@ -121,8 +119,7 @@
 
 ##
 # @VsockSocketAddress:
-#
-# Captures a socket address in the vsock namespace.
+#     Captures a socket address in the vsock namespace.
 #
 # @cid: unique host identifier
 #
@@ -140,8 +137,7 @@
 
 ##
 # @FdSocketAddress:
-#
-# A file descriptor name or number.
+#     A file descriptor name or number.
 #
 # @str: decimal is for file descriptor number, otherwise it's a file
 #     descriptor name.  Named file descriptors are permitted in
@@ -197,9 +193,8 @@
 
 ##
 # @SocketAddressLegacy:
-#
-# Captures the address of a socket, which could also be a named file
-# descriptor
+#     Captures the address of a socket, which could also be a named
+#     file descriptor
 #
 # @type: Transport type
 #
@@ -219,8 +214,7 @@
 
 ##
 # @SocketAddressType:
-#
-# Available `SocketAddress` types
+#     Available `SocketAddress` types
 #
 # @inet: Internet address
 #
@@ -237,9 +231,8 @@
 
 ##
 # @SocketAddress:
-#
-# Captures the address of a socket, which could also be a socket file
-# descriptor
+#     Captures the address of a socket, which could also be a socket
+#     file descriptor
 #
 # @type: Transport type
 #
-- 
2.55.0


