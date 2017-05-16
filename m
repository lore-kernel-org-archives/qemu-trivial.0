Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dAXSY-0007DB-Dt
	for mharc-qemu-trivial@gnu.org; Tue, 16 May 2017 04:03:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dAXSU-0007BD-Aj
	for qemu-trivial@nongnu.org; Tue, 16 May 2017 04:03:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dAXSR-0007oY-7q
	for qemu-trivial@nongnu.org; Tue, 16 May 2017 04:03:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60994)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dAXSE-0007hd-W7; Tue, 16 May 2017 04:03:39 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A4B47753D7;
	Tue, 16 May 2017 08:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A4B47753D7
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=famz@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A4B47753D7
Received: from localhost (vpn1-5-58.pek2.redhat.com [10.72.5.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 93A865C3F8;
	Tue, 16 May 2017 08:03:33 +0000 (UTC)
Date: Tue, 16 May 2017 16:03:32 +0800
From: Fam Zheng <famz@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	"open list:raw" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Message-ID: <20170516080332.GA27669@lemon.lan>
References: <20170516074256.24731-1-kraxel@redhat.com>
	<2c224267-32ec-ccf7-ae80-113ebfdce1e2@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c224267-32ec-ccf7-ae80-113ebfdce1e2@weilnetz.de>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 16 May 2017 08:03:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/win32: fix 'ret not
 initialized' warning
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
X-List-Received-Date: Tue, 16 May 2017 08:03:55 -0000

On Tue, 05/16 09:52, Stefan Weil wrote:
> Am 16.05.2017 um 09:42 schrieb Gerd Hoffmann:
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  block/file-win32.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/block/file-win32.c b/block/file-win32.c
> > index 1a35dbabf2..8f14f0bdcd 100644
> > --- a/block/file-win32.c
> > +++ b/block/file-win32.c
> > @@ -346,6 +346,7 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
> > 
> >      if (qdict_get_try_bool(options, "locking", false)) {
> >          error_setg(errp, "locking=on is not supported on Windows");
> > +        ret = -EINVAL;
> >          goto fail;
> >      }
> 
> 
> This is a bug fix for commit 1c3a555c.
> 
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> 
> 

Thank you!

Reviewed-by: Fam Zheng <famz@redhat.com>

