Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bfHUq-0004RM-FQ
	for mharc-qemu-trivial@gnu.org; Wed, 31 Aug 2016 22:12:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bfHUp-0004Q9-0p
	for qemu-trivial@nongnu.org; Wed, 31 Aug 2016 22:12:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bfHUn-0006S5-1s
	for qemu-trivial@nongnu.org; Wed, 31 Aug 2016 22:12:49 -0400
Received: from [59.151.112.132] (port=7518 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1bfHUf-0006Q8-I0; Wed, 31 Aug 2016 22:12:43 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10488340"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Sep 2016 10:12:19 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0295F40056FF;
	Thu,  1 Sep 2016 10:12:16 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 1 Sep 2016 10:12:15 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <pbonzini@redhat.com>, <qemu-trivial@nongnu.org>
Date: Thu, 1 Sep 2016 10:21:19 +0800
Message-ID: <1472696479-3619-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 0295F40056FF.AA770
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] doc/rcu: fix typo
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
X-List-Received-Date: Thu, 01 Sep 2016 02:12:52 -0000

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 docs/rcu.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/rcu.txt b/docs/rcu.txt
index 2f70954..a70b72c 100644
--- a/docs/rcu.txt
+++ b/docs/rcu.txt
@@ -37,7 +37,7 @@ do not matter; as soon as all previous critical sections have finished,
 there cannot be any readers who hold references to the data structure,
 and these can now be safely reclaimed (e.g., freed or unref'ed).
 
-Here is a picutre:
+Here is a picture:
 
         thread 1                  thread 2                  thread 3
     -------------------    ------------------------    -------------------
-- 
2.1.0




