Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVese-0005DN-B4
	for mharc-qemu-trivial@gnu.org; Wed, 11 Mar 2015 07:32:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YVesb-00059c-Kr
	for qemu-trivial@nongnu.org; Wed, 11 Mar 2015 07:32:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YVesY-0001LX-EO
	for qemu-trivial@nongnu.org; Wed, 11 Mar 2015 07:32:49 -0400
Received: from mail-lb0-f180.google.com ([209.85.217.180]:41924)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YVesY-0001LL-7S
	for qemu-trivial@nongnu.org; Wed, 11 Mar 2015 07:32:46 -0400
Received: by lbvp9 with SMTP id p9so8101673lbv.8
	for <qemu-trivial@nongnu.org>; Wed, 11 Mar 2015 04:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=GvXxsOCZV9vJ4t1qpF7CNax3dsoLBHKhgqrUexaQ3IM=;
	b=FImtMAYlVFm1a1pAbTrrSBlXP6c7Rpi07UdQGAF/kzHYm8eXS9b7tzNxTn5dKFNm+Y
	7g5TqdSQTXYMKLLZChA5Xk5+RKryYTNVas4GNTgzSmVboWNtWlrHMjOVkPwdbnJ4m4nj
	ggnfIkR5V8RDJy20FNbFxduvgkFfKC0Wn12k6COoXfOY/iJkqklppPDEwpZ69dVhEtz4
	dOXA6SYXpIoHzgwC43qcomchBSrz7ZzlFYiW3q+itipem+UuWfZbC6HykW3H6ok14rcd
	8cum35s79lUIqZpVjS+Z9OGHE2VFYMJxXEUHsfQy1bZdVVSO9J18FyAHU4j6CarHU/x4
	33qw==
X-Gm-Message-State: ALoCoQkKPbMQKxaHJjv/ECzlMYEwaRSJBugwlbLnvEnJOIt918VwkqZqf2owRUYEcmUvOU/B/DBM
X-Received: by 10.152.5.170 with SMTP id t10mr34139816lat.43.1426073565406;
	Wed, 11 Mar 2015 04:32:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.145.193 with HTTP; Wed, 11 Mar 2015 04:32:25 -0700 (PDT)
In-Reply-To: <54DD97E3.8090905@twiddle.net>
References: <1423231328-15662-1-git-send-email-peter.maydell@linaro.org>
	<54DD97E3.8090905@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Mar 2015 11:32:25 +0000
Message-ID: <CAFEAcA_+ksXBxO_KM-3UodSv6__kzq6_qp_q8GbAZwyfvZpm6g@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.180
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] bitops.h: sextract64()
 return type should be int64_t, not uint64_t
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
X-List-Received-Date: Wed, 11 Mar 2015 11:32:50 -0000

On 13 February 2015 at 06:21, Richard Henderson <rth@twiddle.net> wrote:
> On 02/06/2015 06:02 AM, Peter Maydell wrote:
>> The documentation for sextract64() claims that the return type is
>> an int64_t, but the code itself disagrees. Fix the return type to
>> conform to the documentation and to bring it into line with
>> sextract32(), which returns int32_t.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> I quickly eyeballed all the callers and I don't think any of them
>> were relying on the unsignedness of the return type.
>> ---
>>  include/qemu/bitops.h | 2 +-
>
> Reviewed-by: Richard Henderson <rth@twiddle.net>
>
> Via trivial?

I guess I forgot to cc trivial there. I can just put it in the
ARM pullreq I'm doing anyway I suppose...

-- PMM

