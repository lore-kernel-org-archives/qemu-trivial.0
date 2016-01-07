Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aH7KJ-0001fN-R0
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jan 2016 04:57:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>) id 1aH7KG-0001bx-SQ
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 04:57:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>) id 1aH7KF-0005xM-W0
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 04:57:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52254)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>)
	id 1aH7KA-0005wi-8z; Thu, 07 Jan 2016 04:57:42 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id D9AEA19F250;
	Thu,  7 Jan 2016 09:57:40 +0000 (UTC)
Received: from localhost (dhcp193-144.pnq.redhat.com [10.65.193.144])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u079vcw9026441; Thu, 7 Jan 2016 04:57:39 -0500
Date: Thu, 7 Jan 2016 15:27:37 +0530
From: Amit Shah <amit.shah@redhat.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <20160107095737.GA17885@grmbl.mre>
References: <1452068575-21543-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452068575-21543-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
	mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] virtio serial port: fix to incomplete
	QOMify
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
X-List-Received-Date: Thu, 07 Jan 2016 09:57:50 -0000

On (Wed) 06 Jan 2016 [16:22:55], Cao jin wrote:
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  hw/char/virtio-serial-bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
> index 497b0af..2d2a659 100644
> --- a/hw/char/virtio-serial-bus.c
> +++ b/hw/char/virtio-serial-bus.c
> @@ -798,7 +798,7 @@ static const TypeInfo virtser_bus_info = {
>  
>  static void virtser_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent)
>  {
> -    VirtIOSerialPort *port = DO_UPCAST(VirtIOSerialPort, dev, qdev);
> +    VirtIOSerialPort *port = VIRTIO_SERIAL_PORT(qdev);
>  
>      monitor_printf(mon, "%*sport %d, guest %s, host %s, throttle %s\n",
>                     indent, "", port->id,

Reviewed-by: Amit Shah <amit.shah@redhat.com>

Applied to my tree, thanks.

		Amit

