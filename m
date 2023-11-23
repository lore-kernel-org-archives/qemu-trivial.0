Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r6Gxz-0002RJ-0U
	for mharc-qemu-trivial@gnu.org; Thu, 23 Nov 2023 16:10:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>) id 1r6Glz-00049Y-Vg
 for qemu-trivial@nongnu.org; Thu, 23 Nov 2023 15:58:08 -0500
Received: from zoidberg.rfc1149.net ([195.154.227.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>) id 1r6Gly-0007i6-8b
 for qemu-trivial@nongnu.org; Thu, 23 Nov 2023 15:58:07 -0500
Received: from buffy.. (buffy [192.168.147.6])
 by zoidberg.rfc1149.net (Postfix) with ESMTP id 37B9680024;
 Thu, 23 Nov 2023 21:57:56 +0100 (CET)
Authentication-Results: zoidberg.rfc1149.net;
 dmarc=fail (p=none dis=none) header.from=rfc1149.net
Authentication-Results: zoidberg.rfc1149.net;
 spf=fail smtp.mailfrom=rfc1149.net
From: Samuel Tardieu <sam@rfc1149.net>
To: qemu-trivial@nongnu.org
Cc: Samuel Tardieu <sam@rfc1149.net>
Subject: [PATCH] target/hexagon/idef-parser/prepare: use env to invoke bash
Date: Thu, 23 Nov 2023 21:57:42 +0100
Message-ID: <20231123205742.630004-1-sam@rfc1149.net>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.154.227.159; envelope-from=sam@rfc1149.net;
 helo=zoidberg.rfc1149.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 23 Nov 2023 16:10:28 -0500
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
X-List-Received-Date: Thu, 23 Nov 2023 20:58:08 -0000

This file is the only one involved in the compilation process which
still uses the /bin/bash path.

Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
---
 target/hexagon/idef-parser/prepare | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/idef-parser/prepare b/target/hexagon/idef-parser/prepare
index 72d6fcbd21..cb3622d4f8 100755
--- a/target/hexagon/idef-parser/prepare
+++ b/target/hexagon/idef-parser/prepare
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 #
 #  Copyright(c) 2019-2021 rev.ng Labs Srl. All Rights Reserved.
-- 
2.42.0


