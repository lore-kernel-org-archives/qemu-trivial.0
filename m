Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVDqy-0001Qo-Io
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 02:41:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVDqw-0001OQ-Tm
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 02:41:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVDqv-0007TX-SO
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 02:41:18 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55279)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVDqp-0007Li-Om; Tue, 10 Mar 2015 02:41:11 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8D5B841302;
	Tue, 10 Mar 2015 09:41:10 +0300 (MSK)
Message-ID: <54FE9206.1070809@msgid.tls.msk.ru>
Date: Tue, 10 Mar 2015 09:41:10 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1425838487-28274-1-git-send-email-sw@weilnetz.de>	<54FE896B.1000802@msgid.tls.msk.ru>
	<54FE8D8B.3070807@weilnetz.de>
In-Reply-To: <54FE8D8B.3070807@weilnetz.de>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 1/7] backends: Fix warning from Sparse
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
X-List-Received-Date: Tue, 10 Mar 2015 06:41:19 -0000

10.03.2015 09:22, Stefan Weil wrote:

> No, that was my mistake. Please excuse also the cris patch which I sent twice.
> I did not notice that it already had caused trouble, nor did I notice that I had already sent it.
> In my local patch queue (~ 50 patches) there was even a 2nd cris patch
> which removed the unused variables...

No problems with that (except that we bothered Peter twice
with this cris thing already, and I really mean "we", since
it escaped my testing and accurate review too, and it was
twice too, so I'm as guilty if not more).

And this situation suggests that I should process and submit
patches a) more carefully and b) faster.  So it is, again,
good portion of my fault.  Not doing trivial-patches merging
for 3 weeks and rushing a whole lot in one go without that
good review isn't going to work well.

Thank you for the good work!  And it really is good, while
boring...

/mjt

