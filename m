Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VpMZq-0006GX-T2
	for mharc-qemu-trivial@gnu.org; Sat, 07 Dec 2013 13:26:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VpMZk-00068H-4G
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 13:26:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VpMZf-0003Jp-8h
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 13:26:00 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46348)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VpMZU-0003J5-JW; Sat, 07 Dec 2013 13:25:44 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CD98D40CDB;
	Sat,  7 Dec 2013 22:25:43 +0400 (MSK)
Message-ID: <52A36827.7090104@msgid.tls.msk.ru>
Date: Sat, 07 Dec 2013 22:25:43 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1386425352-23728-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1386425352-23728-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] qxl: Add missing trace.h (fix broken
	build)
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
X-List-Received-Date: Sat, 07 Dec 2013 18:26:05 -0000

07.12.2013 18:09, Stefan Weil wrote:
> Commit ac86048bcd41129b18702ba63395f222871804de removed trace.h from
> console.h and ignored the fact that qxl-render.c needs this file
> (it includes qxl.h which includes console.h which included trace.h).
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> Sorry for this regression. Obviously most builds don't set CONFIG_QXL.

I actually thought I enabled QXL in build when testing stuff initially.
However, as it turned out, I disabled it due to other reason, and forgot
about this...  Oh well.. ;)

Thanks, applied to trivial-patches queue.  I think an urgent pull request
is needed, unless this can be applied directly.

/mjt

