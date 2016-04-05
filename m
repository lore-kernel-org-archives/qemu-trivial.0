Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1anQti-0007Uf-B2
	for mharc-qemu-trivial@gnu.org; Tue, 05 Apr 2016 09:19:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1anKYJ-0007KP-Vt
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 02:33:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1anKYJ-0003uD-69
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 02:33:27 -0400
Received: from [59.151.112.132] (port=61304 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1anKYE-0003jn-4f; Tue, 05 Apr 2016 02:33:22 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5271458"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Apr 2016 14:32:49 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A6271408D261;
	Tue,  5 Apr 2016 14:32:44 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 5 Apr 2016 14:32:44 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
To: qemu devel <qemu-devel@nongnu.org>, qemu trivial
	<qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Alex Bennee
	<alex.bennee@linaro.org>, Eric Blake <eblake@redhat.com>, Markus Armbruster
	<armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
	<mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Date: Tue, 5 Apr 2016 14:35:27 +0800
Message-ID: <1459838127-32288-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: A6271408D261.AFD48
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
X-Mailman-Approved-At: Tue, 05 Apr 2016 09:19:56 -0400
Cc: Changlong Xie <xiecl.fnst@cn.fujitsu.com>,
	Wen Congyang <wency@cn.fujitsu.com>
Subject: [Qemu-trivial] [PATCH] tests: ignore test-logging
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
X-List-Received-Date: Tue, 05 Apr 2016 06:33:28 -0000

Commit 3514552e added a new test, but did not mark it for
exclusion in .gitignore.

Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
---
 tests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index b7bf13e..898a35f 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -70,5 +70,6 @@ test-xbzrle
 test-netfilter
 test-filter-mirror
 test-filter-redirector
+test-logging
 *-test
 qapi-schema/*.test.*
-- 
1.9.3




