Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1orGcA-0004WK-D2
	for mharc-qemu-trivial@gnu.org; Sat, 05 Nov 2022 06:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stweil@bss11.bib.uni-mannheim.de>)
 id 1orGc7-0004Ut-7l; Sat, 05 Nov 2022 06:41:24 -0400
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stweil@bss11.bib.uni-mannheim.de>)
 id 1orGbq-00036h-3n; Sat, 05 Nov 2022 06:41:22 -0400
Received: from localhost (localhost [127.0.0.1])
 by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id CFBF8100C18;
 Sat,  5 Nov 2022 11:25:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
 by localhost (mail-r83.rz.uni-mannheim.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id MiwTwciaZCnz; Sat,  5 Nov 2022 11:25:04 +0100 (CET)
Received: from bss11.bib.uni-mannheim.de (unknown
 [IPv6:2001:7c0:2900:8024::869b:24a1])
 by smtp.mail.uni-mannheim.de (Postfix) with ESMTPS id B3E34100C07;
 Sat,  5 Nov 2022 11:25:04 +0100 (CET)
Received: from stweil by bss11.bib.uni-mannheim.de with local (Exim 4.94.2)
 (envelope-from <stweil@bss11.bib.uni-mannheim.de>)
 id 1orGMK-001pbt-Eh; Sat, 05 Nov 2022 11:25:04 +0100
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 for-7.2 0/4] libvhost-user: Add format attribute and fix
 format strings
Date: Sat,  5 Nov 2022 11:24:44 +0100
Message-Id: <20221105102448.436469-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.155.96.80;
 envelope-from=stweil@bss11.bib.uni-mannheim.de; helo=smtp.mail.uni-mannheim.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 05 Nov 2022 10:41:24 -0000

v2: Add patch 3 to fix two more format strings before applying patch 4

[PATCH v2 1/4] libvhost-user: Fix wrong type of argument to
[PATCH v2 2/4] libvhost-user: Fix format strings
[PATCH v2 3/4] libvhost-user: Fix two more format strings
[PATCH v2 4/4] libvhost-user: Add format attribute to local function


