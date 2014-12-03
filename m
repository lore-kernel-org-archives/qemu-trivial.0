Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xw7CS-0006NW-6s
	for mharc-qemu-trivial@gnu.org; Wed, 03 Dec 2014 05:30:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Xw7CK-00069W-GW
	for qemu-trivial@nongnu.org; Wed, 03 Dec 2014 05:30:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Xw7CE-0004aV-D3
	for qemu-trivial@nongnu.org; Wed, 03 Dec 2014 05:30:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55530)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1Xw7CE-0004aQ-6V; Wed, 03 Dec 2014 05:30:10 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB3AU8f9030616
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 3 Dec 2014 05:30:09 -0500
Received: from [10.36.112.40] (ovpn-112-40.ams2.redhat.com [10.36.112.40])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB3AU4LQ013894
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Wed, 3 Dec 2014 05:30:06 -0500
Message-ID: <547EE62B.3070004@redhat.com>
Date: Wed, 03 Dec 2014 11:30:03 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1417602482-8832-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1417602482-8832-1-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Drop superfluous conditionals around
	qemu_opts_del()
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
X-List-Received-Date: Wed, 03 Dec 2014 10:30:23 -0000



On 03/12/2014 11:28, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/core/qdev.c | 4 +---
>  qemu-char.c    | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
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
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

