Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XNbBC-0006gn-9B
	for mharc-qemu-trivial@gnu.org; Sat, 30 Aug 2014 01:26:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XNbB5-0006Wm-5S
	for qemu-trivial@nongnu.org; Sat, 30 Aug 2014 01:26:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XNbB0-0001zk-CN
	for qemu-trivial@nongnu.org; Sat, 30 Aug 2014 01:26:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47464)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XNbAq-0001ys-BN; Sat, 30 Aug 2014 01:26:04 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5AC8B458D7;
	Sat, 30 Aug 2014 09:26:01 +0400 (MSK)
Message-ID: <54016069.4070209@msgid.tls.msk.ru>
Date: Sat, 30 Aug 2014 09:26:01 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: "john.liuli" <john.liuli@huawei.com>
References: <1409369799-9028-1-git-send-email-john.liuli@huawei.com>
In-Reply-To: <1409369799-9028-1-git-send-email-john.liuli@huawei.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] numa: fix qerror_report_err not free
	issue
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
X-List-Received-Date: Sat, 30 Aug 2014 05:26:24 -0000

30.08.2014 07:36, john.liuli wrote:
> From: Li Liu <john.liuli@huawei.com>
> 
> All qerror_report_err returned none NULL pointers need to
> be freed, otherwise will cause memory leaking.
> 
> Although this place did not cause real memory leaking by exit,
> obviously it's not correct to use qerror_report_err
> without error_free it.

I don't thing there's any good reason to free resources like
this (freeing memory, closing files, etc) right before exit()
(esp. in error path).  The OS will do that for us in one go
much faster.

/mjt

