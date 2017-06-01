Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dGMft-0005aK-AG
	for mharc-qemu-trivial@gnu.org; Thu, 01 Jun 2017 05:45:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dGMfr-0005Za-If
	for qemu-trivial@nongnu.org; Thu, 01 Jun 2017 05:45:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dGMfq-0000Df-Sl
	for qemu-trivial@nongnu.org; Thu, 01 Jun 2017 05:45:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49635)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dGMfm-0000Au-Ha; Thu, 01 Jun 2017 05:45:42 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C5F8540122;
	Thu,  1 Jun 2017 12:45:41 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id AE19F5DA;
	Thu,  1 Jun 2017 12:45:41 +0300 (MSK)
To: Mao Zhongyi <maozy.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <20170526014614.19840-1-maozy.fnst@cn.fujitsu.com>
Cc: pbonzini@redhat.com, armbru@redhat.com,
	QEMU Trivial <qemu-trivial@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <99c7bb56-5899-7c03-1d3d-4213b3c8ec1e@msgid.tls.msk.ru>
Date: Thu, 1 Jun 2017 12:45:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170526014614.19840-1-maozy.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] scsi/lsi53c895a: Remove unused
 lsi_mem_*() return value
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
X-List-Received-Date: Thu, 01 Jun 2017 09:45:48 -0000

26.05.2017 04:46, Mao Zhongyi wrote:
> lsi_mem_read/write() always return 0 about which their
> callers actually don't care. Change the function type
> to void.

Applied to -trivial, thanks!

/mjt

