Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hEffE-0007G9-CY
	for mharc-qemu-trivial@gnu.org; Thu, 11 Apr 2019 15:47:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hEffC-0007Es-5i
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 15:47:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hEffB-0001jI-9M
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 15:47:10 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:60001)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hEff8-0001h2-SI; Thu, 11 Apr 2019 15:47:07 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
	1M4K6z-1hEOXs1pTt-000OvG; Thu, 11 Apr 2019 21:47:01 +0200
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: lvivier@redhat.com, peter.maydell@linaro.org, ehabkost@redhat.com,
	viktor.prutyanov@phystech.edu, QEMU Trivial <qemu-trivial@nongnu.org>, 
	kraxel@redhat.com, marcel.apfelbaum@gmail.com, alex.bennee@linaro.org
References: <20190313162812.8885-1-armbru@redhat.com>
	<8cd63797-76f6-9ba8-0113-13a4bf04e6ed@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9585a1fc-fc7c-d3f4-06be-46d1a544a0ce@vivier.eu>
Date: Thu, 11 Apr 2019 21:46:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <8cd63797-76f6-9ba8-0113-13a4bf04e6ed@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:BsLtIAyNBcvpkz0AYDgdIQuMWkHGIaA34Ha9Is1vN4UrNPMPdec
	Qzxu+CcMoWehvY3NEN0GgrQ+EwltCm8vpgeHGYDwkdRgXTdeMC3ZbtcKRPoqm54pzPnLhiP
	GOWZzKx+8uVayCm+9NACbUTZRbVXQ3B/UKHncNHqNBSk6gofkhUO0t71uY5R27WqmoGu/Gb
	OhTz3eqTvM6s1X43Z6+7w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EPUUrfK9nQw=:SlXxgXllZLsU09YiH9DPRv
	B53iyGKKkNr/7tyntouA2JAhyzgC9+CzE3du5RPTxdkJ5SEEbZGHD/yqrJkxX5MhJjD4e9oAv
	zF8HEitLAZF34XEggMTHmqWxt6A7RhnB0RI/jsla7K1qKyFvXNGC+a+CTs6ExUulAjO5Vt9uL
	hH/GURcH6L4wB0APzR5oeXHO36MmX4DOUlYwWXGS/iXbDHz6OQz4WIyu43fx4ks1i07jilCmI
	2ZkZ6Z+Maem2GDdWX1q9YGh46wNiRGZeukXWxzQc+FIkCdQXziI4URYYOTKgsSNzar2/prCxm
	ceroTzXvnaNE+yHXFlb2992CHPfHisIwlQWCpTABCX8L8se0h0Lgv70aIf1yrMkScSWkbmmPI
	2RqTGSD42FijU+nogV0tjLrg367NherGV81Mq1S68H4qcitbQ9SP4cH/f5d5M67u0/7NTIDrQ
	NHp6FVIM+SeoZGuWDQeYy5VO2hJV2i/zsiS1+qjqlvolzocd+sSTUP0YFRoEqZ0VvvBCZ1E55
	2X3ARRY0d9lbrwqZHyppOBlQQQ1sTX15QRfFov6iEC51ba71Xy1zzI89wGEY8Do6WJgnBls+Q
	VEjfMx6Ou+kX4n+UVE7miNUVHmbo5pT0jrgDkV1GmlxvbZd9Y6VJ7mimZ1gWIrLuV1zki1xtT
	kbIF0RtTfI+hvuvbI8XFSE4cmaEk0WRknf/j4FZrMFYAC5b75gAsYaAtnLkFzX7+y1rb72dVT
	D8OeQlmqmkTuJrXlpVjl3U0S04ACbHnBwUAAs/CFOfpqavjWt3zx9RU4cQk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: Re: [Qemu-trivial] [PATCH] Clean up includes
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
X-List-Received-Date: Thu, 11 Apr 2019 19:47:11 -0000

On 21/03/2019 10:21, Thomas Huth wrote:
> On 13/03/2019 17.28, Markus Armbruster wrote:
>> Clean up includes so that osdep.h is included first and headers
>> which it implies are not included manually.
>>
>> This commit was created with scripts/clean-includes, with the changes
>> to the following files manually reverted:
>>
>>     contrib/libvhost-user/libvhost-user-glib.h
>>     contrib/libvhost-user/libvhost-user.c
>>     contrib/libvhost-user/libvhost-user.h
>>     linux-user/mips64/cpu_loop.c
>>     linux-user/mips64/signal.c
>>     linux-user/sparc64/cpu_loop.c
>>     linux-user/sparc64/signal.c
>>     linux-user/x86_64/cpu_loop.c
>>     linux-user/x86_64/signal.c
>>     slirp/src/*
>>     target/s390x/gen-features.c
>>     tests/migration/s390x/a-b-bios.c
>>     tests/test-rcu-simpleq.c
>>     tests/test-rcu-tailq.c
>>     tests/uefi-test-tools/UefiTestToolsPkg/BiosTablesTest/BiosTablesTest.c
>>
>> We're in the process of spinning out slirp/.  tests/uefi-test-tools/
>> is guest software.  The remaining reverts are the same as in commit
>> b7d89466dde.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  contrib/elf2dmp/main.c   | 3 +--
>>  contrib/elf2dmp/pdb.c    | 3 +--
>>  hw/display/ati.c         | 1 +
>>  hw/display/ati_2d.c      | 1 +
>>  hw/display/ati_dbg.c     | 1 +
>>  hw/display/ati_int.h     | 1 -
>>  include/hw/cpu/cluster.h | 1 -
>>  tests/fp/platform.h      | 1 -
>>  tests/libqos/qgraph.h    | 4 ----
>>  tests/qos-test.c         | 2 +-
>>  10 files changed, 6 insertions(+), 12 deletions(-)
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 


Applied to my trivial-patches branch.

Thanks,
Laurent

