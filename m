Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WK6H6-0007C4-To
	for mharc-qemu-trivial@gnu.org; Sun, 02 Mar 2014 08:17:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WK6H1-00075E-H5
	for qemu-trivial@nongnu.org; Sun, 02 Mar 2014 08:17:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WK6Gw-0003ou-Pc
	for qemu-trivial@nongnu.org; Sun, 02 Mar 2014 08:17:43 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:47221)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WK6Gm-0003mh-Sp; Sun, 02 Mar 2014 08:17:29 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 520864045C;
	Sun,  2 Mar 2014 17:17:28 +0400 (MSK)
Message-ID: <53132F68.9070001@msgid.tls.msk.ru>
Date: Sun, 02 Mar 2014 17:17:28 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
References: <1392549158-6009-1-git-send-email-sebastian.huber@embedded-brains.de>
	<530D9D92.5030800@embedded-brains.de>
In-Reply-To: <530D9D92.5030800@embedded-brains.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] hw/timer/grlib_gptimer:
 Avoid integer overflows
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
X-List-Received-Date: Sun, 02 Mar 2014 13:17:48 -0000

26.02.2014 11:53, Sebastian Huber wrote:
> Ping.

There was another comment on this, about the first hunk,
see https://lists.gnu.org/archive/html/qemu-trivial/2014-02/msg00067.html

Note that the comment below this line mentions the +1 which is
being removed.

Thanks,

/mjt


