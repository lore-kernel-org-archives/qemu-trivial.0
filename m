Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnLNV-0007y5-Jt
	for mharc-qemu-trivial@gnu.org; Wed, 29 Apr 2015 02:21:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnLNT-0007ug-A2
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 02:21:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnLNS-0001Wf-Hs
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 02:21:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42530)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YnLNO-0001TI-Ad; Wed, 29 Apr 2015 02:21:42 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3199242A54;
	Wed, 29 Apr 2015 09:21:41 +0300 (MSK)
Message-ID: <55407875.10800@msgid.tls.msk.ru>
Date: Wed, 29 Apr 2015 09:21:41 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <1430153133-30988-1-git-send-email-cota@braap.org>
In-Reply-To: <1430153133-30988-1-git-send-email-cota@braap.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/6] trivial fixes
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
X-List-Received-Date: Wed, 29 Apr 2015 06:21:48 -0000

27.04.2015 19:45, Emilio G. Cota wrote:
> Here is a hodge-podge of fixes for issues I found while reviewing
> QTAILQ callers, with a .gitignore patch as a bonus.

Applied to -trivial, all except the bonus.  The 5/6 one (unnecessary
parentheses removal) is a bit too trivial, maybe not worh a patch, but
I applied it too anyway.

Thank you!

/mjt

