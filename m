Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d2LL9-0003vl-Rs
	for mharc-qemu-trivial@gnu.org; Sun, 23 Apr 2017 13:30:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2LL7-0003u8-O3
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 13:30:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2LL7-00079v-1M
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 13:30:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56829)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d2LL1-000791-6K; Sun, 23 Apr 2017 13:30:19 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B9ABA41F5A;
	Sun, 23 Apr 2017 20:30:17 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 9FD5C3F8;
	Sun, 23 Apr 2017 20:30:17 +0300 (MSK)
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <20170207132723.13934-1-famz@redhat.com>
	<20170207132723.13934-2-famz@redhat.com>
Cc: Laszlo Ersek <lersek@redhat.com>, qemu-block@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <a573309c-24a9-072d-4c0a-b55f66d77222@msgid.tls.msk.ru>
Date: Sun, 23 Apr 2017 20:30:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170207132723.13934-2-famz@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH 1/2] virtio-blk: Remove useless condition
 around g_free()
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
X-List-Received-Date: Sun, 23 Apr 2017 17:30:26 -0000

07.02.2017 16:27, Fam Zheng wrote:
> Laszlo spotted and studied this wasteful "if". He pointed out:
> 
> The original virtio_blk_free_request needed an "if" as it accesses one
> field, since 671ec3f05655 ("virtio-blk: Convert VirtIOBlockReq.elem to
> pointer", 2014-06-11); later on in f897bf751fbd ("virtio-blk: embed
> VirtQueueElement in VirtIOBlockReq", 2014-07-09) the field became
> embedded, so the "if" became unnecessary (at which point we were using
> g_slice_free(), but it is the same.
> 
> Now drop it.

Applied to -trivial, thanks!

/mjt

