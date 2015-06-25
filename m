Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z83E2-0001mO-Ik
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jun 2015 05:13:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1Z83E0-0001is-2R
	for qemu-trivial@nongnu.org; Thu, 25 Jun 2015 05:13:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1Z83Dy-0001Oq-AW
	for qemu-trivial@nongnu.org; Thu, 25 Jun 2015 05:13:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48323)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>)
	id 1Z83Du-0001N4-6J; Thu, 25 Jun 2015 05:13:30 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id A3C58B8133;
	Thu, 25 Jun 2015 09:13:28 +0000 (UTC)
Received: from [10.34.129.181] (dhcp129-181.brq.redhat.com [10.34.129.181])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5P9DQ5Q022791
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 25 Jun 2015 05:13:27 -0400
Message-ID: <558BC635.1010602@redhat.com>
Date: Thu, 25 Jun 2015 11:13:25 +0200
From: Michal Privoznik <mprivozn@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, Stefan Weil <sw@weilnetz.de>
References: <58e7daaa2977c903b46c3b0dde64e81ce191b5d6.1435062620.git.mprivozn@redhat.com>	<CAFEAcA_AYg5okJgU61CYQasH9yY8rjsQQxpLq5xPvFyHLtJdgw@mail.gmail.com>	<5589543B.1020309@redhat.com>
	<20150623144917.372248b1@thh440s>	<558960A3.5010509@redhat.com>	<CAFEAcA9Rx6AyWqVuOAgyXE236v5dsB7xhRCMx+WNkZMU3p21Ag@mail.gmail.com>	<55899B88.30103@weilnetz.de>
	<87h9pwxo2a.fsf@blackfin.pond.sub.org>
In-Reply-To: <87h9pwxo2a.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
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
X-List-Received-Date: Thu, 25 Jun 2015 09:13:37 -0000

On 25.06.2015 09:08, Markus Armbruster wrote:
> Stefan Weil <sw@weilnetz.de> writes:
> 
>> Am 23.06.2015 um 19:31 schrieb Peter Maydell:
>>> On 23 June 2015 at 14:35, Michal Privoznik <mprivozn@redhat.com> wrote:
>>>> Yeah, that could work too. For some reason I thought that having it
>>>> there would result in making 'all' just under tests/. But Now that I
>>>> tried it out it works just nicely.
>>> Have you tested both "build in the source tree" and "build in
>>> a separate directory from the source tree", by the way?
>>>
>>> thanks
>>> -- PMM
>>
>> Both will work, as the modification only adds a dependency.
>>
>> Do we care that running "make check" will take longer with this
>> patch? Make needs some time to check all dependencies for
>> "all", even if nothing has to be done.
> 
> If this bothers us, we could try making it an order-only prerequisite:
> 
> check: | all

I'm not sure this is the right approach. What is there to check if
nothing has been built? I think this dependency is not order-only. It
should be a real dependency.

> 
> https://www.gnu.org/software/make/manual/html_node/Prerequisite-Types.html
> 
>> I feel a little bit uneasy with something depending on all.
>> Maybe some day we'll want to include check in the default
>> build. Then all would depend on check which depends on
> 
> I agree that depending on the default goal (here: all) isn't nice.
> 
>> all which depends on check and so on. An intermediate
>> make target could solve that:
>>
>> all: full-build
>> check: full-build
>> full-build: $(DOCS) $(TOOLS) $(HELPERS-y) recurse-all modules

Well, if we ever do that, it can be done this way. Or any other way that
would be applicable to the code in the future.

Michal

