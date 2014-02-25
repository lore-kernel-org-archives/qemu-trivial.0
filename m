Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WIAdR-0001yx-L0
	for mharc-qemu-trivial@gnu.org; Tue, 25 Feb 2014 00:32:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WIAdH-0001ii-M1
	for qemu-trivial@nongnu.org; Tue, 25 Feb 2014 00:32:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WIAdA-0006Sb-CI
	for qemu-trivial@nongnu.org; Tue, 25 Feb 2014 00:32:43 -0500
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:40793)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1WIAcv-0006QF-JX; Tue, 25 Feb 2014 00:32:21 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	74A1A7280AC0; Tue, 25 Feb 2014 06:32:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id YjxsXUrsil4E; Tue, 25 Feb 2014 06:32:18 +0100 (CET)
Received: from [192.168.178.35] (p54ADBE45.dip0.t-ipconnect.de [84.173.190.69])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	9E20B7280AB8; Tue, 25 Feb 2014 06:32:18 +0100 (CET)
Message-ID: <530C2AE2.1010003@weilnetz.de>
Date: Tue, 25 Feb 2014 06:32:18 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <1393174935-11750-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1393174935-11750-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/9] w32: Reduce dependency
	on Windows API
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
X-List-Received-Date: Tue, 25 Feb 2014 05:32:52 -0000

Am 23.02.2014 18:02, schrieb Stefan Weil:
> Today, most .o files depend on windows.h when QEMU is built with MinGW or
> MinGW-w64 (32 and 64 bit builds). These patches reduce the number of such
> files from more than 1800 to less than 180. They also allow removing some
> hacks which were needed because of conflicts with windows.h. A nasty
> compiler warning is fixed, too.
> 
> The modifications were tested with MinGW (32 bit native) and MinGW-w64
> (32 and 64 bit cross).
> 
> Regards
> Stefan W.
> 
> [PATCH 1/9] util/iov: Use qemu/sockets.h instead of conditional code
> [PATCH 2/9] exec: Remove unneeded include files
> [PATCH 3/9] qemu-img: Remove unneeded include files
> [PATCH 4/9] qga: Remove unneeded include file
> [PATCH 5/9] vl: Remove unneeded include file
> [PATCH 6/9] w32: Add and use intermediate include file for windows.h
> [PATCH 7/9] w32: Move inline function from header file to C source
> [PATCH 8/9] w32: Reduce dependencies in sysemu/os-win32.h
> [PATCH 9/9] w32: Replace Windows specific data types in common
> 

This patch series needs at least one more iteration with a v2.

Patches 1-5 can be applied independently of the rest and are trivial, so
maybe they can be applied by qemu-trivial, or I can send a pull request
for only those patches as soon as they were reviewed. That would reduce
the size of my v2 patch set.

Thanks
Stefan


