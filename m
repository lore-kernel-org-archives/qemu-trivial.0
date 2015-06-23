Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7NXJ-0001dY-Td
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 08:42:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1Z7NXH-0001aA-9R
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 08:42:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1Z7NXG-0007sN-9w
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 08:42:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37587)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>)
	id 1Z7NXC-0007qz-5f; Tue, 23 Jun 2015 08:42:38 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 8E82F19F971;
	Tue, 23 Jun 2015 12:42:37 +0000 (UTC)
Received: from [10.34.129.181] (dhcp129-181.brq.redhat.com [10.34.129.181])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5NCgZHG010689
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 23 Jun 2015 08:42:36 -0400
Message-ID: <5589543B.1020309@redhat.com>
Date: Tue, 23 Jun 2015 14:42:35 +0200
From: Michal Privoznik <mprivozn@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <58e7daaa2977c903b46c3b0dde64e81ce191b5d6.1435062620.git.mprivozn@redhat.com>
	<CAFEAcA_AYg5okJgU61CYQasH9yY8rjsQQxpLq5xPvFyHLtJdgw@mail.gmail.com>
In-Reply-To: <CAFEAcA_AYg5okJgU61CYQasH9yY8rjsQQxpLq5xPvFyHLtJdgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Properly order
 build targets 'all' and 'check'
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
X-List-Received-Date: Tue, 23 Jun 2015 12:42:44 -0000

On 23.06.2015 14:37, Peter Maydell wrote:
> On 23 June 2015 at 13:30, Michal Privoznik <mprivozn@redhat.com> wrote:
>> I'm used to run 'make -j5 all check'. However, this is not possible in
>> qemu because of the missing dependency in the Makefile. If I do that,
>> tests are usually started with build and since not everything is built
>> yet, they often fail too. Moreover, we should run test suite only
>> after every binary we want to test has been built.
>>
>> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
>> ---
>>  Makefile | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Makefile b/Makefile
>> index e7c5c3a..67eeb87 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -151,6 +151,7 @@ dummy := $(call unnest-vars,, \
>>
>>  ifneq ($(wildcard config-host.mak),)
>>  include $(SRC_PATH)/tests/Makefile
>> +check: all
>>  endif
>>  ifeq ($(CONFIG_SMARTCARD_NSS),y)
>>  include $(SRC_PATH)/libcacard/Makefile
> 
> I'm having difficulty understanding the use of conditionals
> in our makefile -- can you explain why inside this ifneq
> rather than outside is the right place for this dependency?

Well, I guess it could be outside too. My thinking was, that we include
the tests/Makefile - which defines the 'check' target - only
conditionally, therefore the dependency should be defined only sometimes
too. I guess it won't hurt if it was outside too.

Michal

