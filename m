Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cdweW-000211-P3
	for mharc-qemu-trivial@gnu.org; Wed, 15 Feb 2017 05:17:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cdweS-0001z4-O6
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 05:17:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cdweR-00067U-P2
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 05:17:32 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:38084)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cdweM-00065Y-57; Wed, 15 Feb 2017 05:17:26 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 22EF1421B6;
	Wed, 15 Feb 2017 13:17:26 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 6EB3F264;
	Wed, 15 Feb 2017 13:17:25 +0300 (MSK)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1486144722-6021-1-git-send-email-peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, patches@linaro.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <e54fdd88-c5be-1ec8-c426-8e4ddf3379ed@msgid.tls.msk.ru>
Date: Wed, 15 Feb 2017 13:17:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <1486144722-6021-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] CODING_STYLE: Mention preferred comment
 form
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
X-List-Received-Date: Wed, 15 Feb 2017 10:17:35 -0000

03.02.2017 20:58, Peter Maydell wrote:
> Our defacto coding style strongly prefers /* */ style comments
> over the single-line // style, and checkpatch enforces this,
> but we don't actually document this. Mention it in CODING_STYLE.

Applied to -trivial, thanks!

/mjt

