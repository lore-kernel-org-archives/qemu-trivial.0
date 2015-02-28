Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRdVS-00035s-Li
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 04:16:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YRdVQ-00032u-R6
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:16:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YRdVQ-0008TG-42
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:16:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:45832)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YRdVL-0008RB-69; Sat, 28 Feb 2015 04:16:11 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9EE1A43EE1;
	Sat, 28 Feb 2015 12:16:10 +0300 (MSK)
Message-ID: <54F1875A.1080805@msgid.tls.msk.ru>
Date: Sat, 28 Feb 2015 12:16:10 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Thomas Huth <thuth@linux.vnet.ibm.com>, qemu-trivial@nongnu.org, 
	qemu-devel@nongnu.org
References: <1424365943-27563-1-git-send-email-thuth@linux.vnet.ibm.com>
In-Reply-To: <1424365943-27563-1-git-send-email-thuth@linux.vnet.ibm.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2 0/5] Remove unused functions
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
X-List-Received-Date: Sat, 28 Feb 2015 09:16:17 -0000

19.02.2015 20:12, Thomas Huth wrote:
> There are quite a lot of completely unused functions scattered
> around in the QEMU sources - here are some patches to remove at
> least some of them.

Applied series to -trivial, thank you!

/mjt

