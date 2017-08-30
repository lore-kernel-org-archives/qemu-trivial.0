Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dn4In-00082v-1c
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 10:49:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dn4If-0007yU-Q4
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 10:49:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dn4Ia-0000XJ-3N
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 10:49:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50890)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dn4IW-0000WF-9a; Wed, 30 Aug 2017 10:48:52 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 37B2A267D5;
	Wed, 30 Aug 2017 14:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 37B2A267D5
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.68] (ovpn-116-68.ams2.redhat.com [10.36.116.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 091259B511;
	Wed, 30 Aug 2017 14:48:48 +0000 (UTC)
To: Cornelia Huck <cohuck@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
	<marcandre.lureau@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
References: <1504100343-26607-1-git-send-email-thuth@redhat.com>
	<20170830161327.4b199e9a.cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9ce5a57f-a2b9-a7d0-fd88-639fb8f2e062@redhat.com>
Date: Wed, 30 Aug 2017 16:48:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170830161327.4b199e9a.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 30 Aug 2017 14:48:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.11] hw/misc/ivshmem:
 Fix ivshmem_recv_msg() to also work on big endian systems
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
X-List-Received-Date: Wed, 30 Aug 2017 14:49:08 -0000

On 30.08.2017 16:13, Cornelia Huck wrote:
> On Wed, 30 Aug 2017 15:39:03 +0200
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> The "slow" ivshmem-tests currently fail when they are running on a
>> big endian host:
>>
>> $ uname -m
>> ppc64
>> $ V=1 QTEST_QEMU_BINARY=x86_64-softmmu/qemu-system-x86_64 tests/ivshmem-test -m slow
>> /x86_64/ivshmem/single: OK
>> /x86_64/ivshmem/hotplug: OK
>> /x86_64/ivshmem/memdev: OK
>> /x86_64/ivshmem/pair: OK
>> /x86_64/ivshmem/server-msi: qemu-system-x86_64:
>>  -device ivshmem-doorbell,chardev=chr0,vectors=2: server sent invalid ID message
>> Broken pipe
>>
>> The problem is that the server side code in ivshmem_server_send_one_msg()
>> correctly translates all messages IDs into little endian 64-bit values,
>> but the client side code in the ivshmem_recv_msg() function does not swap
>> the byte order back. Fix it by passing the value through le64_to_cpu().
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
[...]
> This fixes the "invalid ID message" problem on s390x for me as well,
> and I run now into the same error as on x86 (which you also have a fix
> for IIRC)
Yes, you also need my other patch, look for "tests: Fix broken
ivshmem-server-msi/-irq tests" on the list.

 Thomas

