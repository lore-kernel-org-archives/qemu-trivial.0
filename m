Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1blvfl-0004yv-4n
	for mharc-qemu-trivial@gnu.org; Mon, 19 Sep 2016 06:19:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1blvfi-0004yW-Lw
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 06:19:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1blvfg-00075R-Ki
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 06:19:33 -0400
Received: from mail-yw0-x236.google.com ([2607:f8b0:4002:c05::236]:34818)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1blvfg-000759-Fq
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 06:19:32 -0400
Received: by mail-yw0-x236.google.com with SMTP id u82so134673160ywc.2
	for <qemu-trivial@nongnu.org>; Mon, 19 Sep 2016 03:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G/WBdWZ9Q4Iw2CFRUCBYc1ZQyL2KpOqJPYUhHgK9kTM=;
	b=RRhdB8Fsota3tpsZaMXKqPXWqlpgaCChzSqqsFrxy2cDAdCHzSQUdHs0c2YLj6OW80
	fBVZTHOSUQ+HRfpa0kdASGpzNwOT48Z512oCKLRkkhihElUyZvGOM83uNDkTkWUgt3aO
	Dr5Btv4PzhyeQuZ7nu525nM7+sF2/Rm4ads0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G/WBdWZ9Q4Iw2CFRUCBYc1ZQyL2KpOqJPYUhHgK9kTM=;
	b=G6poeSU1gl+678U7dPm8Dk9PM3mKvdcXncfr7EfJSLy1aaBCXnfYC3h2ygxvUhjHim
	M7937ZSY8hloBkAps+DaDASloKB5nsSjH/6pA6ha+1Ye2vzxrr8zQuxhdMXNiZXBSBng
	KCF1D6yuW037ngAeb3LWGHkXu9ElY8qRHSAtmcS/Af44a849My4PXKXFLX2wM2ubvBYZ
	CpZ7FHpmrlm1e/uGTmtzEeqtatv9/5n/LjTMsnLh8F1UtZsH4Y2B2sDMKwDo13QnriuG
	yx4S2lIuF6QtsXae/8HEhjQBnJ0kpVlVLMvD5QpxWMWfBncZ58tmv4sEkRyuXYITVr4n
	Nnsg==
X-Gm-Message-State: AE9vXwM98ezt6oNBcbmEjs7GY3S45cgBBg0Nh/lIYru4qsAaNYKsaD6yzLEoNbZTU7dGyMr+A2yn963Sf49v1zm6
X-Received: by 10.13.231.3 with SMTP id q3mr25133082ywe.242.1474280371634;
	Mon, 19 Sep 2016 03:19:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Mon, 19 Sep 2016 03:19:10 -0700 (PDT)
In-Reply-To: <d664e3ae-0899-3509-2cce-bc868446d48f@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
	<CAFEAcA9kTe0geCwguRbRSn8ozhnfarz4eTd5+Ra5kTZeR-fJkA@mail.gmail.com>
	<20160916153951.GE9654@redhat.com>
	<CAFEAcA-syR4mDW9JRD6NcJkeQd0Ue9ymf3CKcF6W1Shi-1VZmA@mail.gmail.com>
	<d664e3ae-0899-3509-2cce-bc868446d48f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Sep 2016 11:19:10 +0100
Message-ID: <CAFEAcA-X5nG+-S6eJPX6iVPE30p8g2+k7q07dWL2cnjjRV0Bag@mail.gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::236
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
X-List-Received-Date: Mon, 19 Sep 2016 10:19:35 -0000

On 19 September 2016 at 10:46, Laurent Vivier <lvivier@redhat.com> wrote:
> -----------------------------------------------------------------------
> Portability note: Some non-POSIX systems use different conventions for
> exit status values. For greater portability, you can use the macros
> EXIT_SUCCESS and EXIT_FAILURE for the conventional status value for
> success and failure, respectively. They are declared in the file stdlib.h.

The only non-POSIX system we support is mingw32, which also uses 0/1
for its exit codes.

The POSIX rationale for exit() also notes that EXIT_SUCCESS is
required to be 0.

Personally I think we should:
 * definitely fix the "exit(-1)" and other exit-with-negative-number
   bugs in the codebase
 * possibly add a checkpatch check for exit-with-negative-constant-arg

If we're going to do anything else then maybe we could change
the EXIT_SUCCESS/EXIT_FAILURE instances in the codebase, but
really I think there are more important inconsistencies to
address (like all the unconverted non-QOM devices).

thanks
-- PMM

