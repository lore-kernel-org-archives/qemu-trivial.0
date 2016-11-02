Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1voP-0004Bh-VB
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 09:42:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1c1voM-00048P-I3
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 09:42:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1c1voL-0003pq-Vi
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 09:42:38 -0400
Received: from [59.151.112.132] (port=59770 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1c1voJ-0003m8-Gj; Wed, 02 Nov 2016 09:42:36 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="12601529"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Nov 2016 21:42:23 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 024C343972B0;
	Wed,  2 Nov 2016 21:42:22 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 2 Nov 2016 21:42:21 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <thuth@redhat.com>, <peter.maydell@linaro.org>, <eblake@redhat.com>,
	<armbru@redhat.com>, <mst@redhat.com>
Date: Wed, 2 Nov 2016 21:44:45 +0800
Message-ID: <1478094287-15009-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 024C343972B0.A67BB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH v4 0/2] trivial changes on util/mmap-alloc
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
X-List-Received-Date: Wed, 02 Nov 2016 13:42:39 -0000


Cao jin (2):
  util/mmap-alloc: check parameter before using
  util/mmap-alloc: refactor a little bit for readability

 util/mmap-alloc.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

-- 
2.1.0




