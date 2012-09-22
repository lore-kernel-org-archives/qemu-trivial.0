Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFXLk-0002pc-Um
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 17:34:56 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TFXLi-0002jD-FH
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 17:34:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TFXLh-0003uh-DY
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 17:34:54 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:57677)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1TFXLe-0003t3-1G; Sat, 22 Sep 2012 17:34:50 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	51BE47280033; Sat, 22 Sep 2012 23:34:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id QTPPx3XI-g6J; Sat, 22 Sep 2012 23:34:48 +0200 (CEST)
Received: from flocke.weilnetz.de (p54ADAD92.dip.t-dialin.net [84.173.173.146])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	4DF987280032; Sat, 22 Sep 2012 23:34:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1TFXLb-00019R-O7; Sat, 22 Sep 2012 23:34:47 +0200
Message-ID: <505E2EF7.5050207@weilnetz.de>
Date: Sat, 22 Sep 2012 23:34:47 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20120724 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1346790601-14439-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA-r8N+vzqDfLB4592W6V+Mt=ko=nyqp3syXSxOLBz4OkQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-r8N+vzqDfLB4592W6V+Mt=ko=nyqp3syXSxOLBz4OkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/xics: Fix one-bit signed
	bitfields
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
X-List-Received-Date: Sat, 22 Sep 2012 21:34:55 -0000

Am 04.09.2012 22:53, schrieb Peter Maydell:
> On 4 September 2012 21:30, Stefan Weil<sw@weilnetz.de>  wrote:
>> Report from smatch:
>>
>> xics.c:169:19: error: dubious one-bit signed bitfield
>> xics.c:170:15: error: dubious one-bit signed bitfield
>> xics.c:171:19: error: dubious one-bit signed bitfield
>> xics.c:172:25: error: dubious one-bit signed bitfield
>>
>> Instead of replacing 'int' by 'unsigned', 'bool' was used because
>> all 4 values are boolean values.
>>
>> Replacing 0 and 1 in the assignments by false and true
>> looks better for those boolean values.
>
> If we're changing this we should just drop the bitfield usage
> entirely and use plain bool, I think.
>
> -- PMM

David, could you please review the patch and Peter's suggestion?
See also http://patchwork.ozlabs.org/patch/181671/

Thanks,

Stefan Weil


