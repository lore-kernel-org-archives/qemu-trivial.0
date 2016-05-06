Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ayksP-0001M6-3M
	for mharc-qemu-trivial@gnu.org; Fri, 06 May 2016 14:53:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ayksH-000134-LW
	for qemu-trivial@nongnu.org; Fri, 06 May 2016 14:53:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ayks6-00077B-AR
	for qemu-trivial@nongnu.org; Fri, 06 May 2016 14:53:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41600)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aykrl-00070l-Fj; Fri, 06 May 2016 14:52:45 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D95A940619;
	Fri,  6 May 2016 21:52:29 +0300 (MSK)
To: Wei Jiangang <weijg.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1460606282-4570-1-git-send-email-weijg.fnst@cn.fujitsu.com>
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	xiecl.fnst@cn.fujitsu.com
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <572CE7EC.6020701@msgid.tls.msk.ru>
Date: Fri, 6 May 2016 21:52:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <1460606282-4570-1-git-send-email-weijg.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2] accel: make configure_accelerator
 return void
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
X-List-Received-Date: Fri, 06 May 2016 18:53:24 -0000

14.04.2016 06:58, Wei Jiangang wrote:
> Return the negated value of accel_initialised is meaningless,
> and the caller vl doesn't check it.

Applied to -trivial, thanks!

/mjt

