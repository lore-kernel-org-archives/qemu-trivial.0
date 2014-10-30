Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xjjip-0003Lc-Gb
	for mharc-qemu-trivial@gnu.org; Thu, 30 Oct 2014 03:00:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xjjih-0003D2-V3
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 03:00:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XjjiV-0001X4-Fp
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 03:00:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xjji8-000111-MM; Thu, 30 Oct 2014 02:59:56 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id ABD3646E67;
	Thu, 30 Oct 2014 09:59:45 +0300 (MSK)
Message-ID: <5451E1E1.3020306@msgid.tls.msk.ru>
Date: Thu, 30 Oct 2014 09:59:45 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.8.1
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-trivial@nongnu.org
References: <1414634608-31292-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1414634608-31292-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH] target-tricore: check return value
 before using it
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
X-List-Received-Date: Thu, 30 Oct 2014 07:00:38 -0000

30.10.2014 05:03, zhanghailiang wrote:
> We reference the return value of cpu before checking whether it is NULL,
> The checking code is after that which violates code style.

Applied, thanks!

/mjt

