Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TgXTX-0003nC-32
	for mharc-qemu-trivial@gnu.org; Thu, 06 Dec 2012 04:10:35 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1TgXTN-0003R9-Al
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2012 04:10:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1TgXTD-0000Ex-0Y
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2012 04:10:22 -0500
Received: from [222.73.24.84] (port=15509 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1TgXSx-0008SK-LV; Thu, 06 Dec 2012 04:09:59 -0500
X-IronPort-AV: E=Sophos;i="4.84,229,1355068800"; 
   d="scan'208";a="6345647"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 06 Dec 2012 17:08:03 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id qB68oQGM027909;
	Thu, 6 Dec 2012 16:50:27 +0800
Received: from [10.167.225.128] ([10.167.225.128])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2012120616493834-272652 ;
	Thu, 6 Dec 2012 16:49:38 +0800 
From: li guang <lig.fnst@cn.fujitsu.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
In-Reply-To: <CAJSP0QXytL5YBzx2S1qQ0SOHJ6-Ke15kVbqC7Q12_PFWQOeGeA@mail.gmail.com>
References: <1352101300-12060-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<CAJSP0QXytL5YBzx2S1qQ0SOHJ6-Ke15kVbqC7Q12_PFWQOeGeA@mail.gmail.com>
Date: Thu, 06 Dec 2012 16:47:51 +0800
Message-ID: <1354783671.8768.1.camel@liguang.fnst.cn.fujitsu.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2012/12/06 16:49:38,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2012/12/06 16:49:40,
	Serialize complete at 2012/12/06 16:49:40
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel][PATCH v4] correct error message
 qemu-img reported
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
X-List-Received-Date: Thu, 06 Dec 2012 09:10:32 -0000

Hi, Stefan

seems this tiny patch was ignored.

=E5=9C=A8 2012-11-05=E4=B8=80=E7=9A=84 11:27 +0100=EF=BC=8CStefan Hajnoczi=
=E5=86=99=E9=81=93=EF=BC=9A
> On Mon, Nov 5, 2012 at 8:41 AM, liguang <lig.fnst@cn.fujitsu.com> wrote:
> > qemu-img will complain when qcow or qcow2
> > size overflow for 64 bits, report the right
> > message in this condition.
> >
> > Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> > ---
> >  qemu-img.c |    7 ++++++-
> >  1 files changed, 6 insertions(+), 1 deletions(-)
>=20
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--=20
regards!
li guang


