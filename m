Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uh7ph-00038K-SR
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 20:32:09 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Uh7pZ-0002yl-TX
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 20:32:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Uh7pU-00059b-U9
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 20:32:01 -0400
Received: from [222.73.24.84] (port=17726 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1Uh7p3-00056l-Hk; Mon, 27 May 2013 20:31:29 -0400
X-IronPort-AV: E=Sophos;i="4.87,754,1363104000"; 
   d="scan'208";a="7383649"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 28 May 2013 08:28:37 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r4S0VR0a009903;
	Tue, 28 May 2013 08:31:27 +0800
Received: from [10.167.233.147] ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013052808295962-1572979 ;
	Tue, 28 May 2013 08:29:59 +0800 
From: li guang <lig.fnst@cn.fujitsu.com>
To: Gerd Hoffmann <kraxel@redhat.com>
In-Reply-To: <51A323B4.2000101@redhat.com>
References: <1369363654-7063-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<51A323B4.2000101@redhat.com>
Date: Tue, 28 May 2013 08:31:06 +0800
Message-ID: <1369701066.19028.53.camel@liguang.fnst.cn.fujitsu.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/05/28 08:29:59,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/05/28 08:30:00,
	Serialize complete at 2013/05/28 08:30:00
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org,
	Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH 0/4] debugcon: fix some bugs when
	DEBUG_DEBUGCON
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
X-List-Received-Date: Tue, 28 May 2013 00:32:08 -0000

=E5=9C=A8 2013-05-27=E4=B8=80=E7=9A=84 11:13 +0200=EF=BC=8CGerd Hoffmann=E5=
=86=99=E9=81=93=EF=BC=9A
> On 05/24/13 04:47, liguang wrote:
> > when enable DEBUG_DEBUGCON, there are some message
> > printing bugs, so fix them.
>=20
> I'd suggest to either simply remove the debug printfs or turn them into
> tracepoints.
>=20

sorry, why we simply remove debug message printing?
it's un-useful at all?

but, for me, it is helpful.

Thanks!



