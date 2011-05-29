Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQhWA-0005sM-HO
	for mharc-qemu-trivial@gnu.org; Sun, 29 May 2011 11:03:02 -0400
Received: from eggs.gnu.org ([140.186.70.92]:44382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QQhW7-0005mZ-Mx
	for qemu-trivial@nongnu.org; Sun, 29 May 2011 11:03:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QQhW6-0003ED-UT
	for qemu-trivial@nongnu.org; Sun, 29 May 2011 11:02:59 -0400
Received: from fmmailgate02.web.de ([217.72.192.227]:47961)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1QQhW4-0003Df-K4; Sun, 29 May 2011 11:02:56 -0400
Received: from smtp05.web.de  ( [172.20.4.166])
	by fmmailgate02.web.de (Postfix) with ESMTP id 41FAF1A06DC89;
	Sun, 29 May 2011 17:02:55 +0200 (CEST)
Received: from [87.173.127.118] (helo=[10.0.1.1])
	by smtp05.web.de with asmtp (TLSv1:AES128-SHA:128) (WEB.DE 4.110 #2)
	id 1QQhW2-0007TA-00; Sun, 29 May 2011 17:02:55 +0200
Message-Id: <FCD2CC28-7DEC-4435-B7B0-D1349BD9BA4C@web.de>
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
To: Alexandre Raymond <cerbere@gmail.com>, Stefan Weil <weil@mail.berlios.de>
In-Reply-To: <4DDFE26E.8090803@mail.berlios.de>
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed; delsp=yes
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Apple Message framework v936)
Date: Sun, 29 May 2011 17:02:53 +0200
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
	<1306516951-31105-4-git-send-email-cerbere@gmail.com>
	<4DDFE26E.8090803@mail.berlios.de>
X-Mailer: Apple Mail (2.936)
Sender: andreas.faerber@web.de
X-Sender: Andreas.Faerber@web.de
X-Provags-ID: V01U2FsdGVkX1+zVpjQCge1AHKNQFR1bic2XkvmsYDNch/UuU2x
	tSbOEG/BAil7XDSIHb4tDGUXqJTvMwuiZ4VR4zmqyyzGJgb8Ms
	0CShxP4EGsGJOtfbD/0g==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.227
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/6] Fix compilation warning
	due to incorrectly specified type
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
X-List-Received-Date: Sun, 29 May 2011 15:03:00 -0000

Am 27.05.2011 um 19:42 schrieb Stefan Weil:

> Am 27.05.2011 19:22, schrieb Alexandre Raymond:
>> In audio/coreaudio.c, a variable named "str" was assigned "const =20
>> char" values,
>> which resulted in the following warnings:
>>
>> -----8<-----
>> audio/coreaudio.c: In function =91coreaudio_logstatus=92:
>> audio/coreaudio.c:59: warning: initialization discards qualifiers =20
>> from pointer target type
>> audio/coreaudio.c:63: warning: assignment discards qualifiers from =20=

>> pointer target type
>> (...)
>> -----8<-----
>>
>> Signed-off-by: Alexandre Raymond<cerbere@gmail.com>
>> ---
>>  audio/coreaudio.c |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
>> index 0a26413..3bd75cd 100644
>> --- a/audio/coreaudio.c
>> +++ b/audio/coreaudio.c
>> @@ -56,7 +56,7 @@ typedef struct coreaudioVoiceOut {
>>
>>  static void coreaudio_logstatus (OSStatus status)
>>  {
>> -    char *str =3D "BUG";
>> +    const char *str =3D "BUG";
>>
>>      switch(status) {
>>      case kAudioHardwareNoError:
>>
>
> Acked-by: Stefan Weil <weil@mail.berlios.de>

Thanks, applied to the cocoa branch.

Andreas=

