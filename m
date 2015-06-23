Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7OMY-0004Rl-MU
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 09:35:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1Z7OMW-0004Nl-NX
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 09:35:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1Z7OMV-0001Om-Li
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 09:35:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42641)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>)
	id 1Z7OMQ-0001L9-Vk; Tue, 23 Jun 2015 09:35:35 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 3EB4DC1F69;
	Tue, 23 Jun 2015 13:35:34 +0000 (UTC)
Received: from [10.34.129.181] (dhcp129-181.brq.redhat.com [10.34.129.181])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5NDZVeA021331
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 23 Jun 2015 09:35:33 -0400
Message-ID: <558960A3.5010509@redhat.com>
Date: Tue, 23 Jun 2015 15:35:31 +0200
From: Michal Privoznik <mprivozn@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Thomas Huth <thuth@redhat.com>
References: <58e7daaa2977c903b46c3b0dde64e81ce191b5d6.1435062620.git.mprivozn@redhat.com>	<CAFEAcA_AYg5okJgU61CYQasH9yY8rjsQQxpLq5xPvFyHLtJdgw@mail.gmail.com>	<5589543B.1020309@redhat.com>
	<20150623144917.372248b1@thh440s>
In-Reply-To: <20150623144917.372248b1@thh440s>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
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
X-List-Received-Date: Tue, 23 Jun 2015 13:35:41 -0000

On 23.06.2015 14:49, Thomas Huth wrote:
> On Tue, 23 Jun 2015 14:42:35 +0200
> Michal Privoznik <mprivozn@redhat.com> wrote:
> 
>> On 23.06.2015 14:37, Peter Maydell wrote:
>>> On 23 June 2015 at 13:30, Michal Privoznik <mprivozn@redhat.com> wrote:
>>>> I'm used to run 'make -j5 all check'. However, this is not possible in
>>>> qemu because of the missing dependency in the Makefile. If I do that,
>>>> tests are usually started with build and since not everything is built
>>>> yet, they often fail too. Moreover, we should run test suite only
>>>> after every binary we want to test has been built.
>>>>
>>>> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
>>>> ---
>>>>  Makefile | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Makefile b/Makefile
>>>> index e7c5c3a..67eeb87 100644
>>>> --- a/Makefile
>>>> +++ b/Makefile
>>>> @@ -151,6 +151,7 @@ dummy := $(call unnest-vars,, \
>>>>
>>>>  ifneq ($(wildcard config-host.mak),)
>>>>  include $(SRC_PATH)/tests/Makefile
>>>> +check: all
>>>>  endif
>>>>  ifeq ($(CONFIG_SMARTCARD_NSS),y)
>>>>  include $(SRC_PATH)/libcacard/Makefile
>>>
>>> I'm having difficulty understanding the use of conditionals
>>> in our makefile -- can you explain why inside this ifneq
>>> rather than outside is the right place for this dependency?
>>
>> Well, I guess it could be outside too. My thinking was, that we include
>> the tests/Makefile - which defines the 'check' target - only
>> conditionally, therefore the dependency should be defined only sometimes
>> too. I guess it won't hurt if it was outside too.
> 
> Maybe it's simpler to add the dependency into tests/Makefile instead?
> 

Yeah, that could work too. For some reason I thought that having it
there would result in making 'all' just under tests/. But Now that I
tried it out it works just nicely. Do you want me to post v2 or is that
something that can be fixed just before pushing?

Michal

