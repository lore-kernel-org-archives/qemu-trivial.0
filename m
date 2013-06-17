Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UoOx9-0002ga-Eu
	for mharc-qemu-trivial@gnu.org; Sun, 16 Jun 2013 22:13:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1UoOx5-0002aN-Md
	for qemu-trivial@nongnu.org; Sun, 16 Jun 2013 22:13:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1UoOx4-0003m3-Pw
	for qemu-trivial@nongnu.org; Sun, 16 Jun 2013 22:13:51 -0400
Received: from [222.73.24.84] (port=14293 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>)
	id 1UoOx2-0003kV-0a; Sun, 16 Jun 2013 22:13:48 -0400
X-IronPort-AV: E=Sophos;i="4.87,877,1363104000"; 
   d="scan'208";a="7570877"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 17 Jun 2013 10:10:49 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5H2Df9B031188;
	Mon, 17 Jun 2013 10:13:43 +0800
Received: from localhost ([10.167.233.156])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013061710073564-2175559 ;
	Mon, 17 Jun 2013 10:07:35 +0800 
Date: Mon, 17 Jun 2013 10:08:49 +0800
From: Hu Tao <hutao@cn.fujitsu.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20130617020849.GD6416@G08FNSTD100614.fnst.cn.fujitsu.com>
References: <1371120709-18923-1-git-send-email-hutao@cn.fujitsu.com>
	<1371120709-18923-2-git-send-email-hutao@cn.fujitsu.com>
	<51B9A766.6070706@suse.de>
MIME-Version: 1.0
In-Reply-To: <51B9A766.6070706@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/17 10:07:35,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/17 10:11:43
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial@nongnu.org, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fix typo: apci -> acpi
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
X-List-Received-Date: Mon, 17 Jun 2013 02:13:52 -0000

Michael,

On Thu, Jun 13, 2013 at 01:05:10PM +0200, Andreas F=C3=A4rber wrote:
> Am 13.06.2013 12:51, schrieb Hu Tao:
> > Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
> > ---
> >  hw/acpi/ich9.c  | 4 ++--
> >  hw/acpi/piix4.c | 6 +++---
> >  2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>

Would you like to pick up this one?

=

