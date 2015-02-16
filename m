Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNIl2-0005s9-Gb
	for mharc-qemu-trivial@gnu.org; Mon, 16 Feb 2015 05:18:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39330)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YNIkw-0005kf-3L
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 05:18:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YNIku-0003HN-Os
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 05:18:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55449)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1YNIko-0003GJ-Rk; Mon, 16 Feb 2015 05:18:15 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1GAIAhn016317
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 16 Feb 2015 05:18:11 -0500
Received: from [10.36.116.55] (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1GAI78Z022895; Mon, 16 Feb 2015 05:18:08 -0500
Message-ID: <1424081886.3722.9.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gonglei <arei.gonglei@huawei.com>
Date: Mon, 16 Feb 2015 11:18:06 +0100
In-Reply-To: <54E1AFF2.2070706@huawei.com>
References: <1424059258-11024-1-git-send-email-arei.gonglei@huawei.com>
	<1424059258-11024-3-git-send-email-arei.gonglei@huawei.com>
	<1424075329.3722.0.camel@nilsson.home.kraxel.org>
	<54E1AB64.3070303@msgid.tls.msk.ru> <54E1AFF2.2070706@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Wang Xin <wangxinxin.wang@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
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
X-List-Received-Date: Mon, 16 Feb 2015 10:18:27 -0000

  Hi,

> Both "numbersign" and "numerosign" needed. Although they have the same
> keymap characters, their keysym in vnc_keysym.h are different:
> 
> static const name2keysym_t name2keysym[]={
> ...
>      { "numbersign",           0x023},
> ...
>     +{"numerosign",                    0x06b0},  /* U+2116 NUMERO SIGN */

Not questioning that for the vnc keysym table.

But the russian keymap needs numerosign only, right?
Or does a russian keyboard have *both*?

cheers,
  Gerd



