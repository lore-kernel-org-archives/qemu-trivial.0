Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zqghw-0004un-RH
	for mharc-qemu-trivial@gnu.org; Mon, 26 Oct 2015 08:17:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Zqghu-0004q7-5z
	for qemu-trivial@nongnu.org; Mon, 26 Oct 2015 08:16:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Zqghp-0008Ef-Pq
	for qemu-trivial@nongnu.org; Mon, 26 Oct 2015 08:16:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40048)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1Zqghn-0008D3-Rn; Mon, 26 Oct 2015 08:16:51 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 6A148C0AF790;
	Mon, 26 Oct 2015 12:16:51 +0000 (UTC)
Received: from redhat.com (ovpn-116-41.ams2.redhat.com [10.36.116.41])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id t9QCGnF5005029; Mon, 26 Oct 2015 08:16:50 -0400
Date: Mon, 26 Oct 2015 14:16:49 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <20151026141641-mutt-send-email-mst@redhat.com>
References: <1445761408-10308-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<562E1786.9040202@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <562E1786.9040202@cn.fujitsu.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
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
X-List-Received-Date: Mon, 26 Oct 2015 12:16:59 -0000

On Mon, Oct 26, 2015 at 08:07:34PM +0800, Cao jin wrote:
> Sorry, I just find that maybe I should cc this patch to
> qemu-trivial@nongnu.org

Indeed.

> On 10/25/2015 04:23 PM, Cao jin wrote:
> >bad indentation conflicts with CODING_STYLE doc
> >
> >Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> >---
> >  hw/pci/pcie.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> >diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> >index 6e28985..e4bfe91 100644
> >--- a/hw/pci/pcie.c
> >+++ b/hw/pci/pcie.c
> >@@ -413,13 +413,13 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
> >       */
> >      if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
> >          ((val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF)) {
> >-            PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
> >-            pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> >-                                pcie_unplug_device, NULL);
> >+        PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
> >+        pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> >+                            pcie_unplug_device, NULL);
> >
> >-            pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
> >-                                         PCI_EXP_SLTSTA_PDS);
> >-            pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
> >+        pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
> >+                                     PCI_EXP_SLTSTA_PDS);
> >+        pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
> >                                         PCI_EXP_SLTSTA_PDC);
> >      }
> >
> >
> 
> -- 
> Yours Sincerely,
> 
> Cao Jin

