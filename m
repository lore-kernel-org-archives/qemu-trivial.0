Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dsOv6-0005ts-AB
	for mharc-qemu-trivial@gnu.org; Thu, 14 Sep 2017 03:50:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dsOv4-0005sZ-Rp
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 03:50:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dsOv1-00067X-Hl
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 03:50:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56947)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dsOuu-00061h-Nj; Thu, 14 Sep 2017 03:50:32 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DB8A1412D3;
	Thu, 14 Sep 2017 10:50:31 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id B37EE5B9;
	Thu, 14 Sep 2017 10:50:29 +0300 (MSK)
To: Eduardo Otubo <otubo@redhat.com>, qemu-trivial@nongnu.org
Cc: lizhijian@cn.fujitsu.com, qemu-devel@nongnu.org,
	zhangchen.fnst@cn.fujitsu.com
References: <20170821155005.16885-1-otubo@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <09770957-c357-2d8e-147b-a9f1f8caa797@msgid.tls.msk.ru>
Date: Thu, 14 Sep 2017 10:50:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170821155005.16885-1-otubo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] filter-mirror: segfault when specifying
 non existent device
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
X-List-Received-Date: Thu, 14 Sep 2017 07:50:43 -0000

21.08.2017 18:50, Eduardo Otubo wrote:
> When using filter-mirror like the example below where the interface
> 'ndev0' does not exist on the host, QEMU crashes into segmentation
> fault.

Applied to -trivial, thanks!

/mjt

