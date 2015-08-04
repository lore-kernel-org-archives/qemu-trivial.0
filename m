Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMe2F-0001wd-Cn
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 11:21:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ZMe28-0001oD-3a
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 11:21:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ZMe27-0004Sv-3Q
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 11:21:40 -0400
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233]:36422)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1ZMe21-0004P4-Oe; Tue, 04 Aug 2015 11:21:34 -0400
Received: by qkdv3 with SMTP id v3so4407804qkd.3;
	Tue, 04 Aug 2015 08:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=ku2HMZsZzIiJuHtoBM3yYxqP60n3R+BQDH7sf0sVExc=;
	b=pHFDraGdq/rvn1Ddu9JEZnRU+OIAmWdr7CHUHK/F74Lu+qCbHX2orYkyHmjTVK9Ub6
	JlMaPkSD43BEZtJCz0iv+hJTejyHw4wwS8fdPgk9mkK1INLDllIsomX7c/xaz2glCZQh
	gAr8jQ8NWBQhH09SP2orct8XCy757qOHYwCayT0X6jHWUqk0LCjzB5zGgTXjiodYYbqt
	+3jLYlNUzwPCW8F4To9RMD/V6qBiT4kYAVJw3BP6byv0b4x+Af5XEE+t7eLL3Btqszq1
	IRdzRVvmLEoQ/e7Un0NYUQDb7eFSAG3fpZwCrnGOJDkOxV1iesijypJwEZWnbyO0Lqx1
	uj7Q==
X-Received: by 10.55.33.162 with SMTP id f34mr7223310qki.25.1438701693445;
	Tue, 04 Aug 2015 08:21:33 -0700 (PDT)
Received: from anchor.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by smtp.googlemail.com with ESMTPSA id
	d6sm639970qgf.0.2015.08.04.08.21.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Aug 2015 08:21:32 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-4-git-send-email-alex.bennee@linaro.org>
	<20150804121616.GA8192@aurel32.net> <87h9ofks0j.fsf@linaro.org>
	<CAFEAcA9o7TOHEr_Uojan-uYWhvBpniYzG9hxG6102CAg+uWiwg@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <55C0D879.90404@twiddle.net>
Date: Tue, 4 Aug 2015 08:21:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9o7TOHEr_Uojan-uYWhvBpniYzG9hxG6102CAg+uWiwg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c09::233
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
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
X-List-Received-Date: Tue, 04 Aug 2015 15:21:46 -0000

On 08/04/2015 08:15 AM, Peter Maydell wrote:
> On 4 August 2015 at 16:11, Alex Bennée <alex.bennee@linaro.org> wrote:
>> Aurelien Jarno <aurelien@aurel32.net> writes:
>>> On 2015-08-03 10:14, Alex Bennée wrote:
>>> In practice this is not true for linked TB. Should we also disable TB
>>> linking when this option is enabled?
>>
>> Good question. I suspect yes because if you've gone to level of wanting
>> exec tracing you'll probably get confused by the chaining. Of course it
>> will run a lot slower then.
> 
> Unless the bug you were trying to track down is caused by the exec
> chaining, of course... But yes, I think we get more people wanting
> chaining to be disableable.
> 
> Not sure we want to tie it to the 'cpu' debug option, though -- it
> applies just as much to 'exec'.

Does it make more sense to have a 'nochain' debug option, and not tie it to
either 'cpu' or 'exec'?  It might be occasionally useful on its own, simply to
determine if a bug does exist in the exec chaining.


r~

