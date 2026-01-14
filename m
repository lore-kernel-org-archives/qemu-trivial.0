Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2922D37E59
	for <qemu-trivial@archiver.kernel.org>; Wed, 14 Jan 2026 15:54:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vg3CC-0004Po-Si; Wed, 14 Jan 2026 10:54:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vg3CB-0004Oz-1B
 for qemu-trivial@nongnu.org; Wed, 14 Jan 2026 10:54:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vg3C9-0003KU-MC
 for qemu-trivial@nongnu.org; Wed, 14 Jan 2026 10:54:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768406044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=BrAY2T5uccnvXwlQLT1MN3DHNBaxIGxvo1kp/hGKA3g=;
 b=XESLMYVtod3oqaMiNWhEUa9nanvfflTOI2iU/JGPIpbJUvtSsE6niNUEzR9G6uaKyh8E4k
 4StfELIMwvmi8xuNUdOgxaE9stsZC9IigiaHIRmQZUxDEEI7GvVo1pmf+EBqYoqHOz9xc6
 UeRjkgbyjQXCS4xwlAgRH7POsMl5/Ss=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-15-nE6aWH3_MtSAeQSlOThK_A-1; Wed,
 14 Jan 2026 10:54:01 -0500
X-MC-Unique: nE6aWH3_MtSAeQSlOThK_A-1
X-Mimecast-MFC-AGG-ID: nE6aWH3_MtSAeQSlOThK_A_1768406040
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B1AD919560B7; Wed, 14 Jan 2026 15:53:59 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.254])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 38C8030002D8; Wed, 14 Jan 2026 15:53:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-trivial@nongnu.org, gustavo.romero@linaro.org
Subject: [PATCH] configure: Remove duplicated entry of --gdb in the help text
Date: Wed, 14 Jan 2026 16:53:55 +0100
Message-ID: <20260114155355.82096-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

From: Thomas Huth <thuth@redhat.com>

Since --gdb has recently been added to meson_options.txt, the help
text shows up twice in the output of "./configure --help":

 $ ./configure --help | grep gdb
   --gdb=GDB-path           gdb to use for gdbstub tests [/usr/bin/gdb]
   --gdb=VALUE              Path to GDB

Remove the entry from "configure" to fix this duplication.

Fixes: b46b3818cf8 ("tests/functional: Provide GDB to the functional tests")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index ef5157cf903..093dd7b01eb 100755
--- a/configure
+++ b/configure
@@ -899,7 +899,6 @@ Advanced options (experts only):
   --cpu=CPU                Build for host CPU [$cpu]
   --disable-containers     don't use containers for cross-building
   --container-engine=TYPE  which container engine to use [$container_engine]
-  --gdb=GDB-path           gdb to use for gdbstub tests [$gdb_bin]
 EOF
   meson_options_help
 cat << EOF
-- 
2.52.0


