Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmhCf-0005e6-JH
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 07:27:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YmhCd-0005bf-1I
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 07:27:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YmhCc-0004FZ-BH
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 07:27:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45500)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YmhCY-0004EI-5I; Mon, 27 Apr 2015 07:27:50 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E9A264273F;
	Mon, 27 Apr 2015 14:27:48 +0300 (MSK)
Message-ID: <553E1D34.4020203@msgid.tls.msk.ru>
Date: Mon, 27 Apr 2015 14:27:48 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Thomas Huth <thuth@linux.vnet.ibm.com>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org
References: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
In-Reply-To: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2 0/7] Remove more unused functions
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
X-List-Received-Date: Mon, 27 Apr 2015 11:27:56 -0000

14.03.2015 09:19, Thomas Huth wrote:
> Here are some more patches to remove completely unused functions
> from QEMU. Please review carefully, some of the functions might
> still get usefull in the future again, so if you discover one,
> please let me know, then I'll remove it from the patch series
> again.

Applied to -trivial, thank you!

/mjt

