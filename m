Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLUJj-0007V8-Tz
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 05:42:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1XLUJa-0007UL-EW
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 05:42:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1XLUJS-00007Z-Uw
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 05:42:22 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:58226)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1XLUJS-00007P-Og
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 05:42:14 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	67A001180F98; Sun, 24 Aug 2014 11:42:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id UVUtzgifyvjF; Sun, 24 Aug 2014 11:42:10 +0200 (CEST)
Received: from [192.168.178.24] (p54ACA97A.dip0.t-ipconnect.de
	[84.172.169.122])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	78B171180F97; Sun, 24 Aug 2014 11:42:10 +0200 (CEST)
Message-ID: <53F9B372.10602@weilnetz.de>
Date: Sun, 24 Aug 2014 11:42:10 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <1408525330-25414-1-git-send-email-sw@weilnetz.de>
	<53F9AE86.7040700@msgid.tls.msk.ru>
In-Reply-To: <53F9AE86.7040700@msgid.tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] libdecnumber: Fix warnings from smatch
 (missing static, boolean operations)
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
X-List-Received-Date: Sun, 24 Aug 2014 09:42:30 -0000

Am 24.08.2014 11:21, schrieb Michael Tokarev:
> Applied to -trivial, thank you!
>
> But I've a small concern - should we really do this on "external" sources,
> and divirge from upstream needlessly?
>
> Thanks,
>
> /mjt

In general, I agree. In this case, the code was part of gcc, and newer 
versions of gcc use GPL 3 which is incompatible with QEMU, so I assume 
that the code in QEMU is no longer available from a maintained upstream.

Stefan



