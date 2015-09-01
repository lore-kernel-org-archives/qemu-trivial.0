Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZWjmS-0005fl-3t
	for mharc-qemu-trivial@gnu.org; Tue, 01 Sep 2015 07:31:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZWjmP-0005cj-Tj
	for qemu-trivial@nongnu.org; Tue, 01 Sep 2015 07:31:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZWjmL-0001XV-U2
	for qemu-trivial@nongnu.org; Tue, 01 Sep 2015 07:31:09 -0400
Received: from mail-vk0-f47.google.com ([209.85.213.47]:33870)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZWjmL-0001XK-Pg
	for qemu-trivial@nongnu.org; Tue, 01 Sep 2015 07:31:05 -0400
Received: by vkhf67 with SMTP id f67so54862318vkh.1
	for <qemu-trivial@nongnu.org>; Tue, 01 Sep 2015 04:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HLqsbn3TyYyARWX3dewPclKa0zE8Z9A0Z5+wjj+zEcc=;
	b=JSGTK7YYKj4sRf8a29X8SemupGVNU7Xe9Y8nFTltxhmjmcyccr8/rVqRpBT1UBaOIT
	GUqrLjoU1z7YSgqxNmYWD/r2OUqIOzU+tBCsTdUFtmXM2wUeKzdN1QPZ046VNRlMoCY9
	VaxKh5bi/3zGLlRtZZGhqoeaFgYj35eTezjQLYKnlGMFfNCjFpTn65kDbCvy6jS07rC6
	/UgNxee5lqgs7UTWLN4lMwz8XBoKlGF/jcISKw4WxBB0aIAyWdJtM6Pq7Z8sqdqZR5ni
	cQKTjhVVK0C0cqx22rGv/P8ajABMHpkrcl8yYd/1/zmZjf76FVAbvFyL6WveR+MHpb49
	VeIg==
X-Gm-Message-State: ALoCoQkGgC1yoh9gmEc6x+mKPSCgF5j7VE2whD0NGy8zsUN8ybdnMwrNzX62r5HDxrUB1CamAfEj
X-Received: by 10.52.163.50 with SMTP id yf18mr29948471vdb.93.1441107065411;
	Tue, 01 Sep 2015 04:31:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Tue, 1 Sep 2015 04:30:46 -0700 (PDT)
In-Reply-To: <55E58A9B.5060200@redhat.com>
References: <1440703987-29012-1-git-send-email-lvivier@redhat.com>
	<1440703987-29012-7-git-send-email-lvivier@redhat.com>
	<CAFEAcA9cm4g0wOEAXGmhNZkWbD82o+eWkWpK4R-uorfFtJyOXA@mail.gmail.com>
	<55E58A9B.5060200@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2015 12:30:46 +0100
Message-ID: <CAFEAcA_+NzotsgJ=5+S1Aq=wsA70eNtP267_HJPTiYbHZxog5w@mail.gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.47
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v3 6/9] arm: clarify the use of muldiv64()
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
X-List-Received-Date: Tue, 01 Sep 2015 11:31:10 -0000

On 1 September 2015 at 12:23, Laurent Vivier <lvivier@redhat.com> wrote:
>
>
> On 01/09/2015 13:17, Peter Maydell wrote:
>> On 27 August 2015 at 20:33, Laurent Vivier <lvivier@redhat.com> wrote:
>>> +#define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
>>
>> LL suffix for large constants, please.
>
> In fact, I didn't put the LL suffix to not force the use of a 64bit on a
> 32bit machines. Moreover in muldiv64() it is used as a 32bit value.
>
> But if you think it is better, I will. Have I to resend the whole series
> or only this patch ? Perhaps the commiter can edit it ?

Oh, you're right, it's a 32-bit value. I take back my suggestion.

thanks
-- PMM

