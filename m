Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V3OsC-0002lH-Ki
	for mharc-qemu-trivial@gnu.org; Sun, 28 Jul 2013 07:10:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1V3Os6-0002dL-BL
	for qemu-trivial@nongnu.org; Sun, 28 Jul 2013 07:10:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1V3Os1-00074J-7c
	for qemu-trivial@nongnu.org; Sun, 28 Jul 2013 07:10:42 -0400
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:51330)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1V3Orq-00072X-VW; Sun, 28 Jul 2013 07:10:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 13F0D1597DE;
	Sun, 28 Jul 2013 13:10:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (mail-r86.rz.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4n4Tl82vUid6; Sun, 28 Jul 2013 13:10:31 +0200 (CEST)
Received: from [192.168.178.35] (p54ADBBF4.dip0.t-ipconnect.de
	[84.173.187.244])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPSA id 169071593B4;
	Sun, 28 Jul 2013 13:10:31 +0200 (CEST)
Message-ID: <51F4FC1F.6070803@weilnetz.de>
Date: Sun, 28 Jul 2013 13:10:23 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1374990895-25584-1-git-send-email-sw@weilnetz.de>
	<51F4E884.4010509@suse.de>
In-Reply-To: <51F4E884.4010509@suse.de>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 134.155.96.80
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] musicpal: Fix typo in name
	of local function
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
X-List-Received-Date: Sun, 28 Jul 2013 11:10:47 -0000

Am 28.07.2013 11:46, schrieb Andreas F=C3=A4rber:
> Am 28.07.2013 07:54, schrieb Stefan Weil:
>> The misspelling was spotted by Andreas F=C3=A4rber.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>  hw/arm/musicpal.c |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
[...]
>> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>
>> but to clarify: I had notified you not to send this small patch, which
>> now conflicts with my argument cleanup, but to add this typo to your
>> blacklist to check the whole codebase for similar typos. Are there non=
e?
>>
>> But since this is a sensible cleanup anyway, I'll just put a copy into
>> my queue before the refactoring, to avoid merge conflicts with -trivia=
l.
>>
>> Thanks,
>> Andreas

Codespell uses a list of common misspellings which is an enhanced version=
of
https://en.wikipedia.org/wiki/Wikipedia:Lists_of_common_misspellings/For_=
machines.

"Brigthness" was not among those words. Even if it were, codespell would =
not
detect it in a composed word like musicpal_lcd_gpio_brigthness_in.

With some small modifications (split words at [-_]), codespell detects mo=
re
misspellings in QEMU: bandwith, issueing, propietary, threshhold.

Even more could be detected by analysing composed words.

Regards,
Stefan


