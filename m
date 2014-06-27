Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X0Z7Z-0004ra-Rs
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jun 2014 12:35:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1X0Z7R-0004dO-1Q
	for qemu-trivial@nongnu.org; Fri, 27 Jun 2014 12:35:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1X0Z7K-00081E-Tr
	for qemu-trivial@nongnu.org; Fri, 27 Jun 2014 12:35:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:9751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>)
	id 1X0Z78-0007cf-C6; Fri, 27 Jun 2014 12:35:02 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5RGZ0be007201
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 27 Jun 2014 12:35:00 -0400
Received: from [10.3.113.59] (ovpn-113-59.phx2.redhat.com [10.3.113.59])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s5RGYxTK016591; Fri, 27 Jun 2014 12:35:00 -0400
Message-ID: <1403886899.31091.187.camel@ul30vt.home>
From: Alex Williamson <alex.williamson@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 27 Jun 2014 10:34:59 -0600
In-Reply-To: <1403879569-24256-1-git-send-email-pbonzini@redhat.com>
References: <1403879569-24256-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for 2.1] vfio: use correct runstate
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
X-List-Received-Date: Fri, 27 Jun 2014 16:35:27 -0000

On Fri, 2014-06-27 at 16:32 +0200, Paolo Bonzini wrote:
> io-error is for block device errors; it should always be preceded
> by a BLOCK_IO_ERROR event.

Where does this requirement come from?  I only see a loose association
of IO_ERROR to disk in libvirt and none in QEMU.

>   I think vfio wants to use
> RUN_STATE_INTERNAL_ERROR instead.

But that seems to put us into an "unknown" paused state in libvirt.  An
I/O error still seems like a more appropriate state.  I'm not sure this
qualifies as a trivial patch, it is small, but subtle.  Thanks,

Alex

> 
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/misc/vfio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/vfio.c b/hw/misc/vfio.c
> index 7437c2e..9d71d97 100644
> --- a/hw/misc/vfio.c
> +++ b/hw/misc/vfio.c
> @@ -3978,7 +3978,7 @@ static void vfio_err_notifier_handler(void *opaque)
>                   __func__, vdev->host.domain, vdev->host.bus,
>                   vdev->host.slot, vdev->host.function);
>  
> -    vm_stop(RUN_STATE_IO_ERROR);
> +    vm_stop(RUN_STATE_INTERNAL_ERROR);
>  }
>  
>  /*




