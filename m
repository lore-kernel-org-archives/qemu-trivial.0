Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwhMQ-0002dN-JN
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 00:20:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <daniel@loffgren.org>) id 1dwhMO-0002bW-Cw
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 00:20:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <daniel@loffgren.org>) id 1dwhMN-0001jp-DN
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 00:20:40 -0400
Received: from tk2-216-17739.vs.sakura.ne.jp ([160.16.80.243]:60371
	helo=maro.localdomain)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <daniel@loffgren.org>)
	id 1dwhMI-0001dT-Im; Tue, 26 Sep 2017 00:20:34 -0400
Received: from [10.0.0.206] (c-24-23-203-58.hsd1.ca.comcast.net [24.23.203.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by maro.localdomain (Postfix) with ESMTPSA id E2EEC19CF12;
	Tue, 26 Sep 2017 13:18:13 +0900 (JST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Daniel Loffgren <daniel@loffgren.org>
In-Reply-To: <b99306b2-2e53-7b0f-933c-c549c54b07b7@redhat.com>
Date: Mon, 25 Sep 2017 21:20:24 -0700
Cc: qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <BFEFA6ED-21D2-44EF-AD78-12DF3F47A6A4@loffgren.org>
References: <40DEFE92-410B-4FED-B0A5-56C186627134@loffgren.org>
	<b99306b2-2e53-7b0f-933c-c549c54b07b7@redhat.com>
To: Eric Blake <eblake@redhat.com>
X-Mailer: Apple Mail (2.3273)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 160.16.80.243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] fprintf-fn.h uses
 GCC_FMT, but doesn't include the definition of it
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
X-List-Received-Date: Tue, 26 Sep 2017 04:20:41 -0000

I am working on getting ppc-darwin-user working again, and this was one =
of the many things preventing it from compiling. Your explanation sounds =
correct. I believe it was the lack of osdep.h in the right .c files, =
since I added osdep.h to the tops of all of the necessary files well =
after this change (I was fixing things in order of compiler failures). I =
dropped this commit from my branch and it didn=E2=80=99t break. So, feel =
free to disregard this.

> On Sep 25, 2017, at 9:18 AM, Eric Blake <eblake@redhat.com> wrote:
>=20
> On 09/24/2017 08:02 PM, Daniel Loffgren wrote:
>>=20
>> Signed-off-by: Daniel Loffgren <daniel@loffgren.org>
>=20
> Hmm - you've identified a file with no listed maintainer.  But
> qemu-trivial does seem like the right place to include it.
>=20
> Generally, we like patches to call out the topic that it is touching;
> also, the subject line should focus on the what, while the body =
focuses
> on the why.  So a better commit message might be:
>=20
> maint: Make fprintf-fn.h self-contained
>=20
> Include the necessary headers so that GCC_FMT_ATTR is defined =
regardless
> of what client files use fprintf-fn.h.
>=20
>=20
> However, after saying that, I think your patch is not needed.  Per
> HACKING, _all_ .c files must include osdep.h first, and osdep.h =
already
> includes compiler.h, therefore, any .c file that uses fprintf-fn.h
> already has GCC_FMT_ATTR in scope by the time it gets to the
> fprintf_function typedef.  If you ran into a situation where you had a
> compile failure, please post more details of what failed for you, in
> case the problem was you forgetting to use osdep.h.
>=20
> --=20
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>=20


