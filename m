Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RlOhh-0001Ly-7U
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2012 12:44:45 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RlOhZ-0000uV-9P
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 12:44:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RlOhY-0005YC-8g
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 12:44:37 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:49753)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1RlOhR-0005XD-6s; Thu, 12 Jan 2012 12:44:29 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	E479C728000F; Thu, 12 Jan 2012 18:44:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id EkNq17ur95ID; Thu, 12 Jan 2012 18:44:27 +0100 (CET)
Received: from [192.168.178.20] (p54ADA5C1.dip.t-dialin.net [84.173.165.193])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	922FE728000D; Thu, 12 Jan 2012 18:44:27 +0100 (CET)
Message-ID: <4F0F1BFB.5070509@weilnetz.de>
Date: Thu, 12 Jan 2012 18:44:27 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.24) Gecko/20111108 Thunderbird/3.1.16
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
References: <1326377824-23776-1-git-send-email-stefanha@linux.vnet.ibm.com>
In-Reply-To: <1326377824-23776-1-git-send-email-stefanha@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, andrew.zaborowski@intel.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] bt-host: add missing break
	statement
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
X-List-Received-Date: Thu, 12 Jan 2012 17:44:43 -0000

Am 12.01.2012 15:17, schrieb Stefan Hajnoczi:
> The switch statement in bt_host_read() is missing a break in one case.
> Andrzej Zaborowski <andrew.zaborowski@intel.com> confirmed that this is
> not an intentional fall-through.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
> ---
> bt-host.c | 1 +
> 1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/bt-host.c b/bt-host.c
> index df5b7cd..0d3ad28 100644
> --- a/bt-host.c
> +++ b/bt-host.c
> @@ -130,6 +130,7 @@ static void bt_host_read(void *opaque)
> pktlen = MIN(pkt[2] + 3, s->len);
> s->len -= pktlen;
> pkt += pktlen;
> + break;
>
> default:
> bad_pkt:

Reviewed-by: Stefan Weil <sw@weilnetz.de>


