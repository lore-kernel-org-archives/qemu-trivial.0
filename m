Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d85Wl-0002Sq-Hj
	for mharc-qemu-trivial@gnu.org; Tue, 09 May 2017 09:50:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1d85Wj-0002PN-2R
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 09:50:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1d85Wf-0001Nb-4Z
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 09:50:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55252)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1d85WP-0001KT-8z; Tue, 09 May 2017 09:49:49 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2948FC04B929;
	Tue,  9 May 2017 13:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2948FC04B929
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=jsnow@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 2948FC04B929
Received: from scv.usersys.redhat.com (ovpn-123-197.rdu2.redhat.com
	[10.10.123.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 434B388849;
	Tue,  9 May 2017 13:49:46 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	qemu-block@nongnu.org
References: <20170508233918.9043-1-f4bug@amsat.org>
	<20170508233918.9043-5-f4bug@amsat.org>
	<56387911-b587-adf0-c65b-ed12374d604d@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <80969f61-38d4-20ac-d850-5e90c8852b40@redhat.com>
Date: Tue, 9 May 2017 09:49:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <56387911-b587-adf0-c65b-ed12374d604d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 09 May 2017 13:49:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 04/11] ide/ahci: add missing
 includes
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 09 May 2017 13:50:10 -0000



On 05/08/2017 07:58 PM, Eric Blake wrote:
> On 05/08/2017 06:39 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> qemu/include/hw/ide/ahci.h:260:16: error: field =E2=80=98sglist=E2=80=99=
 has incomplete type
>>      QEMUSGList sglist;
>>                 ^~~~~~
>=20
> What are you doing to get this compilation error (configure options,
> platform, compiler, etc)?  I can't reproduce it. Is it something that
> pops up later when you remove includes from somewhere else, and you're
> just pre-emptively adding includes here to allow removal of includes la=
ter?
>=20

"What he said," but if I had to guess, Philippe is testing that each
header can be compiled separately.

>> /qemu/include/hw/ide/ahci.h:272:5: error: unknown type name =E2=80=98I=
DEDMA=E2=80=99
>>      IDEDMA dma;
>>      ^~~~~~
>> qemu/include/hw/ide/ahci.h:273:5: error: unknown type name =E2=80=98ID=
EBus=E2=80=99
>>      IDEBus port;
>>      ^~~~~~
>> qemu/include/hw/ide/ahci.h:305:15: error: field =E2=80=98parent_obj=E2=
=80=99 has incomplete type
>>      PCIDevice parent_obj;
>>                ^~~~~~~~~~
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>  include/hw/ide/ahci.h | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/include/hw/ide/ahci.h b/include/hw/ide/ahci.h
>> index 0ca7c65820..293f9ebcd0 100644
>> --- a/include/hw/ide/ahci.h
>> +++ b/include/hw/ide/ahci.h
>> @@ -25,6 +25,8 @@
>>  #define HW_IDE_AHCI_H
>> =20
>>  #include "hw/sysbus.h"
>> +#include "hw/ide/internal.h">> +#include "sysemu/dma.h"
>> =20
>>  #define AHCI_MEM_BAR_SIZE         0x1000
>>  #define AHCI_MAX_PORTS            32
>>
>=20

