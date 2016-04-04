Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1anBez-0004Wf-Rd
	for mharc-qemu-trivial@gnu.org; Mon, 04 Apr 2016 17:03:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anBex-0004W4-HU
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 17:03:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anBew-0002KH-ET
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 17:03:43 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:36591)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anBew-0002KB-A8
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 17:03:42 -0400
Received: by mail-vk0-x236.google.com with SMTP id c4so71424596vkb.3
	for <qemu-trivial@nongnu.org>; Mon, 04 Apr 2016 14:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eHAZ02sqhyOsAlNTCKFS6oC0GNnk4+7wMA1Sjy9X7Kg=;
	b=Aid0j+qHr0va1rP9PiDzBSqC+Cl/idx2H0m9nvz6EkIw5XO4W+SDKra8pj0XWGLSOE
	oRW/bubaDNDcOaOuAnCQoAtS2IoU19finmDNqMF9rTiGkz8coeTfevznMmPisD7DNvJV
	WimweTDnDJcmOZYlovg9CuV+tVpa991Fa+SRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eHAZ02sqhyOsAlNTCKFS6oC0GNnk4+7wMA1Sjy9X7Kg=;
	b=blw9F2bUUWl4K3ptCp0jeErLgElrSNwk+qgID7vRIaPgpcYJg0SHjjaasxIpg4YIcf
	EPKMujzI+11HENI/5Im3YBsvwyyoxSR+rP4Ztzsvn4Gkdwts9Uy8prynNZ2dVH4vDYUh
	vEN+TnJ9QfqpQWHVM40S5DDIbiATth9SFy5QWLIgmo9iuNF/P2uXIz6sG2rnbQMAz7QB
	v5IidmYbDrIOY+3oGnrFs04rDtB6gYp8vam7SEL3ko5UBaLY44vX+HrCI3Dskp2ycmKm
	rkBTldQZQMmkjirZTDekj65/zHNIkACWIHcMAuE+gHCm6Iu2EXR4shDaZ2ijrlov4zLR
	vKsw==
X-Gm-Message-State: AD7BkJI6KPbC1VhlwK/iwjo2yX5QpElL9VLuKaRimJok1OW0yfdBzXSBdW531KmfQ1CH4Xej0iPObfQMyFwh+nBU
X-Received: by 10.159.35.109 with SMTP id 100mr6103590uae.119.1459803821645;
	Mon, 04 Apr 2016 14:03:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 4 Apr 2016 14:03:22 -0700 (PDT)
In-Reply-To: <5702D146.6020404@weilnetz.de>
References: <1459792209-25270-1-git-send-email-sw@weilnetz.de>
	<5702AD10.8040807@gmail.com> <5702D146.6020404@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Apr 2016 22:03:22 +0100
Message-ID: <CAFEAcA9vQ+5WeSsCfc844Y3QG_MOdi_1hmLM-5i6UnyPX5rtoQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Sergey Fedorov <serge.fdrv@gmail.com>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] tci: Fix build regression
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
X-List-Received-Date: Mon, 04 Apr 2016 21:03:44 -0000

On 4 April 2016 at 21:40, Stefan Weil <sw@weilnetz.de> wrote:
> Am 04.04.2016 um 20:06 schrieb Sergey Fedorov:
>> On 04/04/16 20:50, Stefan Weil wrote:
>>> -/* Defining NDEBUG disables assertions (which makes the code faster). */
>>> -#if !defined(CONFIG_DEBUG_TCG) && !defined(NDEBUG)
>>> -# define NDEBUG
>>> +/* Enable TCI assertions only when debugging TCG (and without NDEBUG defined).
>>> + * Without assertions, the interpreter runs much faster. */
>>> +#if defined(CONFIG_DEBUG_TCG)
>>> +# define tci_assert(cond) assert(cond)
>>> +#else
>>> +# define tci_assert(cond) (void)0
>>
>> Maybe wrap the "(void)0" into parentheses?

> Maybe. It's not needed for the current code.
> Are there situations where parentheses for this would make a difference?

Not sure, but the POSIX standard specifies brackets for its
NDEBUG version of assert:
http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/assert.h.html

so it seems safest to follow suit.

thanks
-- PMM

