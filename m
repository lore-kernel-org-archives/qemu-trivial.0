Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1blv9S-0004Ya-JS
	for mharc-qemu-trivial@gnu.org; Mon, 19 Sep 2016 05:46:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1blv9Q-0004Wq-Av
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 05:46:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1blv9P-00088J-8S
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 05:46:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55560)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1blv9J-00084L-9s; Mon, 19 Sep 2016 05:46:05 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F21FD329D99;
	Mon, 19 Sep 2016 09:46:03 +0000 (UTC)
Received: from [10.36.112.30] (ovpn-112-30.ams2.redhat.com [10.36.112.30])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8J9k1vj006818; Mon, 19 Sep 2016 05:46:02 -0400
To: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P. Berrange" <berrange@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
	<CAFEAcA9kTe0geCwguRbRSn8ozhnfarz4eTd5+Ra5kTZeR-fJkA@mail.gmail.com>
	<20160916153951.GE9654@redhat.com>
	<CAFEAcA-syR4mDW9JRD6NcJkeQd0Ue9ymf3CKcF6W1Shi-1VZmA@mail.gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <d664e3ae-0899-3509-2cce-bc868446d48f@redhat.com>
Date: Mon, 19 Sep 2016 11:46:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-syR4mDW9JRD6NcJkeQd0Ue9ymf3CKcF6W1Shi-1VZmA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 19 Sep 2016 09:46:04 +0000 (UTC)
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
X-List-Received-Date: Mon, 19 Sep 2016 09:46:13 -0000



On 16/09/2016 17:45, Peter Maydell wrote:
> On 16 September 2016 at 16:39, Daniel P. Berrange <berrange@redhat.com> wrote:
>> On Fri, Sep 16, 2016 at 03:47:37PM +0100, Peter Maydell wrote:
>>> On 16 September 2016 at 14:55, Laurent Vivier <lvivier@redhat.com> wrote:
>>>> This series is the result of coccinelle patch
>>>> scripts/coccinelle/exit.cocci
>>>> provided by the first patch of the series.
>>>>
>>>> It replaces exit(0) by exit(EXIT_SUCCESS)
>>>> and exit(1) by exit(EXIT_FAILURE).
>>>>
>>>> All other exit() are not modified as we don't want
>>>> to change the behavior.
>>>>
>>>> In some cases, I've added manually a line break to comply
>>>> with the maximum line length.
>>>
>>>>  182 files changed, 734 insertions(+), 715 deletions(-)
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

Portability?

https://www.gnu.org/software/libc/manual/html_node/Exit-Status.html

-----------------------------------------------------------------------
Portability note: Some non-POSIX systems use different conventions for
exit status values. For greater portability, you can use the macros
EXIT_SUCCESS and EXIT_FAILURE for the conventional status value for
success and failure, respectively. They are declared in the file stdlib.h.

Macro: int EXIT_SUCCESS
This macro can be used with the exit function to indicate successful
program completion.

On POSIX systems, the value of this macro is 0. On other systems, the
value might be some other (possibly non-constant) integer expression.

Macro: int EXIT_FAILURE
This macro can be used with the exit function to indicate unsuccessful
program completion in a general sense.

On POSIX systems, the value of this macro is 1. On other systems, the
value might be some other (possibly non-constant) integer expression.
Other nonzero status values also indicate failures. Certain programs use
different nonzero status values to indicate particular kinds of
"non-success". For example, diff uses status value 1 to mean that the
files are different, and 2 or more to mean that there was difficulty in
opening the files.
-----------------------------------------------------------------------

What bothers me is some exit() use 0s and 1s, and some others EXIT_
macros. If you want to use 0s and 1s I have no problem with that, I have
just to update the coccinelle script.

Laurent

