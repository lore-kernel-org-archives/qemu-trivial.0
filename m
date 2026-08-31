Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91982C61DD3
	for <qemu-trivial@archiver.kernel.org>; Mon, 31 Aug 2026 20:25:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1x18Yp-00020L-PZ; Mon, 31 Aug 2026 16:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x18Yo-0001rx-7t
 for qemu-trivial@nongnu.org; Mon, 31 Aug 2026 16:24:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x18Ym-0008UA-9I
 for qemu-trivial@nongnu.org; Mon, 31 Aug 2026 16:24:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788207891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y8pqXrIvr/yRTQ3rsO16r+lqlJjBRU1uvUFq6p7chi8=;
 b=T9ztIeHseJRrY7oY0K0cLr5frcfNh/j6UhN/N3mFythUy7V73W5v/SGcib8B/fIRtodmCo
 9z6aDpklnRDOsJn0PWui7D2aeZmBijVzcuvpqac8vv2dQrTERC82oKvRB4BdjmUaMBTqi+
 gdO5AFXQYjhInEv/mx/4dZnKvOsZnTQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-685-VgiO1ekmMsm3UUxhDdvEcg-1; Mon,
 31 Aug 2026 16:24:47 -0400
X-MC-Unique: VgiO1ekmMsm3UUxhDdvEcg-1
X-Mimecast-MFC-AGG-ID: VgiO1ekmMsm3UUxhDdvEcg_1788207884
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4E1A61843AD9; Mon, 31 Aug 2026 20:24:44 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.63])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2D9041800577; Mon, 31 Aug 2026 20:24:36 +0000 (UTC)
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
Subject: [PATCH v4 32/43] qapi: convert trivial intro sections for misc.json
Date: Mon, 31 Aug 2026 16:19:34 -0400
Message-ID: <20260831201945.287730-33-jsnow@redhat.com>
In-Reply-To: <20260831201945.287730-1-jsnow@redhat.com>
References: <20260831201945.287730-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: Ccb-u7iPAOd8WRAfPUtX_GhaPJdHJfNfeQHaHq7aZ0w_1788207884
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qapi/misc.json | 74 ++++++++++++++++++--------------------------------
 1 file changed, 27 insertions(+), 47 deletions(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index 22b7afed9f6..b3c2a1421f3 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -44,8 +44,7 @@
 
 ##
 # @NameInfo:
-#
-# Guest name information.
+#     Guest name information.
 #
 # @name: The name of the guest
 #
@@ -55,8 +54,7 @@
 
 ##
 # @query-name:
-#
-# Return the name information of a guest.
+#     Return the name information of a guest.
 #
 # Since: 0.14
 #
@@ -69,8 +67,7 @@
 
 ##
 # @IOThreadInfo:
-#
-# Information about an iothread
+#     Information about an iothread
 #
 # @id: the identifier of the iothread
 #
@@ -137,8 +134,7 @@
 
 ##
 # @stop:
-#
-# Stop guest VM execution.
+#     Stop guest VM execution.
 #
 # Since: 0.14
 #
@@ -159,8 +155,7 @@
 
 ##
 # @cont:
-#
-# Resume guest VM execution.
+#     Resume guest VM execution.
 #
 # Since: 0.14
 #
@@ -208,8 +203,7 @@
 
 ##
 # @human-monitor-command:
-#
-# Execute a command on the human monitor and return the output.
+#     Execute a command on the human monitor and return the output.
 #
 # @command-line: the command to execute in the human monitor
 #
@@ -251,8 +245,7 @@
 
 ##
 # @getfd:
-#
-# Receive a file descriptor via SCM rights and assign it a name
+#     Receive a file descriptor via SCM rights and assign it a name
 #
 # @fdname: file descriptor name
 #
@@ -273,11 +266,10 @@
 
 ##
 # @get-win32-socket:
-#
-# Add a socket that was duplicated to QEMU process with
-# WSADuplicateSocketW() via WSASocket() & WSAPROTOCOL_INFOW structure
-# and assign it a name (the SOCKET is associated with a CRT file
-# descriptor)
+#     Add a socket that was duplicated to QEMU process with
+#     WSADuplicateSocketW() via WSASocket() & WSAPROTOCOL_INFOW
+#     structure and assign it a name (the SOCKET is associated with a
+#     CRT file descriptor)
 #
 # @info: the WSAPROTOCOL_INFOW structure (encoded in base64)
 #
@@ -301,8 +293,7 @@
 
 ##
 # @closefd:
-#
-# Close a file descriptor previously passed via SCM rights
+#     Close a file descriptor previously passed via SCM rights
 #
 # @fdname: file descriptor name
 #
@@ -317,8 +308,7 @@
 
 ##
 # @AddfdInfo:
-#
-# Information about a file descriptor that was added to an fd set.
+#     Information about a file descriptor that was added to an fd set.
 #
 # @fdset-id: The ID of the fd set that @fd was added to.
 #
@@ -331,8 +321,8 @@
 
 ##
 # @add-fd:
-#
-# Add a file descriptor, that was passed via SCM rights, to an fd set.
+#     Add a file descriptor, that was passed via SCM rights, to an fd
+#     set.
 #
 # @fdset-id: The ID of the fd set to add the file descriptor to.
 #
@@ -361,8 +351,7 @@
 
 ##
 # @remove-fd:
-#
-# Remove a file descriptor from an fd set.
+#     Remove a file descriptor from an fd set.
 #
 # @fdset-id: The ID of the fd set that the file descriptor belongs to.
 #
@@ -387,8 +376,7 @@
 
 ##
 # @FdsetFdInfo:
-#
-# Information about a file descriptor that belongs to an fd set.
+#     Information about a file descriptor that belongs to an fd set.
 #
 # @fd: The file descriptor value.
 #
@@ -401,8 +389,7 @@
 
 ##
 # @FdsetInfo:
-#
-# Information about an fd set.
+#     Information about an fd set.
 #
 # @fdset-id: The ID of the fd set.
 #
@@ -415,8 +402,7 @@
 
 ##
 # @query-fdsets:
-#
-# Return information describing all fd sets.
+#     Return information describing all fd sets.
 #
 # Since: 1.2
 #
@@ -457,8 +443,7 @@
 
 ##
 # @CommandLineParameterType:
-#
-# Possible types for an option parameter.
+#     Possible types for an option parameter.
 #
 # @string: accepts a character string
 #
@@ -476,8 +461,7 @@
 
 ##
 # @CommandLineParameterInfo:
-#
-# Details about a single parameter of a command line option.
+#     Details about a single parameter of a command line option.
 #
 # @name: parameter name
 #
@@ -497,9 +481,8 @@
 
 ##
 # @CommandLineOptionInfo:
-#
-# Details about a command line option, including its list of parameter
-# details
+#     Details about a command line option, including its list of
+#     parameter details
 #
 # @option: option name
 #
@@ -512,8 +495,7 @@
 
 ##
 # @query-command-line-options:
-#
-# Query command line option schema.
+#     Query command line option schema.
 #
 # @option: option name
 #
@@ -552,8 +534,7 @@
 
 ##
 # @RTC_CHANGE:
-#
-# Emitted when the guest changes the RTC time.
+#     Emitted when the guest changes the RTC time.
 #
 # @offset: offset in seconds between base RTC clock (as specified by
 #     -rtc base), and new RTC clock value
@@ -577,9 +558,8 @@
 
 ##
 # @VFU_CLIENT_HANGUP:
-#
-# Emitted when the client of a TYPE_VFIO_USER_SERVER closes the
-# communication channel
+#     Emitted when the client of a TYPE_VFIO_USER_SERVER closes the
+#     communication channel
 #
 # @vfu-id: ID of the TYPE_VFIO_USER_SERVER object.  It is the last
 #     component of @vfu-qom-path referenced below
-- 
2.55.0


