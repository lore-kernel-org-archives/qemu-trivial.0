Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yzh8B-0008Iy-K8
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 04:01:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Yzh84-0008EP-Hk
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 04:01:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Yzh80-0008TQ-Dh
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 04:00:56 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:50366 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Yzh7v-0008Qt-Vj; Tue, 02 Jun 2015 04:00:48 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1YziT9-0001KX-1A; Tue, 02 Jun 2015 11:26:47 +0200
References: <1432897012-1423-1-git-send-email-alex.bennee@linaro.org>
	<55684995.3070205@redhat.com> <877frrii83.fsf@linaro.org>
	<556893DB.9030502@redhat.com> <556D43C4.2070309@msgid.tls.msk.ru>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Michael Tokarev <mjt@tls.msk.ru>
In-reply-to: <556D43C4.2070309@msgid.tls.msk.ru>
Date: Tue, 02 Jun 2015 09:01:01 +0100
Message-ID: <87vbf6bkua.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: don't apply -O2 if
	extra-cflags sets -O
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
X-List-Received-Date: Tue, 02 Jun 2015 08:01:02 -0000


Michael Tokarev <mjt@tls.msk.ru> writes:

> 29.05.2015 19:29, Paolo Bonzini wrote:
>> On 29/05/2015 16:14, Alex Bennée wrote:
>>> You mean just do:
>>>
>>> diff --git a/configure b/configure
>>> index b707429..f13831a 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -353,7 +353,7 @@ for opt do
>>>    ;;
>>>    --cpu=*) cpu="$optarg"
>>>    ;;
>>> -  --extra-cflags=*) QEMU_CFLAGS="$optarg $QEMU_CFLAGS"
>>> +  --extra-cflags=*) QEMU_CFLAGS="$QEMU_CFLAGS $optarg"
>>>                      EXTRA_CFLAGS="$optarg"
>>>    ;;
>>>    --extra-ldflags=*) LDFLAGS="$optarg $LDFLAGS"
>>>
>>> I guess at the time I was trying to be clean and avoiding multiple -O
>>> calls. But I guess that will have the same effect.
>> 
>> Yes, that.  Most other QEMU_CFLAGS assignments add at the beginning, so
>> I guess the remaining ones (including the --extra-cflags one) should too.
>
> So, what's the final version of this patch?

I can send the second patch but I'm wary about changing all instances to
QEMU_CFLAGS to append additional flags.

>
> Thanks,
>
> /mjt

-- 
Alex Bennée

