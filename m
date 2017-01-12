Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRdDf-0002ac-JJ
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 06:06:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRdDd-0002Xb-4i
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 06:06:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRdDb-00079x-No
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 06:06:57 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56764)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cRdDY-000790-9J; Thu, 12 Jan 2017 06:06:52 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3EF9B40A33;
	Thu, 12 Jan 2017 14:06:52 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 7C1E654C;
	Thu, 12 Jan 2017 14:06:51 +0300 (MSK)
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <1484132542-22520-1-git-send-email-kraxel@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <196dd8f1-4a2a-e085-ad3a-7db97a10668f@msgid.tls.msk.ru>
Date: Thu, 12 Jan 2017 14:06:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.5.1
MIME-Version: 1.0
In-Reply-To: <1484132542-22520-1-git-send-email-kraxel@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] docs: sync pci-ids.txt
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
X-List-Received-Date: Thu, 12 Jan 2017 11:06:58 -0000

11.01.2017 14:02, Gerd Hoffmann wrote:
> Three commits allocated pci ids in include/hw/pci/pci.h
> without also updating docs/specs/pci-ids.txt:
> 
>   bf439db pci: Allocate PCIe host bridge PCI ID
>   40d14be hw/pci: introduce PCI Expander Bridge (PXB)
>   02b0743 hw/pxb: introduce pxb-pcie expander for PCIe machines
> 
> This patch updates pci-ids.txt accordingly.

Applied to -trivial, thank you!

/mjt

