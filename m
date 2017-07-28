Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db3nY-0005ne-Fz
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 07:51:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1db3nW-0005ma-Ef
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:51:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1db3nV-0004mV-JQ
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:51:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35966)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1db3nQ-0004i6-N8; Fri, 28 Jul 2017 07:51:08 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2212535789D;
	Fri, 28 Jul 2017 11:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2212535789D
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=pbonzini@redhat.com
Received: from [10.36.117.163] (ovpn-117-163.ams2.redhat.com [10.36.117.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 006925F91D;
	Fri, 28 Jul 2017 11:50:49 +0000 (UTC)
To: Fam Zheng <famz@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>
Cc: Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
	<lvivier@redhat.com>, qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-47-f4bug@amsat.org>
	<20170728062426.GQ5117@lemon.lan>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c3c6b7df-6629-982a-3135-a739979c36e7@redhat.com>
Date: Fri, 28 Jul 2017 13:50:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170728062426.GQ5117@lemon.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 28 Jul 2017 11:51:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [RFC PATCH 46/47] MAINTAINERS: add
 missing entries for Coccinelle scripts
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
X-List-Received-Date: Fri, 28 Jul 2017 11:51:15 -0000

On 28/07/2017 08:24, Fam Zheng wrote:
> On Fri, 07/28 02:36, Philippe Mathieu-Daud=C3=A9 wrote:
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 224890643d..7854792765 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1537,6 +1537,12 @@ Checkpatch
>>  S: Odd Fixes
>>  F: scripts/checkpatch.pl
>> =20
>> +Coccinelle scripts
>> +R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> +S: Orphan
>=20
> "Orphan" sounds like we don't care much anymore but I suppose this is n=
ot the
> case. But I don't have any better idea either.

Just don't add it to the file.  It doesn't have a specific owner.

Paolo

>=20
> Fam
>=20
>> +F: scripts/cocci-macro-file.h
>> +F: scripts/coccinelle/
>> +
>>  Migration
>>  M: Juan Quintela <quintela@redhat.com>
>>  M: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> @@ -1970,4 +1976,3 @@ Build system architecture
>>  M: Daniel P. Berrange <berrange@redhat.com>
>>  S: Odd Fixes
>>  F: docs/devel/build-system.txt


