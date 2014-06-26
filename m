Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X08PM-0003uY-MP
	for mharc-qemu-trivial@gnu.org; Thu, 26 Jun 2014 08:04:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X08PE-0003qR-TK
	for qemu-trivial@nongnu.org; Thu, 26 Jun 2014 08:04:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X08P4-0008Me-Gv
	for qemu-trivial@nongnu.org; Thu, 26 Jun 2014 08:03:56 -0400
Received: from mail-la0-f54.google.com ([209.85.215.54]:62135)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X08P4-0008MO-AZ
	for qemu-trivial@nongnu.org; Thu, 26 Jun 2014 08:03:46 -0400
Received: by mail-la0-f54.google.com with SMTP id mc6so1753931lab.41
	for <qemu-trivial@nongnu.org>; Thu, 26 Jun 2014 05:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=j2wj8JbqALmoVtr8TCCobQc14J9VxSRDHzbSDbkFlpU=;
	b=B8pCnbvNAPNcNnhGrCOJ28/rp9L2ooWxRFOzYkK3zWRvLJ4aJ91ckXXbP/WAktTlH1
	XN0UKt86YCgs5Ja5bU6AROqJXNfYr3Wm2fShcgbP1Z0dPTMsGtcqk1s2OKxN0kZJdxwH
	e4mkl0yOZr8mb+AlFRsjC7qeJjMY+lCdfSWo8eCpOBBm4QSTC7NVFpud5oUFAZa9DI9m
	7ZgC64ySFN1SrLfJFX8ZitdlvkhVkuCbLdjs4V3WUhawgoFjSlY72NxSDHPMCauR1EBW
	vPM6KDlcMlbqno3Fl/Kd/4YZX3XmB8m8oQM8L7ZMtMvs8VFLfCav4RfaSylpiJ7ERLCz
	Jmkw==
X-Gm-Message-State: ALoCoQnsEk2mjxQw90Wtlzdu7fsKbSqXMTq2wci41zab8ashguyIfAxZsh8kIso5OVxYj5eVgf73
X-Received: by 10.112.129.202 with SMTP id ny10mr10557306lbb.14.1403784225247; 
	Thu, 26 Jun 2014 05:03:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Thu, 26 Jun 2014 05:03:25 -0700 (PDT)
In-Reply-To: <53AB1E8E.2030404@weilnetz.de>
References: <1403683241-20678-1-git-send-email-imammedo@redhat.com>
	<87vbrpe4qa.fsf@blackfin.pond.sub.org>
	<20140625135126.64cc15d8@nial.usersys.redhat.com>
	<53AB1E8E.2030404@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Jun 2014 13:03:25 +0100
Message-ID: <CAFEAcA_sJ8+Dztsovec=f3womgyTuGqwXz+pZ1jym89EU5R6vw@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.54
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-char: fix warning
	'res' may be used uninitialized
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
X-List-Received-Date: Thu, 26 Jun 2014 12:04:03 -0000

On 25 June 2014 20:10, Stefan Weil <sw@weilnetz.de> wrote:
> Am 25.06.2014 13:51, schrieb Igor Mammedov:
>> On Wed, 25 Jun 2014 11:08:29 +0200
>> Markus Armbruster <armbru@redhat.com> wrote:
>>
>>> Igor Mammedov <imammedo@redhat.com> writes:
>>>
>>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>>
>>> Broken in commit 9005b2a (author cc'ed).  Bites only when passed zero
>>> len, which seems unlikely.
>>>
>>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>>
>>
>> main motivation for the patch was to allow -Werror=all build pass.
>>
>
> As I sent an identical patch some minutes ago, I can add
>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>

Applied to master as a buildfix; thanks.

-- PMM

