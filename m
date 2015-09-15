Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zbvu0-0003IB-LR
	for mharc-qemu-trivial@gnu.org; Tue, 15 Sep 2015 15:28:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zbvty-0003GL-FK
	for qemu-trivial@nongnu.org; Tue, 15 Sep 2015 15:28:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zbvtu-0003c7-CF
	for qemu-trivial@nongnu.org; Tue, 15 Sep 2015 15:28:26 -0400
Received: from mail-vk0-f53.google.com ([209.85.213.53]:33849)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zbvtu-0003c0-90
	for qemu-trivial@nongnu.org; Tue, 15 Sep 2015 15:28:22 -0400
Received: by vkhf67 with SMTP id f67so87038118vkh.1
	for <qemu-trivial@nongnu.org>; Tue, 15 Sep 2015 12:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=ZlG92IiPQIN/Xf2lL89Aga00DJB1MJkP6+Tk9gY8zkI=;
	b=H0PxCi1RPRmqAcPPWcgi4/4W0Trw+8AlaS729FuU6EkMeqGhrtnWkXEu0KkPmH9RDU
	b2sBVGYJIS2eQTUUxRhC1SGcvchR4Zyp6CUQ0y5BpJfaBaFa266RsAYxz90ib7rAhAOD
	cK6meEIlcTqZYKNqMoYFtyVmuMnXLQxk2nLNjZ5XoMG1VT9LA1E8REYGb38sLBRYqHQH
	8erpPWyc07hgIE4DR4QX+mY2O8cWat69SNouNMzOa4QdESrqevTkeHPA9PZEL4CfPn8x
	kD1OSsEHXCr7yXuY8OPnpDz/VGy9Ij6Vb/goYrT7z4Nb+rfN6N9IJQG+pVCmOGf9W6qV
	eAwQ==
X-Gm-Message-State: ALoCoQn4GET/TZ0ebPxuf2AqskOjyAy/IO/gI1kzSXeJNVY1nt2FcYKXwCmoENifM7EjoOHQ9moz
X-Received: by 10.31.1.214 with SMTP id 205mr23779106vkb.90.1442345301833;
	Tue, 15 Sep 2015 12:28:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 15 Sep 2015 12:28:02 -0700 (PDT)
In-Reply-To: <55C10F8D.3030400@twiddle.net>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-4-git-send-email-alex.bennee@linaro.org>
	<20150804121616.GA8192@aurel32.net> <87h9ofks0j.fsf@linaro.org>
	<CAFEAcA9o7TOHEr_Uojan-uYWhvBpniYzG9hxG6102CAg+uWiwg@mail.gmail.com>
	<55C0D879.90404@twiddle.net> <87d1z3klyh.fsf@linaro.org>
	<55C0FFE2.5010502@twiddle.net>
	<87a8u6lvm3.fsf@linaro.org> <55C10F8D.3030400@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Sep 2015 20:28:02 +0100
Message-ID: <CAFEAcA_n6RUS+EpHBUV0SUBvjY5h7VEAc2GSQ5e0LkZ1c8qRWg@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.53
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
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
X-List-Received-Date: Tue, 15 Sep 2015 19:28:27 -0000

On 4 August 2015 at 20:16, Richard Henderson <rth@twiddle.net> wrote:
> On 08/04/2015 12:08 PM, Alex Benn=C3=A9e wrote:
>>>> Would that make sense as a debug option or should we have a specific s=
et
>>>> of TCG options to alter its behaviour?
>>>
>>>
>>> That's what I'm saying -- probably a separate debug option is better.
>>
>> Sorry I meant should we add it to -d (as in -d nochain) or have some tcg
>> opts (--tcg nochain,blah)
>
> I was suggesting the former: -d nochain.

Did anybody ever write the patch to add 'nochain' support?

thanks
-- PMM

