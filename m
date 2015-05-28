Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxwAe-0001uf-5C
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 07:40:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YxwAV-0001lL-Sp
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:40:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YxwAQ-00074T-3L
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:40:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42879)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YxwAK-0006dv-1v; Thu, 28 May 2015 07:40:00 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 57F4D42715;
	Thu, 28 May 2015 14:39:59 +0300 (MSK)
Message-ID: <5566FE8F.7080406@msgid.tls.msk.ru>
Date: Thu, 28 May 2015 14:39:59 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1432604767-5964-1-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1432604767-5964-1-git-send-email-zhaoshenglong@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2 0/3] Fix memory leak spotted by
	valgrind
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
X-List-Received-Date: Thu, 28 May 2015 11:40:18 -0000

26.05.2015 04:46, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> These patches fix memmory leak spotted by valgrind.
> 
> changes since v1:
>   * use qemu_allocate_irq instead of qemu_allocate_irqs for allocating
>     one irq (Paolo)
>   * Add review-by from Igor for PATCH 3/3
> 
> Shannon Zhao (3):
>   hw/i386/pc_piix: Fix memory leak
>   hw/ide/pci: Fix memory leak
>   hw/i386/acpi-build: decref after use

Applied all 3 of this v2 to -trivial, thank you!

/mjt

