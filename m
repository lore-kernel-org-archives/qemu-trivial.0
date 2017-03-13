Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cnUPY-0006r1-2f
	for mharc-qemu-trivial@gnu.org; Mon, 13 Mar 2017 14:09:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cnUPV-0006p1-Ou
	for qemu-trivial@nongnu.org; Mon, 13 Mar 2017 14:09:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cnUPU-0004Fd-SQ
	for qemu-trivial@nongnu.org; Mon, 13 Mar 2017 14:09:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40182)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1cnUPQ-0004DN-Ea; Mon, 13 Mar 2017 14:09:28 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A657B231968;
	Mon, 13 Mar 2017 18:09:28 +0000 (UTC)
Received: from localhost (ovpn-116-55.gru2.redhat.com [10.97.116.55])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v2DI9R3a007972; Mon, 13 Mar 2017 14:09:28 -0400
Date: Mon, 13 Mar 2017 15:08:07 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial@nongnu.org
Message-ID: <20170313180807.GK4694@thinpad.lan.raisama.net>
References: <20170310200550.13313-1-krzk@kernel.org>
	<20170310200550.13313-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170310200550.13313-3-krzk@kernel.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 13 Mar 2017 18:09:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 2/2] qdev: Constify local variable
 returned by blk_bs
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
X-List-Received-Date: Mon, 13 Mar 2017 18:09:34 -0000

On Fri, Mar 10, 2017 at 10:05:50PM +0200, Krzysztof Kozlowski wrote:
> Inside qdev_prop_set_drive() the value returned by blk_bs() is passed
> only as pointer to const to bdrv_get_node_name() and pointed values is
> not modified in other places so this can be made const for code
> safeness.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

Unless another maintainer wants to take this, I am queueing it
for 2.10 on my machine-next branch.

> ---
>  hw/core/qdev-properties-system.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
> index c34be1c1bace..0d40ce682d05 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -405,7 +405,7 @@ void qdev_prop_set_drive(DeviceState *dev, const char *name,
>      if (value) {
>          ref = blk_name(value);
>          if (!*ref) {
> -            BlockDriverState *bs = blk_bs(value);
> +            const BlockDriverState *bs = blk_bs(value);
>              if (bs) {
>                  ref = bdrv_get_node_name(bs);
>              }
> -- 
> 2.9.3
> 

-- 
Eduardo

