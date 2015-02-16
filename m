Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNItv-00046z-5p
	for mharc-qemu-trivial@gnu.org; Mon, 16 Feb 2015 05:27:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YNItt-00045F-64
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 05:27:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YNIts-0006aH-2H
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 05:27:37 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42905)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YNItl-0006Z2-V1; Mon, 16 Feb 2015 05:27:30 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id EDF3B42540;
	Mon, 16 Feb 2015 13:27:27 +0300 (MSK)
Message-ID: <54E1C60F.2040602@msgid.tls.msk.ru>
Date: Mon, 16 Feb 2015 13:27:27 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>, Gonglei <arei.gonglei@huawei.com>
References: <1424059258-11024-1-git-send-email-arei.gonglei@huawei.com>		
	<1424059258-11024-3-git-send-email-arei.gonglei@huawei.com>	
	<1424075329.3722.0.camel@nilsson.home.kraxel.org>	
	<54E1AB64.3070303@msgid.tls.msk.ru> <54E1AFF2.2070706@huawei.com>
	<1424081886.3722.9.camel@nilsson.home.kraxel.org>
In-Reply-To: <1424081886.3722.9.camel@nilsson.home.kraxel.org>
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
X-List-Received-Date: Mon, 16 Feb 2015 10:27:38 -0000

16.02.2015 13:18, Gerd Hoffmann wrote:
[]
> But the russian keymap needs numerosign only, right?
> Or does a russian keyboard have *both*?

Now maybe I don't understand how keymap works.

When switching my keyboard to russian (cyrillic) layout,
I can't type # without switching back to latin layout.
Both symbols are produced by the same key - it is key
with number 3 on it, when used with Shift.  On latin
layout it produces #, on cyrillic layout it produces =E2=84=96.

Does it mean the layout does not have # key?

Thanks,

/mjt

