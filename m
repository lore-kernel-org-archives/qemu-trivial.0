Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bkvKW-0003Pt-JJ
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 11:45:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bkvKT-0003M0-Uf
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 11:45:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bkvKS-0007SC-2Q
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 11:45:29 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:34391)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bkvKR-0007Rt-Ta
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 11:45:28 -0400
Received: by mail-vk0-x235.google.com with SMTP id g9so32671167vkg.1
	for <qemu-trivial@nongnu.org>; Fri, 16 Sep 2016 08:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dtE8+PCLq+dEpV07wWByFTaxQ4SQ2W+UpMsYkfGHnRg=;
	b=kE71ddAQva4z8pXl+lGn68t/VpvJod/sttls4TGRWNc936bMwqDzdzGJR0vwwJXFFZ
	T8aTBIcmLarYs3gVZ1woaoJAJvrP8OMf1rr0lB6HzHwQH81fz0qQP2F73+fzl/ZuM/C9
	ud10ubYUqZcBsiPK7Fu9Qtm6c9pV4ObcwGaJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dtE8+PCLq+dEpV07wWByFTaxQ4SQ2W+UpMsYkfGHnRg=;
	b=Uh8I1b85ec/6KXEUt/DA/wQzv5c5V0vEX8ySYrHFtk6ouCHReF2gVx8uUvZ5NyjKgx
	dQS3oqvthn9Azrkhff5T1wMwP6M5GYpJ/i20DVuHOFEZRw8zUDAUK2+FENsf35hJ9hOy
	m9UirvCf44/PIm5yvb1E9adkDgYUxsm+EpHVoj/3dmIi3M+CxqjM2jmZ9Ly98kGGav5D
	5GFaa2snu0FB6QCJDjEotyoCsy1Mt5ni1SFbDcBDcQR0PDHr+ku4azlJbc1uCt0exWkV
	TQ2GIgzHP4ehROBBfzwPs7JrUxXSUfvBTLL8uNtTHEs8vgFURnfuxVJ0/H0hidGd8TJQ
	ei/A==
X-Gm-Message-State: AE9vXwNPSGPoVXwlXB/Zu/X52OeHeZL0W/C4YXpdRB0jrWwxdTbYONOzXeO1D1+8/llPXAFLNjy+k6G9ho5uS5Cj
X-Received: by 10.31.206.6 with SMTP id e6mr4406480vkg.17.1474040727194; Fri,
	16 Sep 2016 08:45:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.131 with HTTP; Fri, 16 Sep 2016 08:45:06 -0700 (PDT)
In-Reply-To: <20160916153951.GE9654@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
	<CAFEAcA9kTe0geCwguRbRSn8ozhnfarz4eTd5+Ra5kTZeR-fJkA@mail.gmail.com>
	<20160916153951.GE9654@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Sep 2016 16:45:06 +0100
Message-ID: <CAFEAcA-syR4mDW9JRD6NcJkeQd0Ue9ymf3CKcF6W1Shi-1VZmA@mail.gmail.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
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
X-List-Received-Date: Fri, 16 Sep 2016 15:45:31 -0000

On 16 September 2016 at 16:39, Daniel P. Berrange <berrange@redhat.com> wrote:
> On Fri, Sep 16, 2016 at 03:47:37PM +0100, Peter Maydell wrote:
>> On 16 September 2016 at 14:55, Laurent Vivier <lvivier@redhat.com> wrote:
>> > This series is the result of coccinelle patch
>> > scripts/coccinelle/exit.cocci
>> > provided by the first patch of the series.
>> >
>> > It replaces exit(0) by exit(EXIT_SUCCESS)
>> > and exit(1) by exit(EXIT_FAILURE).
>> >
>> > All other exit() are not modified as we don't want
>> > to change the behavior.
>> >
>> > In some cases, I've added manually a line break to comply
>> > with the maximum line length.
>>
>> >  182 files changed, 734 insertions(+), 715 deletions(-)
>>
>> You don't say why this is a useful change to make, and it's an
>> awful lot of churn for a stylistic issue...
>
> Currently QEMU uses a mix of at least
>
>   exit(EXIT_SUCCESS)
>   exit(EXIT_FAILURE)
>   exit(1)
>   exit(-1)
>   _exit(1)
>   _exit(0);
>
> so this series has the potential giving us more consistency style
> and behaviour, across our code. By not fixing the up the usage of -1,
> or fixing the _exit() usage, the series feels incomplete to me though.

-1 is just a bug which we should fix (as Eric says). I don't
see the point in converting all our 0s and 1s to EXIT_SUCCESS
and EXIT_FAILURE though. (It would be less churn to convert the
uses of EXIT_* to 0 and 1...)

thanks
-- PMM

