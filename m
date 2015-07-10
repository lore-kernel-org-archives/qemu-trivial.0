Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZDdNN-00027y-UZ
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jul 2015 14:50:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1ZDdNI-00023V-86
	for qemu-trivial@nongnu.org; Fri, 10 Jul 2015 14:50:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1ZDdNC-0005ac-LW
	for qemu-trivial@nongnu.org; Fri, 10 Jul 2015 14:50:16 -0400
Received: from e32.co.us.ibm.com ([32.97.110.150]:59278)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1ZDdNC-0005aT-Dq
	for qemu-trivial@nongnu.org; Fri, 10 Jul 2015 14:50:10 -0400
Received: from /spool/local
	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mdroth@linux.vnet.ibm.com>;
	Fri, 10 Jul 2015 12:50:09 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
	by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 10 Jul 2015 12:50:07 -0600
X-Helo: d03dlp01.boulder.ibm.com
X-MailFrom: mdroth@linux.vnet.ibm.com
X-RcptTo: qemu-trivial@nongnu.org
Received: from b03cxnp08027.gho.boulder.ibm.com
	(b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 7B4C01FF0043;
	Fri, 10 Jul 2015 12:41:17 -0600 (MDT)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t6AIo67636110542; Fri, 10 Jul 2015 11:50:07 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])
	by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP
	id t6AIo6Z6014935; Fri, 10 Jul 2015 12:50:06 -0600
Received: from localhost ([9.41.105.109])
	by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t6AIo4s7014839; Fri, 10 Jul 2015 12:50:04 -0600
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: <arei.gonglei@huawei.com>, qemu-devel@nongnu.org
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <1436489490-236-3-git-send-email-arei.gonglei@huawei.com>
References: <1436489490-236-1-git-send-email-arei.gonglei@huawei.com>
	<1436489490-236-3-git-send-email-arei.gonglei@huawei.com>
Message-ID: <20150710184950.22411.10593@loki>
User-Agent: alot/0.3.6
Date: Fri, 10 Jul 2015 13:49:50 -0500
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15071018-0005-0000-0000-0000137FBF6B
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 32.97.110.150
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>
Subject: Re: [Qemu-trivial] [PATCH 2/4] ppc/spapr_drc: fix memory leak
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
X-List-Received-Date: Fri, 10 Jul 2015 18:50:17 -0000

Quoting arei.gonglei@huawei.com (2015-07-09 19:51:28)
> From: Gonglei <arei.gonglei@huawei.com>
> =

> fix CID 1311373.
> =

> Signed-off-by: Gonglei <arei.gonglei@huawei.com>

Reviewed-by: Michael Roth <mdroth@linux.vnet.ibm.com>

> ---
>  hw/ppc/spapr_drc.c | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index ef98538..ee87432 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -422,6 +422,7 @@ static void realize(DeviceState *d, Error **errp)
>          error_free(err);
>          object_unref(OBJECT(drc));
>      }
> +    g_free(child_name);
>      DPRINTFN("drc realize complete");
>  }
> =

> -- =

> 1.7.12.4
> =

> =

>=20


