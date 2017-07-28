Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db3nl-0005vq-6W
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 07:51:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1db3nh-0005tw-0y
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:51:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1db3ng-0004td-79
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:51:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57968)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1db3nb-0004px-EA; Fri, 28 Jul 2017 07:51:19 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5875A67743;
	Fri, 28 Jul 2017 11:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5875A67743
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=pbonzini@redhat.com
Received: from [10.36.117.163] (ovpn-117-163.ams2.redhat.com [10.36.117.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D2876F42E;
	Fri, 28 Jul 2017 11:51:17 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-6-f4bug@amsat.org>
	<a7fdc125-9a1b-bec3-915f-e8f764816b0d@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c44770f5-df9d-2340-5dba-2f5db7acd046@redhat.com>
Date: Fri, 28 Jul 2017 13:51:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <a7fdc125-9a1b-bec3-915f-e8f764816b0d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 28 Jul 2017 11:51:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 05/47] MAINTAINERS: add
 missing KVM entry
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
X-List-Received-Date: Fri, 28 Jul 2017 11:51:26 -0000

On 28/07/2017 09:00, Thomas Huth wrote:
> On 28.07.2017 07:35, Philippe Mathieu-Daud=C3=A9 wrote:
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 3b472d7a09..ece02522be 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -278,6 +278,7 @@ S: Supported
>>  F: */kvm.*
>>  F: accel/kvm/
>>  F: include/sysemu/kvm*.h
>> +F: linux-headers/asm-*/kvm*.h
>=20
> The linux-headers are not really maintained by the QEMU project - so I
> guess we do not need an entry for these?

Actually I agree with the patch.  I'd like to be CCed on
update-linux-headers patches, and this achieves it. :)

Paolo

