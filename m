Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z81H9-00051E-4m
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jun 2015 03:08:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z81H6-0004yP-Jd
	for qemu-trivial@nongnu.org; Thu, 25 Jun 2015 03:08:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z81H5-0005uJ-ME
	for qemu-trivial@nongnu.org; Thu, 25 Jun 2015 03:08:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39992)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Z81Gz-0005sh-W2; Thu, 25 Jun 2015 03:08:34 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 028E53173D1;
	Thu, 25 Jun 2015 07:08:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-21.ams2.redhat.com
	[10.36.116.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5P78UA5014042
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 25 Jun 2015 03:08:31 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A93B6303F90A; Thu, 25 Jun 2015 09:08:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
References: <58e7daaa2977c903b46c3b0dde64e81ce191b5d6.1435062620.git.mprivozn@redhat.com>
	<CAFEAcA_AYg5okJgU61CYQasH9yY8rjsQQxpLq5xPvFyHLtJdgw@mail.gmail.com>
	<5589543B.1020309@redhat.com> <20150623144917.372248b1@thh440s>
	<558960A3.5010509@redhat.com>
	<CAFEAcA9Rx6AyWqVuOAgyXE236v5dsB7xhRCMx+WNkZMU3p21Ag@mail.gmail.com>
	<55899B88.30103@weilnetz.de>
Date: Thu, 25 Jun 2015 09:08:29 +0200
In-Reply-To: <55899B88.30103@weilnetz.de> (Stefan Weil's message of "Tue, 23
	Jun 2015 19:46:48 +0200")
Message-ID: <87h9pwxo2a.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michal Privoznik <mprivozn@redhat.com>
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
X-List-Received-Date: Thu, 25 Jun 2015 07:08:42 -0000

Stefan Weil <sw@weilnetz.de> writes:

> Am 23.06.2015 um 19:31 schrieb Peter Maydell:
>> On 23 June 2015 at 14:35, Michal Privoznik <mprivozn@redhat.com> wrote:
>>> Yeah, that could work too. For some reason I thought that having it
>>> there would result in making 'all' just under tests/. But Now that I
>>> tried it out it works just nicely.
>> Have you tested both "build in the source tree" and "build in
>> a separate directory from the source tree", by the way?
>>
>> thanks
>> -- PMM
>
> Both will work, as the modification only adds a dependency.
>
> Do we care that running "make check" will take longer with this
> patch? Make needs some time to check all dependencies for
> "all", even if nothing has to be done.

If this bothers us, we could try making it an order-only prerequisite:

check: | all

https://www.gnu.org/software/make/manual/html_node/Prerequisite-Types.html

> I feel a little bit uneasy with something depending on all.
> Maybe some day we'll want to include check in the default
> build. Then all would depend on check which depends on

I agree that depending on the default goal (here: all) isn't nice.

> all which depends on check and so on. An intermediate
> make target could solve that:
>
> all: full-build
> check: full-build
> full-build: $(DOCS) $(TOOLS) $(HELPERS-y) recurse-all modules

