Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aZGa7-0007PC-7l
	for mharc-qemu-trivial@gnu.org; Fri, 26 Feb 2016 06:29:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aZGa3-0007HC-E2
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 06:29:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aZGa2-0006Cs-Fu
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 06:29:07 -0500
Received: from [59.151.112.132] (port=15227 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aZGZz-00067f-SP; Fri, 26 Feb 2016 06:29:04 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3959510"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Feb 2016 19:28:50 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 2433442B4AE5;
	Fri, 26 Feb 2016 19:28:47 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 26 Feb 2016 19:28:46 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 26 Feb 2016 19:29:38 +0800
Message-ID: <1456486178-8074-3-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1456486178-8074-1-git-send-email-caoj.fnst@cn.fujitsu.com>
References: <1456486178-8074-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 2433442B4AE5.A9BA3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH v3 2/2] doc/memory: remove the stray extra '-'
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Feb 2016 11:29:08 -0000

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 docs/memory.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/memory.txt b/docs/memory.txt
index 306280e..d5c216c 100644
--- a/docs/memory.txt
+++ b/docs/memory.txt
@@ -185,8 +185,8 @@ an MMIO region mapped at 0x0, size 0x6000, priority 2. B currently has two
 of its own subregions: D of size 0x1000 at offset 0 and E of size 0x1000 at
 offset 0x2000. As a diagram:
 
-        0      1000   2000   3000   4000   5000   6000   7000    8000
-        |------|------|------|------|------|------|------|-------|
+        0      1000   2000   3000   4000   5000   6000   7000   8000
+        |------|------|------|------|------|------|------|------|
   A:    [                                                       ]
   C:    [CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC]
   B:                  [                          ]
-- 
2.1.0




