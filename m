Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0WCS-0006s6-7c
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jun 2015 10:32:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z0WCP-0006oZ-Aj
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 10:32:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z0WCO-0004pu-MQ
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 10:32:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60279)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z0WCF-0004o9-CT; Thu, 04 Jun 2015 10:32:39 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 614E64093D;
	Thu,  4 Jun 2015 17:32:38 +0300 (MSK)
Message-ID: <55706186.5070701@msgid.tls.msk.ru>
Date: Thu, 04 Jun 2015 17:32:38 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Shannon Zhao <shannon.zhao@linaro.org>, 
	Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
	<1432972477-13504-3-git-send-email-zhaoshenglong@huawei.com>
	<55705E46.4010106@msgid.tls.msk.ru> <55706108.9070903@linaro.org>
In-Reply-To: <55706108.9070903@linaro.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2 2/7] hw/mips/mips_jazz.c: Store irq
 array in MachineState to fix memory leak
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
X-List-Received-Date: Thu, 04 Jun 2015 14:32:50 -0000

04.06.2015 17:30, Shannon Zhao wrote:

>> BTW, there's also cpu_exit_irq in this function whose allocation also
>> suffers from qemu_allocate_irqs(..., 1) API abuse.
> 
> Yeah, missed this one.

This one isn't that simple, because it passes the result to DMA_init
which expects a pointer, even if it uses only one element of the
array.

/mjt


