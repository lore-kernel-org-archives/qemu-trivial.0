Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9S3c-0005ZG-MM
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 03:01:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9S3a-0005YA-Oi
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:01:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9S3Z-0002O6-RJ
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:01:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54621)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9S3U-0002MS-Dg; Sun, 05 Jun 2016 03:01:04 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id DF4F6408D7;
	Sun,  5 Jun 2016 10:00:50 +0300 (MSK)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1464876355-21050-1-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <5753CE22.2080706@msgid.tls.msk.ru>
Date: Sun, 5 Jun 2016 10:00:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <1464876355-21050-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] qemu-common.h: Drop WORDS_ALIGNED define
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
X-List-Received-Date: Sun, 05 Jun 2016 07:01:11 -0000

02.06.2016 17:05, Peter Maydell wrote:
> The WORDS_ALIGNED #define is not used anywhere, and hasn't been since
> 2013 when commit 612d590ebc6cef rewrote the various ld<type>_<endian>_p
> functions to not use it. Remove the #define and the comment describing it.
> Also remove the line in the comment about TARGET_WORDS_ALIGNED, since
> it has never actually existed.

Applied to -trivial, thanks!

/mjt

