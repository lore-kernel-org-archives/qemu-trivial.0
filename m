Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UT7kR-00033T-4a
	for mharc-qemu-trivial@gnu.org; Fri, 19 Apr 2013 05:36:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UT7kO-0002z4-3B
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 05:36:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UT7kM-0005Xa-85
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 05:36:48 -0400
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a]:38947)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UT7kM-0005X5-1h; Fri, 19 Apr 2013 05:36:46 -0400
Received: by mail-wi0-f170.google.com with SMTP id l13so634751wie.3
	for <multiple recipients>; Fri, 19 Apr 2013 02:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=wD8hBW12brs+xEM9FBVD0rEuQHf48CHfm+6E/tfD6UU=;
	b=gbUH5dFHwO0NwuyBRZpdqNFQDiD2P1WFyPyggyrLtjdPTvhOtji0Kf7RLU1sLlmZY2
	hjU0hTJQw3yvFUQitJQNKvvd3/awKLqgRUcviaNidq6UofNC5ejM3O/IstbuyppBLuNo
	JV4ZE0waDpF+YvOUu/uNwnUp5LsMfGh1y3wqWawD/+zDr/OvQQS5uQBWASfEElNos+fc
	+YqKOm6aUTV5YVeECXhDrOwakiQ8yvaOEd2XGd5WFCok9wES4A227LNQ+v8m7S3SUiUE
	hNYttQV62RK1jsfyrakEiOogJ9+1cT1tto4EgjZqBPpBFx4HmwraOFWK1MA7ihB+t177
	qibw==
X-Received: by 10.180.94.100 with SMTP id db4mr23962101wib.17.1366364205108;
	Fri, 19 Apr 2013 02:36:45 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:f833:9039:bb71:5207])
	by mx.google.com with ESMTPS id d8sm2372943wiv.10.2013.04.19.02.36.43
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 02:36:44 -0700 (PDT)
Date: Fri, 19 Apr 2013 11:36:42 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130419093642.GC30143@stefanha-thinkpad.redhat.com>
References: <1365792838-13621-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1365792838-13621-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22a
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Remove unneeded type casts
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
X-List-Received-Date: Fri, 19 Apr 2013 09:36:50 -0000

On Fri, Apr 12, 2013 at 08:53:58PM +0200, Stefan Weil wrote:
> cpu_physical_memory_read, cpu_physical_memory_write take any pointer
> as 2nd argument without needing a type cast.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/arm/armv7m.c            |   12 ++++++------
>  hw/arm/boot.c              |    4 ++--
>  hw/arm/musicpal.c          |    8 ++++----
>  hw/arm/nseries.c           |    4 ++--
>  hw/arm/omap1.c             |   12 ++++++------
>  hw/audio/marvell_88w8618.c |    3 +--
>  hw/display/pxa2xx_lcd.c    |    2 +-
>  hw/dma/pxa2xx_dma.c        |    2 +-
>  hw/dma/xilinx_axidma.c     |    4 ++--
>  hw/gpio/zaurus.c           |    2 +-
>  hw/microblaze/boot.c       |    2 +-
>  hw/misc/macio/mac_dbdma.c  |    8 ++++----
>  hw/misc/milkymist-pfpu.c   |    4 ++--
>  hw/net/mcf_fec.c           |    4 ++--
>  hw/ppc/ppc405_boards.c     |    2 +-
>  hw/ppc/virtex_ml507.c      |    2 +-
>  16 files changed, 37 insertions(+), 38 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

