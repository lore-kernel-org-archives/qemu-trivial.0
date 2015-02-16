Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNHji-0005sH-SD
	for mharc-qemu-trivial@gnu.org; Mon, 16 Feb 2015 04:13:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YNHjg-0005op-Ky
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 04:13:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YNHjf-0005rF-KS
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 04:13:00 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:37835)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YNHjV-0005pe-Rr; Mon, 16 Feb 2015 04:12:50 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C221942540;
	Mon, 16 Feb 2015 12:12:48 +0300 (MSK)
Message-ID: <54E1B490.60805@msgid.tls.msk.ru>
Date: Mon, 16 Feb 2015 12:12:48 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Gonglei <arei.gonglei@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <1424059258-11024-1-git-send-email-arei.gonglei@huawei.com>	
	<1424059258-11024-3-git-send-email-arei.gonglei@huawei.com>
	<1424075329.3722.0.camel@nilsson.home.kraxel.org>
	<54E1AB64.3070303@msgid.tls.msk.ru> <54E1AFF2.2070706@huawei.com>
In-Reply-To: <54E1AFF2.2070706@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Wang Xin <wangxinxin.wang@huawei.com>,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH 2/2] qemu-char: add cyrillic key
 'numerosign' to Russian keymap
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
X-List-Received-Date: Mon, 16 Feb 2015 09:13:01 -0000

16.02.2015 11:53, Gonglei wrote:

> Both "numbersign" and "numerosign" needed. Although they have the same
> keymap characters, their keysym in vnc_keysym.h are different:
>=20
> static const name2keysym_t name2keysym[]=3D{
> ...
>      { "numbersign",           0x023},
> ...
>     +{"numerosign",                    0x06b0},  /* U+2116 NUMERO SIGN =
*/
> ...
> Please see the provenance:
>  http://www.cl.cam.ac.uk/~mgk25/ucs/keysymdef.h
> #define XK_numbersign                    0x0023  /* U+0023 NUMBER SIGN =
*/
> #define XK_numerosign                    0x06b0  /* U+2116 NUMERO SIGN =
*/

Oh.  That's funny.  "Number sign" is actually just a hash character - #.
While numero sign is this -- =E2=84=96.  So yes, okay, both are neecessar=
y indeed.
And yes, this "numero sign" (named after french word) is used in russia.

Thanks,

/mjt

