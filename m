Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XtHVQ-0005pt-Q1
	for mharc-qemu-trivial@gnu.org; Tue, 25 Nov 2014 09:54:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XtHVJ-0005dz-7e
	for qemu-trivial@nongnu.org; Tue, 25 Nov 2014 09:54:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XtHVC-0000IG-MQ
	for qemu-trivial@nongnu.org; Tue, 25 Nov 2014 09:54:09 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58499)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XtHUy-0000Fl-Cq; Tue, 25 Nov 2014 09:53:48 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 42B6C443B6;
	Tue, 25 Nov 2014 17:53:47 +0300 (MSK)
Message-ID: <547497FB.3070006@msgid.tls.msk.ru>
Date: Tue, 25 Nov 2014 17:53:47 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-trivial@nongnu.org
References: <1416797265-10308-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1416797265-10308-1-git-send-email-zhang.zhanghailiang@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-devel@nongnu.org, peter.huangpeng@huawei.com, agraf@suse.de,
	arei.gonglei@huawei.com, pbonzini@redhat.com, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH] target-s390x: fix possible out of bounds
 read
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
X-List-Received-Date: Tue, 25 Nov 2014 14:54:15 -0000

24.11.2014 05:47, zhanghailiang write:
> Array index starts at 0, so the valid index of ext_queue array,
> io_queue array, mchk_queue array should be MAX_EXT_QUEUE - 1,
> MAX_IO_QUEUE - 1, MAX_MCHK_QUEUE - 1.
> 
> The original checks missed the invalid bound value, which will lead
> possible out of bounds read in the follow codes.

Applied to -trivial, thank you!

/mjt

