Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZYXk1-00071r-5m
	for mharc-qemu-trivial@gnu.org; Sun, 06 Sep 2015 07:04:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZYXjy-00070B-6d
	for qemu-trivial@nongnu.org; Sun, 06 Sep 2015 07:04:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZYXjx-0002dt-FE
	for qemu-trivial@nongnu.org; Sun, 06 Sep 2015 07:04:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50672)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZYXjs-0002ac-HS; Sun, 06 Sep 2015 07:04:00 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C7FC0409B9;
	Sun,  6 Sep 2015 14:03:56 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id B8BBDA76;
	Sun,  6 Sep 2015 14:03:56 +0300 (MSK)
Message-ID: <55EC1D9C.1080801@msgid.tls.msk.ru>
Date: Sun, 06 Sep 2015 14:03:56 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Samuel Thibault <samuel.thibault@gnu.org>, qemu-devel@nongnu.org
References: <20150830141909.GA13186@var.home> <20150830151213.GE3238@var.home>
In-Reply-To: <20150830151213.GE3238@var.home>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] baum: Fix build with debugging enabled
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
X-List-Received-Date: Sun, 06 Sep 2015 11:04:07 -0000

30.08.2015 18:12, Samuel Thibault wrote:
> cur and buf are pointers, so the difference is a ptrdiff_t

Applied to -trivial, thanks!

/mjt

