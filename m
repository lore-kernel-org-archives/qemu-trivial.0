Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WFza8-0003fM-UO
	for mharc-qemu-trivial@gnu.org; Wed, 19 Feb 2014 00:20:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WFza0-0003ZA-F0
	for qemu-trivial@nongnu.org; Wed, 19 Feb 2014 00:20:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WFzZt-0007lP-6g
	for qemu-trivial@nongnu.org; Wed, 19 Feb 2014 00:20:20 -0500
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:54455)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1WFzZe-0007SD-BW; Wed, 19 Feb 2014 00:19:58 -0500
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 4FB591032EB;
	Wed, 19 Feb 2014 06:19:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (smtp.mail.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 7erK_BdgcrvV; Wed, 19 Feb 2014 06:19:56 +0100 (CET)
Received: from [192.168.178.35] (p54ADBA36.dip0.t-ipconnect.de [84.173.186.54])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPSA id 656671032CF;
	Wed, 19 Feb 2014 06:19:56 +0100 (CET)
Message-ID: <53043EFB.3070503@weilnetz.de>
Date: Wed, 19 Feb 2014 06:19:55 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: qemu-trivial@nongnu.org
References: <1392786705-9730-1-git-send-email-sw@weilnetz.de>
	<1392786705-9730-3-git-send-email-sw@weilnetz.de>
In-Reply-To: <1392786705-9730-3-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 134.155.96.80
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] bswap: Modify
 prototypes of st[wl]_{le, be}_p (avoid type conversions)
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
X-List-Received-Date: Wed, 19 Feb 2014 05:20:27 -0000

Am 19.02.2014 06:11, schrieb Stefan Weil:
> The function use uint16_t or uint32_t values, so show this in the function

The functions ...

> prototypes. Non-optimizing compilers will avoid unnecessary type
> conversions when generating calls of these inline function.

... inline functions.

Maybe these typos can be fixed during the commit.

Thanks,
Stefan



