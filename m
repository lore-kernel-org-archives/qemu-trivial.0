Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QHxJM-0005u4-OY
	for mharc-qemu-trivial@gnu.org; Thu, 05 May 2011 08:05:40 -0400
Received: from eggs.gnu.org ([140.186.70.92]:52409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1QHxJG-0005hE-Tl
	for qemu-trivial@nongnu.org; Thu, 05 May 2011 08:05:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1QHxJG-0007Oy-25
	for qemu-trivial@nongnu.org; Thu, 05 May 2011 08:05:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:3555)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1QHxJD-0007OX-Jl; Thu, 05 May 2011 08:05:32 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p45C5UiR026668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 5 May 2011 08:05:30 -0400
Received: from rincewind.home.kraxel.org (vpn2-10-40.ams2.redhat.com
	[10.36.10.40])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p45C5SjP020869; Thu, 5 May 2011 08:05:29 -0400
Message-ID: <4DC29287.5030106@redhat.com>
Date: Thu, 05 May 2011 14:05:27 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110318 Red Hat/3.1.9-3.el6_0 Thunderbird/3.1.9
MIME-Version: 1.0
To: Jan Vesely <jano.vesely@gmail.com>
References: <BANLkTik3hmvH6_tUuEZjR8j0L04PdCk7mw@mail.gmail.com>
In-Reply-To: <BANLkTik3hmvH6_tUuEZjR8j0L04PdCk7mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] Bug #757654: UHCI fails to signal
 stall response patch
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
X-List-Received-Date: Thu, 05 May 2011 12:05:38 -0000

> diff --git a/hw/usb-uhci.c b/hw/usb-uhci.c
> index 346db3e..a51d89b 100644
> --- a/hw/usb-uhci.c
> +++ b/hw/usb-uhci.c
> @@ -732,11 +732,21 @@ out:
>       case USB_RET_STALL:
>           td->ctrl |= TD_CTRL_STALL;
>           td->ctrl&= ~TD_CTRL_ACTIVE;
> +        s->status |= UHCI_STS_USBERR;

Just this line should be enougth.

>       case USB_RET_BABBLE:
>           td->ctrl |= TD_CTRL_BABBLE | TD_CTRL_STALL;
>           td->ctrl&= ~TD_CTRL_ACTIVE;
> +        s->status |= UHCI_STS_USBERR;

Likewise.

Tried that?

cheers,
   Gerd


