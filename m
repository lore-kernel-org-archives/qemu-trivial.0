Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aW7i0-0000wy-Bi
	for mharc-qemu-trivial@gnu.org; Wed, 17 Feb 2016 14:24:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aW7hx-0000uB-Cj
	for qemu-trivial@nongnu.org; Wed, 17 Feb 2016 14:24:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aW7hw-0007cr-E8
	for qemu-trivial@nongnu.org; Wed, 17 Feb 2016 14:24:17 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:32935)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aW7hw-0007cX-99
	for qemu-trivial@nongnu.org; Wed, 17 Feb 2016 14:24:16 -0500
Received: by mail-vk0-x22a.google.com with SMTP id k196so24211941vka.0
	for <qemu-trivial@nongnu.org>; Wed, 17 Feb 2016 11:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4iU4QWc9M7Ds7oUBSP5qv4+WJ7QKLtsNBjTAMTcfnzI=;
	b=aDJW4BCEU68mq6fWj70SmKDulcH5oA9VJ9EQ50KPOkld4Xq+u/Y7JR4e9Hjs6BtPYn
	Tpq6L8yMfKTtfdRhGE4xDOq0iGBLxyceJ0EVfFypgBIlCFBGnHVHP4mMCpZJEyByY8q2
	OClJpkmdj6zKEGQO5iBVQWIYYOR70Qbs8Se9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4iU4QWc9M7Ds7oUBSP5qv4+WJ7QKLtsNBjTAMTcfnzI=;
	b=I0BRSnl9VdheWyhertc8uyuH27mUrT5GlNOX4u0msEyLdAODsb08hTTtrYr+vNYIgp
	zX4c3P0lGKete/Ja36GVHpSGWOrfUxW6now450YfQmBSDkmdlxgcKlrAlV9sEWL+ID26
	gkv8WOqxqy3zG7HFu/xmwfpbploP7/Mwx2nNcnrJQQJhv+C711Dyk3Sd3auSU3zffkwI
	OscNlFrPezafcdNGOB1nlciE+t2S7OnBAblJrBBxTVhVfQ1NQlPrcjabijiTjqN45YOj
	bEk86xrHcYZ//FBjI95m+TUR/VvgB7nxTgA1CuZQuMMTxAWIPyOvbUapTBTBnW52FokE
	Nqxw==
X-Gm-Message-State: AG10YOQuy3y6HZWXw26x/+jBNy8xgcqAqqsnq2PscwJiFxtQkzvh9IXmB18m6cQfUyqFM6dUgasHdx6od2xFQJqC
X-Received: by 10.31.1.6 with SMTP id 6mr2419459vkb.139.1455737054723; Wed, 17
	Feb 2016 11:24:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Wed, 17 Feb 2016 11:23:55 -0800 (PST)
In-Reply-To: <56C4C55F.2050006@redhat.com>
References: <1454359775-25959-1-git-send-email-wei@redhat.com>
	<CAFEAcA8czS_7Wxw1_s_khTL8eFNKcXixRrEYuEb4==_cYbdHbg@mail.gmail.com>
	<CAFEAcA8oUBe+mZ+2Lq0RO2eq_-H+atamp=gBCnxS2OWdkyza0w@mail.gmail.com>
	<56C4AF0D.9070803@redhat.com>
	<CAFEAcA-0+HLS4vgG3DqgUqsBNEt=J3M9Fy89uOtTQAtbt5noCQ@mail.gmail.com>
	<56C4C55F.2050006@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Feb 2016 19:23:55 +0000
Message-ID: <CAFEAcA9LuN6--czsaU72VCqacgbvd2DM1Ka9A-c5k_a0FozbhQ@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH V2 1/2] ARM: PL061: Clear PL061 device
	state after reset
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
X-List-Received-Date: Wed, 17 Feb 2016 19:24:18 -0000

On 17 February 2016 at 19:09, Wei Huang <wei@redhat.com> wrote:
>
>
> On 02/17/2016 11:53 AM, Peter Maydell wrote:
>> On 17 February 2016 at 17:34, Wei Huang <wei@redhat.com> wrote:
>>> On 02/16/2016 08:39 AM, Peter Maydell wrote:
>>>> Side note: half our "PL061" behaviour is actually specific
>>>> to the TI variant in the Luminary, and for our plain old PL061
>>>> we ought to restrict access to the registers that are Stellaris
>>>> only. But that's a different bug and not a very major one.
>>>
>>> Thanks for your suggestion. I was trying to fix it. The plan was to add
>>> a new field rsvd_addr in "struct PL061State". Then in pl061_read() and
>>> pl061_write(), we can check offset against [rsvd_addr, 0xfcc] (ignored
>>> if inside).
>>>
>>> While I was working on it, I realized that this is a benign issue. It is
>>> true that PL061 device can access Luminary registers in the reserved
>>> memory area. However QEMU doesn't use these Luminary registers anywhere
>>> else other than pl061_read() and pl061_write(). It basically passes the
>>> read/write requests through. I don't see a malicious driver can damage
>>> device state. Thoughts?
>>
>> It's not a "malicious guest can do bad things" bug, it's a "modelled
>> hardware doesn't behave like the real thing" bug. A non-Luminary PL061
>> should act like the hardware, which means that the registers that don't
>> exist should be RAZ/WI (and should log guest-errors if the guest tries
>> to access them), the same way we do in the "default" case of the
>> case statements for other reserved registers.
>
> How about the attached patch? I can write a new patch based on it, or
> you prefer stashing it on top of V3 I just submitted?

Looks OK, but you don't need to check for address being <= 0xfcc
because either we've already handled the ID registers (read)
or we were going to be reserved anyway (write).

thanks
-- PMM

