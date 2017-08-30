Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dn4Sk-0003my-P4
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 10:59:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dn4Sf-0003iF-9w
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 10:59:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dn4SZ-0003o1-Hm
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 10:59:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37720)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dn4SU-0003lP-0Q; Wed, 30 Aug 2017 10:59:10 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C5D67E439;
	Wed, 30 Aug 2017 14:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9C5D67E439
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.68] (ovpn-116-68.ams2.redhat.com [10.36.116.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2248F8D543;
	Wed, 30 Aug 2017 14:59:04 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <1504100343-26607-1-git-send-email-thuth@redhat.com>
	<b98a4c56-f386-f827-5aa7-9a00e6fdf790@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <52928093-36d5-89cf-bb89-ab5abf54b8f0@redhat.com>
Date: Wed, 30 Aug 2017 16:59:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <b98a4c56-f386-f827-5aa7-9a00e6fdf790@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 30 Aug 2017 14:59:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for-2.11] hw/misc/ivshmem: Fix
 ivshmem_recv_msg() to also work on big endian systems
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
X-List-Received-Date: Wed, 30 Aug 2017 14:59:25 -0000

On 30.08.2017 16:53, Philippe Mathieu-Daud=C3=A9 wrote:
> On 08/30/2017 10:39 AM, Thomas Huth wrote:
>> The "slow" ivshmem-tests currently fail when they are running on a
>> big endian host:
>>
>> $ uname -m
>> ppc64
>> $ V=3D1 QTEST_QEMU_BINARY=3Dx86_64-softmmu/qemu-system-x86_64
>> tests/ivshmem-test -m slow
>> /x86_64/ivshmem/single: OK
>> /x86_64/ivshmem/hotplug: OK
>> /x86_64/ivshmem/memdev: OK
>> /x86_64/ivshmem/pair: OK
>> /x86_64/ivshmem/server-msi: qemu-system-x86_64:
>> =C2=A0 -device ivshmem-doorbell,chardev=3Dchr0,vectors=3D2: server sen=
t invalid
>> ID message
>> Broken pipe
>>
>> The problem is that the server side code in ivshmem_server_send_one_ms=
g()
>> correctly translates all messages IDs into little endian 64-bit values=
,
>> but the client side code in the ivshmem_recv_msg() function does not s=
wap
>> the byte order back. Fix it by passing the value through le64_to_cpu()=
.
>=20
> Yes, we lack BE testing :(

As far as I know, some people are already running the tests on s390x and
ppc64 ... the problem is that apparently nobody is running with
SPEED=3Dslow there - that's why this problem slipped through so far.
Maybe we should switch to the SPEED=3Dslow by default in the Makefile?

 Thomas

