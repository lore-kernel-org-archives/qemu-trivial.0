Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQMQl-0002oo-Md
	for mharc-qemu-trivial@gnu.org; Sun, 29 Sep 2013 15:13:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1VQMQg-0002eB-0K
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 15:13:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1VQMQb-0002Ln-HI
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 15:13:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:8945)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1VQMQS-0002KV-A8; Sun, 29 Sep 2013 15:13:04 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8TJClTO005378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Sun, 29 Sep 2013 15:12:47 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-30.ams2.redhat.com
	[10.36.112.30])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8TJCdWS013943; Sun, 29 Sep 2013 15:12:40 -0400
Message-ID: <52487BAB.4010703@redhat.com>
Date: Sun, 29 Sep 2013 21:12:43 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: Guenter Roeck <linux@roeck-us.net>
References: <1378625945-15525-1-git-send-email-linux@roeck-us.net>
	<5233E059.8090402@roeck-us.net>
In-Reply-To: <5233E059.8090402@roeck-us.net>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	Rob Landley <rob@landley.net>
Subject: Re: [Qemu-trivial] [PATCH] sh4: Fix serial line access for Linux
 kernels later than 3.2
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
X-List-Received-Date: Sun, 29 Sep 2013 19:13:22 -0000

sh4 is ~orphan so nobody should complain if qemu-trivial picks this up
as well.

Paolo

Il 14/09/2013 06:04, Guenter Roeck ha scritto:
> On 09/08/2013 12:39 AM, Guenter Roeck wrote:
>> With Linux kernel version 3.3 or later, qemu fails with the following
>> message:
>>
>> sh_serial: unsupported read from 0x18
>>    Aborted
>>
>> Reported-and-analyzed-by: Rob Landley <rob@landley.net>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> ping ...
> 
>> ---
>> See http://lists.nongnu.org/archive/html/qemu-devel/2012-07/msg03870.html
>> for Rob's analysis of the problem. Unfortunately, the patch never made it
>> into qemu.
>>
>>   hw/char/sh_serial.c |    2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
>> index 6223a55..9328dd1 100644
>> --- a/hw/char/sh_serial.c
>> +++ b/hw/char/sh_serial.c
>> @@ -248,11 +248,9 @@ static uint64_t sh_serial_read(void *opaque,
>> hwaddr offs,
>>                       s->flags &= ~SH_SERIAL_FLAG_RDF;
>>               }
>>               break;
>> -#if 0
>>           case 0x18:
>>               ret = s->fcr;
>>               break;
>> -#endif
>>           case 0x1c:
>>               ret = s->rx_cnt;
>>               break;
>>
> 


