Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0Wta-0005zq-S3
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jun 2015 11:17:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z0WtY-0005wq-BA
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 11:17:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z0WtX-0005Yl-DC
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 11:17:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38110)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z0WtT-0005Xf-Ey; Thu, 04 Jun 2015 11:17:19 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id DB4814091E;
	Thu,  4 Jun 2015 18:17:18 +0300 (MSK)
Message-ID: <55706BFE.1020408@msgid.tls.msk.ru>
Date: Thu, 04 Jun 2015 18:17:18 +0300
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
	<55706186.5070701@msgid.tls.msk.ru> <557065ED.7010409@linaro.org>
	<55706775.7090204@msgid.tls.msk.ru> <55706A17.80601@linaro.org>
	<55706B62.3060304@msgid.tls.msk.ru>
In-Reply-To: <55706B62.3060304@msgid.tls.msk.ru>
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
X-List-Received-Date: Thu, 04 Jun 2015 15:17:25 -0000

04.06.2015 18:14, Michael Tokarev wrote:
> 04.06.2015 18:09, Shannon Zhao wrote:
>> On 2015/6/4 22:57, Michael Tokarev wrote:
>>> 04.06.2015 17:51, Shannon Zhao wrote:
>>>>> Yeah, but I think something like below would work.
>>>>>
>>>>>     cpu_exit_irq = &qemu_allocate_irq(cpu_request_exit, NULL, 0);
>>>>>     DMA_init(0, cpu_exit_irq);
>>> NO!!!:)
>>
>> Hmm...really?
> 
> Really-really :)
> 
> You're getting an address of a temporary local variable
> returned from qemu_allocate_irq,

If this is valid at all, to which I'm not sure.

Even for this:

 int foo();

 int *var = &foo();

/mjt\

