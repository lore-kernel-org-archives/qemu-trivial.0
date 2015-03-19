Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYVsR-0004wO-By
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 04:32:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYVsP-0004te-Sn
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 04:32:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYVsL-0002Ki-9o
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 04:32:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48832)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYVsH-0002Jp-05; Thu, 19 Mar 2015 04:32:17 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 08C6F41D21;
	Thu, 19 Mar 2015 11:32:16 +0300 (MSK)
Message-ID: <550A898F.1040806@msgid.tls.msk.ru>
Date: Thu, 19 Mar 2015 11:32:15 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Viswesh <visweshn92@gmail.com>, qemu-devel@nongnu.org
References: <1426603988-3541-1-git-send-email-visweshn92@gmail.com>
In-Reply-To: <1426603988-3541-1-git-send-email-visweshn92@gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, kbastian@mail.uni-paderborn.de,
	aneesh.kumar@linux.vnet.ibm.com, peter.maydell@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2] Fix typos in comments
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
X-List-Received-Date: Thu, 19 Mar 2015 08:32:26 -0000

17.03.2015 17:53, Viswesh wrote:
> The commit message is changed per review comments of Peter Maydell.
> This should be good now.

Applied to -trivial, without the above comment.  Actually it was enough
to send the first version, it's easy to fix up commit comment than to
resend single patches like this.

Thanks,

/mjt

