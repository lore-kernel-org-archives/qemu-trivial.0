Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7SHn-0007VJ-GO
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 13:47:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Z7SHl-0007Ri-44
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 13:47:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Z7SHk-0004rq-6q
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 13:47:01 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=40024
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Z7SHb-0004mt-TB; Tue, 23 Jun 2015 13:46:52 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	C8E291181899; Tue, 23 Jun 2015 19:46:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id SX-Nxfbxe_yt; Tue, 23 Jun 2015 19:46:48 +0200 (CEST)
Received: from [192.168.178.24] (p54AC9134.dip0.t-ipconnect.de [84.172.145.52])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	9F0A6118188E; Tue, 23 Jun 2015 19:46:48 +0200 (CEST)
Message-ID: <55899B88.30103@weilnetz.de>
Date: Tue, 23 Jun 2015 19:46:48 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, 
	Michal Privoznik <mprivozn@redhat.com>
References: <58e7daaa2977c903b46c3b0dde64e81ce191b5d6.1435062620.git.mprivozn@redhat.com>	<CAFEAcA_AYg5okJgU61CYQasH9yY8rjsQQxpLq5xPvFyHLtJdgw@mail.gmail.com>	<5589543B.1020309@redhat.com>
	<20150623144917.372248b1@thh440s>	<558960A3.5010509@redhat.com>
	<CAFEAcA9Rx6AyWqVuOAgyXE236v5dsB7xhRCMx+WNkZMU3p21Ag@mail.gmail.com>
In-Reply-To: <CAFEAcA9Rx6AyWqVuOAgyXE236v5dsB7xhRCMx+WNkZMU3p21Ag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Properly order
 build targets 'all' and 'check'
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
X-List-Received-Date: Tue, 23 Jun 2015 17:47:02 -0000

Am 23.06.2015 um 19:31 schrieb Peter Maydell:
> On 23 June 2015 at 14:35, Michal Privoznik <mprivozn@redhat.com> wrote:
>> Yeah, that could work too. For some reason I thought that having it
>> there would result in making 'all' just under tests/. But Now that I
>> tried it out it works just nicely.
> Have you tested both "build in the source tree" and "build in
> a separate directory from the source tree", by the way?
>
> thanks
> -- PMM

Both will work, as the modification only adds a dependency.

Do we care that running "make check" will take longer with this
patch? Make needs some time to check all dependencies for
"all", even if nothing has to be done.

I feel a little bit uneasy with something depending on all.
Maybe some day we'll want to include check in the default
build. Then all would depend on check which depends on
all which depends on check and so on. An intermediate
make target could solve that:

all: full-build
check: full-build
full-build: $(DOCS) $(TOOLS) $(HELPERS-y) recurse-all modules

Stefan


