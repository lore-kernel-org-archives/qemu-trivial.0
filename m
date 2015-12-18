Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a9qLX-0007Kz-AC
	for mharc-qemu-trivial@gnu.org; Fri, 18 Dec 2015 03:25:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1a9qLV-0007JL-7b
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 03:25:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1a9qLU-0007M9-E3
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 03:25:01 -0500
Received: from [59.151.112.132] (port=35244 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1a9qLP-0007Cp-33; Fri, 18 Dec 2015 03:24:55 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="1734315"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Dec 2015 16:24:44 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 5A87440427C0;
	Fri, 18 Dec 2015 16:24:44 +0800 (CST)
Received: from [10.167.226.86] (10.167.226.86) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 18 Dec 2015 16:27:59 +0800
To: <qemu-devel@nongnu.org>
References: <1450425454-12274-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <5673C352.70006@cn.fujitsu.com>
Date: Fri, 18 Dec 2015 16:26:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1450425454-12274-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.86]
X-yoursite-MailScanner-ID: 5A87440427C0.A5C41
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mst@redhat.com,
	ehabkost@redhat.com, rth@twiddle.net
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Use macro instead of plain
	text
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
X-List-Received-Date: Fri, 18 Dec 2015 08:25:02 -0000

Sorry, it can`t pass compilation...
I will give v2 soon.

On 12/18/2015 03:57 PM, Cao jin wrote:
> There is TYPE_ICH9_AHCI definition in ahci.h when QOMify it, seems these two
> places are missed.
>
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>   hw/i386/pc_q35.c | 2 +-
>   qdev-monitor.c   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 9a12068..aa34a07 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -249,7 +249,7 @@ static void pc_q35_init(MachineState *machine)
>       ahci = pci_create_simple_multifunction(host_bus,
>                                              PCI_DEVFN(ICH9_SATA1_DEV,
>                                                        ICH9_SATA1_FUNC),
> -                                           true, "ich9-ahci");
> +                                           true, TYPE_ICH9_AHCI);
>       idebus[0] = qdev_get_child_bus(&ahci->qdev, "ide.0");
>       idebus[1] = qdev_get_child_bus(&ahci->qdev, "ide.1");
>       g_assert(MAX_SATA_PORTS == ICH_AHCI(ahci)->ahci.ports);
> diff --git a/qdev-monitor.c b/qdev-monitor.c
> index a35098f..f249603 100644
> --- a/qdev-monitor.c
> +++ b/qdev-monitor.c
> @@ -48,7 +48,7 @@ static const QDevAlias qdev_alias_table[] = {
>       { "virtio-net-ccw", "virtio-net", QEMU_ARCH_S390X },
>       { "virtio-serial-ccw", "virtio-serial", QEMU_ARCH_S390X },
>       { "lsi53c895a", "lsi" },
> -    { "ich9-ahci", "ahci" },
> +    { TYPE_ICH9_AHCI, "ahci" },
>       { "kvm-pci-assign", "pci-assign" },
>       { "e1000", "e1000-82540em" },
>       { }
>

-- 
Yours Sincerely,

Cao Jin



