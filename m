Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dJi7G-0007Cr-Ms
	for mharc-qemu-trivial@gnu.org; Sat, 10 Jun 2017 11:15:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dJi7D-0007BG-VT
	for qemu-trivial@nongnu.org; Sat, 10 Jun 2017 11:15:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dJi7C-0007MW-T9
	for qemu-trivial@nongnu.org; Sat, 10 Jun 2017 11:15:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42020)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dJi77-0007LE-8y; Sat, 10 Jun 2017 11:15:45 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9EA7980462;
	Sat, 10 Jun 2017 15:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9EA7980462
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9EA7980462
Received: from blackfin.pond.sub.org (ovpn-116-98.ams2.redhat.com
	[10.36.116.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 947E087DC8;
	Sat, 10 Jun 2017 15:15:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id EFB1E1138645; Sat, 10 Jun 2017 17:15:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kamil Rytarowski <n54@gmx.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  QEMU Trivial
	<qemu-trivial@nongnu.org>,  Michael Tokarev <mjt@tls.msk.ru>,  QEMU
	Developers <qemu-devel@nongnu.org>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
	<marcandre.lureau@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
	<f4bug@amsat.org>
References: <20170531120049.14111-1-n54@gmx.com>
	<26b48c35-b6cc-708d-c4d2-b26a9382e10a@msgid.tls.msk.ru>
	<df623a80-4017-2e79-6bf3-7c402f24b275@gmx.com>
	<877f0p38tr.fsf@dusky.pond.sub.org>
	<b60c5d7b-6ae7-4aa0-6263-b96c964b9195@msgid.tls.msk.ru>
	<55dd32a9-7f01-93e3-e22e-3826dcef1d9d@gmx.com>
	<CAFEAcA_2X6QRBS_mbL15Rkq51HxTAX-vb9TJQxKMnwuRsixkiw@mail.gmail.com>
	<6620e2b9-6cc7-48fc-6ecf-4065718d765d@gmx.com>
	<cdc49669-c996-b84d-8110-b7b62ada8ad0@gmx.com>
Date: Sat, 10 Jun 2017 17:15:39 +0200
In-Reply-To: <cdc49669-c996-b84d-8110-b7b62ada8ad0@gmx.com> (Kamil
	Rytarowski's message of "Sat, 10 Jun 2017 15:41:34 +0200")
Message-ID: <87lgoz98mc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Sat, 10 Jun 2017 15:15:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] ivshmem-server:
 ivshmem-client: Build when eventfd() is available
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
X-List-Received-Date: Sat, 10 Jun 2017 15:15:53 -0000

Kamil Rytarowski <n54@gmx.com> writes:

> On 06.06.2017 16:56, Kamil Rytarowski wrote:
>> On 06.06.2017 16:34, Peter Maydell wrote:
>>> On 6 June 2017 at 14:38, Kamil Rytarowski <n54@gmx.com> wrote:
>>>> I've linked qemu with the original patch and:
>>>> ./configure --disable-linux-user --disable-system --static
>>>>
>>>> I got some warnings, I think they are originated from our libc and are
>>>> not related to qemu:
>>>>   LINK    sparc64-bsd-user/qemu-sparc64
>>>> /usr/lib/libc.a(initfini.o): warning: common of `__ps_strings'
>>>> overridden by definition
>>>> /usr/lib/crt0.o: warning: defined here
>>>> /usr/lib/libc.a(_env.o): warning: multiple common of `environ'
>>>> /usr/lib/crt0.o: warning: previous common is here
>>>> /usr/lib/libc.a(getprogname.o): warning: common of `__progname'
>>>> overridden by definition
>>>> /usr/lib/crt0.o: warning: defined here
>>>
>>> Yes, I think I've seen those before on NetBSD -- they look
>>> like a bug in your libc to me, it shouldn't be confusing itself
>>> with itself like that :-)
>>>
>>> thanks
>>> -- PMM
>>>
>> 
>> I have filed this bug upstream: http://gnats.netbsd.org/52278
>> 
>> 
>
>
> What's the status with this patch?
>
> NetBSD build still breaks due to ivshmem-*.

I guess Michael expects a v4 that doesn't break the static build.

