Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uoq8c-0002i3-1D
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jun 2013 03:15:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UonSn-00043J-Cp
	for qemu-trivial@nongnu.org; Tue, 18 Jun 2013 00:24:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UonSm-0003tN-5A
	for qemu-trivial@nongnu.org; Tue, 18 Jun 2013 00:24:13 -0400
Received: from [222.73.24.84] (port=1753 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UonSj-0003qI-8g; Tue, 18 Jun 2013 00:24:09 -0400
X-IronPort-AV: E=Sophos;i="4.87,886,1363104000"; 
   d="scan'208";a="7584824"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 18 Jun 2013 12:21:10 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5I4NPwE018407;
	Tue, 18 Jun 2013 12:23:58 +0800
Received: from [10.167.233.147] ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013061812080885-2223607 ;
	Tue, 18 Jun 2013 12:08:08 +0800 
From: li guang <lig.fnst@cn.fujitsu.com>
To: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <51BFD8F3.8050807@msgid.tls.msk.ru>
References: <1370927720-4348-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<1370927720-4348-4-git-send-email-lig.fnst@cn.fujitsu.com>
	<51B70B35.3090305@msgid.tls.msk.ru>
	<1371522779.31705.29.camel@liguang.fnst.cn.fujitsu.com>
	<51BFD8F3.8050807@msgid.tls.msk.ru>
Date: Tue, 18 Jun 2013 12:08:00 +0800
Message-ID: <1371528480.31705.43.camel@liguang.fnst.cn.fujitsu.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/18 12:08:08,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/18 12:22:01,
	Serialize complete at 2013/06/18 12:22:01
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
X-Mailman-Approved-At: Tue, 18 Jun 2013 03:15:32 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/5] memory: use '=' instead
 of '|=' for memory_region_update_pending
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
X-List-Received-Date: Tue, 18 Jun 2013 04:24:14 -0000

=E5=9C=A8 2013-06-18=E4=BA=8C=E7=9A=84 07:50 +0400=EF=BC=8CMichael Tokarev=
=E5=86=99=E9=81=93=EF=BC=9A
> 18.06.2013 06:32, li guang =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > =E5=9C=A8 2013-06-11=E4=BA=8C=E7=9A=84 15:34 +0400=EF=BC=8CMichael Toka=
rev=E5=86=99=E9=81=93=EF=BC=9A
> >> 11.06.2013 09:15, liguang wrote:
> >>> because memory_region_update_pending is bool
> >>>
> >>> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> >>> ---
> >>>  memory.c |   18 +++++++++---------
> >>>  1 files changed, 9 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/memory.c b/memory.c
> >>> index 5cb8f4a..d99eecd 100644
> >>> --- a/memory.c
> >>> +++ b/memory.c
> >>> @@ -1114,7 +1114,7 @@ void memory_region_set_log(MemoryRegion *mr, bo=
ol log, unsigned client)
> >>> =20
> >>>      memory_region_transaction_begin();
> >>>      mr->dirty_log_mask =3D (mr->dirty_log_mask & ~mask) | (log * mas=
k);
> >>> -    memory_region_update_pending |=3D mr->enabled;
> >>> +    memory_region_update_pending =3D mr->enabled;
> >>
> >> This is wrong, and the original code was right.  Here and in all other=
 places.
> >=20
> > Is it valid to do '|' operation for boolean?
>=20
> Yes it is.  Why do you think it might be problematic?
>=20

No problem now,

Thanks!



