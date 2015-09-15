Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zbw6x-0000es-Rx
	for mharc-qemu-trivial@gnu.org; Tue, 15 Sep 2015 15:41:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1Zbw6u-0000Zf-KK
	for qemu-trivial@nongnu.org; Tue, 15 Sep 2015 15:41:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1Zbw6t-0000ra-Bp
	for qemu-trivial@nongnu.org; Tue, 15 Sep 2015 15:41:48 -0400
Received: from mail-qg0-x22e.google.com ([2607:f8b0:400d:c04::22e]:36297)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1Zbw6o-0000o2-Nn; Tue, 15 Sep 2015 15:41:42 -0400
Received: by qgx61 with SMTP id 61so153041539qgx.3;
	Tue, 15 Sep 2015 12:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=Bfan2wD0RkRJGZD5oO+lXd6Lx+dR8BcvwdMsoCoo6VA=;
	b=b9m9Zl6Q+snw8sZ3hX4jvnrRoSQ6cDf0zs41CmykGfxHdsJj652iGqxTIsc7kEEdml
	6Y9v4i6ty32PER+A0H1hpfgS3syWGhXi5Es2JbBYWhl7cHjWUSBr2daA05pK+ytv3it1
	iLei0ebMkIQPP7FTkrUaGqwM9lzoEAecqv1tJMSA/xWABklSCtR2jCSDX6m9uia6siEx
	WCvfgFBNIvP6Dr2L0R2FfVntJ6lTN2P2zN7GO1LZ8X16pK3JFoURtYSvsRKglrN0LMc0
	jwG9ni0jsn38C7kRSfazOfnARp+MwJMVfBS21p+fGRWA1PVL2PIhUUB8JA+O9CwJWVdb
	h5zg==
X-Received: by 10.140.40.139 with SMTP id x11mr34464081qgx.41.1442346102144;
	Tue, 15 Sep 2015 12:41:42 -0700 (PDT)
Received: from anchor.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by smtp.googlemail.com with ESMTPSA id
	s52sm8562923qge.19.2015.09.15.12.41.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Sep 2015 12:41:41 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-4-git-send-email-alex.bennee@linaro.org>
	<20150804121616.GA8192@aurel32.net> <87h9ofks0j.fsf@linaro.org>
	<CAFEAcA9o7TOHEr_Uojan-uYWhvBpniYzG9hxG6102CAg+uWiwg@mail.gmail.com>
	<55C0D879.90404@twiddle.net> <87d1z3klyh.fsf@linaro.org>
	<55C0FFE2.5010502@twiddle.net> <87a8u6lvm3.fsf@linaro.org>
	<55C10F8D.3030400@twiddle.net>
	<CAFEAcA_n6RUS+EpHBUV0SUBvjY5h7VEAc2GSQ5e0LkZ1c8qRWg@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <55F87472.70205@twiddle.net>
Date: Tue, 15 Sep 2015 12:41:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_n6RUS+EpHBUV0SUBvjY5h7VEAc2GSQ5e0LkZ1c8qRWg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::22e
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
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
X-List-Received-Date: Tue, 15 Sep 2015 19:41:49 -0000

On 09/15/2015 12:28 PM, Peter Maydell wrote:
> On 4 August 2015 at 20:16, Richard Henderson <rth@twiddle.net> wrote:
>> On 08/04/2015 12:08 PM, Alex Bennée wrote:
>>>>> Would that make sense as a debug option or should we have a specific set
>>>>> of TCG options to alter its behaviour?
>>>>
>>>>
>>>> That's what I'm saying -- probably a separate debug option is better.
>>>
>>> Sorry I meant should we add it to -d (as in -d nochain) or have some tcg
>>> opts (--tcg nochain,blah)
>>
>> I was suggesting the former: -d nochain.
> 
> Did anybody ever write the patch to add 'nochain' support?

Nope.  ;-)


r~



