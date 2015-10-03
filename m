Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk5AS-0000Si-4C
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 02:59:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZiQ1P-0004gh-Da
	for qemu-trivial@nongnu.org; Sat, 03 Oct 2015 12:50:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZiQ1O-0003mS-KQ
	for qemu-trivial@nongnu.org; Sat, 03 Oct 2015 12:50:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53888)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZiQ1H-0003hV-JD; Sat, 03 Oct 2015 12:50:47 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 08BDE4035E;
	Sat,  3 Oct 2015 19:50:47 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id B7E48A66;
	Sat,  3 Oct 2015 19:50:46 +0300 (MSK)
Message-ID: <56100766.6070700@msgid.tls.msk.ru>
Date: Sat, 03 Oct 2015 19:50:46 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Shraddha Barke <shraddha.6596@gmail.com>, kvm@vger.kernel.org, 
	qemu-trivial@nongnu.org
References: <1443170278-9318-1-git-send-email-shraddha.6596@gmail.com>
	<1443170278-9318-3-git-send-email-shraddha.6596@gmail.com>
In-Reply-To: <1443170278-9318-3-git-send-email-shraddha.6596@gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 3/3] Target-ppc: Remove unnecessary
	variable
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
X-List-Received-Date: Sat, 03 Oct 2015 16:50:56 -0000

25.09.2015 11:37, Shraddha Barke wrote:
> Compress lines and remove the variable.

Applied to -trivial, removing this piece of commit message:

---
> Change made using Coccinelle script
> 
> @@
> expression ret;
> @@
> - if (ret) return ret;
> - return 0;
> + return ret;
> @@
> local idexpression ret;
> expression e;
> @@
> - ret = e;
> - return ret;
> + return e;
> @@
> type T; identifier i;
> @@
> - T i;
> ... when != i
---

Thanks,

/mjt

