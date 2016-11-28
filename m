Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cBO1F-0003RQ-PI
	for mharc-qemu-trivial@gnu.org; Mon, 28 Nov 2016 10:39:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cBO1D-0003Pl-9H
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2016 10:39:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cBO1C-0001sr-JX
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2016 10:38:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39492)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1cBO1A-0001rD-1K; Mon, 28 Nov 2016 10:38:56 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7CE43D960;
	Mon, 28 Nov 2016 15:38:54 +0000 (UTC)
Received: from [10.36.112.57] (ovpn-112-57.ams2.redhat.com [10.36.112.57])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uASFcpxA002049
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 28 Nov 2016 10:38:53 -0500
To: Adrian Bunk <bunk@stusta.de>
References: <20161127162817.15144-1-bunk@stusta.de>
	<a6630537-d71e-1b1a-4388-c91ba8cacbb7@redhat.com>
	<20161128152404.sywmey4pdcv7btup@bunk.spdns.de>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <36ee35dd-49ea-f2e3-fa1e-600483b9d4e7@redhat.com>
Date: Mon, 28 Nov 2016 16:38:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161128152404.sywmey4pdcv7btup@bunk.spdns.de>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 28 Nov 2016 15:38:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] rules.mak: Use -r instead of -Wl,
 -r to fix building when PIE is default
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
X-List-Received-Date: Mon, 28 Nov 2016 15:39:00 -0000



On 28/11/2016 16:24, Adrian Bunk wrote:
> On Mon, Nov 28, 2016 at 04:05:33PM +0100, Paolo Bonzini wrote:
>>
>>
>> On 27/11/2016 17:28, Adrian Bunk wrote:
>>> Building qemu fails in distributions where gcc enables PIE
>>> by default (e.g. Debian unstable) with:
>>> /usr/bin/ld: -r and -pie may not be used together
>>>
>>> -r and -pie cannot be used together in the linker,
>>> and position independent is already relocatable.
>>>
>>> Use -r instead of -Wl,-r to avoid gcc passing -r to the
>>> linker when PIE is enabled.
>>>
>>> Signed-off-by: Adrian Bunk <bunk@stusta.de>
>>
>> I think this is a bug in the linker.  If the linker is producing
>> relocatable objects by default, it has no reason to refuse -r.  Have y=
ou
>> tried asking the binutils folks about it too?
>=20
> The linker knows nothing about this default, gcc is passing -pie
> to the linker.

The linker is receiving "-r -pie".  It can satisfy the requirement of
producing a relocatable object by discarding the "-r", but it doesn't.
That'd be a linker bug.

But in fact ELF makes PIE ET_DYN and relocatable ET_REL.  That would
make the linker error the right thing, but then I don't understand what
you mean by "position independent is already relocatable".

Paolo

