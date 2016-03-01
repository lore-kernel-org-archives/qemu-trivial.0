Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aagx5-0006P3-Ti
	for mharc-qemu-trivial@gnu.org; Tue, 01 Mar 2016 04:50:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1aagx1-0006MM-9H
	for qemu-trivial@nongnu.org; Tue, 01 Mar 2016 04:50:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1aagx0-0000dk-5K
	for qemu-trivial@nongnu.org; Tue, 01 Mar 2016 04:50:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44871)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>)
	id 1aagwu-0000ZP-UF; Tue, 01 Mar 2016 04:50:37 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id C432D90E7D;
	Tue,  1 Mar 2016 09:50:34 +0000 (UTC)
Received: from [10.36.7.159] (vpn1-7-159.ams2.redhat.com [10.36.7.159])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u219oWtW029403; Tue, 1 Mar 2016 04:50:33 -0500
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1456825524-10805-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <56D565E8.2090401@redhat.com>
Date: Tue, 1 Mar 2016 11:50:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1456825524-10805-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] pxb: cleanup
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
X-List-Received-Date: Tue, 01 Mar 2016 09:50:44 -0000

On 03/01/2016 11:45 AM, Cao jin wrote:
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
> BTW: this doc seems little out of date, since pxb has already support Q35.

Hi,

Yes, you are right, but we use a different device, pxb-pcie.
I will send a doc update about it, thanks for reminding me,
Marcel


>
>   docs/pci_expander_bridge.txt        | 6 +++---
>   hw/pci-bridge/pci_expander_bridge.c | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/docs/pci_expander_bridge.txt b/docs/pci_expander_bridge.txt
> index e7c8fe9..3675027 100644
> --- a/docs/pci_expander_bridge.txt
> +++ b/docs/pci_expander_bridge.txt
> @@ -24,8 +24,8 @@ A detailed command line would be:
>   -object memory-backend-ram,size=1024M,policy=bind,host-nodes=0,id=ram-node0 -numa node,nodeid=0,cpus=0,memdev=ram-node0
>   -object memory-backend-ram,size=1024M,policy=bind,host-nodes=1,id=ram-node1 -numa node,nodeid=1,cpus=1,memdev=ram-node1
>   -device pxb,id=bridge1,bus=pci.0,numa_node=1,bus_nr=4 -netdev user,id=nd -device e1000,bus=bridge1,addr=0x4,netdev=nd
> --device pxb,id=bridge2,bus=pci.0,numa_node=0,bus_nr=8, -device e1000,bus=bridge2,addr=0x3
> --device pxb,id=bridge3,bus=pci.0,bus_nr=40, -drive if=none,id=drive0,file=[img] -device virtio-blk-pci,drive=drive0,scsi=off,bus=bridge3,addr=1
> +-device pxb,id=bridge2,bus=pci.0,numa_node=0,bus_nr=8 -device e1000,bus=bridge2,addr=0x3
> +-device pxb,id=bridge3,bus=pci.0,bus_nr=40 -drive if=none,id=drive0,file=[img] -device virtio-blk-pci,drive=drive0,scsi=off,bus=bridge3,addr=1
>
>   Here you have:
>    - 2 NUMA nodes for the guest, 0 and 1. (both mapped to the same NUMA node in host, but you can and should put it in different host NUMA nodes)
> @@ -43,7 +43,7 @@ Implementation
>   ==============
>   The PXB is composed by:
>   - HostBridge (TYPE_PXB_HOST)
> -  The host bridge allows to register and query the PXB's rPCI root bus in QEMU.
> +  The host bridge allows to register and query the PXB's PCI root bus in QEMU.
>   - PXBDev(TYPE_PXB_DEVICE)
>     It is a regular PCI Device that resides on the piix host-bridge bus and its bus uses the same PCI domain.
>     However, the bus behind is exposed through ACPI as a primary PCI bus and starts a new PCI hierarchy.
> diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
> index d23b8da..5e7e546 100644
> --- a/hw/pci-bridge/pci_expander_bridge.c
> +++ b/hw/pci-bridge/pci_expander_bridge.c
> @@ -283,7 +283,7 @@ static void pxb_dev_exitfn(PCIDevice *pci_dev)
>   }
>
>   static Property pxb_dev_properties[] = {
> -    /* Note: 0 is not a legal a PXB bus number. */
> +    /* Note: 0 is not a legal PXB bus number. */
>       DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
>       DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
>       DEFINE_PROP_END_OF_LIST(),
>


Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>

