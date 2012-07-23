Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1StLVU-0000Lm-Lv
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jul 2012 12:29:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1StLVS-0000DC-3Q
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 12:29:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1StLVN-0003aH-UW
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 12:29:14 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:58041)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1StLVG-0003XY-7m; Mon, 23 Jul 2012 12:29:02 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	E42C372800C1; Mon, 23 Jul 2012 18:28:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Szz9hL8vCwXy; Mon, 23 Jul 2012 18:28:59 +0200 (CEST)
Received: from [192.168.178.20] (p54AD9B65.dip.t-dialin.net [84.173.155.101])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	3940B72800C0; Mon, 23 Jul 2012 18:28:59 +0200 (CEST)
Message-ID: <500D7BCA.9090409@weilnetz.de>
Date: Mon, 23 Jul 2012 18:28:58 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: initcrash@gmail.com
References: <1343035544-11101-1-git-send-email-initcrash@gmail.com>
In-Reply-To: <1343035544-11101-1-git-send-email-initcrash@gmail.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] eepro100: fix simplified
	mode
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
X-List-Received-Date: Mon, 23 Jul 2012 16:29:15 -0000

Am 23.07.2012 11:25, schrieb initcrash@gmail.com:
> From: Christian Schilling <initcrash@gmail.com>
>
> A driver using simplified mode that works on real hardware
> did not work in qemu.
>
> Signed-off-by: Christian Schilling <initcrash@gmail.com>
> ---
>   hw/eepro100.c |    7 +++++++
>   1 files changed, 7 insertions(+), 0 deletions(-)
>
> diff --git a/hw/eepro100.c b/hw/eepro100.c
> index 6279ae3..4a48372 100644
> --- a/hw/eepro100.c
> +++ b/hw/eepro100.c
> @@ -774,6 +774,13 @@ static void tx_command(EEPRO100State *s)
>   #if 0
>           uint16_t tx_buffer_el = lduw_le_pci_dma(&s->dev, tbd_address + 6);
>   #endif
> +        if (tbd_array == 0xffffffff) {
> +            /* In simpliyfied mode there is no tbd_array. Instead the packet data
> +             * starts right after the tcb_bytes field, and the packet size is
> +             * equal to tcb_bytes */
> +            tx_buffer_size = tcb_bytes;
> +            tx_buffer_address = tbd_address;
> +        }
>           tbd_address += 8;
>           TRACE(RXTX, logout
>               ("TBD (simplified mode): buffer address 0x%08x, size 0x%04x\n",

Do you really think that's a trivial patch?

I have a different fix for simplified mode in my QEMU tree:

http://repo.or.cz/w/qemu/ar7.git/blob/HEAD:/hw/eepro100.c

That version is implemented according to the Intel specifications
and avoids hacks for specific guest drivers.

Maybe you can give it a try.

If it works for you, I can put the changes needed for simplified mode
in a patch for QEMU git master.

Regards,

Stefan Weil


