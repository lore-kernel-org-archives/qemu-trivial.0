Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1alb57-0007uz-8z
	for mharc-qemu-trivial@gnu.org; Thu, 31 Mar 2016 07:48:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1alb53-0007qb-Ss
	for qemu-trivial@nongnu.org; Thu, 31 Mar 2016 07:48:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1alb52-0002SH-QN
	for qemu-trivial@nongnu.org; Thu, 31 Mar 2016 07:48:05 -0400
Received: from smtp3.mundo-r.com ([212.51.32.191]:43080 helo=smtp4.mundo-r.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>)
	id 1alb4x-0002Mk-68; Thu, 31 Mar 2016 07:47:59 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2AWAgCVDf1W/5tjdVtdGgEBAYMXgVCnCwUBgREBkGOCDwENgXCGDQKBPDgUAQEBAQEBAWUnhEIBAQRnEhALGAklDwEsGxmIKwHCBwEBAQEBBQEBAQEchVaFDoQDgQeFCgWXco9ujSeGGIh9HgEBQoNpOjCIbQEBAQ
X-IPAS-Result: A2AWAgCVDf1W/5tjdVtdGgEBAYMXgVCnCwUBgREBkGOCDwENgXCGDQKBPDgUAQEBAQEBAWUnhEIBAQRnEhALGAklDwEsGxmIKwHCBwEBAQEBBQEBAQEchVaFDoQDgQeFCgWXco9ujSeGGIh9HgEBQoNpOjCIbQEBAQ
X-IronPort-AV: E=Sophos;i="5.24,422,1454972400"; d="scan'208";a="123866529"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 31 Mar 2016 13:47:56 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1alb4u-0007cA-Ld; Thu, 31 Mar 2016 13:47:56 +0200
Received: from berto by mail.igalia.com with local (Exim)
	id 1alb4u-0005mC-J5; Thu, 31 Mar 2016 13:47:56 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
In-Reply-To: <1456217065-5465-1-git-send-email-berto@igalia.com>
References: <1456217065-5465-1-git-send-email-berto@igalia.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
	(i586-pc-linux-gnu)
Date: Thu, 31 Mar 2016 13:47:56 +0200
Message-ID: <w51h9fmq36b.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.51.32.191
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] ipack: Update e-mail address
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
X-List-Received-Date: Thu, 31 Mar 2016 11:48:07 -0000

ping 2 ...

On Tue 23 Feb 2016 09:44:25 AM CET, Alberto Garcia wrote:
> I'm not really using the old one anymore.
>
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>  hw/char/ipoctal232.c     | 2 +-
>  hw/ipack/ipack.c         | 2 +-
>  hw/ipack/tpci200.c       | 2 +-
>  include/hw/ipack/ipack.h | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/char/ipoctal232.c b/hw/char/ipoctal232.c
> index bc0ae49..9ead32a 100644
> --- a/hw/char/ipoctal232.c
> +++ b/hw/char/ipoctal232.c
> @@ -2,7 +2,7 @@
>   * QEMU GE IP-Octal 232 IndustryPack emulation
>   *
>   * Copyright (C) 2012 Igalia, S.L.
> - * Author: Alberto Garcia <agarcia@igalia.com>
> + * Author: Alberto Garcia <berto@igalia.com>
>   *
>   * This code is licensed under the GNU GPL v2 or (at your option) any
>   * later version.
> diff --git a/hw/ipack/ipack.c b/hw/ipack/ipack.c
> index 7c5c30d..4967351 100644
> --- a/hw/ipack/ipack.c
> +++ b/hw/ipack/ipack.c
> @@ -2,7 +2,7 @@
>   * QEMU IndustryPack emulation
>   *
>   * Copyright (C) 2012 Igalia, S.L.
> - * Author: Alberto Garcia <agarcia@igalia.com>
> + * Author: Alberto Garcia <berto@igalia.com>
>   *
>   * This code is licensed under the GNU GPL v2 or (at your option) any
>   * later version.
> diff --git a/hw/ipack/tpci200.c b/hw/ipack/tpci200.c
> index fdda6f4..4dfa6b3 100644
> --- a/hw/ipack/tpci200.c
> +++ b/hw/ipack/tpci200.c
> @@ -2,7 +2,7 @@
>   * QEMU TEWS TPCI200 IndustryPack carrier emulation
>   *
>   * Copyright (C) 2012 Igalia, S.L.
> - * Author: Alberto Garcia <agarcia@igalia.com>
> + * Author: Alberto Garcia <berto@igalia.com>
>   *
>   * This code is licensed under the GNU GPL v2 or (at your option) any
>   * later version.
> diff --git a/include/hw/ipack/ipack.h b/include/hw/ipack/ipack.h
> index e95ffe8..e33e032 100644
> --- a/include/hw/ipack/ipack.h
> +++ b/include/hw/ipack/ipack.h
> @@ -2,7 +2,7 @@
>   * QEMU IndustryPack emulation
>   *
>   * Copyright (C) 2012 Igalia, S.L.
> - * Author: Alberto Garcia <agarcia@igalia.com>
> + * Author: Alberto Garcia <berto@igalia.com>
>   *
>   * This code is licensed under the GNU GPL v2 or (at your option) any
>   * later version.
> -- 
> 2.7.0

