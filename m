Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T8a68-0007Kz-Nk
	for mharc-qemu-trivial@gnu.org; Mon, 03 Sep 2012 13:06:04 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1T8a5z-0006w3-QD
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 13:06:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1T8a5g-00074G-Nq
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 13:05:55 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:59619)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1T8a2b-0005fx-Ae; Mon, 03 Sep 2012 13:02:25 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	8FD9B728002D; Mon,  3 Sep 2012 19:02:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id LV+15phe9YBQ; Mon,  3 Sep 2012 19:02:20 +0200 (CEST)
Received: from [192.168.178.20] (p5086F8C8.dip.t-dialin.net [80.134.248.200])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	53C157280029; Mon,  3 Sep 2012 19:02:20 +0200 (CEST)
Message-ID: <5044E29C.1030802@weilnetz.de>
Date: Mon, 03 Sep 2012 19:02:20 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Luiz Capitulino <lcapitulino@redhat.com>
References: <1346484855-29649-1-git-send-email-sw@weilnetz.de>
	<20120903134920.2dff4a3d@doriath.home>
In-Reply-To: <20120903134920.2dff4a3d@doriath.home>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-ga: Remove unreachable
	code after g_error
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
X-List-Received-Date: Mon, 03 Sep 2012 17:06:03 -0000

Am 03.09.2012 18:49, schrieb Luiz Capitulino:
> On Sat,  1 Sep 2012 09:34:15 +0200
> Stefan Weil <sw@weilnetz.de> wrote:
>
>> Report from smatch:
>> qemu-ga.c:117 register_signal_handlers(11) info: ignoring unreachable code.
>> qemu-ga.c:122 register_signal_handlers(16) info: ignoring unreachable code.
>>
>> g_error calls abort which terminates the program.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>   qemu-ga.c |    2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/qemu-ga.c b/qemu-ga.c
>> index 7623079..b747470 100644
>> --- a/qemu-ga.c
>> +++ b/qemu-ga.c
>> @@ -114,12 +114,10 @@ static gboolean register_signal_handlers(void)
>>       ret = sigaction(SIGINT, &sigact, NULL);
>>       if (ret == -1) {
>>           g_error("error configuring signal handler: %s", strerror(errno));
>> -        return false;
> Good catch, but we should really drop g_error() usage as qemu-ga will not
> fail gracefully otherwise (will leak the pidfile, for example). We either
> just drop g_error() or replace it by fprintf().

Isn't that a classical case of an error which should never occur,
something which could also be handled by an assert statement?

I don't expect a graceful exit after such errors. If they occur,
that's something which must be fixed in the code.

When I read the documentation of sigaction, I don't see how
it could fail with the given function arguments.

Therefore I'd apply the patch as it is.

Regards,

- sw


