Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YSPFx-0000uz-Ks
	for mharc-qemu-trivial@gnu.org; Mon, 02 Mar 2015 07:15:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YSPFp-0000p8-Br
	for qemu-trivial@nongnu.org; Mon, 02 Mar 2015 07:15:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YSPFo-0003fK-LH
	for qemu-trivial@nongnu.org; Mon, 02 Mar 2015 07:15:21 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48844)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YSPFi-0003eH-3G; Mon, 02 Mar 2015 07:15:14 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 58AE0402C1;
	Mon,  2 Mar 2015 15:15:11 +0300 (MSK)
Message-ID: <54F4544F.6000602@msgid.tls.msk.ru>
Date: Mon, 02 Mar 2015 15:15:11 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1425146983-16015-1-git-send-email-sw@weilnetz.de>
	<1425146983-16015-2-git-send-email-sw@weilnetz.de>
In-Reply-To: <1425146983-16015-2-git-send-email-sw@weilnetz.de>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Amit Shah <amit.shah@redhat.com>, QEMU Developer <qemu-devel@nongnu.org>,
	Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 1/3] migration: Fix coding style
	(whitespace issues)
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
X-List-Received-Date: Mon, 02 Mar 2015 12:15:27 -0000

28.02.2015 21:09, Stefan Weil wrote:
> * Remove trailing whitespace (fixes 9 errors from checkpatch.pl).
>   One comment line was longer than 80 characters, so wrap it
>   and fix a typo, too.
> * Replace tabs by blanks (fixes 1 error).

This hunk:

> @@ -2421,7 +2421,7 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
>                          continue;
>                      }
>                  }
> -                    
> +
>                  goto listen;
>              }


clashes with my earlier attemt to clean up this code, I rewrote
this loop a bit to avoid this "twisted" usage of gotos.
I'll apply this patch without this change.

Thanks,

/mjt

