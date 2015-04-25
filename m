Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YltQw-0004JG-65
	for mharc-qemu-trivial@gnu.org; Sat, 25 Apr 2015 02:19:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YltQq-0004G3-MW
	for qemu-trivial@nongnu.org; Sat, 25 Apr 2015 02:19:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YltMt-0001F1-AB
	for qemu-trivial@nongnu.org; Sat, 25 Apr 2015 02:15:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44087)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YltMp-0001DW-Sr; Sat, 25 Apr 2015 02:15:08 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3BEA242320;
	Sat, 25 Apr 2015 09:15:07 +0300 (MSK)
Message-ID: <553B30EA.6030508@msgid.tls.msk.ru>
Date: Sat, 25 Apr 2015 09:15:06 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-trivial@nongnu.org
References: <1427827750-610946-1-git-send-email-stefanb@linux.vnet.ibm.com>
In-Reply-To: <1427827750-610946-1-git-send-email-stefanb@linux.vnet.ibm.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/2] tpm: Cast 64bit variables to int
	when used in DPRINTF
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
X-List-Received-Date: Sat, 25 Apr 2015 06:19:19 -0000

Applied both patches to -trivial, thank you!

/mjt

