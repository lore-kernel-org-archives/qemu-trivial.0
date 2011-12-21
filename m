Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RdJxD-0001UU-HC
	for mharc-qemu-trivial@gnu.org; Wed, 21 Dec 2011 06:03:23 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RdJx5-00015E-Ne
	for qemu-trivial@nongnu.org; Wed, 21 Dec 2011 06:03:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RdJx4-0006c1-JM
	for qemu-trivial@nongnu.org; Wed, 21 Dec 2011 06:03:15 -0500
Received: from mail-qw0-f52.google.com ([209.85.216.52]:64896)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RdJwg-0006QB-7u; Wed, 21 Dec 2011 06:02:50 -0500
Received: by qadc11 with SMTP id c11so4536550qad.4
	for <multiple recipients>; Wed, 21 Dec 2011 03:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZGxEoJ6WQZBxuw6tB8JAXFvmVANoAUEWl6PSKkaxphE=;
	b=xOlB3221YT2FDdaHyWnQLk3rwglCDqIbwk6374Q18F4MMhXm0iSdI7d34jve0sSv8K
	t0IiQvdXuXa//RQE2+y3MBcy9GQzc2Y6GroYbf4oOxqaxKTonQwgVAV3cCgE9lbWFvTd
	FSdixdhb2fpkspxuJCmD71T5ZxLO+uEaJLQ84=
Received: by 10.224.188.137 with SMTP id da9mr1284885qab.29.1324465369020;
	Wed, 21 Dec 2011 03:02:49 -0800 (PST)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id eb5sm9919817qab.10.2011.12.21.03.02.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Dec 2011 03:02:48 -0800 (PST)
Date: Wed, 21 Dec 2011 11:02:45 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20111221110245.GD22697@stefanha-thinkpad.localdomain>
References: <1324463877-1281-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1324463877-1281-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.52
Cc: qemu-trivial@nongnu.org, amit.shah@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] scsi virtio-blk usb-msd:
 Clean up device init error messages
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
X-List-Received-Date: Wed, 21 Dec 2011 11:03:21 -0000

On Wed, Dec 21, 2011 at 11:37:57AM +0100, Markus Armbruster wrote:
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
> ---
>  hw/scsi-disk.c    |    4 ++--
>  hw/scsi-generic.c |    8 ++++----
>  hw/usb-msd.c      |    2 +-
>  hw/virtio-blk.c   |    2 +-
>  4 files changed, 8 insertions(+), 8 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

