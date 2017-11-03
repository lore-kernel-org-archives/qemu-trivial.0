Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eAa3L-0005qR-8I
	for mharc-qemu-trivial@gnu.org; Fri, 03 Nov 2017 07:22:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eAa3J-0005pb-Q6
	for qemu-trivial@nongnu.org; Fri, 03 Nov 2017 07:22:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eAa3J-000583-1u
	for qemu-trivial@nongnu.org; Fri, 03 Nov 2017 07:22:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38201)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eAa3E-0004xV-LY; Fri, 03 Nov 2017 07:22:16 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC807883B8;
	Fri,  3 Nov 2017 11:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BC807883B8
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.22] (ovpn-116-22.ams2.redhat.com [10.36.116.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9161C5D964;
	Fri,  3 Nov 2017 11:22:14 +0000 (UTC)
To: "Daniel P. Berrange" <berrange@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <1509701953-8995-1-git-send-email-thuth@redhat.com>
	<20171103101341.GE20155@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2f044593-fb74-6633-3f94-9a6da1c6d9b5@redhat.com>
Date: Fri, 3 Nov 2017 12:22:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171103101341.GE20155@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 03 Nov 2017 11:22:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: Run the
 test-crypto-block only if encryption is available
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
X-List-Received-Date: Fri, 03 Nov 2017 11:22:22 -0000

On 03.11.2017 11:13, Daniel P. Berrange wrote:
> On Fri, Nov 03, 2017 at 10:39:13AM +0100, Thomas Huth wrote:
>> The test-crypto-block currently fails if encryption has not been
>> compiled into QEMU
[...]
>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>> index 434a2ce..ac46aea 100644
>> --- a/tests/Makefile.include
>> +++ b/tests/Makefile.include
>> @@ -145,7 +145,7 @@ check-unit-$(if $(CONFIG_NETTLE_KDF),y,$(CONFIG_GCRYPT_KDF)) += tests/test-crypt
>>  check-unit-y += tests/test-crypto-ivgen$(EXESUF)
>>  check-unit-y += tests/test-crypto-afsplit$(EXESUF)
>>  check-unit-y += tests/test-crypto-xts$(EXESUF)
>> -check-unit-y += tests/test-crypto-block$(EXESUF)
>> +check-unit-$(call lor,$(CONFIG_NETTLE_KDF),$(CONFIG_GCRYPT_KDF)) += tests/test-crypto-block$(EXESUF)
> 
> This is disabling the entire test suite, even though only the LUKS part of
> the test suite has problems. Can you just extend the logic for setting the
> TEST_LUKS condition in the test source code instad. 

Ah, ok, that sounds of course like the better solution, I'll have a try...

 Thomas

