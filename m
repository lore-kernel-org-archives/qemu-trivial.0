Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zqhrt-0004k5-LN
	for mharc-qemu-trivial@gnu.org; Mon, 26 Oct 2015 09:31:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59164)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZqgSs-0003nI-DV
	for qemu-trivial@nongnu.org; Mon, 26 Oct 2015 08:01:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZqgSn-00047e-5i
	for qemu-trivial@nongnu.org; Mon, 26 Oct 2015 08:01:26 -0400
Received: from [59.151.112.132] (port=30243 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1ZqgSm-000477-PV; Mon, 26 Oct 2015 08:01:21 -0400
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="102290112"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Oct 2015 20:03:32 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t9QC0iOF006714;
	Mon, 26 Oct 2015 20:00:44 +0800
Received: from [10.167.226.38] (10.167.226.38) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 26 Oct 2015 20:01:16 +0800
To: <qemu-devel@nongnu.org>
References: <1445761408-10308-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <562E1786.9040202@cn.fujitsu.com>
Date: Mon, 26 Oct 2015 20:07:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1445761408-10308-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.38]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
X-Mailman-Approved-At: Mon, 26 Oct 2015 09:31:19 -0400
Cc: qemu-trivial@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fix bad indentation in
 pcie_cap_slot_write_config()
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
X-List-Received-Date: Mon, 26 Oct 2015 12:01:27 -0000

Sorry, I just find that maybe I should cc this patch to 
qemu-trivial@nongnu.org

On 10/25/2015 04:23 PM, Cao jin wrote:
> bad indentation conflicts with CODING_STYLE doc
>
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>   hw/pci/pcie.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 6e28985..e4bfe91 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -413,13 +413,13 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
>        */
>       if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
>           ((val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF)) {
> -            PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
> -            pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> -                                pcie_unplug_device, NULL);
> +        PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
> +        pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> +                            pcie_unplug_device, NULL);
>
> -            pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
> -                                         PCI_EXP_SLTSTA_PDS);
> -            pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
> +        pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
> +                                     PCI_EXP_SLTSTA_PDS);
> +        pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
>                                          PCI_EXP_SLTSTA_PDC);
>       }
>
>

-- 
Yours Sincerely,

Cao Jin

