Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQnJ0-0001gL-7S
	for mharc-qemu-trivial@gnu.org; Tue, 02 Feb 2016 21:36:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aQnIw-0001YT-7z
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 21:36:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aQnIv-00049r-Ct
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 21:36:26 -0500
Received: from [59.151.112.132] (port=16963 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aQnIq-00047e-8n; Tue, 02 Feb 2016 21:36:20 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3256825"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Feb 2016 10:36:18 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id B81F54042EDB;
	Wed,  3 Feb 2016 10:35:25 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 3 Feb 2016 10:36:16 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 3 Feb 2016 10:36:33 +0800
Message-ID: <1454466995-14906-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: B81F54042EDB.AB97C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH v2 0/2] CCID QOMify
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
X-List-Received-Date: Wed, 03 Feb 2016 02:36:27 -0000

v2 changelog
1. move macro definition to its home .c file

Cao jin (2):
  Emulated CCID card: QOMify
  Passthru CCID card: QOMify

 hw/usb/ccid-card-emulated.c | 23 +++++++++++++----------
 hw/usb/ccid-card-passthru.c | 14 ++++++++------
 2 files changed, 21 insertions(+), 16 deletions(-)

-- 
2.1.0




