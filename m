Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQYME-0002Jb-4U
	for mharc-qemu-trivial@gnu.org; Mon, 30 Sep 2013 03:57:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1VQYM6-00029q-KE
	for qemu-trivial@nongnu.org; Mon, 30 Sep 2013 03:57:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1VQYM0-0006YD-Kt
	for qemu-trivial@nongnu.org; Mon, 30 Sep 2013 03:57:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:64261)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1VQYLo-0006Ww-Eq; Mon, 30 Sep 2013 03:57:04 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8U7v3tE018018
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 30 Sep 2013 03:57:03 -0400
Received: from dhcp-200-207.str.redhat.com (dhcp-192-197.str.redhat.com
	[10.33.192.197])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with SMTP
	id r8U7uxvQ004399; Mon, 30 Sep 2013 03:57:00 -0400
Date: Mon, 30 Sep 2013 09:57:03 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130930075703.GA2507@dhcp-200-207.str.redhat.com>
References: <1380362114-29476-1-git-send-email-sw@weilnetz.de>
	<52488325.5090702@msgid.tls.msk.ru> <52488A4E.5010902@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52488A4E.5010902@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
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
X-List-Received-Date: Mon, 30 Sep 2013 07:57:28 -0000

Am 29.09.2013 um 22:15 hat Stefan Weil geschrieben:
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

And actually I think removing it would make the code worse (less
readable).

Kevin

