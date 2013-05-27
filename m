Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgmRR-0007NL-5M
	for mharc-qemu-trivial@gnu.org; Sun, 26 May 2013 21:41:41 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UgmRI-000789-Bx
	for qemu-trivial@nongnu.org; Sun, 26 May 2013 21:41:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UgmRC-0005cX-OY
	for qemu-trivial@nongnu.org; Sun, 26 May 2013 21:41:32 -0400
Received: from [222.73.24.84] (port=22716 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UgmR1-0005bI-Mp; Sun, 26 May 2013 21:41:15 -0400
X-IronPort-AV: E=Sophos;i="4.87,747,1363104000"; 
   d="scan'208";a="7373644"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 27 May 2013 09:38:21 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r4R1fAko014667;
	Mon, 27 May 2013 09:41:11 +0800
Received: from [10.167.233.147] ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013052709394129-1544947 ;
	Mon, 27 May 2013 09:39:41 +0800 
From: li guang <lig.fnst@cn.fujitsu.com>
To: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <51A09581.6030105@msgid.tls.msk.ru>
References: <1369363654-7063-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<51A08422.7030207@msgid.tls.msk.ru> <51A093F6.4070202@suse.de>
	<51A09581.6030105@msgid.tls.msk.ru>
Date: Mon, 27 May 2013 09:40:53 +0800
Message-ID: <1369618853.19028.20.camel@liguang.fnst.cn.fujitsu.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/05/27 09:39:41,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/05/27 09:39:46,
	Serialize complete at 2013/05/27 09:39:46
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
X-List-Received-Date: Mon, 27 May 2013 01:41:39 -0000

=E5=9C=A8 2013-05-25=E5=85=AD=E7=9A=84 14:42 +0400=EF=BC=8CMichael Tokarev=
=E5=86=99=E9=81=93=EF=BC=9A
> 25.05.2013 14:35, Andreas F=C3=A4rber wrote:
> > Am 25.05.2013 11:28, schrieb Michael Tokarev:
> []
> >>> 	 debugcon: use fprintf(stderr...) instead of printf
> >>
> >> The subjects and commit messages are a bit inaccurate, and
> >> as Andreas says, these may have been merged together, but
> >> the inaccuracy is small (and mostly due to language barriers),
> >> and the result is good anyway, with one patch doing one thing.
> >>
> >> So.. thanks, applied to the trivial-patches queue.
> >=20
> > NACK. If you want to apply 1-3, okay. But please unqueue 4/4, it makes
> > no sense as-is (just look at the stderr output to see what I mean) and
> > it pretends that I suggested that!
>=20
> Actually I did just that, rebuild with DEBUG_DEBUGCON and looked
> at the output, -- because I didn't know how it works.  And you're
> right, it's not a good change ;)  But your email come before I was
> able to reply.  Unqueued.

Hi, Michael

do you queued patch 1-3?
if so, I will only send one patch for comments from Andreas,
otherwise, I will refactor all patches.

Thanks!



