Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tlbk2-0008DY-T6
	for mharc-qemu-trivial@gnu.org; Thu, 20 Dec 2012 03:44:34 -0500
Received: from eggs.gnu.org ([208.118.235.92]:49792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tlbjz-0008DS-Dy
	for qemu-trivial@nongnu.org; Thu, 20 Dec 2012 03:44:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tlbjy-0006Ti-2k
	for qemu-trivial@nongnu.org; Thu, 20 Dec 2012 03:44:31 -0500
Received: from mail-la0-f42.google.com ([209.85.215.42]:52634)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tlbjx-0006TZ-QK
	for qemu-trivial@nongnu.org; Thu, 20 Dec 2012 03:44:29 -0500
Received: by mail-la0-f42.google.com with SMTP id s15so2538441lag.29
	for <qemu-trivial@nongnu.org>; Thu, 20 Dec 2012 00:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=EjVNGdalqNAJ+KFcCEe4lkOX2qDszmqzC61IMwkuAlM=;
	b=klpr76Qpk+drkaxIm68NbO7XkmNmuaIlrs5Cg3x7vk+6CdUZXQkGWbJy8uHXOfKxsk
	3QTtAi+NmcbhmHUu+zuv0X03MaUvSdGndIQFE+iP/KYpBdYQLiEZI6y1dL6TjfK4+Ahr
	xl0xhoynHdqpQ3ajE+1chdYL731DPNCr30k4PrEzs6ZSYQGLgi7m23S+xSc5A6/BdRBV
	3aqnAfZrI+nBRm4HiMb4J5DIFesoksxJ6aTMe/bdBiBJtbL4aK+vcW6jBe9HW4pHk+nZ
	f8tYPl8ptr4FGB78gvKzU6v50LFYQVz8vM8YbY7+ouyPT8jaS+aKpPwU/FlJZMnYyUgy
	GTRQ==
MIME-Version: 1.0
Received: by 10.152.162.1 with SMTP id xw1mr8184460lab.3.1355993067534; Thu,
	20 Dec 2012 00:44:27 -0800 (PST)
Received: by 10.112.41.194 with HTTP; Thu, 20 Dec 2012 00:44:27 -0800 (PST)
In-Reply-To: <20121218162833.GF12099@stefanha-thinkpad.redhat.com>
References: <20121210135131.GA40753@cs.nctu.edu.tw>
	<20121218162833.GF12099@stefanha-thinkpad.redhat.com>
Date: Thu, 20 Dec 2012 09:44:27 +0100
Message-ID: <CAJSP0QUJYWu44CAsZTU3NMZD0Bn311xXFt6HyuPx=H90GcXaug@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?UTF-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.215.42
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Andreas Faerber <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] Remove Sparc v7 and v8 host support from
 the configure list
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
X-List-Received-Date: Thu, 20 Dec 2012 08:44:33 -0000

Wei-Ren: your SMTP server bounced my response, I hope it gets through now:

554 <chenwj@iis.sinica.edu.tw>...5.7.1 go away! you're rejected by recipien=
t.


On Tue, Dec 18, 2012 at 5:28 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote=
:
> On Mon, Dec 10, 2012 at 09:51:31PM +0800, =E9=99=B3=E9=9F=8B=E4=BB=BB (We=
i-Ren Chen) wrote:
>>   According to QEMU 1.3 release note, sparc v7 and v8 host support have
>> been removed. [1] Fix configure list as well.
>>
>> [1] http://wiki.qemu.org/ChangeLog/1.3#Host_support
>>
>> Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
>> ---
>>  configure |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/configure b/configure
>> index e5aedef..56cf49d 100755
>> --- a/configure
>> +++ b/configure
>> @@ -1089,7 +1089,7 @@ echo "  --fmod-inc               path to FMOD incl=
udes"
>>  echo "  --oss-lib                path to OSS library"
>>  echo "  --enable-uname-release=3DR Return R for uname -r in usermode em=
ulation"
>>  echo "  --cpu=3DCPU                Build for host CPU [$cpu]"
>> -echo "  --sparc_cpu=3DV            Build qemu for Sparc architecture v7=
, v8, v8plus, v8plusa, v9"
>> +echo "  --sparc_cpu=3DV            Build qemu for Sparc architecture v8=
plus, v8plusa, v9"
>>  echo "  --disable-uuid           disable uuid support"
>>  echo "  --enable-uuid            enable uuid support"
>>  echo "  --disable-vde            disable support for vde network"
>
> Please remove --sparc_cpu completely, it no longer does anything.  See
> 9b9c37c36439ee0452632253dac7a31897f27f70 for details.
>
> Stefan

