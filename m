Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZrhxY-0008CH-5b
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 03:49:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZrhxV-00087v-Hg
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:49:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZrhxU-00079s-QN
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:49:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40699)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZrhxO-00079H-N9; Thu, 29 Oct 2015 03:49:10 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 15BCB4211B;
	Thu, 29 Oct 2015 10:49:10 +0300 (MSK)
Message-ID: <5631CF76.5040101@msgid.tls.msk.ru>
Date: Thu, 29 Oct 2015 10:49:10 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1445263720-6765-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1445263720-6765-1-git-send-email-pbonzini@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] target-alpha: fix uninitialized variable
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
X-List-Received-Date: Thu, 29 Oct 2015 07:49:18 -0000

19.10.2015 17:08, Paolo Bonzini wrote:
> I am not sure why the compiler does not catch it.  There is no
> semantic change since gen_excp returns EXIT_NORETURN, but the
> old code is wrong.

Applied to -trivial.  Indeed it's interesting why gcc can't
catch it, might be due to unlikely() (which smells like a bug?)

Thanks,

/mjt

