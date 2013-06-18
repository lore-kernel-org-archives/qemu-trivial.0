Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uoliv-0007SE-EN
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jun 2013 22:32:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uolit-0007PE-He
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 22:32:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uolis-0002fF-Mg
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 22:32:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60763)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Uoliq-0002eq-OU; Mon, 17 Jun 2013 22:32:40 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A7637418E5;
	Tue, 18 Jun 2013 06:32:39 +0400 (MSK)
Message-ID: <51BFC6C6.4050009@msgid.tls.msk.ru>
Date: Tue, 18 Jun 2013 06:32:38 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1371382645-20912-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1371382645-20912-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] kvm: Fix potential resource leak
 (missing fclose)
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
X-List-Received-Date: Tue, 18 Jun 2013 02:32:44 -0000

Thanks, applied all of the following:

 kvm: Fix potential resource leak (missing fclose)
 savevm: Fix potential memory leak
 audio: Replace static functions in header file by macros, remove GCC_ATTR
 libcacard: Fix cppcheck warning and remove unneeded code

to the trivial patch queue.

/mjt

