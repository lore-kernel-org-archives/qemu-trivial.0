Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gS1rH-0000da-E4
	for mharc-qemu-trivial@gnu.org; Wed, 28 Nov 2018 10:34:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gS1rE-0000cD-5u
	for qemu-trivial@nongnu.org; Wed, 28 Nov 2018 10:34:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gS1rD-0007Ds-FL
	for qemu-trivial@nongnu.org; Wed, 28 Nov 2018 10:34:32 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:55089)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1gS1r9-00078u-0Q; Wed, 28 Nov 2018 10:34:27 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 2A871C21;
	Wed, 28 Nov 2018 10:34:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute4.internal (MEProxy); Wed, 28 Nov 2018 10:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	from:to:cc:subject:date:message-id; s=mesmtp; bh=2m8saKmAywe20VE
	KxumiDFO5Ol3N0opjxEJfQ8OoUm4=; b=0G+wdSIizhSo4RxF2yiGW212ZMZxoLC
	JgnmRu7lUZJQxbNp7D3fMCkHDtP6l0kb2aNq5oTiJj0XJ3/UyX+FqKQnAXEGRrej
	rAwny5cKllonFO5WwX5QlQvCawkZ9ZrufL1KLuZLtXVz0J3zOujp5le+eGEqsMWe
	vjD1i+l1fjGE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=2m8saKmAywe20VEKxumiDFO5Ol3N0opjxEJfQ8OoUm4=; b=J4tvKVVt
	mI5M9cBlS+q5zm31qEp4wxPzPhc72ht+mA9A9+UhbNiw5rGFY/C2TK4yxmUKO++z
	49sjsS/Obqdejv329qa1v26mI9ChcI8F2zo+hvAoY5O+G/Rym8w7569M8jcHEq9E
	trZ24V51FiJGwCjYZW5aAPamIO1w2eHpMzmiUh69vxOPxyNRXCxYRZzfhrWh/sHy
	R23iT5D9bR8P0/7xqdkKd2p+gfNDlSrjm1sni5MbOIXQeu3DGwDszzsQCMAfbv0G
	bYTQvUpDlusGkFnOvqMrT8J5QlDaay1dPO+16y5Rl10cLzoCWczAk4HQIr1HsuBy
	1KZjXVPcWLlQiA==
X-ME-Sender: <xms:gLX-W7xXJ0bfSPyNv0qvtnPvBEZuxVm-LzVT0dbRCHcTRGU_Qg83vg>
X-ME-Proxy: <xmx:gLX-W99--6vO9nuosuE2q3QaWIfV1QaVEXwvii1zEq3lhkWPRpzeZg>
	<xmx:gLX-W21TBKCgaBinJSXtF9Hk3EF5NAGXw054mAp_vNnmuNHab2QL0Q>
	<xmx:gLX-W99KGfA4KudfECmL4qxekCGgjo_sRGeOEPcYdIJDdqN0GL6zwA>
	<xmx:gLX-W3eD6Y5u6Caa_nSXRbVBP_SM3v9VnDxC4o8GarZouK1nlsSmgA>
	<xmx:gLX-W5EyQeUd8i3ZIsIrh_asMOkaoYbj3QWZaKh1zXzG9ochIQ3QjA>
	<xmx:gLX-W58gavVJKfMLhrlxaw8wCvzFCgdEshq0vbBMWHEcccVgsNXyEA>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 327D8E49DF;
	Wed, 28 Nov 2018 10:34:24 -0500 (EST)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
Date: Wed, 28 Nov 2018 10:34:23 -0500
Message-Id: <20181128153423.11916-1-cota@braap.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 64.147.123.25
Subject: [Qemu-trivial] [PATCH trivial] docs/devel/build-system: fix
 'softmu' typo
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2018 15:34:33 -0000

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 docs/devel/build-system.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/build-system.txt b/docs/devel/build-system.txt
index 52501f2ad9..f9fd27fab0 100644
--- a/docs/devel/build-system.txt
+++ b/docs/devel/build-system.txt
@@ -393,7 +393,7 @@ all use $(obj) as a prefix to the target, e.g.
 This file provides the entry point used to build each individual system
 or userspace emulator target. Each enabled target has its own
 subdirectory. For example if configure is run with the argument
-'--target-list=x86_64-softmmu', then a sub-directory 'x86_64-softmu'
+'--target-list=x86_64-softmmu', then a sub-directory 'x86_64-softmmu'
 will be created, containing a 'Makefile' which symlinks back to
 Makefile.target
 
-- 
2.17.1


