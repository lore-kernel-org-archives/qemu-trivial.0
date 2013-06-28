Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UsW0K-000771-BD
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2013 06:34:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsW0H-00074L-Uv
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 06:34:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsW0H-0004T9-0h
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 06:34:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35814)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UsW0D-0004RZ-B6; Fri, 28 Jun 2013 06:34:05 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 778EC42B0C;
	Fri, 28 Jun 2013 14:34:02 +0400 (MSK)
Received: from wh.tls.msk.ru (wh.tls.msk.ru [192.168.177.7])
	by tsrv.corpit.ru (Postfix) with ESMTP id 33BAB3E;
	Fri, 28 Jun 2013 14:34:02 +0400 (MSK)
Message-ID: <51CD669A.1010100@msgid.tls.msk.ru>
Date: Fri, 28 Jun 2013 14:34:02 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:10.0.12) Gecko/20130116 Icedove/10.0.12
MIME-Version: 1.0
To: Ed Maste <emaste@freebsd.org>
References: <1372101677-46175-1-git-send-email-emaste@freebsd.org>
In-Reply-To: <1372101677-46175-1-git-send-email-emaste@freebsd.org>
X-Enigmail-Version: 1.4.1
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH] tls.h: Enable TLS on FreeBSD
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
X-List-Received-Date: Fri, 28 Jun 2013 10:34:11 -0000

24.06.2013 23:21, Ed Maste wrote:
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
> I have had this in a local tree for some time, and it is needed by the
> BSD-user work that is now being proposed.

So I'm not applying this to -trivial, because it caused quite some
discussion.  If nevertheless it's okay to apply it, please let me know.

/mjt

