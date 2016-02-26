Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aZGa7-0007Pq-NV
	for mharc-qemu-trivial@gnu.org; Fri, 26 Feb 2016 06:29:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aZGa3-0007Gz-8R
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 06:29:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aZGa2-0006Cm-95
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 06:29:07 -0500
Received: from [59.151.112.132] (port=15227 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aZGZx-00067f-VH; Fri, 26 Feb 2016 06:29:02 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3959511"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Feb 2016 19:28:50 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id F233A42B4AE2;
	Fri, 26 Feb 2016 19:28:45 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 26 Feb 2016 19:28:45 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 26 Feb 2016 19:29:36 +0800
Message-ID: <1456486178-8074-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: F233A42B4AE2.A9AE4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH v3 0/2] doc/memory: cleanup
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

see each commit message

Cao jin (2):
  doc/memory: fix typo
  doc/memory: remove the stray extra '-'

 docs/memory.txt | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.1.0




