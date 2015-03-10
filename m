Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVKjZ-0003od-Uh
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 10:02:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVKjT-0003e5-T2
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 10:02:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVKjP-0006x2-2U
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 10:02:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37823)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVKj6-0006n3-3z; Tue, 10 Mar 2015 10:01:40 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C07DF4138F;
	Tue, 10 Mar 2015 17:01:38 +0300 (MSK)
Message-ID: <54FEF942.5010602@msgid.tls.msk.ru>
Date: Tue, 10 Mar 2015 17:01:38 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>, Kevin Wolf <kwolf@redhat.com>
References: <1425971164-9845-1-git-send-email-mjt@msgid.tls.msk.ru>	<20150310085016.GC3770@noname.str.redhat.com>	<20150310091759.GC14320@ad.nay.redhat.com>	<20150310100936.GD3770@noname.str.redhat.com>
	<CAJSP0QWk+KzGuR2e6m8KsCUbMqcU6cReQbp2231zf9+Nt8zF9g@mail.gmail.com>
In-Reply-To: <CAJSP0QWk+KzGuR2e6m8KsCUbMqcU6cReQbp2231zf9+Nt8zF9g@mail.gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Fam Zheng <famz@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, Peter Wu <peter@lekensteyn.nl>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH] block/dmg: make it modular
 if using additional library
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Mar 2015 14:02:09 -0000

10.03.2015 16:58, Stefan Hajnoczi =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Tue, Mar 10, 2015 at 10:09 AM, Kevin Wolf <kwolf@redhat.com> wrote:
>> Am 10.03.2015 um 10:17 hat Fam Zheng geschrieben:
>>> On Tue, 03/10 09:50, Kevin Wolf wrote:
>>>> Am 10.03.2015 um 08:06 hat Michael Tokarev geschrieben:
>>>> Also, should we consider making some more rarely used image formats
>>>> modules even if they don't pull in external dependencies?
>>>
>>> Sounds reasonable to me. Is the intention to reduce binary size?
>>
>> Yes, that and also that it allows compiling out some drivers without
>> having to mess with the Makefiles. You just don't install all of them.
>>
>> Related to that, Peter also mentioned that you (the user, not develope=
r
>> or packager) could simply disable a single driver, for example as a
>> temporary hotfix in the case of security problems in a block driver.
>> That would actually be an argument for making _all_ drivers modules.
>=20
> I am for making all block drivers built as modules.

That might be useful if module loading will be modified a bit,
like by loadin modules on demand only.  Something like this,
search a "foo" block driver in the registered list, found ->
use it, if not, try to open block-foo.so (maybe after looking
in the "available" internal list before that) and look up in
the registered list again.

That will make it more useful.

Thanks,

/mjt

