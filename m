Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ayl7z-0006DR-UX
	for mharc-qemu-trivial@gnu.org; Fri, 06 May 2016 15:09:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ayl7r-0005qi-PI
	for qemu-trivial@nongnu.org; Fri, 06 May 2016 15:09:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ayl7g-00033E-9L
	for qemu-trivial@nongnu.org; Fri, 06 May 2016 15:09:18 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41030)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ayl7O-0002rZ-Ez; Fri, 06 May 2016 15:08:54 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CF4C940619;
	Fri,  6 May 2016 22:08:39 +0300 (MSK)
To: Greg Kurz <gkurz@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <146226372069.2827.10871082115775209236.stgit@bahia.huguette.org>
Cc: qemu-trivial@nongnu.org,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <572CEBB6.7060000@msgid.tls.msk.ru>
Date: Fri, 6 May 2016 22:08:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <146226372069.2827.10871082115775209236.stgit@bahia.huguette.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] 9p: drop unused declaration from coth.h
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
X-List-Received-Date: Fri, 06 May 2016 19:09:30 -0000

03.05.2016 11:22, Greg Kurz wrote:
> Commit "ebac1202c95a virtio-9p: use QEMU thread pool" dropped function
> v9fs_init_worker_threads.

Applied to -trivial, thanks!

/mjt

