Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dn4eb-0003S1-85
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 11:11:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1dn4eW-0003Pn-LS
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 11:11:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1dn4eR-0000lN-UC
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 11:11:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58742)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1dn4eN-0000iC-8x; Wed, 30 Aug 2017 11:11:27 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BB53495;
	Wed, 30 Aug 2017 15:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4BB53495
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=cohuck@redhat.com
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2086F98163;
	Wed, 30 Aug 2017 15:11:21 +0000 (UTC)
Date: Wed, 30 Aug 2017 17:11:20 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Laurent Vivier
	<lvivier@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
	<marcandre.lureau@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20170830171120.190439f5.cohuck@redhat.com>
In-Reply-To: <52928093-36d5-89cf-bb89-ab5abf54b8f0@redhat.com>
References: <1504100343-26607-1-git-send-email-thuth@redhat.com>
	<b98a4c56-f386-f827-5aa7-9a00e6fdf790@amsat.org>
	<52928093-36d5-89cf-bb89-ab5abf54b8f0@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 30 Aug 2017 15:11:26 +0000 (UTC)
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
X-List-Received-Date: Wed, 30 Aug 2017 15:11:40 -0000

On Wed, 30 Aug 2017 16:59:03 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 30.08.2017 16:53, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 08/30/2017 10:39 AM, Thomas Huth wrote: =20
> >> The "slow" ivshmem-tests currently fail when they are running on a
> >> big endian host:
> >>
> >> $ uname -m
> >> ppc64
> >> $ V=3D1 QTEST_QEMU_BINARY=3Dx86_64-softmmu/qemu-system-x86_64
> >> tests/ivshmem-test -m slow
> >> /x86_64/ivshmem/single: OK
> >> /x86_64/ivshmem/hotplug: OK
> >> /x86_64/ivshmem/memdev: OK
> >> /x86_64/ivshmem/pair: OK
> >> /x86_64/ivshmem/server-msi: qemu-system-x86_64:
> >> =C2=A0 -device ivshmem-doorbell,chardev=3Dchr0,vectors=3D2: server sen=
t invalid
> >> ID message
> >> Broken pipe
> >>
> >> The problem is that the server side code in ivshmem_server_send_one_ms=
g()
> >> correctly translates all messages IDs into little endian 64-bit values,
> >> but the client side code in the ivshmem_recv_msg() function does not s=
wap
> >> the byte order back. Fix it by passing the value through le64_to_cpu()=
. =20
> >=20
> > Yes, we lack BE testing :( =20
>=20
> As far as I know, some people are already running the tests on s390x and
> ppc64 ... the problem is that apparently nobody is running with
> SPEED=3Dslow there - that's why this problem slipped through so far.
> Maybe we should switch to the SPEED=3Dslow by default in the Makefile?

Not sure whether that is a good idea. /me adding this to my s390x tests
should help, though.

