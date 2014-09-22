Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XVyTi-0004Cn-DV
	for mharc-qemu-trivial@gnu.org; Mon, 22 Sep 2014 03:56:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1XVyTa-0004B0-SB
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 03:56:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1XVyTU-0007h3-No
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 03:56:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48714)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1XVyTU-0007fG-GT; Mon, 22 Sep 2014 03:55:56 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8M7tklm015837
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 22 Sep 2014 03:55:46 -0400
Received: from noname.redhat.com (ovpn-116-83.ams2.redhat.com [10.36.116.83])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	SMTP id s8M7tir1018225; Mon, 22 Sep 2014 03:55:44 -0400
Date: Mon, 22 Sep 2014 09:55:43 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140922075543.GA4026@noname.redhat.com>
References: <1411053464-12666-1-git-send-email-atuvenie@cloudbasesolutions.com>
	<1411053464-12666-2-git-send-email-atuvenie@cloudbasesolutions.com>
	<541D86DC.9060701@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <541D86DC.9060701@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Adelina Tuvenie <atuvenie@cloudbasesolutions.com>,
	Adelina Tuvenie <adelinatuvenie@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 1/1] qemu-img: Cannot create fixed vhdx
	image
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
X-List-Received-Date: Mon, 22 Sep 2014 07:56:09 -0000

Am 20.09.2014 um 15:53 hat Michael Tokarev geschrieben:
> 18.09.2014 19:17, Adelina Tuvenie wrote:
> > 
> > When trying to create a fixed vhd image qemu-img will return the
> > following error:
> > 
> > qemu-img: test.vhdx: Could not create image: Cannot allocate memory
> > 
> > This happens because of a incorrect check in vhdx.c. Specifficaly,
> > in vhdx_create_bat(), after allocating memory for the BAT entry,
> > there is a check to determine if the allocation was unsuccsessful.
> > The error comes from the fact that it checks if s->bat isn't NULL,
> > which is true in case of succsessful allocation,  and exits with
> > error ENOMEM.
> 
> Applying to -trivial, as it is an obvious trivial one-liner, hopefully
> it's okay for kwolf@ and stefanha@.  But please,
> 
>  - Cc qemu-devel and the subsystem maintainers (Cc'ed)
>  - do not send an "intro" email for single patches
>  - do not attach the patch, place it inline if possible
> 
> (Since the original patch was in an attachment, I copy it here for
> completness:
> 
> diff --git a/block/vhdx.c b/block/vhdx.c
> index 796b7bd..5bf292e 100644
> --- a/block/vhdx.c
> +++ b/block/vhdx.c
> @@ -1593,7 +1593,7 @@ static int vhdx_create_bat(BlockDriverState *bs, BDRVVHDXState *s,
>                  bdrv_has_zero_init(bs) == 0) {
>          /* for a fixed file, the default BAT entry is not zero */
>          s->bat = g_try_malloc0(length);
> -        if (length && s->bat != NULL) {
> +        if (length && s->bat == NULL) {
>              ret = -ENOMEM;
>              goto exit;
>          }
> )

Whoops, this is what happens when you make mechanical changes manually.
And I fooled two reviewers with this code. :-)

Acked-by: Kevin Wolf <kwolf@redhat.com>

