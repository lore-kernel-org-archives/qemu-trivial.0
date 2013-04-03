Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UNHan-0006Jn-Nk
	for mharc-qemu-trivial@gnu.org; Wed, 03 Apr 2013 02:54:45 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1UNHal-0006HA-Nq
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 02:54:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1UNHak-0006iB-JY
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 02:54:43 -0400
Received: from mail-ea0-x229.google.com ([2a00:1450:4013:c01::229]:58692)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1UNHah-0006h3-4l; Wed, 03 Apr 2013 02:54:39 -0400
Received: by mail-ea0-f169.google.com with SMTP id n15so540242ead.28
	for <multiple recipients>; Tue, 02 Apr 2013 23:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=VewULC1J6Zvkb0o7YCXidyjjf9Q7OlzUcVhxYf9w7JQ=;
	b=KfF6Xhqz6/Dne1lG7dGIzfWft7cSGtFapnbP+xL1dvKKFCfwkUKo0K0UdHlZ8Crpr9
	m/s5QLcTY+5SlhE7Q2EpM+SNO2k0wUapSH4Ispc6y1v2Vv9uE7EhsjBkRqzlF1p1iIiv
	Hc6i5hkhBa/I4Ecm53t6H6BK5XuWamrqvooNaUk9yvf1tbc66+V+qnm83Ex/HdUGtnpq
	csqDmNXEHZ2nNtVm0urUHT7fi4OZ5ZVWMQ2i18GK4EIFu9I0lz8h054zQ9bZRTKQzY9A
	CbEFh2zpZi7BBDaSpJz8Vaqu0zSm9T6qlYaOwkVsjld3hhT1kuHCce8+dmhvfMuQyu2/
	XAqw==
X-Received: by 10.14.216.2 with SMTP id f2mr948502eep.44.1364972077758;
	Tue, 02 Apr 2013 23:54:37 -0700 (PDT)
Received: from localhost (h59ec325f.selukar.dyn.perspektivbredband.net.
	[89.236.50.95])
	by mx.google.com with ESMTPS id d47sm6577061eem.9.2013.04.02.23.54.36
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 23:54:37 -0700 (PDT)
Date: Wed, 3 Apr 2013 08:50:56 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Message-ID: <20130403065056.GD21321@smtp.vpn>
References: <cover.1364961975.git.peter.crosthwaite@xilinx.com>
	<ef1ea44a6c6f5d9846c3492006094044bbd805c3.1364961975.git.peter.crosthwaite@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef1ea44a6c6f5d9846c3492006094044bbd805c3.1364961975.git.peter.crosthwaite@xilinx.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::229
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1 1/4] m25p80: Fix debug
	messages.
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
X-List-Received-Date: Wed, 03 Apr 2013 06:54:44 -0000

On Wed, Apr 03, 2013 at 02:09:16PM +1000, Peter Crosthwaite wrote:
> Some dodgy casts were making a mess of these msgs.


Hi Peter

> 
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> ---
> 
>  hw/m25p80.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/m25p80.c b/hw/m25p80.c
> index 55e9d0d..34b476b 100644
> --- a/hw/m25p80.c
> +++ b/hw/m25p80.c
> @@ -538,15 +538,15 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint32_t tx)
>      switch (s->state) {
>  
>      case STATE_PAGE_PROGRAM:
> -        DB_PRINT("page program cur_addr=%lx data=%x\n", s->cur_addr,
> -                 (uint8_t)tx);
> +        DB_PRINT("page program cur_addr=%lx data=%x\n", (unsigned)s->cur_addr,

Shouldn't this be using PRIx64 for cur_addr?


> +                 (unsigned)(uint8_t)tx);
>          flash_write8(s, s->cur_addr, (uint8_t)tx);
>          s->cur_addr++;
>          break;
>  
>      case STATE_READ:
>          r = s->storage[s->cur_addr];
> -        DB_PRINT("READ 0x%lx=%x\n", s->cur_addr, r);
> +        DB_PRINT("READ 0x%lx=%x\n", (unsigned)s->cur_addr, (unsigned)r);


same here.


>          s->cur_addr = (s->cur_addr + 1) % s->size;
>          break;
>  
> -- 
> 1.7.0.4
> 
> 

