Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uoq8O-0002JA-Th
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jun 2013 03:15:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Uoloj-0004kX-M2
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 22:38:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Uoloi-0004Xb-OG
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 22:38:45 -0400
Received: from [222.73.24.84] (port=65325 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1Uoloe-0004Wb-TP; Mon, 17 Jun 2013 22:38:41 -0400
X-IronPort-AV: E=Sophos;i="4.87,885,1363104000"; 
   d="scan'208";a="7583516"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 18 Jun 2013 10:35:44 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5I2ccdR011000;
	Tue, 18 Jun 2013 10:38:38 +0800
Received: from [10.167.233.147] ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013061810363674-2220702 ;
	Tue, 18 Jun 2013 10:36:36 +0800 
From: li guang <lig.fnst@cn.fujitsu.com>
To: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <51BFC780.4090204@msgid.tls.msk.ru>
References: <1370927720-4348-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<51B70F11.7090101@msgid.tls.msk.ru> <51BFC780.4090204@msgid.tls.msk.ru>
Date: Tue, 18 Jun 2013 10:36:29 +0800
Message-ID: <1371522989.31705.32.camel@liguang.fnst.cn.fujitsu.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/18 10:36:36,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/18 10:36:37,
	Serialize complete at 2013/06/18 10:36:37
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
X-Mailman-Approved-At: Tue, 18 Jun 2013 03:15:20 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/5] vnc: pass bool pararmeter for
 vnc_connect
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
X-List-Received-Date: Tue, 18 Jun 2013 02:38:47 -0000

=E5=9C=A8 2013-06-18=E4=BA=8C=E7=9A=84 06:35 +0400=EF=BC=8CMichael Tokarev=
=E5=86=99=E9=81=93=EF=BC=9A
> 11.06.2013 15:50, Michael Tokarev wrote:
> > 11.06.2013 09:15, liguang wrote:
> >> type last parameter of vnc_connect if bool,
> >> so pass 'false' instead of '0' for it.
> >=20
> > There's another parameter in here, `skipauth', which should be
> > bool in vnc_connect(), and should be bool in vnc_display_add_client()
> > too.
> >=20
> > Also, there's no big point in splitting 1/5 and 2/5 (vnc_listen_read),
> > I think.
> >=20
> > Does something like the below look ok? (not even compile-tested)
> > (and I'd really rename `skipauth' to `doauth' everywhere, to mean
> > exactly the opposite so that we don't have double negatives, but
> > it is too late already)
>=20
> Hello.
>=20
> Do you want/plan to respin the series, addressing comments?
> Are you okay with my version?
>=20

Yes, I'm little busy now, but I'll re-spin as soon as possible.




