Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4Boe-0004H3-Pn
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 16:16:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4Boc-0004FE-4R
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:16:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4Bob-0008SM-CQ
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:16:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55831)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1e4BoV-0008P3-Sh; Mon, 16 Oct 2017 16:16:40 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 56A3140D0A;
	Mon, 16 Oct 2017 23:16:34 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 615D7AF8;
	Mon, 16 Oct 2017 23:16:34 +0300 (MSK)
To: Eduardo Otubo <otubo@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, lizhijian@cn.fujitsu.com,
	Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
References: <20170929120339.14197-1-otubo@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <a58fe8e6-65ef-a8e0-19ff-6234c65f32a7@msgid.tls.msk.ru>
Date: Mon, 16 Oct 2017 23:16:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170929120339.14197-1-otubo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCHv2] filter-mirror: segfault when
 specifying non existent device
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
X-List-Received-Date: Mon, 16 Oct 2017 20:16:47 -0000

29.09.2017 15:03, Eduardo Otubo wrote:
> v2:
>     Removed "err:" label from the end of the function and replaced by
>     two separate error messages. One when outdev is not specified and
>     one when outdev does not exist.
> 
>     Fixed the error message that was referencing nf->netdev_id and not
>     s->outdev.
> 
> When using filter-mirror like the example below where the interface
> 'ndev0' does not exist on the host, QEMU crashes into segmentation
> fault.
> 
>  $ qemu-system-x86_64 -S -machine pc -netdev user,id=ndev0 -object filter-mirror,id=test-object,netdev=ndev0
> 
> This happens because the function filter_mirror_setup() does not checks
> if the device actually exists and still keep on processing calling
> qemu_chr_find(). This patch fixes this issue.

Applied to -trivial, with a tiny fix in the commit message (checkS).

Thanks!

/mjt

