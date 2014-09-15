Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XTVkD-0004dO-Ce
	for mharc-qemu-trivial@gnu.org; Mon, 15 Sep 2014 08:51:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XTVk6-0004Vg-9h
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 08:50:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XTVk1-0006HW-8H
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 08:50:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50987)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XTVjr-0006E0-2z; Mon, 15 Sep 2014 08:50:39 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 071A1441EB;
	Mon, 15 Sep 2014 16:50:28 +0400 (MSK)
Message-ID: <5416E094.9070500@msgid.tls.msk.ru>
Date: Mon, 15 Sep 2014 16:50:28 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: "john.liuli" <john.liuli@huawei.com>, armbru@redhat.com
References: <1410261588-8360-1-git-send-email-john.liuli@huawei.com>
In-Reply-To: <1410261588-8360-1-git-send-email-john.liuli@huawei.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, peter.huangpeng@huawei.com,
	kraxel@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2] qemu-char: fix terminal crash when
 using "-monitor stdio -nographic"
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
X-List-Received-Date: Mon, 15 Sep 2014 12:50:59 -0000

09.09.2014 15:19, john.liuli wrote:
> From: Li Liu <john.liuli@huawei.com>
> 
> Eeay to reproduce, just try "qemu -monitor stdio -nographic"
> and type "quit", then the terminal will be crashed.
> 
> There are two pathes try to call tcgetattr of stdio in vl.c:

This looks reasonable.  Except of one thing -- how about renaming
stdio_is_ready to stdio_in_use?  (I can do that when applying, no
need to resend anythnig).  Because, well, stdio_is_ready is not
obvious at all, at least to me... :)

Thank you for fixing this!

/mjt

