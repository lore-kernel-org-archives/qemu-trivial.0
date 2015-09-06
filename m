Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZYXAr-00025O-7e
	for mharc-qemu-trivial@gnu.org; Sun, 06 Sep 2015 06:27:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZYXAp-00024t-Dm
	for qemu-trivial@nongnu.org; Sun, 06 Sep 2015 06:27:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZYXAl-0004Bn-F1
	for qemu-trivial@nongnu.org; Sun, 06 Sep 2015 06:27:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49768)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZYXAl-0004Bg-7g
	for qemu-trivial@nongnu.org; Sun, 06 Sep 2015 06:27:43 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B30E4409B9;
	Sun,  6 Sep 2015 13:27:42 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id A484DA76;
	Sun,  6 Sep 2015 13:27:42 +0300 (MSK)
Message-ID: <55EC151E.3060106@msgid.tls.msk.ru>
Date: Sun, 06 Sep 2015 13:27:42 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Andrey Korolyov <andrey@xdel.ru>, qemu-trivial@nongnu.org
References: <1438369974-3315-1-git-send-email-andrey@xdel.ru>
In-Reply-To: <1438369974-3315-1-git-send-email-andrey@xdel.ru>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] Trivial: fix commandline help message
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
X-List-Received-Date: Sun, 06 Sep 2015 10:27:48 -0000

31.07.2015 22:12, Andrey Korolyov wrote:
> Fix obvious typo in printed help for qemu-nbd.

Applied to -trivial, thanks!

/mjt

