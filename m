Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WteJw-00011P-TB
	for mharc-qemu-trivial@gnu.org; Sun, 08 Jun 2014 10:43:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WteJq-0000uV-5i
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 10:43:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WteJk-0006x3-NC
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 10:43:34 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:52274)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1WteJX-0006v4-8Z; Sun, 08 Jun 2014 10:43:15 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	9EE261180F74; Sun,  8 Jun 2014 16:43:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id ZlED5UaLYimw; Sun,  8 Jun 2014 16:43:12 +0200 (CEST)
Received: from [192.168.178.35] (p54ACB2BE.dip0.t-ipconnect.de
	[84.172.178.190])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	6C11D1180A74; Sun,  8 Jun 2014 16:43:12 +0200 (CEST)
Message-ID: <5394767F.9010102@weilnetz.de>
Date: Sun, 08 Jun 2014 16:43:11 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Beno=EEt_Canet?= <benoit.canet@irqsave.net>, 
	Paolo Bonzini <pbonzini@redhat.com>
References: <1402063613-12400-1-git-send-email-pbonzini@redhat.com>
	<20140606141453.GE16494@irqsave.net>
In-Reply-To: <20140606141453.GE16494@irqsave.net>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vdi: remove double
	conversion
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
X-List-Received-Date: Sun, 08 Jun 2014 14:43:39 -0000

Am 06.06.2014 16:14, schrieb Beno=EEt Canet:
> The Friday 06 Jun 2014 =E0 16:06:52 (+0200), Paolo Bonzini wrote :
>> This should be a problem when running on big-endian machines.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>> 	It's time to clean up old branch, and I found this nice little
>> 	patch from May 2012.
>>
>>  block/vdi.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/block/vdi.c b/block/vdi.c
>> index 119d3c7..993430e 100644
>> --- a/block/vdi.c
>> +++ b/block/vdi.c
>> @@ -237,7 +237,6 @@ static void vdi_header_to_le(VdiHeader *header)
>>      cpu_to_le32s(&header->block_extra);
>>      cpu_to_le32s(&header->blocks_in_image);
>>      cpu_to_le32s(&header->blocks_allocated);
>> -    cpu_to_le32s(&header->blocks_allocated);
>>      uuid_convert(header->uuid_image);
>>      uuid_convert(header->uuid_last_snap);
>>      uuid_convert(header->uuid_link);
>> --=20
>> 1.8.3.1
>>
>>
> Reviewed-by: Benoit Canet <benoit@irqsave.net>
>=20

Autsch, that's a really old (2009) copy+paste bug. Thanks for fixing it.

Reviewed-by: Stefan Weil <sw@weilnetz.de>
(creator of that bug)


