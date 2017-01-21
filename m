Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cUyjI-0007xj-PO
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jan 2017 11:41:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cUyjG-0007vg-9N
	for qemu-trivial@nongnu.org; Sat, 21 Jan 2017 11:41:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cUyjF-0000zK-3C
	for qemu-trivial@nongnu.org; Sat, 21 Jan 2017 11:41:26 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:54362)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cUyj9-0000rf-1J; Sat, 21 Jan 2017 11:41:19 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AC4E141B62;
	Sat, 21 Jan 2017 19:41:18 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 621FC520;
	Sat, 21 Jan 2017 19:41:17 +0300 (MSK)
To: Ziyue Yang <skiver.cloud.yzy@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1484726561-16441-1-git-send-email-skiver.cloud.yzy@gmail.com>
Cc: Fam Zheng <famz@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Ziyue Yang <yzylivezh@hotmail.com>, Anthony Liguori <aliguori@us.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <08113f34-c3d2-3405-0961-dbde613c3a14@msgid.tls.msk.ru>
Date: Sat, 21 Jan 2017 19:41:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <1484726561-16441-1-git-send-email-skiver.cloud.yzy@gmail.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v5 1/2] gdbstub.c: fix GDB connection
 segfault caused by empty machines
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
X-List-Received-Date: Sat, 21 Jan 2017 16:41:27 -0000

Applied both to -trivial, thank you!

/mjt

