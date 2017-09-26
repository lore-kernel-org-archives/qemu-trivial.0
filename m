Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwtUB-0003Lh-MV
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 13:17:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dwtU4-0003FA-7h
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 13:17:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dwtTy-0006OV-BX
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 13:17:24 -0400
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:50519)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dwtTy-0006Ny-4k
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 13:17:18 -0400
Received: by mail-wm0-x22d.google.com with SMTP id b195so10160863wmb.5
	for <qemu-trivial@nongnu.org>; Tue, 26 Sep 2017 10:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BhQQ5tmzTmSxWQIiVB8o7ETFbibKeoVhqw45EQsHOPs=;
	b=izerihOafiRRmHViAYkzhcsGPqs61uX1Ngx8DLHdBwTrRTW8xhuUabv8AIKIamqJlI
	Xsz5KdtyJowxwVrIdXi1hT4jTeCOxYZeKBclRAb/ZopZ1J9RFCxiNlMdVArDDT4024zQ
	i7jitygXIAP1Fn2ngfkff7d0IPDGPyE6iSEvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BhQQ5tmzTmSxWQIiVB8o7ETFbibKeoVhqw45EQsHOPs=;
	b=LvD5MMboZRq+uP556p9x+5QgT4fuW2C+5PgpL+4KwJP9kHeVC3uURNIN1Vu+6bUUvn
	rrEJ/AZUtdaP16LalsTWGxeNVK/UGFrs7DjAwuAgMaJt0A0Cto3MDMwVFDAGDoODLTwf
	UD+xYI+LVdEtnQJ625YmKy2zSmI9vWxniGMPjMAdQ+wunFT1BGj5L25wNsy/26C3X+qA
	XXD6cWV9OJdqgEMgMwNOakOL17gD4oRnyGfmPZ7Os4qo89F5zLAYn7F/vgCTsJWWbV5l
	xubUxB7FuQ/Yf/Pjf1+PtBRrm3SCES50BUL8651MPhyYPzIJKRcKM6D53OZvrEtd+6Z6
	PBJg==
X-Gm-Message-State: AHPjjUg0ROcJxFHYjTV6NRSiQPDVDGewbjle6gR7SVFKebAYsJPhsAMl
	ucaT8y4MwhXtX93wGE9bHFg5pyJ+KotlQRcoO0ityw==
X-Google-Smtp-Source: AOwi7QAF3mWHRUfOloOAM5P9d2IzCkKCJDRdzkDFK7XMv8+WORCT/jNC9iVIpCoOer1Y9OeYg/ZDj5lLFaQwF0B07Z0=
X-Received: by 10.28.103.195 with SMTP id b186mr3746718wmc.101.1506446237122; 
	Tue, 26 Sep 2017 10:17:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Tue, 26 Sep 2017 10:16:56 -0700 (PDT)
In-Reply-To: <CAKmqyKO2jfVZ9d1epxVWKMy9FUfByCoVXMV4JQ-qGAV=vzKwnQ@mail.gmail.com>
References: <1506441116-16627-1-git-send-email-thuth@redhat.com>
	<CAKmqyKOCsyCHnaNzo_zrRQjZi30ENdPoSc+dFehHvevm-9nrZg@mail.gmail.com>
	<cbcf25a4-db9c-910f-fdbc-b7620d013b14@redhat.com>
	<CAKmqyKO2jfVZ9d1epxVWKMy9FUfByCoVXMV4JQ-qGAV=vzKwnQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Sep 2017 18:16:56 +0100
Message-ID: <CAFEAcA_Q4xqSekX4vRVNGCeD+iSvoe73pxaNB=vKpmc8u+AGMw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/arm/xlnx-zynqmp: Mark
 the "xlnx, zynqmp" device with user_creatable = false
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
X-List-Received-Date: Tue, 26 Sep 2017 17:17:30 -0000

On 26 September 2017 at 18:03, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Tue, Sep 26, 2017 at 9:52 AM, Thomas Huth <thuth@redhat.com> wrote:
>> On 26.09.2017 18:36, Alistair Francis wrote:
>>> On Tue, Sep 26, 2017 at 8:51 AM, Thomas Huth <thuth@redhat.com> wrote:
>>>> The device uses serial_hds in its realize function and thus can't be
>>>> used twice. Apart from that, the comma in its name makes it quite hard
>>>> to use for the user anyway, since a comma is normally used to separate
>>>> the device name from its properties when using the "-device" parameter
>>>> or the "device_add" HMP command.
>>>
>>> Is it worth changing the name now then as well?
>>
>> Not sure, was there a reason for this name? E.g. is it used in a device
>> tree somewhere somehow? Anyway, with user_creatable = false, I think it
>> is not so urgent anymore to change it.
>
> I don't think there was a specific reason. Maybe it was copied from a
> device tree, but I'm not tied to keeping the comma. Maybe that's
> something we can investigate in the future.

I vaguely recall that the comma was part of an attempt to be consistent
about device names by making them follow the device tree names for them
rather than just making up our own. Some of the imx devices and boards
follow the same convention.

thanks
-- PMM

