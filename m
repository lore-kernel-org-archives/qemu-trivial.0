Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0VtJ-0007B3-4E
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jun 2015 10:13:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z0VtG-00077r-Oc
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 10:13:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z0VtF-0005hE-Tw
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 10:13:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58566)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z0VtB-0005em-J6; Thu, 04 Jun 2015 10:12:57 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 2C8BA40937;
	Thu,  4 Jun 2015 17:12:48 +0300 (MSK)
Message-ID: <55705CE0.1040108@msgid.tls.msk.ru>
Date: Thu, 04 Jun 2015 17:12:48 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
	<1432972477-13504-2-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1432972477-13504-2-git-send-email-zhaoshenglong@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2 1/7] hw/ppc/ppc440_bamboo.c: Add a
 member in MachineState to store irq array
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
X-List-Received-Date: Thu, 04 Jun 2015 14:13:03 -0000

30.05.2015 10:54, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Here we add a member in MachineState to store the irq array returned
> from qemu_allocate_irqs. Then these irq arrays will be free before QEMU
> exit and it fixes the memory leak spotted by valgrind.

Where the new member (machine->irqs) is being freed?  Can we add the
generic machinery for it first, and next convert all places to it one
by one?

Thanks,

/mjt

