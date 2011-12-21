Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RdKvG-0007cc-2B
	for mharc-qemu-trivial@gnu.org; Wed, 21 Dec 2011 07:05:26 -0500
Received: from eggs.gnu.org ([140.186.70.92]:37771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>) id 1RdKv7-0007Js-UY
	for qemu-trivial@nongnu.org; Wed, 21 Dec 2011 07:05:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>) id 1RdKv2-000475-7E
	for qemu-trivial@nongnu.org; Wed, 21 Dec 2011 07:05:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:9944)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>)
	id 1RdKum-00040k-Ku; Wed, 21 Dec 2011 07:04:56 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pBLC4tCb019235
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 21 Dec 2011 07:04:55 -0500
Received: from localhost (ovpn-113-87.phx2.redhat.com [10.3.113.87])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pBLC4qEQ006744; Wed, 21 Dec 2011 07:04:54 -0500
Date: Wed, 21 Dec 2011 17:34:52 +0530
From: Amit Shah <amit.shah@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20111221120451.GC9080@amit-x200.redhat.com>
References: <1324463877-1281-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1324463877-1281-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] scsi virtio-blk usb-msd: Clean up device
 init error messages
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
X-List-Received-Date: Wed, 21 Dec 2011 12:05:23 -0000

On (Wed) 21 Dec 2011 [11:37:57], Markus Armbruster wrote:
> Replace
> 
>     error_report("DEVICE-NAME: MESSAGE");
> 
> by just
> 
>     error_report("MESSAGE");
> 
> in block device init functions.
> 
> DEVICE-NAME is bogus in some cases: it's "scsi-disk" for device
> scsi-hd and scsi-cd, "virtio-blk-pci" for virtio-blk-s390, and
> "usb-msd" for usb-storage.
> 
> There is no real need to put a device name in the message, because
> error_report() points to the offending command line option already:
> 
> $ qemu-system-x86_64 --nodefaults --enable-kvm -vnc :0 -S -monitor stdio -usb -device virtio-blk-pci
> upstream-qemu: -device virtio-blk-pci: virtio-blk-pci: drive property not set
> upstream-qemu: -device virtio-blk-pci: Device 'virtio-blk-pci' could not be initialized
> 
> And for a monitor command, it's obvious anyway:
> 
> $ qemu-system-x86_64 --nodefaults --enable-kvm -vnc :0 -S -monitor stdio -usb
> (qemu) device_add virtio-blk-pci
> virtio-blk-pci: drive property not set
> Device 'virtio-blk-pci' could not be initialized
> 
> Reported-by: Amit Shah <amit.shah@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Acked-by: Amit Shah <amit.shah@redhat.com>

		Amit

