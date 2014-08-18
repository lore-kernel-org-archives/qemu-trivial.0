Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJLBe-0002k4-NV
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 07:33:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJLBW-0002Up-N2
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:33:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJLBQ-0004xC-Ea
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:33:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48535)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XJLBD-0004uJ-Mi; Mon, 18 Aug 2014 07:32:51 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 03A5E437EC;
	Mon, 18 Aug 2014 15:32:51 +0400 (MSK)
Message-ID: <53F1E463.9080008@msgid.tls.msk.ru>
Date: Mon, 18 Aug 2014 15:32:51 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-devel@nongnu.org
References: <1408348688-10260-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1408348688-10260-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Li Liu <john.liuli@huawei.com>,
	luonengjun@huawei.com, peter.huangpeng@huawei.com, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v7] tcg: dump op count into qemu log
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
X-List-Received-Date: Mon, 18 Aug 2014 11:33:17 -0000

18.08.2014 11:58, zhanghailiang wrote:
> fopen() may fail and it does not check its return vaule here,
> it is better to dump op count to the normal log file.

Applied to -trivial, thank you!

/mjt

