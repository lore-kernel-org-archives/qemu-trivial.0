Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VvQfW-0003cq-Ij
	for mharc-qemu-trivial@gnu.org; Tue, 24 Dec 2013 07:01:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VvQfP-0003VF-M7
	for qemu-trivial@nongnu.org; Tue, 24 Dec 2013 07:01:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VvQfK-0004sm-Eo
	for qemu-trivial@nongnu.org; Tue, 24 Dec 2013 07:00:55 -0500
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:45709)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VvQf9-0004r0-Qa; Tue, 24 Dec 2013 07:00:39 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	9727A7280AA7; Tue, 24 Dec 2013 13:00:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id jDjkkjrhoocK; Tue, 24 Dec 2013 13:00:27 +0100 (CET)
Received: from [192.168.178.35] (p54ADB0ED.dip0.t-ipconnect.de
	[84.173.176.237])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	8D0517280691; Tue, 24 Dec 2013 13:00:26 +0100 (CET)
Message-ID: <52B9775A.2080704@weilnetz.de>
Date: Tue, 24 Dec 2013 13:00:26 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1387886052-27067-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1387886052-27067-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <andreas.faerber@web.de>,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ui/cocoa: Remove stray tabs
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
X-List-Received-Date: Tue, 24 Dec 2013 12:01:00 -0000

Am 24.12.2013 12:54, schrieb Peter Maydell:
> The ui/cocoa.m file has just three lines with hardcoded tabs; fix them.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I'm generally fairly conservative about "fix indent" patches,
> but three lines seems sufficiently minimal to be worth just
> zapping. Happy to drop this if people disagree.
>
>  ui/cocoa.m | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Stefan Weil <sw@weilnetz.de>

CCing qemu-trivial

