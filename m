Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bzT8U-0002JR-7L
	for mharc-qemu-trivial@gnu.org; Wed, 26 Oct 2016 14:41:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bzT8S-0002Ht-47
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2016 14:41:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bzT8R-0002ZD-FR
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2016 14:41:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bzT8M-0002Xt-Pu; Wed, 26 Oct 2016 14:41:06 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7AFE3431FE;
	Wed, 26 Oct 2016 21:41:05 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 14AA2B4E;
	Wed, 26 Oct 2016 21:41:04 +0300 (MSK)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1477071705-30634-1-git-send-email-peter.maydell@linaro.org>
Cc: Amit Shah <amit.shah@redhat.com>, Juan Quintela <quintela@redhat.com>,
	patches@linaro.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <2695bda7-d094-6027-ca27-6d374b2de714@msgid.tls.msk.ru>
Date: Wed, 26 Oct 2016 21:41:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1477071705-30634-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] migration: Remove unneeded NULL check
 from migrate_fd_error()
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
X-List-Received-Date: Wed, 26 Oct 2016 18:41:12 -0000

Applied to -trivial, thanks!

/mjt

