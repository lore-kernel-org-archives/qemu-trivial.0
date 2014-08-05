Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XEZn7-0008Je-3q
	for mharc-qemu-trivial@gnu.org; Tue, 05 Aug 2014 04:08:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XEZn1-0008Di-Fk
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 04:08:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XEZmq-0000Hc-K6
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 04:08:11 -0400
Received: from mail-la0-f51.google.com ([209.85.215.51]:34922)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XEZmq-0000GT-Dt
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 04:08:00 -0400
Received: by mail-la0-f51.google.com with SMTP id pn19so420406lab.24
	for <qemu-trivial@nongnu.org>; Tue, 05 Aug 2014 01:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jtkvMgxvvb78aPKc9RMhv62JV2t158Vumh/eNYa2fdc=;
	b=MbEZavsO/lPqmwChWQaXMuG+/5UQ5bRhiCj7JAHPJTpwb6/gEpOhMIxQ805rhOGBHn
	yiRNEqgMe30vhjA7E6LTBlLqmpgNZOMQSbVxizDzQt+ODKn8Qov1R2AmXgmxHFriBYhK
	Z5GwA/tHNjlotnGGI9rbhTSlFKOL1d6np7/F7u5mr6KaSmcXnPZpyMFo6vqFf4w0z5Gw
	4crmCspyPTPnM0T7W+LzILvhu3gTsabG2TvRVJCnWxrw3zQJ49VMDTILt6ZxsOZ/gSpd
	SnMt+odUQ2HZF/Br/Bz3j2Yoa3rvhz473ob/ajNCE85UGOlV0WBWyKSUfBlRRgpJf/VL
	ji7w==
X-Gm-Message-State: ALoCoQm3y5JifvHgpkAw/e/Vq02zd33rvjeJ57rLG4zkLgIosuxDiFeWBCVQZoQ19QhfbnksODvH
X-Received: by 10.112.34.78 with SMTP id x14mr2137434lbi.38.1407226079176;
	Tue, 05 Aug 2014 01:07:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Tue, 5 Aug 2014 01:07:39 -0700 (PDT)
In-Reply-To: <53E082EF.9090007@msgid.tls.msk.ru>
References: <53DE5538.1020701@gmail.com> <53DF3D74.9070503@msgid.tls.msk.ru>
	<87d2cguupa.fsf@blackfin.pond.sub.org> <53E06083.7080909@gmail.com>
	<53E082EF.9090007@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Aug 2014 09:07:39 +0100
Message-ID: <CAFEAcA_9+5VEzf4dpyrs9tR-jici+ea6rr6qh6F+nX296PH8hQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.51
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] Cc'ing emails [
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
X-List-Received-Date: Tue, 05 Aug 2014 08:08:16 -0000

n 5 August 2014 08:08, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 05.08.2014 08:41, Chen Gang wrote:
>>
>> Every members have their own tastes, and one working flow may be not
>> suitable for all members. I can understand, and hope other members
>> understand too.
>>
>> At least for me, next, I shall send patch to the members which I can get
>> from 'get_maintainers.pl' and only Cc to qemu-devel. And shall skip
>> qemu-trivial and Michael Tokarev.
>
> Why skip both?  It's your call, but I'm curious.

I think that is a misunderstanding. You asked not to get mails
cc'd to both you personally and qemu-trivial at the same time,
and Chen misread this to mean not to cc either address.

Trivial patches should still be sent "To: qemu-devel + Cc: qemu-trivial".

> What I _think_ wrong is that get_maintainers.pl lists many random
> "patchers" for a given file by default.

Yes, I think it's probably reasonable to change it to make it not
default to "--git-fallback". Do you want to submit a patch?

(Perhaps we could make it cc qemu-orphan@ if we wanted to
flag up holes in our MAINTAINERS coverage and patches liable
to get lost, but that probably only makes sense if we have people
who would care enough to do that monitoring work.)

thanks
-- PMM

