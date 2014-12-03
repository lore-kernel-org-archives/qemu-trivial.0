Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xw7Fg-0003cB-UW
	for mharc-qemu-trivial@gnu.org; Wed, 03 Dec 2014 05:33:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xw7Fa-0003Qt-0Q
	for qemu-trivial@nongnu.org; Wed, 03 Dec 2014 05:33:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xw7FV-0005Va-3T
	for qemu-trivial@nongnu.org; Wed, 03 Dec 2014 05:33:37 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:23649)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xw7FK-0005Rc-7O; Wed, 03 Dec 2014 05:33:22 -0500
Received: from 172.24.2.119 (EHLO szxeml417-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AYC60536; Wed, 03 Dec 2014 18:33:09 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml417-hub.china.huawei.com
	(10.82.67.156) with Microsoft SMTP Server id 14.3.158.1; Wed, 3 Dec 2014
	18:33:04 +0800
Message-ID: <547EE6DE.2090703@huawei.com>
Date: Wed, 3 Dec 2014 18:33:02 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1417602482-8832-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1417602482-8832-1-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020207.547EE6E5.0160, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 9a1fc1d0779668b9fe9b97a6ff34b423
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Drop superfluous
	conditionals around qemu_opts_del()
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
X-List-Received-Date: Wed, 03 Dec 2014 10:33:43 -0000

On 2014/12/3 18:28, Markus Armbruster wrote:

> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/core/qdev.c | 4 +---
>  qemu-char.c    | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 

Reviewed-by: Gonglei <arei.gonglei@huawei.com>

> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 35fd00d..901f289 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -1141,9 +1141,7 @@ static void device_finalize(Object *obj)
>      NamedGPIOList *ngl, *next;
>  
>      DeviceState *dev = DEVICE(obj);
> -    if (dev->opts) {
> -        qemu_opts_del(dev->opts);
> -    }
> +    qemu_opts_del(dev->opts);
>  
>      QLIST_FOREACH_SAFE(ngl, &dev->gpios, node, next) {
>          QLIST_REMOVE(ngl, node);
> diff --git a/qemu-char.c b/qemu-char.c
> index a8b01da..ef84b53 100644
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -3825,9 +3825,7 @@ void qemu_chr_delete(CharDriverState *chr)
>      }
>      g_free(chr->filename);
>      g_free(chr->label);
> -    if (chr->opts) {
> -        qemu_opts_del(chr->opts);
> -    }
> +    qemu_opts_del(chr->opts);
>      g_free(chr);
>  }
>  




