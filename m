Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRkYq-0002ih-Mw
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 11:48:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YRkYo-0002h8-FA
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 11:48:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YRkYk-0001hc-7O
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 11:48:14 -0500
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:41276)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YRkYk-0001hQ-0x
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 11:48:10 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	296FF11810A8; Sat, 28 Feb 2015 17:48:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id VEODujeVKDNA; Sat, 28 Feb 2015 17:47:57 +0100 (CET)
Received: from [192.168.178.24] (p54ACAA0F.dip0.t-ipconnect.de [84.172.170.15])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	DB2FA1180040; Sat, 28 Feb 2015 17:47:56 +0100 (CET)
Message-ID: <54F1F13C.9070204@weilnetz.de>
Date: Sat, 28 Feb 2015 17:47:56 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, 
	arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1425118124-11888-1-git-send-email-arei.gonglei@huawei.com>	<54F194B7.9080603@msgid.tls.msk.ru>
	<54F1EF7A.4040007@redhat.com>
In-Reply-To: <54F1EF7A.4040007@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] e500: fix memory leak
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
X-List-Received-Date: Sat, 28 Feb 2015 16:48:15 -0000

Am 28.02.2015 um 17:40 schrieb Paolo Bonzini:
> On 28/02/2015 11:13, Michael Tokarev wrote:
>> 28.02.2015 13:08, arei.gonglei@huawei.com =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
>>> From: Gonglei <arei.gonglei@huawei.com>
>>>
>>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>>> ---
>>> v2: fix compilation complaint. (mjt)
>>> ---
>>>   hw/ppc/e500.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
>>> index 7e17d18..c060b50 100644
>>> --- a/hw/ppc/e500.c
>>> +++ b/hw/ppc/e500.c
>>> @@ -309,8 +309,10 @@ static int ppce500_load_device_tree(MachineState=
 *machine,
>>>  =20
>>>           fdt =3D load_device_tree(filename, &fdt_size);
>>>           if (!fdt) {
>>> +            g_free(filename);
>>>               goto out;
>>>           }
>>> +        g_free(filename);
>>>           goto done;
>>>       }
>>
>> How about this?
>>
>> --- a/hw/ppc/e500.c
>> +++ b/hw/ppc/e500.c
>> @@ -308,6 +308,7 @@ static int ppce500_load_device_tree(MachineState *=
machine,
>>           }
>>
>>           fdt =3D load_device_tree(filename, &fdt_size);
>> +        g_free(filename);
>>           if (!fdt) {
>>               goto out;
>>           }
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Which one of the two patch variants did you review?

I suggest using Michael's version (only one g_free as early as=20
possible). For that variant, my review may be added:

Reviewed-by: Stefan Weil <sw@weilnetz.de>


