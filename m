Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UCcTw-0007RX-Ut
	for mharc-qemu-trivial@gnu.org; Mon, 04 Mar 2013 15:59:36 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1UCcTu-0007O2-Kf
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2013 15:59:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1UCcTt-00079J-Lx
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2013 15:59:34 -0500
Received: from ssl.serverraum.org ([88.198.40.39]:34645)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>)
	id 1UCcTr-00078g-F9; Mon, 04 Mar 2013 15:59:31 -0500
Received: from localhost (localhost [127.0.0.1])
	by ssl.serverraum.org (Postfix) with ESMTP id 9F94E3F051;
	Mon,  4 Mar 2013 21:59:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.serverraum.org
Received: from ssl.serverraum.org ([127.0.0.1])
	by localhost (web.serverraum.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g5PUAanBaRr8; Mon,  4 Mar 2013 21:59:05 +0100 (CET)
Received: from ssl.serverraum.org (localhost [IPv6:::1])
	by ssl.serverraum.org (Postfix) with ESMTP id 307343F00A;
	Mon,  4 Mar 2013 21:59:05 +0100 (CET)
Received: from 95.89.88.22 (SquirrelMail authenticated user michael@walle.cc)
	by ssl.serverraum.org with HTTP; Mon, 4 Mar 2013 21:59:05 +0100
Message-ID: <828e143ca9f4a2330bb1ef35738fa187.squirrel@ssl.serverraum.org>
In-Reply-To: <1362417107-27069-1-git-send-email-pbonzini@redhat.com>
References: <1362417107-27069-1-git-send-email-pbonzini@redhat.com>
Date: Mon, 4 Mar 2013 21:59:05 +0100
From: "Michael Walle" <michael@walle.cc>
To: "Paolo Bonzini" <pbonzini@redhat.com>
User-Agent: SquirrelMail/1.4.21
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
X-Priority: 3 (Normal)
Importance: Normal
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 88.198.40.39
Cc: qemu-trivial@nongnu.org, michael@walle.cc, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] lm32: remove unused function
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
X-List-Received-Date: Mon, 04 Mar 2013 20:59:35 -0000

On Mon, March 4, 2013 18:11, Paolo Bonzini wrote:
> The milkymist-minimac device in fact does not exist at all.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Acked-by: Michael Walle <michael@walle.cc>


> ---
>  hw/milkymist-hw.h | 16 ----------------
>  1 file changed, 16 deletions(-)
>
> diff --git a/hw/milkymist-hw.h b/hw/milkymist-hw.h
> index c8bd7e9..5def311 100644
> --- a/hw/milkymist-hw.h
> +++ b/hw/milkymist-hw.h
> @@ -170,22 +170,6 @@ static inline DeviceState
> *milkymist_ac97_create(hwaddr base,
>      return dev;
>  }
>
> -static inline DeviceState *milkymist_minimac_create(hwaddr base,
> -        qemu_irq rx_irq, qemu_irq tx_irq)
> -{
> -    DeviceState *dev;
> -
> -    qemu_check_nic_model(&nd_table[0], "minimac");
> -    dev =3D qdev_create(NULL, "milkymist-minimac");
> -    qdev_set_nic_properties(dev, &nd_table[0]);
> -    qdev_init_nofail(dev);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
> -    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, rx_irq);
> -    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 1, tx_irq);
> -
> -    return dev;
> -}
> -
>  static inline DeviceState *milkymist_minimac2_create(hwaddr base,
>          hwaddr buffers_base, qemu_irq rx_irq, qemu_irq tx_irq)
>  {



