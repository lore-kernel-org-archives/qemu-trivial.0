Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsmqV-0000Q7-4H
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 04:19:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsmqS-0000N9-MA
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:19:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsmqQ-0002gh-Su
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:18:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41181)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsmqL-0002d6-BS; Sat, 08 Oct 2016 04:18:53 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6464A40EB7;
	Sat,  8 Oct 2016 11:18:49 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id E00F9B26;
	Sat,  8 Oct 2016 11:18:48 +0300 (MSK)
To: Chen Fan <fan.chen@easystack.cn>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1475121880-9593-1-git-send-email-fan.chen@easystack.cn>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <33388267-c9e5-9346-4908-0609aed19267@msgid.tls.msk.ru>
Date: Sat, 8 Oct 2016 11:18:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475121880-9593-1-git-send-email-fan.chen@easystack.cn>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] virtio: rename the bar index field name
 in VirtIOPCIProxy
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Oct 2016 08:19:01 -0000

29.09.2016 07:04, Chen Fan wrote:
> the bar index names are much similar to the bar memory regions,
> distinguish them to improve the code readability.
>

> -    vpci_dev->modern_mem_bar = 2;
> -    vpci_dev->msix_bar = 4;
> +    vpci_dev->modern_mem_bar_idx = 2;
> +    vpci_dev->msix_bar_idx = 4;

...

Applied to -trivial, thanks!

/mjt

