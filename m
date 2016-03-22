Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aiPVm-00017i-6c
	for mharc-qemu-trivial@gnu.org; Tue, 22 Mar 2016 12:50:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1aiPVj-00015b-RO
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 12:50:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1aiPVe-000211-83
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 12:50:27 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:34195)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>)
	id 1aiPVe-00020E-1t; Tue, 22 Mar 2016 12:50:22 -0400
Received: by mail-vk0-x235.google.com with SMTP id e185so261897377vkb.1;
	Tue, 22 Mar 2016 09:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F9oz+8hvy/5a9S+aS7u3YM1LzmKuUy+gI4j9FmEFkCU=;
	b=UI9kK/r1f4wQRslCZSFizVqMAn/vBieOju9avLJ/gYQ3n1ubX8id1WhIUJKcZye41V
	JoqBgXIMog/lS64tn46rCHQxH0XfgbMqB/j7Ztw3Na35RHonlHt72YPpy2q9IcAz6NLE
	Q1So2Pf00QNdv0hxloWGJ0w3CR86r0sk/ZZstsytD9p9ZMGJ4iEDQDzEtcxCuJxeWVSP
	72tYX0fIodxXkAKRNF5fW3jcHSlgRmkKKUoEXzmrSKvzRpjuDWGwmLmoIwY2agM9xH7K
	EcMi4hP/NpsgLSJ3YcDc4OAAzwM2hMQM+Qu52ggjSHQ7KJ+k5zjPLcCkESuvp6GVZWRp
	EnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F9oz+8hvy/5a9S+aS7u3YM1LzmKuUy+gI4j9FmEFkCU=;
	b=UZX2v5Z6OLQuyZl7M8S5PRraUZIroC/o+7+Mo0OmJiioBLqVeiRintGb0dKblIXXJZ
	CeDsqOPvl5+Mq9yIOc4Iw8Uf0rYUb0QY58jBkKUr0NZf53CliLHRZPl6sZ5wJR3RAihM
	kvFkcacn5BSynAPA/DFf0f41m8IfB0JMdLRpTjvGJzPJ4RMzAlkJI7NayI2LBCPjWyG7
	6hKE4xYMMigDvQLOigsD0d+WeVsBcXk8tlHbxbhjy9JGIbUQmIBYASTj7j/5/UW/zw3o
	HYHy8wqy0cFWEtEyv6zDaRKwZN0sXadvxeLIGJSSyi2BKVD2dwQ/leUpY7ihEN/321hW
	yE2g==
X-Gm-Message-State: AD7BkJL9ED0aW1l/1bO7qjUoaBo5uNWCVe5MD+H/xQdaGoK4wSCM93tWAvdocbtSbODy3iEAX8z7+cCp4YW7Tg==
X-Received: by 10.159.36.119 with SMTP id 110mr4618443uaq.151.1458665421452;
	Tue, 22 Mar 2016 09:50:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.15.9 with HTTP; Tue, 22 Mar 2016 09:50:02 -0700 (PDT)
In-Reply-To: <CAFEAcA8pR=5tr2zw7zGO1eD0Uka2oELr3rkrf_zzn-pVTqCYJw@mail.gmail.com>
References: <1458657219-12156-1-git-send-email-haris.phnx@gmail.com>
	<CAFEAcA8BVq6uy2-1vyvx0HRV8dapOcUjHsCB_wqB4ecj0XmgrA@mail.gmail.com>
	<CAE_WKMwwyURfHKBh35YYWbHBLLekGMaaamOGZAtv_v2r=cJ-8A@mail.gmail.com>
	<56F16D42.1030108@redhat.com>
	<CAE_WKMyzdUMEaxiqT2+gkPoxEY6Z3ZOsbHBcvhyWkC-_mfXdSg@mail.gmail.com>
	<CAFEAcA8pR=5tr2zw7zGO1eD0Uka2oELr3rkrf_zzn-pVTqCYJw@mail.gmail.com>
From: haris iqbal <haris.phnx@gmail.com>
Date: Tue, 22 Mar 2016 22:20:02 +0530
Message-ID: <CAE_WKMy_7A1LFRbxD__LzoeoHRnUxTjbQvb2=sEub5jyVCaKbg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Changed malloc() to g_malloc() at places
 where return value was not being checked
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
X-List-Received-Date: Tue, 22 Mar 2016 16:50:28 -0000

On Tue, Mar 22, 2016 at 10:16 PM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 22 March 2016 at 16:15, haris iqbal <haris.phnx@gmail.com> wrote:
>> One more question. About tracking down g_free(). I thought of
>> submitting for linux-user/qemu.h first. As it is done in a function
>> called lock_user(), which is called by many other functions (around
>> 144, too many to be checked manually). The interesting part is, the
>> free is done by a pair function called unlock_user(). I just want to
>> ask if all those lock_user() calls has a matching unlock_user() call
>> to free() the malloc(), or there is a hidden free somewhere else also?
>> This would save a lot of time. Thanks.
>
> lock_user and unlock_user should always match. (In particular
> lock_user will only malloc if DEBUG_REMAP is defined, which it
> is not by default, so callers can't be free()ing by mistake.)

Thanks. Then its safe to say that changing the free() in unlock_user()
to g_free() would do the job for the malloc() to g_malloc() change in
lock_user().

>
> thanks
> -- PMM



-- 

With regards,

Md Haris Iqbal,
Placement Coordinator, MTech IT
NITK Surathkal,
Contact: +91 8861996962

