Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YK1Nt-0001Co-Vz
	for mharc-qemu-trivial@gnu.org; Sat, 07 Feb 2015 04:09:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YK1Nr-00019D-Nq
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 04:09:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YK1Nq-0007Lx-Ub
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 04:08:59 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58032)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YK1Nk-0007LV-WE; Sat, 07 Feb 2015 04:08:53 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 24F4741366;
	Sat,  7 Feb 2015 12:08:52 +0300 (MSK)
Message-ID: <54D5D624.4010302@msgid.tls.msk.ru>
Date: Sat, 07 Feb 2015 12:08:52 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <1422646675-17657-1-git-send-email-kwolf@redhat.com>
In-Reply-To: <1422646675-17657-1-git-send-email-kwolf@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] qemu-sockets: Fix buffer overflow in
	inet_parse()
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
X-List-Received-Date: Sat, 07 Feb 2015 09:09:00 -0000

30.01.2015 22:37, Kevin Wolf wrote:
> The size of the stack allocated host[] array didn't account for the
> terminating '\0' byte that sscanf() writes. Fix the array size.

Applied to -trivial, thank you!

/mjt

