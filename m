Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVKpY-0007qq-SM
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 10:08:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1YVKpS-0007pd-7o
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 10:08:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1YVKpN-0000xU-Hw
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 10:08:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33942)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1YVKpD-0000me-R2; Tue, 10 Mar 2015 10:08:00 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2AE7sAq001200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 10 Mar 2015 10:07:54 -0400
Received: from noname.str.redhat.com (dhcp-192-197.str.redhat.com
	[10.33.192.197])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2AE7qLt026135; Tue, 10 Mar 2015 10:07:52 -0400
Date: Tue, 10 Mar 2015 15:07:51 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150310140751.GG3770@noname.str.redhat.com>
References: <1425971164-9845-1-git-send-email-mjt@msgid.tls.msk.ru>
	<20150310085016.GC3770@noname.str.redhat.com>
	<20150310091759.GC14320@ad.nay.redhat.com>
	<20150310100936.GD3770@noname.str.redhat.com>
	<CAJSP0QWk+KzGuR2e6m8KsCUbMqcU6cReQbp2231zf9+Nt8zF9g@mail.gmail.com>
	<54FEF942.5010602@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <54FEF942.5010602@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	t2AE7sAq001200
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Fam Zheng <famz@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial <qemu-trivial@nongnu.org>,
	Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, Peter Wu <peter@lekensteyn.nl>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH] block/dmg: make it modular
 if using additional library
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
X-List-Received-Date: Tue, 10 Mar 2015 14:08:19 -0000

Am 10.03.2015 um 15:01 hat Michael Tokarev geschrieben:
> 10.03.2015 16:58, Stefan Hajnoczi =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Mar 10, 2015 at 10:09 AM, Kevin Wolf <kwolf@redhat.com> wrote=
:
> >> Am 10.03.2015 um 10:17 hat Fam Zheng geschrieben:
> >>> On Tue, 03/10 09:50, Kevin Wolf wrote:
> >>>> Am 10.03.2015 um 08:06 hat Michael Tokarev geschrieben:
> >>>> Also, should we consider making some more rarely used image format=
s
> >>>> modules even if they don't pull in external dependencies?
> >>>
> >>> Sounds reasonable to me. Is the intention to reduce binary size?
> >>
> >> Yes, that and also that it allows compiling out some drivers without
> >> having to mess with the Makefiles. You just don't install all of the=
m.
> >>
> >> Related to that, Peter also mentioned that you (the user, not develo=
per
> >> or packager) could simply disable a single driver, for example as a
> >> temporary hotfix in the case of security problems in a block driver.
> >> That would actually be an argument for making _all_ drivers modules.
> >=20
> > I am for making all block drivers built as modules.
>=20
> That might be useful if module loading will be modified a bit,
> like by loadin modules on demand only.  Something like this,
> search a "foo" block driver in the registered list, found ->
> use it, if not, try to open block-foo.so (maybe after looking
> in the "available" internal list before that) and look up in
> the registered list again.
>=20
> That will make it more useful.

The problem with that would be that format probing wouldn't work any
more for drivers that aren't loaded yet.

Kevin

