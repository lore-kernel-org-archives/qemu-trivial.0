Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1StQSC-0006Ve-No
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jul 2012 17:46:12 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1StQSA-0006UN-Or
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 17:46:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1StQS8-0008QS-Pb
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 17:46:10 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:57535)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1StQS8-0008Py-J4
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 17:46:08 -0400
Received: by bkcji1 with SMTP id ji1so4876418bkc.4
	for <qemu-trivial@nongnu.org>; Mon, 23 Jul 2012 14:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=iSttAjqxHL6Z9xCKJKDBHA0CJqdm9dprpucaRQTKzXM=;
	b=gQBZ2XNgK5BzNnWp16MpA/TUvXi0fwqpE5omEz8izrtiN4WTSI+gE6c4UixLWUNjuw
	NzwvHUAo+in/+l7EWwGiMkCKyW0EltHSL+I7K7hIbE+u6Q4Nk2W7tzeNIBhoMsCYrG+T
	fKkdtUbMN8z6x4hnzCrpFduM3wZvObfW3AoHRN+foSX3rmHTTFZN/wb+TpCrocrZzYoP
	BffKffphOAUoqvML1CSbdR7KUBvXywCcXsIQH0LHUIBbyeABvwsJF0GGPje0z7KqwZ0l
	TnfVYAYOT7tIXAHqZ9a4l664rVExlzPSzrkLayw6nnVLpG3s65ke73RKqFixOVQOz24R
	RDYQ==
MIME-Version: 1.0
Received: by 10.204.152.152 with SMTP id g24mr8713675bkw.104.1343079967219;
	Mon, 23 Jul 2012 14:46:07 -0700 (PDT)
Received: by 10.204.102.14 with HTTP; Mon, 23 Jul 2012 14:46:07 -0700 (PDT)
In-Reply-To: <CAAu8pHvCJKqnb5t8GiDDRmkOS9zB5Q+b1yeAACYmc9phtioB=Q@mail.gmail.com>
References: <1342818289-31860-1-git-send-email-sw@weilnetz.de>
	<CAAu8pHvCJKqnb5t8GiDDRmkOS9zB5Q+b1yeAACYmc9phtioB=Q@mail.gmail.com>
Date: Mon, 23 Jul 2012 22:46:07 +0100
Message-ID: <CAFEAcA8R5bbFaEAiBAAeSdsRhAeQXHPK-fQZXgDqeO1dhn5aQg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Blue Swirl <blauwirbel@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkt0x+CrjPGTKls4cbl1lYH87LgEKkxtLfpY3L6yVsdIDZ4JKSxAL1R+9HQ6B1xlc/X7J+r
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qdev: Fix Open Firmware
	comment
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
X-List-Received-Date: Mon, 23 Jul 2012 21:46:11 -0000

On 23 July 2012 19:49, Blue Swirl <blauwirbel@gmail.com> wrote:
> On Fri, Jul 20, 2012 at 9:04 PM, Stefan Weil <sw@weilnetz.de> wrote:
>> +    /*
>> +     * This callback is used to create Open Firmware device path in accordance
>> +     * with OF spec http://forthworks.com/standards/of1275.pdf. Individual bus
>> +     * bindings can be found at http://playground.sun.com/1275/bindings/.
>> +     */
>
> The links are dead. Since you are improving the text, maybe you could
> find archived versions.

Hard to tell not knowing what the original links were, but maybe
for bus bindings:
  http://www.openfirmware.org/ofwg/home.html#OFDbussupps

I suspect that finding a publicly downloadable copy of IEEE1275 is
going to be tricky given it's a commercially published standards doc.

-- PMM

