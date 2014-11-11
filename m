Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xo891-0004Pq-5G
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 04:53:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Xo88u-0004HD-Mb
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 04:53:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Xo88p-0002da-DK
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 04:53:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39745)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Xo88f-0002cY-Gs; Tue, 11 Nov 2014 04:53:29 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAB9rOPH016733
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 11 Nov 2014 04:53:24 -0500
Received: from blackfin.pond.sub.org (ovpn-116-50.ams2.redhat.com
	[10.36.116.50])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAB9rNAP023339
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 11 Nov 2014 04:53:24 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6D3F3303FEAF; Tue, 11 Nov 2014 10:53:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: <arei.gonglei@huawei.com>
References: <1415698679-4264-1-git-send-email-arei.gonglei@huawei.com>
Date: Tue, 11 Nov 2014 10:53:22 +0100
In-Reply-To: <1415698679-4264-1-git-send-email-arei.gonglei@huawei.com> (arei
	gonglei's message of "Tue, 11 Nov 2014 17:37:59 +0800")
Message-ID: <87bnoegj1p.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sysbus: Correct
	SYSTEM_BUS(obj) defines
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
X-List-Received-Date: Tue, 11 Nov 2014 09:53:49 -0000

<arei.gonglei@huawei.com> writes:

> From: Gonglei <arei.gonglei@huawei.com>
>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  include/hw/sysbus.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
> index 6175bf9..d1f3f00 100644
> --- a/include/hw/sysbus.h
> +++ b/include/hw/sysbus.h
> @@ -10,7 +10,7 @@
>  #define QDEV_MAX_PIO 32
>  
>  #define TYPE_SYSTEM_BUS "System"
> -#define SYSTEM_BUS(obj) OBJECT_CHECK(IDEBus, (obj), TYPE_IDE_BUS)
> +#define SYSTEM_BUS(obj) OBJECT_CHECK(BusState, (obj), TYPE_SYSTEM_BUS)
>  
>  typedef struct SysBusDevice SysBusDevice;

Has never been used, so this is "only" an unexploded landmine.  Hope
it's the only one of this kind.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

