Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UoOx6-0002ay-6n
	for mharc-qemu-trivial@gnu.org; Sun, 16 Jun 2013 22:13:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1UoOx3-0002a9-3o
	for qemu-trivial@nongnu.org; Sun, 16 Jun 2013 22:13:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1UoOx1-0003l3-5E
	for qemu-trivial@nongnu.org; Sun, 16 Jun 2013 22:13:49 -0400
Received: from [222.73.24.84] (port=14293 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>)
	id 1UoOx0-0003kV-QZ; Sun, 16 Jun 2013 22:13:47 -0400
X-IronPort-AV: E=Sophos;i="4.87,877,1363104000"; 
   d="scan'208";a="7570876"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 17 Jun 2013 10:10:49 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5H2DfBD031189;
	Mon, 17 Jun 2013 10:13:43 +0800
Received: from localhost ([10.167.233.156])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013061710080297-2175563 ;
	Mon, 17 Jun 2013 10:08:02 +0800 
Date: Mon, 17 Jun 2013 10:09:16 +0800
From: Hu Tao <hutao@cn.fujitsu.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20130617020916.GE6416@G08FNSTD100614.fnst.cn.fujitsu.com>
References: <51B9A88C.3080105@suse.de>
	<1371193890-1098-1-git-send-email-hutao@cn.fujitsu.com>
	<51BAF01A.1000507@msgid.tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <51BAF01A.1000507@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/17 10:08:03,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/17 10:11:43
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] piix: fix some printf errors when
 debug is enabled
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
X-List-Received-Date: Mon, 17 Jun 2013 02:13:50 -0000

On Fri, Jun 14, 2013 at 02:27:38PM +0400, Michael Tokarev wrote:
> 14.06.2013 11:11, Hu Tao wrote:
> > And use PRIxxx macros if possible.
>=20
> Thanks, applied to the trivial patches queue, on top of the patch
> by Herv=C3=A9 Poussineau which I mentioned before.
>=20
> /mjt

Thanks!

=

