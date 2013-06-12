Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmrsR-0005G1-3I
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 16:42:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UmrsO-0005DU-0Z
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 16:42:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UmrsM-00038k-1F
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 16:42:39 -0400
Received: from mail-la0-x236.google.com ([2a00:1450:4010:c03::236]:60604)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UmrsL-00038B-Ql
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 16:42:37 -0400
Received: by mail-la0-f54.google.com with SMTP id ec20so8362903lab.13
	for <qemu-trivial@nongnu.org>; Wed, 12 Jun 2013 13:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=DNo3fNONYS3yzLxAXG0DmfnfJsnUOH/uYwICHJX51lc=;
	b=RfxS4aOWwTFStHGSXbXn0rWq2khtjYojqnI4NgYGm4/Ryw88uuPYCH+315wuC8Cy6Q
	5NGo52ITD8rrFyF1GcTMNHNJG8Lsi9nPPSN/02dVTQLNlBHQNeeHYVOobSJlIMxUkk5k
	ZgOILkj279Ky4c6DOjuFvt0pvkDBZxUSt9C2OJRa/rGwf6wLmzvD3zaT4v07sEh1zVGv
	gSfa7ef8w+YQDIT6iq0EfO3eXMeFZLgPljqRHRF11k7K9L1UA3saFp8kxlc8pwbmwKml
	5z3v8csQuUqR+icbCrvqQiSOgBzpe8U/Xf+VEEJgIc3g+asctWE2gB8k/fkHwrWQfS2G
	+L+Q==
X-Received: by 10.152.42.236 with SMTP id r12mr10480307lal.46.1371069755483;
	Wed, 12 Jun 2013 13:42:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.138.200 with HTTP; Wed, 12 Jun 2013 13:42:14 -0700 (PDT)
In-Reply-To: <20130612201151.GF12585@vm>
References: <1369175577-18130-1-git-send-email-mdroth@linux.vnet.ibm.com>
	<20130612201151.GF12585@vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Jun 2013 21:42:14 +0100
Message-ID: <CAFEAcA8f_yjeHvfwucVXrLm-c+7byg_EK80mYqMLE=3Y0RZzcw@mail.gmail.com>
To: mdroth <mdroth@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnNG9/1v7kKIUMKHT4SOnYVoPGsXns4dhwntp6RgO7SMoRK0TV/tp0yWVy4u2TNv/+11HiA
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::236
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-stable@nongnu.org,
	nick@bytemark.co.uk
Subject: Re: [Qemu-trivial] [PATCH] wdt_i6300esb: fix vmstate versioning
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
X-List-Received-Date: Wed, 12 Jun 2013 20:42:41 -0000

On 12 June 2013 21:11, mdroth <mdroth@linux.vnet.ibm.com> wrote:
> On Tue, May 21, 2013 at 05:32:57PM -0500, Michael Roth wrote:
>> When this VMSD was introduced it's version fields were set to
>> sizeof(I6300State), making them essentially random from build to build,
>> version to version.
>>
>> To fix this, we lock in a high version id and low minimum version id to
>> support old->new migration from all prior versions of this device's
>> state. This should work since the device state has not changed since
>> its introduction.
>>
>> The potentially breaks migration from 1.5+ to 1.5, but since the
>> versioning was essentially random prior to this patch, new->old
>> migration was not consistently functional to begin with.
>>
>> Reported-by: Nicholas Thomas <nick@bytemark.co.uk>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> Cc: qemu-stable@nongnu.org
>> Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
>
> CC'ing qemu-trivial. Looking to get this in for 1.5.1

This is a good patch but it definitely doesn't seem like
-trivial material to me. -trivial isn't "way to get patches
in that would otherwise fall through the cracks" :-)

thanks
-- PMM

