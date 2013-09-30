Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQZbD-0004re-AT
	for mharc-qemu-trivial@gnu.org; Mon, 30 Sep 2013 05:17:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1VQZb4-0004cn-W6
	for qemu-trivial@nongnu.org; Mon, 30 Sep 2013 05:17:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1VQZay-0005GH-UD
	for qemu-trivial@nongnu.org; Mon, 30 Sep 2013 05:16:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:9876)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1VQZam-0005CP-IE; Mon, 30 Sep 2013 05:16:36 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8U9GZbo001677
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 30 Sep 2013 05:16:35 -0400
Received: from localhost (ovpn-112-44.ams2.redhat.com [10.36.112.44])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8U9GYGM004001; Mon, 30 Sep 2013 05:16:35 -0400
Date: Mon, 30 Sep 2013 11:16:33 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130930091633.GG16558@stefanha-thinkpad.redhat.com>
References: <1380362114-29476-1-git-send-email-sw@weilnetz.de>
	<52488325.5090702@msgid.tls.msk.ru> <52488A4E.5010902@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52488A4E.5010902@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] block: Remove unused assignment (fixes
 warning from clang)
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
X-List-Received-Date: Mon, 30 Sep 2013 09:17:01 -0000

On Sun, Sep 29, 2013 at 10:15:10PM +0200, Stefan Weil wrote:
> Am 29.09.2013 21:44, schrieb Michael Tokarev:
> > 28.09.2013 13:55, Stefan Weil wrote:
> [...]
> >> diff --git a/blockdev.c b/blockdev.c
> >> index 8aa66a9..8c83f6f 100644
> >> --- a/blockdev.c
> >> +++ b/blockdev.c
> >> @@ -1926,7 +1926,6 @@ void qmp_drive_mirror(const char *device, const
> >> char *target,
> >>       } else {
> >>           switch (mode) {
> >>           case NEW_IMAGE_MODE_EXISTING:
> >> -            ret = 0;
> >>               break;
> >
> > While this one is obviously unused assignment,
> > there's on more usage of `ret' variable in this
> > function, -- it is to store the return value
> > from bdrv_open():
> >
> >     ret = bdrv_open(target_bs, target, NULL, flags |
> > BDRV_O_NO_BACKING, drv,
> >                     &local_err);
> >     if (ret < 0) {...
> >
> > What's the rule about converting that into if() ?
> >
> > Thanks,
> >
> > /mjt
> 
> Is there a rule for cases like that? This pattern is very common in QEMU
> code
> (several occurrences in blockdev.c). Should we eliminate the 'ret' variable?
> I don't think it's worth the effort.

Me neither.  There is a minor style difference between putting
everything into the if statement and using a variable to split up a
potentially complicated if statement.

Both approaches are usually okay.

Stefan

