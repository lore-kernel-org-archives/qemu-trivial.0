Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1em3TW-0000rH-KA
	for mharc-qemu-trivial@gnu.org; Wed, 14 Feb 2018 15:16:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1em3TU-0000or-Ut
	for qemu-trivial@nongnu.org; Wed, 14 Feb 2018 15:16:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1em3TT-0002Pl-HM
	for qemu-trivial@nongnu.org; Wed, 14 Feb 2018 15:16:16 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53432 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1em3TO-0002Lt-Q2; Wed, 14 Feb 2018 15:16:10 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DA8B402243B;
	Wed, 14 Feb 2018 20:16:00 +0000 (UTC)
Received: from [10.10.122.122] (ovpn-122-122.rdu2.redhat.com [10.10.122.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D4AE5FA287;
	Wed, 14 Feb 2018 20:15:53 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1518629505-22480-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-R0aq7Sp6P2TYrMDE0p0ewwpuXPp6=RzF1bU11FQwJxA@mail.gmail.com>
	<8d49363d-7569-e95d-1d06-17a572c922db@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ab218589-ebb1-b7dd-0e99-3db89d6a2f28@redhat.com>
Date: Wed, 14 Feb 2018 14:15:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <8d49363d-7569-e95d-1d06-17a572c922db@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 14 Feb 2018 20:16:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 14 Feb 2018 20:16:00 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Add missing
 space when using --with-pkgversion
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
X-List-Received-Date: Wed, 14 Feb 2018 20:16:18 -0000

On 02/14/2018 02:00 PM, Thomas Huth wrote:
> On 14.02.2018 19:33, Peter Maydell wrote:
>> On 14 February 2018 at 17:31, Thomas Huth <thuth@redhat.com> wrote:
>>> When running configure with --with-pkgversion=foo there is no
>>> space anymore between the version number and the parentheses:
>>>
>>> $ m68k-softmmu/qemu-system-m68k -version
>>> QEMU emulator version 2.11.50(foo)

It would be nice to document this as '--version' rather than '-version' 
(both work; but see our BiteSized task: 
https://wiki.qemu.org/BiteSizedTasks#Consistent_option_usage_in_documentation)

>>
>> -- does this patch change the QMP reported string
>> unexpectedly?
> 
> Without my patch and with --with-pkgversion=foo :
> 
> { "execute": "query-version" }
> {"return": {"qemu": {"micro": 50, "minor": 11, "major": 2}, "package": "(foo)"}}

Looks nice.  And the version info is ALSO passed as part of the initial 
handshake, even before you call query-version.

> 
> With my patch and with --with-pkgversion=foo :
> 
> { "execute": "query-version" }
> {"return": {"qemu": {"micro": 50, "minor": 11, "major": 2}, "package": " (foo)"}}

Potential regression (arguably cosmetic, though)

> 
> Without my patch and without --with-pkgversion :
> 
> { "execute": "query-version" }
> {"return": {"qemu": {"micro": 50, "minor": 11, "major": 2}, "package": " (v2.11.0-1512-g02f4fbe)"}}

And that means we're already inconsistent, so your patch at least made 
things consistent,

> 
> Using the old QEMU version 67a1de0d19~1 with  --with-pkgversion=foo :
> 
> { "execute": "query-version" }
> {"return": {"qemu": {"micro": 50, "minor": 6, "major": 2}, "package": " (foo)"}}

and that means we've already "regressed", which further means:
- it definitely is cosmetic, if no one is complaining
- changing it to look nicer won't break anyone

> 
> So yes, this patch changes the behavior of query-version, but the new
> behavior is now the same behavior that you get without --with-pkgversion
> (i.e. a space is included) and it is the same as the behavior that we had
> in the past, before commit 67a1de0d19 has been merged. So I think this
> is the right way to go.
> Alternatively, we could maybe change query-version to always skip the
> initial space?

Yes, I like that option.

So, if I'm summarizing correctly, your v2 patch will have:

$ qemu --version
QEMU emulator version 2.11.50 (foo)

QMP query-version
{"return": {"qemu": {"micro": 50, "minor": 6, "major": 2}, "package": 
"(foo)"}}

regardless of whether --with-pkgversion was used during configure.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

