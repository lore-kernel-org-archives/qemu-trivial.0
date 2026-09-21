Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7619AC982ED
	for <qemu-trivial@archiver.kernel.org>; Mon, 21 Sep 2026 20:53:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1x8l01-0007Cs-Gn; Mon, 21 Sep 2026 16:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x8kzy-0007BF-QS
 for qemu-trivial@nongnu.org; Mon, 21 Sep 2026 16:52:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x8kzt-0002Pn-Fx
 for qemu-trivial@nongnu.org; Mon, 21 Sep 2026 16:52:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790023937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jiuQzypKOo2UN4XSnEnDQmXYroFTjnqbNw1e7bjBSrs=;
 b=KfmWPKANUHju9TJdpK49EeJCTYMvM8fuJITRROCpeDnhymVxP9rm2ZLjAH16y/G+d5OyxM
 ZAuLyEDxbvoBIWtAOId88sjTG2/4cR34LkJh9YSt12wWlmcolHzgAycGky0vMNpsqw17EH
 /q1W7bL6v0b8SNpJ1+Um+a5ygimndNA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-86-JfHzVtg6PWKTMIvpLVBJRg-1; Mon,
 21 Sep 2026 16:52:14 -0400
X-MC-Unique: JfHzVtg6PWKTMIvpLVBJRg-1
X-Mimecast-MFC-AGG-ID: JfHzVtg6PWKTMIvpLVBJRg_1790023932
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AD0041829E2E; Mon, 21 Sep 2026 20:52:12 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.125])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E6A2241B; Mon, 21 Sep 2026 20:52:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 4/9] qapi: convert simple intros for qga/qapi-schema.json
Date: Mon, 21 Sep 2026 16:51:42 -0400
Message-ID: <20260921205147.1857168-5-jsnow@redhat.com>
In-Reply-To: <20260921205147.1857168-1-jsnow@redhat.com>
References: <20260921205147.1857168-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: uixEjsYUQY232eWcsrQNfnV5LjqwzIeTAvAcF5pnOxs_1790023932
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

These are all single-paragraph introductions immediately followed by a
non-plaintext section, so no new insertion point is created by this
conversion.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qga/qapi-schema.json | 40 ++++++++++++++++++----------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 90110af5730..b592b14a011 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -205,9 +205,9 @@
 
 ##
 # @guest-shutdown:
-#
-# Initiate guest-activated shutdown.  Note: this is an asynchronous
-# shutdown request, with no guarantee of successful shutdown.
+#     Initiate guest-activated shutdown.  Note: this is an
+#     asynchronous shutdown request, with no guarantee of successful
+#     shutdown.
 #
 # @mode: "halt", "powerdown" (default), or "reboot"
 #
@@ -266,10 +266,10 @@
 
 ##
 # @guest-file-read:
-#
-# Read from an open file in the guest.  Data will be base64-encoded.
-# As this command is just for limited, ad-hoc debugging, such as log
-# file access, the number of bytes to read is limited to 48 MB.
+#     Read from an open file in the guest.  Data will be
+#     base64-encoded.  As this command is just for limited, ad-hoc
+#     debugging, such as log file access, the number of bytes to read
+#     is limited to 48 MB.
 #
 # @handle: filehandle returned by `guest-file-open`
 #
@@ -357,10 +357,9 @@
 
 ##
 # @guest-file-seek:
-#
-# Seek to a position in the file, as with fseek(), and return the
-# current file position afterward.  Also encapsulates ftell()'s
-# functionality, with offset=0 and whence=1.
+#     Seek to a position in the file, as with fseek(), and return the
+#     current file position afterward.  Also encapsulates ftell()'s
+#     functionality, with offset=0 and whence=1.
 #
 # @handle: filehandle returned by `guest-file-open`
 #
@@ -1254,10 +1253,9 @@
 
 ##
 # @guest-exec-status:
-#
-# Check status of process associated with PID retrieved via
-# `guest-exec`.  Reap the process and associated metadata if it has
-# exited.
+#     Check status of process associated with PID retrieved via
+#     `guest-exec`.  Reap the process and associated metadata if it
+#     has exited.
 #
 # @pid: pid returned from `guest-exec`
 #
@@ -1605,10 +1603,9 @@
 
 ##
 # @guest-ssh-remove-authorized-keys:
-#
-# Remove public keys from the user .ssh/authorized_keys on Unix
-# systems (not implemented for other systems).  It's not an error if
-# the key is already missing.
+#     Remove public keys from the user .ssh/authorized_keys on Unix
+#     systems (not implemented for other systems).  It's not an error
+#     if the key is already missing.
 #
 # @username: the user account to remove the authorized keys
 #
@@ -1838,9 +1835,8 @@
 
 ##
 # @GuestNetworkRoute:
-#
-# Route information.  Supported on Linux (since 9.1) and Windows
-# (since 11.0).
+#     Route information.  Supported on Linux (since 9.1) and Windows
+#     (since 11.0).
 #
 # @iface: The destination network or host's egress network interface
 #     in the routing table
-- 
2.55.0


