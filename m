Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W37z5-0006Kr-1M
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jan 2014 12:41:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1W37yw-0006AP-If
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 12:41:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1W37yp-0003eG-9B
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 12:40:54 -0500
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:57566)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1W37yZ-0003ay-SH; Tue, 14 Jan 2014 12:40:31 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	536387280AB6; Tue, 14 Jan 2014 18:40:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id swl3u2HkYwru; Tue, 14 Jan 2014 18:40:06 +0100 (CET)
Received: from [192.168.178.35] (p54ADB7F7.dip0.t-ipconnect.de
	[84.173.183.247])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	874CF7280AB4; Tue, 14 Jan 2014 18:40:04 +0100 (CET)
Message-ID: <52D57673.7020100@weilnetz.de>
Date: Tue, 14 Jan 2014 18:40:03 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1389679228-15870-1-git-send-email-sw@weilnetz.de>
	<52D57343.8000205@msgid.tls.msk.ru>
In-Reply-To: <52D57343.8000205@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] exec: Exclude non portable function for
 MinGW
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
X-List-Received-Date: Tue, 14 Jan 2014 17:41:02 -0000

Am 14.01.2014 18:26, schrieb Michael Tokarev:
> 14.01.2014 10:00, Stefan Weil wrote:
>> cpu_physical_memory_set_dirty_lebitmap calls getpageaddr and ffsl which are
>> unavailable for MinGW. As the function is unused for MinGW, it can simply
>> be excluded from compilation.
> I applied it to -trivial.  But maybe it's better to just move whole thing to kvm-all.c where
> it is actually used?
>
> Thanks,
>
> /mjt

That's a good suggestion.

Juan, a comment in include/exec/ram_addr.h says that those functions
will be removed soon. Would you suggest moving them to kvm-all.c now, or
would you prefer the conditional compilation for MinGW which I
introduced with my patch?

Regards,
Stefan


