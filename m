Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaIbT-00089J-NA
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 03:18:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaIbR-00085s-Er
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 03:18:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaIbN-00064t-GZ
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 03:18:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38875)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaIbD-00062i-BM; Fri, 11 Sep 2015 03:18:19 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9C4A8413F3;
	Fri, 11 Sep 2015 10:18:18 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 8BE65A52;
	Fri, 11 Sep 2015 10:18:18 +0300 (MSK)
Message-ID: <55F2803A.1010408@msgid.tls.msk.ru>
Date: Fri, 11 Sep 2015 10:18:18 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Veres Lajos <vlajos@gmail.com>
References: <alpine.DEB.2.02.1508092307540.14941@citymarket.hu>	<alpine.DEB.2.02.1509072243451.7825@citymarket.hu>
	<CAFEAcA8e8zXxZj09NdJ30CGEYbvsuVvdOy823DiTuaqAuwvR5g@mail.gmail.com>
In-Reply-To: <CAFEAcA8e8zXxZj09NdJ30CGEYbvsuVvdOy823DiTuaqAuwvR5g@mail.gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] typofixes
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
X-List-Received-Date: Fri, 11 Sep 2015 07:18:34 -0000

08.09.2015 11:26, Peter Maydell wrote:
> On 7 September 2015 at 22:45, Veres Lajos <vlajos@gmail.com> wrote:
>> Hi,
>>
>> Please find attached a couple of typo fixes, mostly in comments/docs.
>> (Please cc me directly, I am not on the list.)
> 
> That patch includes at least one change to linux-headers/,
> which is definitely wrong. Typos in the kernel headers need
> to be sent to the kernel list, and we will get them next time
> we do a header sync. It also has a change to disas/libvixl,
> which is also a bit pointless as that is an external project
> which we sync with. Further, it mixes changes to comments and
> docs (totally safe) with changes to code function names etc
> (needs closer review), and it's pretty huge so it's hard to
> review the latter very easily.
> 
> MJT: can you drop this patch from the trivial queue, please?

Dropped now :)  I apologize for not seeing the obvious problems
you and others found, this is the result of me being too relaxed
after returning from vacation :)

Thanks,

/mjt

