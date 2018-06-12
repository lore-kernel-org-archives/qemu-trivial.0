Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSqTB-00040P-CV
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jun 2018 17:04:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fSqT9-0003zD-Vo
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 17:04:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fSqT9-0004lp-2N
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 17:04:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44534 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fSqT1-0004gu-Ng; Tue, 12 Jun 2018 17:04:39 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1FE8B87A80;
	Tue, 12 Jun 2018 21:04:38 +0000 (UTC)
Received: from [10.10.120.103] (ovpn-120-103.rdu2.redhat.com [10.10.120.103])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA23E111C4BD;
	Tue, 12 Jun 2018 21:04:33 +0000 (UTC)
To: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
References: <20180611011501.10235-1-f4bug@amsat.org>
	<20180611011501.10235-12-f4bug@amsat.org>
	<15d222dd-d2e9-4855-62c6-f89f2ee59c52@linaro.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Richard Henderson <rth@twiddle.net>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <76aa5170-1d18-8799-6ff1-a7c0dba0b489@redhat.com>
Date: Tue, 12 Jun 2018 16:04:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <15d222dd-d2e9-4855-62c6-f89f2ee59c52@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 12 Jun 2018 21:04:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 12 Jun 2018 21:04:38 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 11/40] hw/xen: Use the
 IEC binary prefix definitions
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
X-List-Received-Date: Tue, 12 Jun 2018 21:04:49 -0000

On 06/12/2018 03:51 PM, Richard Henderson wrote:
> On 06/10/2018 03:14 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>       xen_pv_printf(xendev, 1, "type \"%s\", fileproto \"%s\", filenam=
e \"%s\","
>> -                  " size %" PRId64 " (%" PRId64 " MB)\n",
>> +                  " size %" PRId64 " (%llu MB)\n",
>>                     blkdev->type, blkdev->fileproto, blkdev->filename,
>> -                  blkdev->file_size, blkdev->file_size >> 20);
>> +                  blkdev->file_size, blkdev->file_size / MiB);
>=20
> Having to change printf markup is exactly why you shouldn't use ULL in =
MiB.

Conversely, M_BYTE was already ULL, so if you don't use it in MiB,=20
you'll have to change other printf markup where you were changing those=20
uses.

One benefit of using the widest possible type: we avoid risk of silent=20
truncation.  Potential downsides: wasted processing time (when 32 bits=20
was sufficient), and compilers might start warning when we narrow a=20
64-bit value into a 32-bit variable (but I think we already ignore that).

One benefit of using the natural type that holds the value: use of=20
64-bit math is explicit based on the type of what else is being=20
multiplied by the macro.  Potential downside: 32*32 assigned to a 64-bit=20
result may be botched (but hopefully Coverity will flag it).

So there's tradeoffs either way, and you at least need to document in=20
your commit messages what auditing you have done that any type changes=20
introduced by your changes are safe.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

