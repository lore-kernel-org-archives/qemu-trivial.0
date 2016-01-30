Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPRyL-0003yY-Ql
	for mharc-qemu-trivial@gnu.org; Sat, 30 Jan 2016 04:37:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aPRyG-0003nd-L8
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 04:37:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aPRyB-0000vS-JD
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 04:37:28 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:32802)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aPRy6-0000v0-LQ; Sat, 30 Jan 2016 04:37:22 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1DCE841D08;
	Sat, 30 Jan 2016 12:37:21 +0300 (MSK)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1453462113-27119-1-git-send-email-pbonzini@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56AC8450.2040702@msgid.tls.msk.ru>
Date: Sat, 30 Jan 2016 12:37:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1453462113-27119-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-sockets: simplify error handling
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
X-List-Received-Date: Sat, 30 Jan 2016 09:37:36 -0000

22.01.2016 14:28, Paolo Bonzini wrote:
> Just go always through the err label.  (Noticed because Coverity
> complains that peer is always non-NULL in the error cleanup code,
> but removing the "if" is arguably more prone to introducing the
> opposite bug in the future).

Applied to -trivial, thanks!

/mjt

