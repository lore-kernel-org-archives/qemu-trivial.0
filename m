Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rd7FM-0001cy-77
	for mharc-qemu-trivial@gnu.org; Thu, 22 Feb 2024 06:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1rd7FJ-0001PK-QZ; Thu, 22 Feb 2024 06:28:09 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1rd7FH-0005Ap-3E; Thu, 22 Feb 2024 06:28:09 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id F0BD34FB5B;
 Thu, 22 Feb 2024 14:26:26 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 7792387187;
 Thu, 22 Feb 2024 14:26:03 +0300 (MSK)
Received: (nullmailer pid 2526217 invoked by uid 1000);
 Thu, 22 Feb 2024 11:26:01 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PULL 25/34] qapi/ui: correct typos
Date: Thu, 22 Feb 2024 14:25:52 +0300
Message-Id: <20240222112601.2526057-26-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240222112601.2526057-1-mjt@tls.msk.ru>
References: <20240222112601.2526057-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
X-List-Received-Date: Thu, 22 Feb 2024 11:28:11 -0000

From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Correct typos automatically found with the `typos` tool
<https://crates.io/crates/typos>

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qapi/ui.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index b6d7e142b7..1448eaca73 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -63,7 +63,7 @@
 ##
 # @SetPasswordOptionsVnc:
 #
-# Options for set_password specific to the VNC procotol.
+# Options for set_password specific to the VNC protocol.
 #
 # @display: The id of the display where the password should be
 #     changed.  Defaults to the first.
@@ -125,7 +125,7 @@
 ##
 # @ExpirePasswordOptionsVnc:
 #
-# Options for expire_password specific to the VNC procotol.
+# Options for expire_password specific to the VNC protocol.
 #
 # @display: The id of the display where the expiration should be
 #     changed.  Defaults to the first.
-- 
2.39.2


