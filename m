Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uh7ZV-0006zp-IG
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 20:15:25 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Uh7ZG-0006gi-F7
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 20:15:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Uh7Z8-0000sU-3a
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 20:15:10 -0400
Received: from [222.73.24.84] (port=34495 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1Uh7Yr-0000jO-3R; Mon, 27 May 2013 20:14:45 -0400
X-IronPort-AV: E=Sophos;i="4.87,754,1363104000"; 
   d="scan'208";a="7383565"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 28 May 2013 08:11:47 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r4S0EaLG009256;
	Tue, 28 May 2013 08:14:37 +0800
Received: from [10.167.233.147] ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013052808130940-1572654 ;
	Tue, 28 May 2013 08:13:09 +0800 
From: li guang <lig.fnst@cn.fujitsu.com>
To: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <51A3C543.9020608@msgid.tls.msk.ru>
References: <1369363654-7063-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<51A08422.7030207@msgid.tls.msk.ru> <51A093F6.4070202@suse.de>
	<51A09581.6030105@msgid.tls.msk.ru>
	<1369618853.19028.20.camel@liguang.fnst.cn.fujitsu.com>
	<51A3C543.9020608@msgid.tls.msk.ru>
Date: Tue, 28 May 2013 08:14:16 +0800
Message-ID: <1369700056.19028.37.camel@liguang.fnst.cn.fujitsu.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/05/28 08:13:09,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/05/28 08:13:10,
	Serialize complete at 2013/05/28 08:13:10
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] debugcon: fix some bugs
 when DEBUG_DEBUGCON
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
X-List-Received-Date: Tue, 28 May 2013 00:15:24 -0000

=E5=9C=A8 2013-05-28=E4=BA=8C=E7=9A=84 00:42 +0400=EF=BC=8CMichael Tokarev=
=E5=86=99=E9=81=93=EF=BC=9A
> 27.05.2013 05:40, li guang wrote:
> []
> >>> NACK. If you want to apply 1-3, okay. But please unqueue 4/4, it make=
s
> >>> no sense as-is (just look at the stderr output to see what I mean) an=
d
> >>> it pretends that I suggested that!
> >>
> >> Actually I did just that, rebuild with DEBUG_DEBUGCON and looked
> >> at the output, -- because I didn't know how it works.  And you're
> >> right, it's not a good change ;)  But your email come before I was
> >> able to reply.  Unqueued.
> >=20
> > Hi, Michael
>=20
> Hello.  Please excuse me for the long(ish) delay, I was out of the city
> when you sent this email and when you pinged me on IRC.

That's OK.

>=20
> > do you queued patch 1-3?
> > if so, I will only send one patch for comments from Andreas,
> > otherwise, I will refactor all patches.
>=20
> Yes I queued your patches 1-3 but not 4.  It can be seen at
> http://git.corpit.ru/?p=3Dqemu.git;a=3Dshortlog;h=3Drefs/heads/trivial-pa=
tches-next
>=20
> (I just rebased it again on top of current qemu/master, but your 3
> patches are there).
>=20
> Should I replace these 3 with the next set?

I think you don't have to do that.
I will try to do a patch base on the patches you queued
as Andreas commented.

>=20
> But as Gerd correctly say, maybe it's better to just get rid of
> these stuff completely, or maybe, just maybe, replace it with
> tracepoints.
>=20
> Anyway, I think the 3 queued-up patches are okay.
>=20

I will consider this comments later.

Thanks!


