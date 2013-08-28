Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEjPt-00022D-70
	for mharc-qemu-trivial@gnu.org; Wed, 28 Aug 2013 13:20:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VEgq9-0003qF-RZ
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 10:35:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VEgq4-0006Hg-SD
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 10:35:21 -0400
Received: from mail-la0-f47.google.com ([209.85.215.47]:39416)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VEgq4-0006HO-LA
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 10:35:16 -0400
Received: by mail-la0-f47.google.com with SMTP id eo20so4765554lab.20
	for <qemu-trivial@nongnu.org>; Wed, 28 Aug 2013 07:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FmH+Nq4c/xUvxcXh3QMbOblfLnlyIXaWgdiY+2IoUMQ=;
	b=OUiLMlOh62RbIuoaaO7ihbgPAYo66W30L48/kT9K8rSN9Evx/n0R/u+EyoAqlwxBUb
	HtHwImEyEHmhQywbAE7iP3msqSVZtTwkP+c05bGy8b+wE9QpwEUBv/ORL6VCi6+WRcxw
	jze5h10F1yvp6obCRwYtF0Qkfj/dmQpyCPNNduhyZiaUx4Aqmmu0t9Umj0YdBQ+UjTw4
	ildyA5BZ7XfOtjO2lCeisdVLXbOqZgGhLsnwHvePFxrg6BFKa3vFdkHw+8F8c8/7SqF5
	6QKV3N+Qx7sVu+9YWMo6x5L/8WL2Wvx0hb0GtvkRyJ7KLCSbMa+9eQVF+ZQqhQ0Jiwy4
	itEw==
X-Gm-Message-State: ALoCoQlHq/8U37OgoahAufFqXpEibRskRXx3X9AyhdY52F7ns5FKmSlIX2wCf2WWBv+AGuQ7AxDx
X-Received: by 10.152.228.130 with SMTP id si2mr1991802lac.32.1377700515672;
	Wed, 28 Aug 2013 07:35:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.169.70 with HTTP; Wed, 28 Aug 2013 07:34:55 -0700 (PDT)
In-Reply-To: <521E09DF.20102@twiddle.net>
References: <1377664796-11698-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA8uJGphig_gzc2hrJCHejjq1qW-eq7NXScDHWVRRk7KeA@mail.gmail.com>
	<521E09DF.20102@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Aug 2013 15:34:55 +0100
Message-ID: <CAFEAcA8K-Wt56VUMdsast3ojE6G2hoyHH-dN4qFj6MjRuX8xcQ@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.47
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>, Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-arm: Report
	unimplemented opcodes (LOG_UNIMP)
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
X-List-Received-Date: Wed, 28 Aug 2013 17:20:24 -0000

On 28 August 2013 15:31, Richard Henderson <rth@twiddle.net> wrote:
> On 08/28/2013 01:15 AM, Peter Maydell wrote:
>> [*] not impossible, we already do something on the ppc
>> that's similar; however I'd really want to take the time to
>> figure out how to do endianness swapping "properly"
>> and what qemu does currently before messing with it.
>
> I've got a loose plan in my head for how to clean up handling of
> reverse-endian load/store instructions at both the translator and
> tcg backend levels.

Nice. Will it allow us to get rid of TARGET_WORDS_BIGENDIAN?

-- PMM

