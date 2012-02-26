Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1jCs-0006N1-86
	for mharc-qemu-trivial@gnu.org; Sun, 26 Feb 2012 13:52:26 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S1jCp-0006E2-6m
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 13:52:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S1jCo-0006Z4-4B
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 13:52:22 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:58153)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1S1jCl-0006Yj-Sr; Sun, 26 Feb 2012 13:52:20 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	375C8728009A; Sun, 26 Feb 2012 19:52:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 0z8dNpUdw4WX; Sun, 26 Feb 2012 19:52:16 +0100 (CET)
Received: from [192.168.178.20] (p5086FEE3.dip.t-dialin.net [80.134.254.227])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	89FC07280013; Sun, 26 Feb 2012 19:52:16 +0100 (CET)
Message-ID: <4F4A7F5F.2020808@weilnetz.de>
Date: Sun, 26 Feb 2012 19:52:15 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.27) Gecko/20120216 Thunderbird/3.1.19
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1330263021-1339-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA_82UCPWVukhAWcxGjeRQfkb+_E7OOdx8fh9y-6Ya_OMg@mail.gmail.com>
In-Reply-To: <CAFEAcA_82UCPWVukhAWcxGjeRQfkb+_E7OOdx8fh9y-6Ya_OMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] libcacard: Spelling and
 grammar fixes in documentation
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
X-List-Received-Date: Sun, 26 Feb 2012 18:52:24 -0000

Am 26.02.2012 19:18, schrieb Peter Maydell:
> On 26 February 2012 13:30, Stefan Weil<sw@weilnetz.de>  wrote:
>> @@ -217,10 +217,10 @@ the card using the following functions:
>>           VCardStatus vcard_add_applet(VCard *card, VCardApplet *applet);
>>
>>    Add an applet onto the list of applets attached to the card. Once an applet
>> -  has been added, it can be selected by it's aid, and then commands will be
>> +  has been added, it can be selected by its aid, and then commands will be
> While you're changing this line, it looks like 'aid' here should be 'AID'
> (it is capitalised elsewhere in the doc except where referring to a function
> parameter name).
>
>>    routed to it VCardProcessAPDU function. This function adopts the applet the
>>    passed int applet.
> The sentence "This function..." clearly needs correcting as it doesn't
> make much sense as it stands, but I'm not sure what it should be changed to.

Nor was I when I read that sentence, that's why I did not fix it :-)

AID looks correct, so I'll send an update of my patch which fixes
that, too.

Thanks,

Stefan Weil


