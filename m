Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1blulZ-0005xy-Vi
	for mharc-qemu-trivial@gnu.org; Mon, 19 Sep 2016 05:21:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1blulX-0005w8-7U
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 05:21:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1blulW-0000DJ-7s
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 05:21:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44946)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1blulQ-00009m-Gw; Mon, 19 Sep 2016 05:21:24 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A2B23D7EE4;
	Mon, 19 Sep 2016 09:21:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-37.ams2.redhat.com
	[10.36.116.37])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8J9LL6c005528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 19 Sep 2016 05:21:22 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C1BB51132B64; Mon, 19 Sep 2016 11:21:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
	<CAFEAcA9kTe0geCwguRbRSn8ozhnfarz4eTd5+Ra5kTZeR-fJkA@mail.gmail.com>
	<20160916153951.GE9654@redhat.com>
	<CAFEAcA-syR4mDW9JRD6NcJkeQd0Ue9ymf3CKcF6W1Shi-1VZmA@mail.gmail.com>
Date: Mon, 19 Sep 2016 11:21:20 +0200
In-Reply-To: <CAFEAcA-syR4mDW9JRD6NcJkeQd0Ue9ymf3CKcF6W1Shi-1VZmA@mail.gmail.com>
	(Peter Maydell's message of "Fri, 16 Sep 2016 16:45:06 +0100")
Message-ID: <878tuokzxr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 19 Sep 2016 09:21:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 00/26] trivial: use
 exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
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
X-List-Received-Date: Mon, 19 Sep 2016 09:21:32 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On 16 September 2016 at 16:39, Daniel P. Berrange <berrange@redhat.com> wrote:
>> On Fri, Sep 16, 2016 at 03:47:37PM +0100, Peter Maydell wrote:
>>> On 16 September 2016 at 14:55, Laurent Vivier <lvivier@redhat.com> wrote:
>>> > This series is the result of coccinelle patch
>>> > scripts/coccinelle/exit.cocci
>>> > provided by the first patch of the series.
>>> >
>>> > It replaces exit(0) by exit(EXIT_SUCCESS)
>>> > and exit(1) by exit(EXIT_FAILURE).
>>> >
>>> > All other exit() are not modified as we don't want
>>> > to change the behavior.
>>> >
>>> > In some cases, I've added manually a line break to comply
>>> > with the maximum line length.
>>>
>>> >  182 files changed, 734 insertions(+), 715 deletions(-)
>>>
>>> You don't say why this is a useful change to make, and it's an
>>> awful lot of churn for a stylistic issue...
>>
>> Currently QEMU uses a mix of at least
>>
>>   exit(EXIT_SUCCESS)
>>   exit(EXIT_FAILURE)
>>   exit(1)
>>   exit(-1)
>>   _exit(1)
>>   _exit(0);
>>
>> so this series has the potential giving us more consistency style
>> and behaviour, across our code. By not fixing the up the usage of -1,
>> or fixing the _exit() usage, the series feels incomplete to me though.
>
> -1 is just a bug which we should fix (as Eric says). I don't
> see the point in converting all our 0s and 1s to EXIT_SUCCESS
> and EXIT_FAILURE though. (It would be less churn to convert the
> uses of EXIT_* to 0 and 1...)

Seconded.

