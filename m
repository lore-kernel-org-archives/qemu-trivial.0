Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b6wPJ-0008Rl-KK
	for mharc-qemu-trivial@gnu.org; Sun, 29 May 2016 04:49:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49388)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b6wPH-0008QL-5K
	for qemu-trivial@nongnu.org; Sun, 29 May 2016 04:49:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b6wPG-0008SA-99
	for qemu-trivial@nongnu.org; Sun, 29 May 2016 04:49:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39329)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b6wP8-0008QT-Ua; Sun, 29 May 2016 04:49:03 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CF1B842C37;
	Sun, 29 May 2016 11:48:58 +0300 (MSK)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1464103479-26913-1-git-send-email-peter.maydell@linaro.org>
Cc: qemu-trivial@nongnu.org, patches@linaro.org
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <574AACFA.8080200@msgid.tls.msk.ru>
Date: Sun, 29 May 2016 11:48:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <1464103479-26913-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH 0/4] Remove unnecessary glib.h includes
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
X-List-Received-Date: Sun, 29 May 2016 08:49:12 -0000

24.05.2016 18:24, Peter Maydell wrote:
> This patchset removes '#include <glib.h>' lines, because the
> header is already included via osdep.h.
> 
> Patch 1 adds the check to clean-includes, and patches 2-4
> apply it (the breakup into 'tests', 'qga' and 'everything else'
> is semi-arbitrary and just to keep patch sizes down.)
> 
> thanks
> -- PMM
> 
> 
> Peter Maydell (4):
>   clean-includes: Add glib.h to list of unneeded includes
>   tests: Remove unnecessary glib.h includes
>   qga: Remove unnecessary glib.h includes
>   all: Remove unnecessary glib.h includes


Applied series to -trivial, thanks!

/mjt

