Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b8J7N-0001iM-Mo
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jun 2016 23:16:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1b8J7G-0001fY-Rp
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2016 23:16:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1b8J7F-0003OB-Q4
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2016 23:16:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56256)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1b8J75-0003NI-Ly; Wed, 01 Jun 2016 23:16:03 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 00B703B71B;
	Thu,  2 Jun 2016 03:16:03 +0000 (UTC)
Received: from localhost (dhcp-15-133.nay.redhat.com [10.66.15.133])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u523G1W7018833; Wed, 1 Jun 2016 23:16:02 -0400
Date: Thu, 2 Jun 2016 11:15:59 +0800
From: Fam Zheng <famz@redhat.com>
To: "Wei, Jiangang" <weijg.fnst@cn.fujitsu.com>
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-block@nongnu.org" <qemu-block@nongnu.org>,
	"mreitz@redhat.com" <mreitz@redhat.com>
Message-ID: <20160602031559.GG19448@ad.usersys.redhat.com>
References: <1464764901-8773-1-git-send-email-weijg.fnst@cn.fujitsu.com>
	<20160601072326.GF8639@ad.usersys.redhat.com>
	<1464836600.5185.7.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1464836600.5185.7.camel@localhost>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 02 Jun 2016 03:16:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/raw-posix: Fix
 error_report of mounting message
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
X-List-Received-Date: Thu, 02 Jun 2016 03:16:19 -0000

On Thu, 06/02 03:04, Wei, Jiangang wrote:
> On Wed, 2016-06-01 at 15:23 +0800, Fam Zheng wrote:
> > On Wed, 06/01 15:08, Wei Jiangang wrote:
> > > Use a single error_printf to replace triple error_report.
> > >=20
> > > Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
> > > ---
> > >  block/raw-posix.c | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/block/raw-posix.c b/block/raw-posix.c
> > > index a4f5a1b..141b01a 100644
> > > --- a/block/raw-posix.c
> > > +++ b/block/raw-posix.c
> > > @@ -2061,11 +2061,11 @@ static bool setup_cdrom(char *bsd_path, Err=
or **errp)
> > >  /* Prints directions on mounting and unmounting a device */
> > >  static void print_unmounting_directions(const char *file_name)
> > >  {
> > > -    error_report("If device %s is mounted on the desktop, unmount"
> > > -                 " it first before using it in QEMU", file_name);
> > > -    error_report("Command to unmount device: diskutil unmountDisk =
%s",
> > > -                 file_name);
> > > -    error_report("Command to mount device: diskutil mountDisk %s",=
 file_name);
> > > +    error_printf("If device %s is mounted on the desktop, unmount"
> > > +        " it first before using it in QEMU\n"
> > > +        "Command to unmount device: diskutil unmountDisk %s\n"
> > > +        "Command to mount device: diskutil mountDisk %s\n",
> > > +        file_name, file_name, file_name);
> >=20
> > I'd say it's less readable with a worse alignment to the parameters.
> Hi, Fam
>=20
> Thanks for your comment.
> You mean every error_report() followed by file_name is more readable ?
> or my codes dosen't follow a good alignment format=EF=BC=9F
>=20

I'm happy with either way. :)

Fam

