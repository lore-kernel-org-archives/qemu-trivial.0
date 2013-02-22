Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U8uri-0001i3-V3
	for mharc-qemu-trivial@gnu.org; Fri, 22 Feb 2013 10:48:50 -0500
Received: from eggs.gnu.org ([208.118.235.92]:40038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1U8ure-0001Wi-UH
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 10:48:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1U8urW-0006RD-Iv
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 10:48:46 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:44958)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1U8urK-0006Nq-5P; Fri, 22 Feb 2013 10:48:26 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	5A58B728004A; Fri, 22 Feb 2013 16:48:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id vXZYozxLyGI4; Fri, 22 Feb 2013 16:48:21 +0100 (CET)
Received: from [192.168.178.35] (p54AD9A8B.dip.t-dialin.net [84.173.154.139])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	9E7CC7280047; Fri, 22 Feb 2013 16:48:21 +0100 (CET)
Message-ID: <51279344.7050404@weilnetz.de>
Date: Fri, 22 Feb 2013 16:48:20 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Anthony Liguori <aliguori@us.ibm.com>
References: <1361514481-26164-1-git-send-email-sw@weilnetz.de>
	<87obfcxzgg.fsf@codemonkey.ws>
In-Reply-To: <87obfcxzgg.fsf@codemonkey.ws>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ui/gtk: Fix build (missing
	include for setlocale)
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
X-List-Received-Date: Fri, 22 Feb 2013 15:48:49 -0000

Am 22.02.2013 14:14, schrieb Anthony Liguori:
> Stefan Weil <sw@weilnetz.de> writes:
>
>> At least for Ubuntu Linux locale.h is needed.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> Thanks, what version of Ubuntu?  I'm running 11.10 and don't have this
> problem.
>

It's needed for Ubuntu Precise 12.04.2 LTS (32 bit), the latest LTS version,
so QEMU should support this environment.

I assume that other distributions include locale.h indirectly.
The man page of setlocale explicitly says that locale.h is the
required include file.

Regards,
Stefan Weil


