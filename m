Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmMqH-0005Ay-Gj
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 07:34:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmMqF-00058M-9U
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 07:34:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmMqE-0001np-4t
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 07:34:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53804)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UmMq8-0001mo-UK; Tue, 11 Jun 2013 07:34:17 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 244D1411FC;
	Tue, 11 Jun 2013 15:34:15 +0400 (MSK)
Message-ID: <51B70B35.3090305@msgid.tls.msk.ru>
Date: Tue, 11 Jun 2013 15:34:13 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1370927720-4348-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<1370927720-4348-4-git-send-email-lig.fnst@cn.fujitsu.com>
In-Reply-To: <1370927720-4348-4-git-send-email-lig.fnst@cn.fujitsu.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 4/5] memory: use '=' instead of '|=' for
 memory_region_update_pending
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
X-List-Received-Date: Tue, 11 Jun 2013 11:34:24 -0000

11.06.2013 09:15, liguang wrote:
> because memory_region_update_pending is bool
> 
> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> ---
>  memory.c |   18 +++++++++---------
>  1 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/memory.c b/memory.c
> index 5cb8f4a..d99eecd 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -1114,7 +1114,7 @@ void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
>  
>      memory_region_transaction_begin();
>      mr->dirty_log_mask = (mr->dirty_log_mask & ~mask) | (log * mask);
> -    memory_region_update_pending |= mr->enabled;
> +    memory_region_update_pending = mr->enabled;

This is wrong, and the original code was right.  Here and in all other places.

Thanks,

/mjt

