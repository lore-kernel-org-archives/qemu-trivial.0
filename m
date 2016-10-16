Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bvmG7-0002dC-FN
	for mharc-qemu-trivial@gnu.org; Sun, 16 Oct 2016 10:17:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bvmG5-0002bm-7I
	for qemu-trivial@nongnu.org; Sun, 16 Oct 2016 10:17:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bvmG4-0002VP-Jw
	for qemu-trivial@nongnu.org; Sun, 16 Oct 2016 10:17:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37986)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bvmG0-0002U4-BH; Sun, 16 Oct 2016 10:17:44 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1035741E1A;
	Sun, 16 Oct 2016 17:17:34 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 036B7B2A;
	Sun, 16 Oct 2016 17:17:33 +0300 (MSK)
To: Akanksha Srivastava <akanksha.dlf@gmail.com>, qemu-devel@nongnu.org
References: <1476390091-6741-1-git-send-email-akanksha.dlf@gmail.com>
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <ca88e7e1-cf4d-c06d-180e-c6cea3155346@msgid.tls.msk.ru>
Date: Sun, 16 Oct 2016 17:17:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1476390091-6741-1-git-send-email-akanksha.dlf@gmail.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v3] usb: Change *_exitfn return type from
 int to void
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Oct 2016 14:17:50 -0000

13.10.2016 23:21, Akanksha Srivastava wrote:
> The *_exitfn functions cannot fail and should not be
> returning int.
...

Applied to -trivial, thank you!

/mjt

