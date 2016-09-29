Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpc99-0000ik-Di
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 10:17:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bpc97-0000eT-CP
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 10:17:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bpc96-0002Yr-I2
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 10:17:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35227)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bpc90-0002Mz-7m; Thu, 29 Sep 2016 10:17:02 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 19E454324A;
	Thu, 29 Sep 2016 17:16:51 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 1B9BFB0F;
	Thu, 29 Sep 2016 17:16:50 +0300 (MSK)
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <1474282586-12211-1-git-send-email-stefanha@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <f116cf59-7abe-53d7-5167-e2d1c33d5c8d@msgid.tls.msk.ru>
Date: Thu, 29 Sep 2016 17:16:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1474282586-12211-1-git-send-email-stefanha@redhat.com>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] qemu-options.hx: fix -chardev ringbuf
 typos
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
X-List-Received-Date: Thu, 29 Sep 2016 14:17:10 -0000

19.09.2016 13:56, Stefan Hajnoczi =EF=E8=F8=E5=F2:
> Clean up the documentation for -chardev ringbuf.  There is a stray
> closing parenthesis and the comma is unnecessary.

Applied, thank you!

/mjt


