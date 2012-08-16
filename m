Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1zJ9-00070D-KF
	for mharc-qemu-trivial@gnu.org; Thu, 16 Aug 2012 08:36:15 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1T1zJ4-0006m6-4t
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2012 08:36:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1T1zJ3-0006cS-1y
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2012 08:36:09 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:56109)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1T1zIu-0006VS-E1; Thu, 16 Aug 2012 08:36:00 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	711CF728002C; Thu, 16 Aug 2012 14:35:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id wx6Ef7EUqdse; Thu, 16 Aug 2012 14:35:58 +0200 (CEST)
Received: from [192.168.3.38] (p548B89E9.dip0.t-ipconnect.de [84.139.137.233])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	EF8E67280027; Thu, 16 Aug 2012 14:35:57 +0200 (CEST)
Message-ID: <502CE924.80205@weilnetz.de>
Date: Thu, 16 Aug 2012 14:35:48 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
References: <1344629007-23311-1-git-send-email-sw@weilnetz.de>
	<1344629007-23311-2-git-send-email-sw@weilnetz.de>
In-Reply-To: <1344629007-23311-2-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Fix spelling (licenced -> licensed) in
	GPL
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
X-List-Received-Date: Thu, 16 Aug 2012 12:36:14 -0000

Ping?

Am 10.08.2012 22:03, schrieb Stefan Weil:
> The patch also fixes the case of "written".
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   hw/imx_avic.c  |    4 ++--
>   hw/imx_timer.c |    4 ++--
>   hw/kzm.c       |    2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/imx_avic.c b/hw/imx_avic.c
> index 4f010e8..b1a8fe6 100644
> --- a/hw/imx_avic.c
> +++ b/hw/imx_avic.c
> @@ -6,9 +6,9 @@
>    *
>    * Copyright (c) 2008 OKL
>    * Copyright (c) 2011 NICTA Pty Ltd
> - * Originally Written by Hans Jiang
> + * Originally written by Hans Jiang
>    *
> - * This code is licenced under the GPL version 2 or later.  See
> + * This code is licensed under the GPL version 2 or later.  See
>    * the COPYING file in the top-level directory.
>    *
>    * TODO: implement vectors.
> diff --git a/hw/imx_timer.c b/hw/imx_timer.c
> index 16215cc..c28c537 100644
> --- a/hw/imx_timer.c
> +++ b/hw/imx_timer.c
> @@ -3,10 +3,10 @@
>    *
>    * Copyright (c) 2008 OK Labs
>    * Copyright (c) 2011 NICTA Pty Ltd
> - * Originally Written by Hans Jiang
> + * Originally written by Hans Jiang
>    * Updated by Peter Chubb
>    *
> - * This code is licenced under GPL version 2 or later.  See
> + * This code is licensed under GPL version 2 or later.  See
>    * the COPYING file in the top-level directory.
>    *
>    */
> diff --git a/hw/kzm.c b/hw/kzm.c
> index 6a5e9df..68cd1b4 100644
> --- a/hw/kzm.c
> +++ b/hw/kzm.c
> @@ -5,7 +5,7 @@
>    * Written by Hans at OK-Labs
>    * Updated by Peter Chubb.
>    *
> - * This code is licenced under the GPL, version 2 or later.
> + * This code is licensed under the GPL, version 2 or later.
>    * See the file `COPYING' in the top level directory.
>    *
>    * It (partially) emulates a Kyoto Microcomputer


