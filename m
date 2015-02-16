Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNJRz-00009P-53
	for mharc-qemu-trivial@gnu.org; Mon, 16 Feb 2015 06:02:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YNJRt-0008SV-C9
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 06:02:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YNJRo-00041G-NB
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 06:02:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43516)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1YNJRc-0003wb-40; Mon, 16 Feb 2015 06:02:28 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1GB2D7l016659
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 16 Feb 2015 06:02:13 -0500
Received: from [10.36.116.55] (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1GB29PS015412; Mon, 16 Feb 2015 06:02:11 -0500
Message-ID: <1424084529.3722.20.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 16 Feb 2015 12:02:09 +0100
In-Reply-To: <54E1C60F.2040602@msgid.tls.msk.ru>
References: <1424059258-11024-1-git-send-email-arei.gonglei@huawei.com>
	<1424059258-11024-3-git-send-email-arei.gonglei@huawei.com>
	<1424075329.3722.0.camel@nilsson.home.kraxel.org>
	<54E1AB64.3070303@msgid.tls.msk.ru> <54E1AFF2.2070706@huawei.com>
	<1424081886.3722.9.camel@nilsson.home.kraxel.org>
	<54E1C60F.2040602@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	t1GB2D7l016659
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Wang Xin <wangxinxin.wang@huawei.com>,
	Gonglei <arei.gonglei@huawei.com>, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
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
X-List-Received-Date: Mon, 16 Feb 2015 11:02:50 -0000

On Mo, 2015-02-16 at 13:27 +0300, Michael Tokarev wrote:
> 16.02.2015 13:18, Gerd Hoffmann wrote:
> []
> > But the russian keymap needs numerosign only, right?
> > Or does a russian keyboard have *both*?
>=20
> Now maybe I don't understand how keymap works.
>=20
> When switching my keyboard to russian (cyrillic) layout,
> I can't type # without switching back to latin layout.
> Both symbols are produced by the same key - it is key
> with number 3 on it, when used with Shift.  On latin
> layout it produces #, on cyrillic layout it produces =E2=84=96.

As the patch description suggests.  Thanks for confirming.

> Does it mean the layout does not have # key?

It might be somewhere else, in theory.  Seems not to be the case for the
russian layout though.

On a german keyboard shift-3 is '=C2=A7', and the number sign is somewher=
e
else.  So I can get '#' with both 'us' and 'de' layouts, but I have to
use different keys ...

cheers,
  Gerd



