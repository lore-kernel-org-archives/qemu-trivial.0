Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgPsn-0006HI-Op
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jun 2019 04:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53496)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hgPsk-000685-S9
 for qemu-trivial@nongnu.org; Thu, 27 Jun 2019 04:35:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hgPsj-0003k6-RA
 for qemu-trivial@nongnu.org; Thu, 27 Jun 2019 04:35:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60118)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hgPsf-0003FV-GH; Thu, 27 Jun 2019 04:35:45 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 238563082200;
 Thu, 27 Jun 2019 08:34:59 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-154.ams2.redhat.com
 [10.36.116.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A40965D71B;
 Thu, 27 Jun 2019 08:34:55 +0000 (UTC)
Date: Thu, 27 Jun 2019 10:34:53 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Qemu-Trivial <qemu-trivial@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, radmehrsaeed7@gmail.com
Message-ID: <20190627083453.GC5618@localhost.localdomain>
References: <20190626215301.30733-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626215301.30733-1-jsnow@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 27 Jun 2019 08:34:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] block/qcow: Improve error when opening
 qcow2 files as qcow
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Jun 2019 08:35:52 -0000

Am 26.06.2019 um 23:53 hat John Snow geschrieben:
> Reported-by: radmehrsaeed7@gmail.com
> Fixes: https://bugs.launchpad.net/bugs/1832914
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  block/qcow.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/block/qcow.c b/block/qcow.c
> index 6dee5bb792..a9cb6ae0bd 100644
> --- a/block/qcow.c
> +++ b/block/qcow.c
> @@ -156,7 +156,12 @@ static int qcow_open(BlockDriverState *bs, QDict *options, int flags,
>          goto fail;
>      }
>      if (header.version != QCOW_VERSION) {
> -        error_setg(errp, "Unsupported qcow version %" PRIu32, header.version);
> +        error_setg(errp, "qcow (v%d) does not support qcow version %" PRIu32,
> +                   QCOW_VERSION, header.version);
> +        if (header.version == 2 || header.version == 3) {
> +            error_append_hint(errp, "Try the 'qcow2' driver instead.");

I think we want a \n at the end here.

Kevin

