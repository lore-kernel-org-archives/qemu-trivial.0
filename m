Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtaSP-0002Mu-1n
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2015 07:12:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZtaSJ-0002Dj-QD
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 07:12:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZtaSI-0006fl-Ux
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 07:12:51 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46539)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZtaSE-0006fN-IP; Tue, 03 Nov 2015 07:12:46 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B7A0C407DB;
	Tue,  3 Nov 2015 15:12:45 +0300 (MSK)
Message-ID: <5638A4BD.4030104@msgid.tls.msk.ru>
Date: Tue, 03 Nov 2015 15:12:45 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1446473857-11934-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1446473857-11934-1-git-send-email-pbonzini@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] pci-assign: do not test path with
	access() before opening
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
X-List-Received-Date: Tue, 03 Nov 2015 12:12:56 -0000

02.11.2015 17:17, Paolo Bonzini wrote:
> Using access() is a time-of-check/time-of-use race condition.  It is
> okay to use them to provide better error messages, but that is pretty
> much it.
> 
> In this case we can get the same error from fopen(), so just use
> strerror and errno there---which actually improves the error
> message most of the time.

Applied to -trivial, thank you!

/mjt

