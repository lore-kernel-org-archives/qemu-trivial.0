Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UomBG-0003zW-9x
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jun 2013 23:02:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UomBE-0003vf-FW
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 23:02:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UomBD-00046r-Md
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 23:02:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58908)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UomB9-00046C-FP; Mon, 17 Jun 2013 23:01:55 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CD94C418E5;
	Tue, 18 Jun 2013 07:01:53 +0400 (MSK)
Message-ID: <51BFCDA1.8040507@msgid.tls.msk.ru>
Date: Tue, 18 Jun 2013 07:01:53 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Anthony PERARD <anthony.perard@citrix.com>
References: <1371487106-17194-1-git-send-email-anthony.perard@citrix.com>
In-Reply-To: <1371487106-17194-1-git-send-email-anthony.perard@citrix.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-stable <qemu-stable@nongnu.org>,
	Alon Levy <alevy@redhat.com>, QEMU-devel <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] qxl: Fix QXLRam initialisation.
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
X-List-Received-Date: Tue, 18 Jun 2013 03:02:01 -0000

17.06.2013 20:38, Anthony PERARD wrote:
> The qxl driver expect NULL for QXLRam.memory_configs, but this is never
> initialized.
> 
> If memory is set to 0xc2c2.., it leads to a spice-critical error when
> trying to start qxl.

This bug has been introduced by:

 commit 020af1c45fec664d5d4cf3b8e5117f8bc1d691f2
 Author: Alon Levy <alevy@redhat.com>
 Date:   Wed Aug 22 11:16:25 2012 +0300

    qxl: add QXL_IO_MONITORS_CONFIG_ASYNC

which went in past 1.2.0, so it might be a good candidate for -stable
as well.

The issue looks real indeed, and is a good catch.

But maybe instead of doing it this way, we should just memset the
whole thing to 0, to avoid similar bugs in the future?  Are there
any arches out there which have cpu_to_le32(0) != 0 ?

Thanks,

/mjt

> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  hw/display/qxl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index c475cb1..937a402 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -387,6 +387,7 @@ static void init_qxl_ram(PCIQXLDevice *d)
>      d->ram->int_pending = cpu_to_le32(0);
>      d->ram->int_mask    = cpu_to_le32(0);
>      d->ram->update_surface = 0;
> +    d->ram->monitors_config = 0;
>      SPICE_RING_INIT(&d->ram->cmd_ring);
>      SPICE_RING_INIT(&d->ram->cursor_ring);
>      SPICE_RING_INIT(&d->ram->release_ring);
> 


