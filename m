Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XknRm-00039H-9f
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 01:11:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XknRf-00031H-EX
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:11:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XknRa-0000e8-HT
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:11:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50499)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XknRQ-0000dR-JO; Sun, 02 Nov 2014 01:11:04 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1328B40231;
	Sun,  2 Nov 2014 08:11:03 +0300 (MSK)
Message-ID: <5455BCE6.5080804@msgid.tls.msk.ru>
Date: Sun, 02 Nov 2014 08:11:02 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1414735861-1232-1-git-send-email-arei.gonglei@huawei.com>
	<1414735861-1232-3-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1414735861-1232-3-git-send-email-arei.gonglei@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 2/2] tap: fix possible fd leak
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
X-List-Received-Date: Sun, 02 Nov 2014 05:11:24 -0000

31.10.2014 09:11, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> In hotplugging scenario, taking those true branch, the file
> handler do not be closed. Adding cleanup logic for them.
> 
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  net/tap.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/net/tap.c b/net/tap.c
> index 7bcd4c7..3cfbee8 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -796,7 +796,7 @@ int net_init_tap(const NetClientOptions *opts, const char *name,
>          if (net_init_tap_one(tap, peer, "bridge", name, ifname,
>                               script, downscript, vhostfdname,
>                               vnet_hdr, fd)) {
> -            return -1;
> +            goto fail;
>          }
>      } else {
>          if (tap->has_vhostfds) {
> @@ -823,7 +823,7 @@ int net_init_tap(const NetClientOptions *opts, const char *name,
>              if (queues > 1 && i == 0 && !tap->has_ifname) {
>                  if (tap_fd_get_ifname(fd, ifname)) {
>                      error_report("Fail to get ifname");
> -                    return -1;
> +                    goto fail;
>                  }
>              }
>  
> @@ -831,12 +831,18 @@ int net_init_tap(const NetClientOptions *opts, const char *name,
>                                   i >= 1 ? "no" : script,
>                                   i >= 1 ? "no" : downscript,
>                                   vhostfdname, vnet_hdr, fd)) {
> -                return -1;
> +                goto fail;
>              }
>          }
>      }
>  
>      return 0;
> +
> +fail:
> +    if (fd != -1) {
> +        close(fd);
> +    }
> +    return -1;
>  }

I think, given the somewhat "hairy" nature of net_init_tap() function, which
has many error returns which should not close fd and just 3 which should, it
is better to add explicit close(fd) in these 3 places.

Besides, why do you check for fd != -1 in the fail path?  You added the goto
into the 3 places, all of them has fd != -1, and there's no other ways to
reach this place.  Are you not certain that fd will be valid here?  If yes,
I think this is yet another argument for adding close()s into the 3 places.

Thanks,

/mjt

