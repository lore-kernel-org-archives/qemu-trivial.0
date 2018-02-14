Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1em3EV-0002cL-OO
	for mharc-qemu-trivial@gnu.org; Wed, 14 Feb 2018 15:00:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1em3ET-0002b2-Gh
	for qemu-trivial@nongnu.org; Wed, 14 Feb 2018 15:00:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1em3ES-0008GO-GB
	for qemu-trivial@nongnu.org; Wed, 14 Feb 2018 15:00:45 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53052 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1em3EM-00089Q-3F; Wed, 14 Feb 2018 15:00:38 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8192640201A0;
	Wed, 14 Feb 2018 20:00:37 +0000 (UTC)
Received: from [10.36.116.140] (ovpn-116-140.ams2.redhat.com [10.36.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 736D9AB593;
	Wed, 14 Feb 2018 20:00:36 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <1518629505-22480-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-R0aq7Sp6P2TYrMDE0p0ewwpuXPp6=RzF1bU11FQwJxA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8d49363d-7569-e95d-1d06-17a572c922db@redhat.com>
Date: Wed, 14 Feb 2018 21:00:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-R0aq7Sp6P2TYrMDE0p0ewwpuXPp6=RzF1bU11FQwJxA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 14 Feb 2018 20:00:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 14 Feb 2018 20:00:37 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 14 Feb 2018 20:00:47 -0000

On 14.02.2018 19:33, Peter Maydell wrote:
> On 14 February 2018 at 17:31, Thomas Huth <thuth@redhat.com> wrote:
>> When running configure with --with-pkgversion=3Dfoo there is no
>> space anymore between the version number and the parentheses:
>>
>> $ m68k-softmmu/qemu-system-m68k -version
>> QEMU emulator version 2.11.50(foo)
>>
>> Fix it by moving the space from the configure script to the Makefile.
>>
>> Fixes: 67a1de0d195a6185c39b436159c9ffc7720bf979
>> Buglink: https://bugs.launchpad.net/qemu/+bug/1673373
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>=20
> I see that in the bug report I wrote
> "Also it looks like we return QEMU_PKGVERSION as part of the
> QMP qmp_query_version() code, so we should check to see what
> the expected behaviour there is regarding having the space
> or not."
>=20
> -- does this patch change the QMP reported string
> unexpectedly?

Without my patch and with --with-pkgversion=3Dfoo :

{ "execute": "query-version" }
{"return": {"qemu": {"micro": 50, "minor": 11, "major": 2}, "package": "(=
foo)"}}

With my patch and with --with-pkgversion=3Dfoo :

{ "execute": "query-version" }
{"return": {"qemu": {"micro": 50, "minor": 11, "major": 2}, "package": " =
(foo)"}}

Without my patch and without --with-pkgversion :

{ "execute": "query-version" }
{"return": {"qemu": {"micro": 50, "minor": 11, "major": 2}, "package": " =
(v2.11.0-1512-g02f4fbe)"}}

Using the old QEMU version 67a1de0d19~1 with  --with-pkgversion=3Dfoo :

{ "execute": "query-version" }
{"return": {"qemu": {"micro": 50, "minor": 6, "major": 2}, "package": " (=
foo)"}}

So yes, this patch changes the behavior of query-version, but the new
behavior is now the same behavior that you get without --with-pkgversion
(i.e. a space is included) and it is the same as the behavior that we had
in the past, before commit 67a1de0d19 has been merged. So I think this
is the right way to go.
Alternatively, we could maybe change query-version to always skip the
initial space?

 Thomas

