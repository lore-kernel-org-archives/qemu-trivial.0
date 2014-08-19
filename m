Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJdv4-0004Dj-Jb
	for mharc-qemu-trivial@gnu.org; Tue, 19 Aug 2014 03:33:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJdux-00041i-9n
	for qemu-trivial@nongnu.org; Tue, 19 Aug 2014 03:33:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJdur-0000QQ-5i
	for qemu-trivial@nongnu.org; Tue, 19 Aug 2014 03:33:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35606)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XJdua-0000OX-HA; Tue, 19 Aug 2014 03:32:56 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A86B543B25;
	Tue, 19 Aug 2014 11:32:55 +0400 (MSK)
Message-ID: <53F2FDA7.6040902@msgid.tls.msk.ru>
Date: Tue, 19 Aug 2014 11:32:55 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1408348310-6628-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<53F1E445.1060301@msgid.tls.msk.ru> <53F2FD31.1010102@huawei.com>
In-Reply-To: <53F2FD31.1010102@huawei.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, jan.kiszka@siemens.com, luonengjun@huawei.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH v7] slirp/misc: Use g_malloc() instead of
 malloc()
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
X-List-Received-Date: Tue, 19 Aug 2014 07:33:25 -0000

19.08.2014 11:30, zhanghailiang wrote:
[]
> Hmm, it is a good idea to use g_new instead of g_malloc,
> we have to perform type cast for g_malloc.(BTW, i found in qemu there
> are several places use g_malloc but not perform appropriate type
> coercions)

There's no need to perform explicit type conversion from void* to type*.

Thanks,

/mjt

