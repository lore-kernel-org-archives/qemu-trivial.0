Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1koqEc-0007us-29
	for mharc-qemu-trivial@gnu.org; Mon, 14 Dec 2020 10:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEW-0007sO-Nl; Mon, 14 Dec 2020 10:57:58 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:34313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEO-0001Pt-OF; Mon, 14 Dec 2020 10:57:54 -0500
Received: from localhost.localdomain ([82.252.135.218]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N33AR-1k7d620xjR-013Jx4; Mon, 14 Dec 2020 16:57:43 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 07/19] CODING_STYLE.rst: Be less strict about 80 character limit
Date: Mon, 14 Dec 2020 16:57:21 +0100
Message-Id: <20201214155733.207430-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
References: <20201214155733.207430-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dFbZeB9hYyMCoMAMNbQY5FhHlLjXOsmrd8vyeBmdGFee5Pa67VM
 DwhEamI1McOxEpbeLGGgL9YOJMZelWHTjSsEqqKCN+1QC/UwRBWndGw2QXVFMpYNP14Tevw
 ookrfu53ptHrKR/WArn436xheFPoUZfRFEziKX+V/LmKTuzZoayUeOMte9H7zAYOw2OH1GS
 w7rlV1tmlPNMwusAuKSZQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tjGLg8d8DO4=:whDlGGOSaQOPOOswEiCXqN
 NhvPS0JImLMEfIVNWqP8DFPGC0Uny4LRqgsUbVrsZQWE7pu+kZzphJEYxYsSYHYxx2tDz8SEI
 lUzUm4UhoDsGFfW5+ysXnKC1EtWU2C3nXhmzhAN8usNkpS7x4iomu50hEPLK8Z/DYcLukvm6f
 5HK8TYJ9ETSa/JYz/wWhYJt/yPUFkdsdSYoY3Y6DsRUb3EKMzjAtO4t6CdFELdIH+BYfRfWnz
 lrO8wlcBQmzQyfyb1CjxnsRSnubRGxuwoAfi4b2YymNJNTqi0q5km8mWHsom838/P9+MwIJR1
 IM7g0UaAZ4/zKmXeGqolXhaqyeyXhqGP8/DmjWefXFoD1D+LDjxFXIkTLdbQoyJ4PKOnxashi
 YvMk1czRMk9Z6C1UMCnF9wuhIEONS6G9c6YKmQdJcOir6X9A+yvQHKx7IAKMGe4WxUpG2/UMs
 NO3f5Z1Odw==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 14 Dec 2020 15:58:00 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Relax the wording about line lengths a little bit; this goes with the
checkpatch changes to warn at 100 characters rather than 80.

(Compare the Linux kernel commit bdc48fa11e46f8; our coding style is
not theirs, but the rationale is good and applies to us too.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20201106112940.31300-1-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 CODING_STYLE.rst | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/CODING_STYLE.rst b/CODING_STYLE.rst
index 8b13ef0669eb..7bf4e39d4871 100644
--- a/CODING_STYLE.rst
+++ b/CODING_STYLE.rst
@@ -85,8 +85,13 @@ Line width
 Lines should be 80 characters; try not to make them longer.
 
 Sometimes it is hard to do, especially when dealing with QEMU subsystems
-that use long function or symbol names.  Even in that case, do not make
-lines much longer than 80 characters.
+that use long function or symbol names. If wrapping the line at 80 columns
+is obviously less readable and more awkward, prefer not to wrap it; better
+to have an 85 character line than one which is awkwardly wrapped.
+
+Even in that case, try not to make lines much longer than 80 characters.
+(The checkpatch script will warn at 100 characters, but this is intended
+as a guard against obviously-overlength lines, not a target.)
 
 Rationale:
 
-- 
2.29.2


