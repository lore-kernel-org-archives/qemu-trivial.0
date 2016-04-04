Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1an8hV-0007Uc-3G
	for mharc-qemu-trivial@gnu.org; Mon, 04 Apr 2016 13:54:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1an8hS-0007RF-Ov
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 13:54:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1an8hO-0004xw-G8
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 13:54:06 -0400
Received: from mail.weilnetz.de ([37.221.199.173]:40288)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1an8hK-0004xg-6s; Mon, 04 Apr 2016 13:53:58 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id 3B9ED11810A5;
	Mon,  4 Apr 2016 19:53:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id h1bLYJtsGLaH; Mon,  4 Apr 2016 19:53:55 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (p54AC9770.dip0.t-ipconnect.de
	[84.172.151.112])
	by mail.weilnetz.de (Postfix) with ESMTPSA id 02C2B1181097;
	Mon,  4 Apr 2016 19:53:54 +0200 (CEST)
To: Sergey Fedorov <serge.fdrv@gmail.com>,
	Sergey Fedorov <sergey.fedorov@linaro.org>, qemu-devel@nongnu.org
References: <1459767918-796-1-git-send-email-sergey.fedorov@linaro.org>
	<5702567E.6060701@weilnetz.de> <57026A7E.1000506@gmail.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <5702AA32.507@weilnetz.de>
Date: Mon, 4 Apr 2016 19:53:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <57026A7E.1000506@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH] tci: Fix build with no '-DNDEBUG'
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
X-List-Received-Date: Mon, 04 Apr 2016 17:54:07 -0000

Am 04.04.2016 um 15:22 schrieb Sergey Fedorov:
> On 04/04/16 14:56, Stefan Weil wrote:
[...]
>> There is indeed a regression in the current code. Commit
>> d38ea87ac54af64ef611de434d07c12dc0399216 added an include statement
>> which includes assert.h before NDEBUG is defined. This is wrong and
>> needs a fix. Could you please try tci.c starting like this?
>>
>> /* Defining NDEBUG disables assertions (which makes the code faster). */
>> #if !defined(CONFIG_DEBUG_TCG) && !defined(NDEBUG)
>> # define NDEBUG
>> #endif
>>
>> #include "qemu/osdep.h"
>>
> 
> Doing so really helps. So what are the plans of how to fix the problem?
> 
> Thanks,
> Sergey


The correct fix needs a little bit more code because my first try (see
above) did not get the definition of macro CONFIG_DEBUG_TCG.

My patch was now sent to the list.

Regards,
Stefan


