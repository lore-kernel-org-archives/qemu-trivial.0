Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cBhEH-0004A1-Ov
	for mharc-qemu-trivial@gnu.org; Tue, 29 Nov 2016 07:09:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cBhEF-00047z-Cl
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2016 07:09:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cBhEB-0005gj-Ac
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2016 07:09:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42164)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1cBhE0-0005bx-Vb; Tue, 29 Nov 2016 07:09:29 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0321080E4A;
	Tue, 29 Nov 2016 12:09:27 +0000 (UTC)
Received: from [10.36.112.64] (ovpn-112-64.ams2.redhat.com [10.36.112.64])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uATC9NPm017192
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 29 Nov 2016 07:09:25 -0500
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <20161127162817.15144-1-bunk@stusta.de>
	<a6630537-d71e-1b1a-4388-c91ba8cacbb7@redhat.com>
	<20161128152404.sywmey4pdcv7btup@bunk.spdns.de>
	<36ee35dd-49ea-f2e3-fa1e-600483b9d4e7@redhat.com>
	<460f994a-fe47-1d1e-0d26-1220d8a05256@redhat.com>
	<20161129093354.GF5152@stefanha-x1.localdomain>
Cc: Adrian Bunk <bunk@stusta.de>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3496f2a1-cb1d-9be0-b004-3f4812d60660@redhat.com>
Date: Tue, 29 Nov 2016 13:09:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161129093354.GF5152@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 29 Nov 2016 12:09:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] rules.mak: Use -r instead
 of -Wl, -r to fix building when PIE is default
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
X-List-Received-Date: Tue, 29 Nov 2016 12:09:44 -0000



On 29/11/2016 10:33, Stefan Hajnoczi wrote:
> On Mon, Nov 28, 2016 at 04:42:54PM +0100, Paolo Bonzini wrote:
>>
>>
>> On 28/11/2016 16:38, Paolo Bonzini wrote:
>>>
>>>
>>> On 28/11/2016 16:24, Adrian Bunk wrote:
>>>> On Mon, Nov 28, 2016 at 04:05:33PM +0100, Paolo Bonzini wrote:
>>>>>
>>>>>
>>>>> On 27/11/2016 17:28, Adrian Bunk wrote:
>>>>>> Building qemu fails in distributions where gcc enables PIE
>>>>>> by default (e.g. Debian unstable) with:
>>>>>> /usr/bin/ld: -r and -pie may not be used together
>>>>>>
>>>>>> -r and -pie cannot be used together in the linker,
>>>>>> and position independent is already relocatable.
>>>>>>
>>>>>> Use -r instead of -Wl,-r to avoid gcc passing -r to the
>>>>>> linker when PIE is enabled.
>>>>>>
>>>>>> Signed-off-by: Adrian Bunk <bunk@stusta.de>
>>>>>
>>>>> I think this is a bug in the linker.  If the linker is producing
>>>>> relocatable objects by default, it has no reason to refuse -r.  Hav=
e you
>>>>> tried asking the binutils folks about it too?
>>>>
>>>> The linker knows nothing about this default, gcc is passing -pie
>>>> to the linker.
>>>
>>> The linker is receiving "-r -pie".  It can satisfy the requirement of
>>> producing a relocatable object by discarding the "-r", but it doesn't=
.
>>> That'd be a linker bug.
>>>
>>> But in fact ELF makes PIE ET_DYN and relocatable ET_REL.  That would
>>> make the linker error the right thing, but then I don't understand wh=
at
>>> you mean by "position independent is already relocatable".
>>
>> Aha, I looked at GCC source code and this is incorrect: "Use -r instea=
d
>> of -Wl,-r to avoid gcc passing -r to the linker when PIE is enabled".
>> When GCC sees -r (as opposed to -Wl,-r) it does not pass -pie to the l=
inker.
>=20
> Should we merge this patch for 2.8 with the commit updated to reflect t=
his?

Yes, I've already sent a pull request for it.

Paolo

