Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxwY9-0004Bm-8a
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:04:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YxwY3-00043Y-FF
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:04:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YxwXz-00018G-64
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:04:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34757)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YxwXo-00016Y-Oa; Thu, 28 May 2015 08:04:16 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B424F4272A;
	Thu, 28 May 2015 15:04:15 +0300 (MSK)
Message-ID: <5567043F.5070301@msgid.tls.msk.ru>
Date: Thu, 28 May 2015 15:04:15 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>, 
 qemu-devel@nongnu.org
References: <1432498814-1469-1-git-send-email-crosthwaite.peter@gmail.com>
In-Reply-To: <1432498814-1469-1-git-send-email-crosthwaite.peter@gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, agraf@suse.de, afaerber@suse.de,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH v2] device-tree: Make a common-obj
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
X-List-Received-Date: Thu, 28 May 2015 12:04:36 -0000

24.05.2015 23:20, Peter Crosthwaite wrote:
> There is no reason for device tree API to be built per-target.
> common-obj it. There is an extraneous inclusion of config.h that
> needs to be removed.
>=20
> Cc: Alexander Graf <agraf@suse.de>
> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

Applied to -trivial, thank you!

/mjt

