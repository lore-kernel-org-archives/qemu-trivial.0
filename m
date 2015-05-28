Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxx1B-0005tD-QK
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:34:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yxx16-0005j7-30
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:34:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yxx12-000428-3p
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:34:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45337)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yxx0s-0003zQ-1c; Thu, 28 May 2015 08:34:18 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E33994272A;
	Thu, 28 May 2015 15:34:16 +0300 (MSK)
Message-ID: <55670B48.20106@msgid.tls.msk.ru>
Date: Thu, 28 May 2015 15:34:16 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, shannon.zhao@linaro.org,
	peter.maydell@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 00/29] Fix memory leak relevant to
	calling qemu_allocate_irqs
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
X-List-Received-Date: Thu, 28 May 2015 12:34:36 -0000

28.05.2015 15:08, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Before I sent some patches to fix memory leak spotted by valgrind and
> those are relevant to qemu_allocate_irqs. Then I find all the places
> calling this function through code searching and test by valgrind to
> check whether they have memory leak. These patches fix these memory leaks.
> 
> Sorry that maybe the names of the patches are vertiginous while I could
> not find out better names and I try to sort them out.

Maybe a better subject will be "fix memory leak after qemu_allocate_irqs"
or something like that?  And for some, "use qemu_allocate_irq not _irqs
for single irq" -- this kind is sorta fun, I wonder why the codebase has
so many cases of this API misuse.

And one more question: do you really care that whole valgrind report is
included into every commit message? :)  All the recent patches you sent
(all the 3 recent "spotted by valgrind" series) are fine without these
reports which are the only info included in the commit message, I'd just
drop these reports like -ETOOMUCHINFO :)  Anyone disagree? :)

Thanks,

/mjt

