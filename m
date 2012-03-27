Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SCaCS-0001rH-1J
	for mharc-qemu-trivial@gnu.org; Tue, 27 Mar 2012 13:28:52 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SCaCP-0001jR-Cn
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2012 13:28:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SCaCK-0000cf-Ov
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2012 13:28:48 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:40037)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1SCaCC-0000af-Uo; Tue, 27 Mar 2012 13:28:37 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	D047972800B1; Tue, 27 Mar 2012 19:28:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id pm-yLSr3dr4E; Tue, 27 Mar 2012 19:28:30 +0200 (CEST)
Received: from [192.168.178.20] (p54AD9D29.dip.t-dialin.net [84.173.157.41])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	3796072800B0; Tue, 27 Mar 2012 19:28:30 +0200 (CEST)
Message-ID: <4F71F8C0.9040109@weilnetz.de>
Date: Tue, 27 Mar 2012 19:28:32 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.28) Gecko/20120313 Thunderbird/3.1.20
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>
References: <1332867470-29780-1-git-send-email-sw@weilnetz.de>
	<4F71F442.7080201@redhat.com>
In-Reply-To: <4F71F442.7080201@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Andreas Faerber <andreas.faerber@web.de>, qemu-devel@nongnu.org,
	Emre Ersin <emre.ersin@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix conversion from lower
 to upper case with Turkish locale
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
X-List-Received-Date: Tue, 27 Mar 2012 17:28:51 -0000

Am 27.03.2012 19:09, schrieb Eric Blake:
> On 03/27/2012 10:57 AM, Stefan Weil wrote:
>> Some locale settings let make fail or create wrong results
>> because tr '[:lower:]' '[:upper:]' which is used to convert
>> from lower to upper case depends on the locale.
>>
>> With locale tr_TR.UTF-8, lower case 'i' is not converted to 'I'.
>> This results in wrong entries in config-host.h like these ones:
>>
>> #define CONFIG_QEMU_PREFiX "/usr/local"
>> #define CONFIG_QEMU_BiNDiR "/usr/local/bin"
>
>> for card in $audio_card_list; do
>> - def=CONFIG_`echo $card | tr '[:lower:]' '[:upper:]'`
>> + def=CONFIG_`echo $card | tr '[a-z]' '[A-Z]'`
>
> NACK. POSIX says that 'tr a-z' is unspecified outside of the POSIX
> locale, but without setting LC_ALL=C, you aren't guaranteeing the POSIX
> locale. If you want to be portable without use of [:lower:], you have
> to spell it out, with abcdefghijklmnopqrstuvwxyz.

Thanks for your review. I don't think that QEMU will run on
systems with EBCDIC or other strange character sets where
[a-z] would not work, but of course settings LC_ALL=C is
better. So I have sent a new patch which adds this to every
invocation of tr.

Regards,
Stefan Weil



