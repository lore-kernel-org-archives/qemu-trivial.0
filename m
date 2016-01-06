Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aGjXf-0002qZ-LC
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jan 2016 03:34:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aGjXc-0002oZ-S0
	for qemu-trivial@nongnu.org; Wed, 06 Jan 2016 03:34:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aGjXY-00058X-Vt
	for qemu-trivial@nongnu.org; Wed, 06 Jan 2016 03:34:00 -0500
Received: from e06smtp06.uk.ibm.com ([195.75.94.102]:48324)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aGjXY-00055n-Ll
	for qemu-trivial@nongnu.org; Wed, 06 Jan 2016 03:33:56 -0500
Received: from localhost
	by e06smtp06.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <gkurz@linux.vnet.ibm.com>;
	Wed, 6 Jan 2016 08:33:54 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp06.uk.ibm.com (192.168.101.136) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 6 Jan 2016 08:33:51 -0000
X-IBM-Helo: d06dlp03.portsmouth.uk.ibm.com
X-IBM-MailFrom: gkurz@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8345A1B0804B; 
	Wed,  6 Jan 2016 08:34:32 +0000 (GMT)
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com
	[9.149.37.212])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u068XoIv6291912; Wed, 6 Jan 2016 08:33:51 GMT
Received: from d06av01.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av01.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u068Xo89030134; Wed, 6 Jan 2016 01:33:50 -0700
Received: from smtp.lab.toulouse-stg.fr.ibm.com
	(srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
	by d06av01.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u068XoFG030125; Wed, 6 Jan 2016 01:33:50 -0700
Received: from bahia.local (icon-9-164-138-69.megacenter.de.ibm.com
	[9.164.138.69])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id AD92722051E;
	Wed,  6 Jan 2016 09:33:49 +0100 (CET)
Date: Wed, 6 Jan 2016 09:33:48 +0100
From: Greg Kurz <gkurz@linux.vnet.ibm.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <20160106093348.1c7146bb@bahia.local>
In-Reply-To: <1452068575-21543-1-git-send-email-caoj.fnst@cn.fujitsu.com>
References: <1452068575-21543-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Organization: IBM
X-Mailer: Claws Mail 3.12.0 (GTK+ 2.24.29; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16010608-0025-0000-0000-0000056FF55F
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.102
Cc: amit.shah@redhat.com, pbonzini@redhat.com, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio serial port: fix to
 incomplete QOMify
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
X-List-Received-Date: Wed, 06 Jan 2016 08:34:01 -0000

On Wed, 6 Jan 2016 16:22:55 +0800
Cao jin <caoj.fnst@cn.fujitsu.com> wrote:

> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---

Reviewed-by: Greg Kurz <gkurz@linux.vnet.ibm.com>

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


