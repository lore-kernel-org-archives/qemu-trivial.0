Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zc9yF-0008DO-8K
	for mharc-qemu-trivial@gnu.org; Wed, 16 Sep 2015 06:29:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zc9yC-00089J-Th
	for qemu-trivial@nongnu.org; Wed, 16 Sep 2015 06:29:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zc9yC-0006I0-64
	for qemu-trivial@nongnu.org; Wed, 16 Sep 2015 06:29:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44545)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zc9y7-0006HP-TT; Wed, 16 Sep 2015 06:29:40 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 68BEA41B11;
	Wed, 16 Sep 2015 13:29:39 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 5B585A6E;
	Wed, 16 Sep 2015 13:29:39 +0300 (MSK)
Message-ID: <55F94493.3030908@msgid.tls.msk.ru>
Date: Wed, 16 Sep 2015 13:29:39 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1442229154-2052-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1442229154-2052-1-git-send-email-pbonzini@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, jcody@redhat.com, rjones@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] block/ssh: remove dead code
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
X-List-Received-Date: Wed, 16 Sep 2015 10:29:45 -0000

14.09.2015 14:12, Paolo Bonzini wrote:
> The "err" label cannot be reached with qp != NULL.  Remove the free-ing
> of qp and avoid future regressions by removing the initializer.

Applied to -trivial, thank you!

/mjt


