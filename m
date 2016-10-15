Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bvORw-0007Wk-7Y
	for mharc-qemu-trivial@gnu.org; Sat, 15 Oct 2016 08:52:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bvORu-0007V6-2v
	for qemu-trivial@nongnu.org; Sat, 15 Oct 2016 08:52:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bvORt-0001Vs-CD
	for qemu-trivial@nongnu.org; Sat, 15 Oct 2016 08:52:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39540)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bvORq-0001T4-FX; Sat, 15 Oct 2016 08:52:22 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3BA1C41D00;
	Sat, 15 Oct 2016 15:52:19 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 52D5EB2A;
	Sat, 15 Oct 2016 15:52:18 +0300 (MSK)
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-trivial@nongnu.org
References: <1476341848-1940-1-git-send-email-zhang.zhanghailiang@huawei.com>
Cc: jasowang@redhat.com, qemu-devel@nongnu.org, zhangchen.fnst@cn.fujitsu.com
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <4fc1bc2e-26c5-df9a-2189-66c96f1060a8@msgid.tls.msk.ru>
Date: Sat, 15 Oct 2016 15:52:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1476341848-1940-1-git-send-email-zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] colo-compare: remove unused struct
 CompareChardevProps and 'props' variable
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
X-List-Received-Date: Sat, 15 Oct 2016 12:52:27 -0000

13.10.2016 09:57, zhanghailiang wrote:
> After commit 0a73336d, 'props' variable in find_and_check_chardev()
> is unused. Remove it, togther with struct CompareChardevProps.

Applied to -trivial, thanks!

/mjt

