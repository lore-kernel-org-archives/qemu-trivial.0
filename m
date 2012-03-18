Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9FO3-0007BP-K1
	for mharc-qemu-trivial@gnu.org; Sun, 18 Mar 2012 08:39:03 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1S9FO0-00078m-EH
	for qemu-trivial@nongnu.org; Sun, 18 Mar 2012 08:39:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1S9FNg-0002bK-Aq
	for qemu-trivial@nongnu.org; Sun, 18 Mar 2012 08:39:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:15907)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1S9FNc-0002WH-7a; Sun, 18 Mar 2012 08:38:36 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2ICcUi0008621
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Sun, 18 Mar 2012 08:38:30 -0400
Received: from redhat.com (reserved-200-249.tlv.redhat.com [10.35.200.249]
	(may be forged))
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id q2ICcPZ6031408; Sun, 18 Mar 2012 08:38:28 -0400
Date: Sun, 18 Mar 2012 14:38:42 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20120318123840.GF29902@redhat.com>
References: <1331859788-6522-1-git-send-email-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1331859788-6522-1-git-send-email-david@gibson.dropbear.id.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com,
	Rusty Russell <rusty@rustcorp.com.au>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Remove PCI class code from virtio
	balloon device
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
X-List-Received-Date: Sun, 18 Mar 2012 12:39:02 -0000

On Fri, Mar 16, 2012 at 12:03:08PM +1100, David Gibson wrote:
> Currently the virtio balloon device, when using the virtio-pci interface
> advertises itself with PCI class code MEMORY_RAM.  This is wrong; the
> balloon is vaguely related to memory, but is nothing like a PCI memory
> device in the meaning of the class code, and this code is not required or
> suggested by the virtio PCI specification.
> 
> Worse, this patch causes problems on the pseries machine, because the
> firmware, seeing this class code, advertises the device as memory in the
> device tree, and then a guest kernel bug causes it to see this "memory"
> before the real system memory, leading to a crash in early boot.
> 
> This patch fixes the problem by removing the bogus PCI class code on the
> balloon device.
> 
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Rusty Russell <rusty@rustcorp.com.au>
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Well, this gives the class a legacy value 00,
and the PCI spec says we should not use this:

D.1.
Base Class 00h
This base class is defined to provide backward compatibility for devices
that were built
before the Class Code field was defined. No new devices should use this
value and existing
devices should switch to a more appropriate value if possible.
For class codes with this base class value, there are two defined values
for the remaining
fields as shown in the table below. All other values are reserved.
Base Class
00h
Sub-Class
Interface
00h
01h
VGA-compatible device
00h
00h
All currently implemented devices
except VGA-compatible devices

You probably want this instead:

#define PCI_CLASS_OTHERS		0xff


> ---
>  hw/virtio-pci.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/hw/virtio-pci.c b/hw/virtio-pci.c
> index a0fb7c1..3c3907a 100644
> --- a/hw/virtio-pci.c
> +++ b/hw/virtio-pci.c
> @@ -919,7 +919,6 @@ static void virtio_balloon_class_init(ObjectClass *klass, void *data)
>      k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
>      k->device_id = PCI_DEVICE_ID_VIRTIO_BALLOON;
>      k->revision = VIRTIO_PCI_ABI_VERSION;
> -    k->class_id = PCI_CLASS_MEMORY_RAM;
>      dc->reset = virtio_pci_reset;
>      dc->props = virtio_balloon_properties;
>  }
> -- 
> 1.7.9.1

