Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jlYNX-00061r-1T
	for mharc-qemu-trivial@gnu.org; Wed, 17 Jun 2020 09:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jlYNV-0005zL-5b; Wed, 17 Jun 2020 09:45:21 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:64284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jlYNR-0006w1-RK; Wed, 17 Jun 2020 09:45:20 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B355D748DCA;
 Wed, 17 Jun 2020 15:45:05 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 979607482CD; Wed, 17 Jun 2020 15:45:05 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Wed, 17 Jun 2020 15:06:05 +0200
Subject: [PATCH 1/2] .gitignore: Ignore generated srorage-daemon files for
 in-tree builds
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Message-Id: <20200617134505.979607482CD@zero.eik.bme.hu>
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 17 Jun 2020 13:45:21 -0000

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 .gitignore | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.gitignore b/.gitignore
index 0c5af83aa7..d9ef9f635a 100644
--- a/.gitignore
+++ b/.gitignore
@@ -46,6 +46,9 @@
 !/qapi/qapi-visit-core.c
 /qapi/qapi-visit.[ch]
 /qapi/qapi-doc.texi
+/storage-daemon/qapi/qapi-doc.texi
+/storage-daemon/qapi/qapi-*.[ch]
+/qemu-storage-daemon
 /qemu-edid
 /qemu-img
 /qemu-nbd
-- 
2.21.3


