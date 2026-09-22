Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FC6C98304
	for <qemu-trivial@archiver.kernel.org>; Tue, 22 Sep 2026 20:58:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1x97Xh-0000No-1w; Tue, 22 Sep 2026 16:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x97XP-0000Fr-TC
 for qemu-trivial@nongnu.org; Tue, 22 Sep 2026 16:56:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x97XO-000458-5k
 for qemu-trivial@nongnu.org; Tue, 22 Sep 2026 16:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790110585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hO6U0r43tcwIk1YxVH+Jad9U+KcRDjTIv+P59ADGJEo=;
 b=BHh4zyMUzOqPiO3GkMwV4n69+8MlTofhAuy3BXe8HGjf4SDBKtg+AyRN4D4/6ZZckq7f7v
 VXZdaW2mZuGV4gvUqpDx2+OCUZFcXow9Ajyk2sapzhZosb3VBUnbGub5cI2AXgfojrBeXM
 rVEkmcLcda3m32Yl6ikIkEItCcQyk0o=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-155-xlp_FLPXNHGSAHfsHoZIAA-1; Tue,
 22 Sep 2026 16:56:21 -0400
X-MC-Unique: xlp_FLPXNHGSAHfsHoZIAA-1
X-Mimecast-MFC-AGG-ID: xlp_FLPXNHGSAHfsHoZIAA_1790110579
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1EE7F1944A85; Tue, 22 Sep 2026 20:56:19 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.125])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EA3E41956087; Tue, 22 Sep 2026 20:56:15 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Michael Roth <michael.roth@amd.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, John Snow <jsnow@redhat.com>
Subject: [PATCH v2 1/8] qapi: convert/split remaining qapi/qmp intro sections
Date: Tue, 22 Sep 2026 16:55:58 -0400
Message-ID: <20260922205605.501602-2-jsnow@redhat.com>
In-Reply-To: <20260922205605.501602-1-jsnow@redhat.com>
References: <20260922205605.501602-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: jW3ILaTxXEV17lsdQNuqDmg070PWSp7y-8qz5vVkT1M_1790110579
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

A few slipped in during the mass conversion, get those too. Mostly
trivial conversion, with the exception of @x-qemu-io which introduces
a new split.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qapi/block.json         |  5 +++--
 qapi/machine-s390x.json |  3 +--
 qapi/machine.json       |  3 +--
 qapi/net.json           | 24 ++++++++----------------
 4 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/qapi/block.json b/qapi/block.json
index 13c47e1eb44..0a88d405a26 100644
--- a/qapi/block.json
+++ b/qapi/block.json
@@ -597,9 +597,10 @@
 
 ##
 # @x-qemu-io:
+#     Run a qemu-io command on a block device.
 #
-# Run a qemu-io command on a block device.  Take either a block
-# backend name or a qdev ID to identify the device.
+# Take either a block backend name or a qdev ID to identify the
+# device.
 #
 # @device: the block backend name, node-name to run the
 #     command on.
diff --git a/qapi/machine-s390x.json b/qapi/machine-s390x.json
index 670a1f9d926..8d8cbe2fb75 100644
--- a/qapi/machine-s390x.json
+++ b/qapi/machine-s390x.json
@@ -138,8 +138,7 @@
 
 ##
 # @BootCertificates:
-#
-# Boot certificates for secure IPL.
+#     Boot certificates for secure IPL.
 #
 # @path: path to an X.509 certificate file or a directory containing
 #      certificate files.
diff --git a/qapi/machine.json b/qapi/machine.json
index 1220116bf7d..6eb14c62851 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1390,8 +1390,7 @@
 
 ##
 # @SpMemDeviceInfo:
-#
-# sp-mem device state information
+#     sp-mem device state information
 #
 # @id: device's ID
 #
diff --git a/qapi/net.json b/qapi/net.json
index 2a186a71b93..f0312dfb714 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -1275,8 +1275,7 @@
 
 ##
 # @UsernetInfo:
-#
-# Information about a user-mode network stack (slirp).
+#     Information about a user-mode network stack (slirp).
 #
 # @hub-id: The hub id, if available.
 #
@@ -1295,8 +1294,7 @@
 
 ##
 # @x-query-usernet:
-#
-# Query user-mode network stack connection states.
+#     Query user-mode network stack connection states.
 #
 # Features:
 #
@@ -1319,8 +1317,7 @@
 
 ##
 # @NetFilterInfo:
-#
-# Information about a netfilter attached to a network client.
+#     Information about a netfilter attached to a network client.
 #
 # @name: filter object name (QOM path component)
 #
@@ -1339,8 +1336,7 @@
 
 ##
 # @NetworkClientInfo:
-#
-# Information about a network client.
+#     Information about a network client.
 #
 # @name: unique network client identifier
 #
@@ -1369,8 +1365,7 @@
 
 ##
 # @NetHubPortInfo:
-#
-# Information about a hub port.
+#     Information about a hub port.
 #
 # @name: hub port identifier
 #
@@ -1385,8 +1380,7 @@
 
 ##
 # @NetHubInfo:
-#
-# Information about a network hub.
+#     Information about a network hub.
 #
 # @id: hub identifier
 #
@@ -1401,8 +1395,7 @@
 
 ##
 # @NetworkInfo:
-#
-# Information about the network configuration.
+#     Information about the network configuration.
 #
 # @hubs: network hubs and their ports
 #
@@ -1417,8 +1410,7 @@
 
 ##
 # @x-query-network:
-#
-# Query the network configuration including hubs and clients.
+#     Query the network configuration including hubs and clients.
 #
 # Features:
 #
-- 
2.55.0


