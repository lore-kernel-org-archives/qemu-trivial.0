Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bDDmP-0002mf-L4
	for mharc-qemu-trivial@gnu.org; Wed, 15 Jun 2016 12:35:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1bDDmJ-0002ji-S6
	for qemu-trivial@nongnu.org; Wed, 15 Jun 2016 12:34:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1bDDmI-0000bZ-TK
	for qemu-trivial@nongnu.org; Wed, 15 Jun 2016 12:34:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1bDDm6-0000VP-8l; Wed, 15 Jun 2016 12:34:42 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D43C98F264;
	Wed, 15 Jun 2016 16:34:41 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-104.phx2.redhat.com
	[10.3.116.104])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5FGYerc020245; Wed, 15 Jun 2016 12:34:40 -0400
To: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
	<1466007277-17525-6-git-send-email-lvivier@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <902c6fb3-967e-9643-5df9-853a83c25649@redhat.com>
Date: Wed, 15 Jun 2016 18:34:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1466007277-17525-6-git-send-email-lvivier@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 15 Jun 2016 16:34:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 5/7] fw_cfg: remove useless casts
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jun 2016 16:34:56 -0000

On 06/15/16 18:14, Laurent Vivier wrote:
> This patch is the result of coccinelle script
> scripts/coccinelle/typecast.cocci
> 
> CC: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/nvram/fw_cfg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 74a0079..9d84129 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -180,7 +180,7 @@ static void fw_cfg_bootsplash(FWCfgState *s)
>          temp = qemu_opt_get(opts, "splash-time");
>          if (temp != NULL) {
>              p = (char *)temp;
> -            boot_splash_time = strtol(p, (char **)&p, 10);
> +            boot_splash_time = strtol(p, &p, 10);
>          }
>      }
>  
> @@ -240,7 +240,7 @@ static void fw_cfg_reboot(FWCfgState *s)
>          temp = qemu_opt_get(opts, "reboot-timeout");
>          if (temp != NULL) {
>              p = (char *)temp;
> -            reboot_timeout = strtol(p, (char **)&p, 10);
> +            reboot_timeout = strtol(p, &p, 10);
>          }
>      }
>      /* validate the input */
> 

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

