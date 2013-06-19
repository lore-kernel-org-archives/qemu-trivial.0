Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UpDai-0006hk-Fy
	for mharc-qemu-trivial@gnu.org; Wed, 19 Jun 2013 04:18:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UpDag-0006g4-Rh
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 04:18:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UpDaf-00026R-MO
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 04:18:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33151)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UpDac-00025k-J9; Wed, 19 Jun 2013 04:18:02 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 231AB41974;
	Wed, 19 Jun 2013 12:18:01 +0400 (MSK)
Message-ID: <51C16937.6060405@msgid.tls.msk.ru>
Date: Wed, 19 Jun 2013 12:17:59 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1371527137-16949-1-git-send-email-lig.fnst@cn.fujitsu.com>
In-Reply-To: <1371527137-16949-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 1/5] vnc: pass bool parameter for some
 functions
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
X-List-Received-Date: Wed, 19 Jun 2013 08:18:08 -0000

18.06.2013 07:45, liguang wrote:
> last parameters of vnc_listen_read,vnc_connect are bool,
> so pass 'false/true' instead of '0/1' for them.
>=20
> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>

I think I'll apply my version instead, -- which converts remaining argume=
nts
of functions your patch touches (so that we don't have this:

> -        vnc_connect(vs, csock, 0, 0);
> +        vnc_connect(vs, csock, 0, false);

where 3rd argument is also a bool), and which combines your patches 1/5
and 2/5 into one.

I'll resend it again in a top-level message.

Thanks,

/mjt

