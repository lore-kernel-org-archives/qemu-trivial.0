Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z08Mb-0005WW-RX
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:05:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08Ma-0005Vn-8q
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:05:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08MZ-0002LQ-Gi
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:05:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48123)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z08MS-00027r-44; Wed, 03 Jun 2015 09:05:36 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8671540787;
	Wed,  3 Jun 2015 16:05:25 +0300 (MSK)
Message-ID: <556EFB95.2010708@msgid.tls.msk.ru>
Date: Wed, 03 Jun 2015 16:05:25 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-trivial@nongnu.org
References: <1433321798-13398-1-git-send-email-alex.bennee@linaro.org>
In-Reply-To: <1433321798-13398-1-git-send-email-alex.bennee@linaro.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: postfix --extra-cflags to
	QEMU_CFLAGS
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
X-List-Received-Date: Wed, 03 Jun 2015 13:05:45 -0000

Applied to -trivial, thanks!

The other nearby case, --extra-ldflags, also wants this reordering :)

/mjt

