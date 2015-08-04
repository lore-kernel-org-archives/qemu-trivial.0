Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMgew-0004Wx-KH
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 14:09:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ZMger-0004Rd-3F
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 14:09:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ZMgeq-0000yT-5g
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 14:09:49 -0400
Received: from mail-qg0-x22d.google.com ([2607:f8b0:400d:c04::22d]:36080)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1ZMgel-0000tb-Ry; Tue, 04 Aug 2015 14:09:43 -0400
Received: by qgeh16 with SMTP id h16so12540571qge.3;
	Tue, 04 Aug 2015 11:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=HluagUHkKvcWB7goo6atqX6Mt5yswYjTqOludOPXsLQ=;
	b=RFtLOYImvUC07k1tp7PYEhyq7kqHegrB1cPHzWBZeALXZD/AzrkVrV1lzEtongJV1C
	WyaP9EjuTIz2zDRuSz+IfsVEUNaxs+c4JTD6oNCbG3z3CqotAhshZRkwBH5m1l2yEnPC
	6kcQelfdiJLQdLP7xzIFsQ1ycQITE28nBeLuuHlgwEgJobrCQpNpcjOeAg1tGYxuzKP2
	48XVqvsweWhfe78qPkF+YfB1vSXTHOjTA+7uoami72Fyjq8cT2voreiSGif1A8ejoq5k
	uHSG3yIHV98j85aaqR/qZT9ASSP84w2rt/AR0kDvHsQvMcNJwOOId3J/GktbY3DwKNm9
	qB3A==
X-Received: by 10.140.38.138 with SMTP id t10mr8825676qgt.74.1438711783166;
	Tue, 04 Aug 2015 11:09:43 -0700 (PDT)
Received: from anchor.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by smtp.googlemail.com with ESMTPSA id
	g30sm45394qge.11.2015.08.04.11.09.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Aug 2015 11:09:41 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-4-git-send-email-alex.bennee@linaro.org>
	<20150804121616.GA8192@aurel32.net> <87h9ofks0j.fsf@linaro.org>
	<CAFEAcA9o7TOHEr_Uojan-uYWhvBpniYzG9hxG6102CAg+uWiwg@mail.gmail.com>
	<55C0D879.90404@twiddle.net> <87d1z3klyh.fsf@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <55C0FFE2.5010502@twiddle.net>
Date: Tue, 4 Aug 2015 11:09:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <87d1z3klyh.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::22d
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 03/11] qemu-log: correct
 help text for -d cpu
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
X-List-Received-Date: Tue, 04 Aug 2015 18:09:50 -0000

On 08/04/2015 10:22 AM, Alex Bennée wrote:
> 
> Richard Henderson <rth@twiddle.net> writes:
> 
>> On 08/04/2015 08:15 AM, Peter Maydell wrote:
>>> On 4 August 2015 at 16:11, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>> Aurelien Jarno <aurelien@aurel32.net> writes:
>>>>> On 2015-08-03 10:14, Alex Bennée wrote:
>>>>> In practice this is not true for linked TB. Should we also disable TB
>>>>> linking when this option is enabled?
>>>>
>>>> Good question. I suspect yes because if you've gone to level of wanting
>>>> exec tracing you'll probably get confused by the chaining. Of course it
>>>> will run a lot slower then.
>>>
>>> Unless the bug you were trying to track down is caused by the exec
>>> chaining, of course... But yes, I think we get more people wanting
>>> chaining to be disableable.
>>>
>>> Not sure we want to tie it to the 'cpu' debug option, though -- it
>>> applies just as much to 'exec'.
>>
>> Does it make more sense to have a 'nochain' debug option, and not tie it to
>> either 'cpu' or 'exec'?  It might be occasionally useful on its own, simply to
>> determine if a bug does exist in the exec chaining.
> 
> Would that make sense as a debug option or should we have a specific set
> of TCG options to alter its behaviour?


That's what I'm saying -- probably a separate debug option is better.


r~

