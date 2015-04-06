Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YfB6Z-0002mz-BD
	for mharc-qemu-trivial@gnu.org; Mon, 06 Apr 2015 13:46:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1YfB6X-0002l0-2S
	for qemu-trivial@nongnu.org; Mon, 06 Apr 2015 13:46:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1YfB6R-00073d-TK
	for qemu-trivial@nongnu.org; Mon, 06 Apr 2015 13:46:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54563)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1YfB6R-00072g-M7; Mon, 06 Apr 2015 13:46:27 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t36HkGro009842
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 6 Apr 2015 13:46:16 -0400
Received: from scv.usersys.redhat.com (dhcp-17-29.bos.redhat.com [10.18.17.29])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t36HkFaU020540; Mon, 6 Apr 2015 13:46:15 -0400
Message-ID: <5522C667.80200@redhat.com>
Date: Mon, 06 Apr 2015 13:46:15 -0400
From: John Snow <jsnow@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Ed Maste <emaste@freebsd.org>
References: <1427911244-22565-1-git-send-email-emaste@freebsd.org>
	<551C5DE7.70904@redhat.com> <551C5FAF.7010303@redhat.com>
	<CAFEAcA-CLb6WNqgxjsys=kfDoTe9KEeNZ8W-7ax=A1dqBVo0eQ@mail.gmail.com>
	<CAPyFy2B=rTfz+6JyVmufLTOxsddXyJWDD0wAGROqbodeNicUtQ@mail.gmail.com>
	<CAFEAcA8nyMCnYOAhjfYxJ1q6Ei_04L5Jr2ERrMUQaE+KCqKDRw@mail.gmail.com>
In-Reply-To: <CAFEAcA8nyMCnYOAhjfYxJ1q6Ei_04L5Jr2ERrMUQaE+KCqKDRw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qtest: Add assertion that
 required environment variable is set
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
X-List-Received-Date: Mon, 06 Apr 2015 17:46:34 -0000



On 04/03/2015 07:18 AM, Peter Maydell wrote:
> On 2 April 2015 at 20:31, Ed Maste <emaste@freebsd.org> wrote:
>> On 1 April 2015 at 18:45, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> Also irritating is the way it silently requires
>>> the binary to have a name in the shape it was
>>> expecting, which can catch you out if you were
>>> trying to set it to a wrapper shell script that
>>> invokes valgrind or something...
>>
>> I don't really have enough context to propose a good user-facing
>> message with a tip for manually executing this, so hopefully someone
>> else can provide one. I just noticed one other instance that already
>> had an assertion on getenv("QTEST_QEMU_BINARY") being non-null.
>
> Yes, that was just me venting about something that caught me
> out in the past rather than review comment on this patch :-)
> Sorry for any confusion.
>
> -- PMM
>

I'll pull this into ide-next for 2.4 -- I have some ahci-test things to 
submit anyway.

I'll touch up the user facing error messages in a later patch and hit a 
few of the startup assertions all at once.

Thanks.
--js

