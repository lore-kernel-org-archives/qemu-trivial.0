Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y8CTe-0001dS-Rl
	for mharc-qemu-trivial@gnu.org; Mon, 05 Jan 2015 13:34:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Y8CTc-0001dD-LW
	for qemu-trivial@nongnu.org; Mon, 05 Jan 2015 13:34:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Y8CTY-0004LR-Jb
	for qemu-trivial@nongnu.org; Mon, 05 Jan 2015 13:34:04 -0500
Received: from mail-la0-f52.google.com ([209.85.215.52]:34661)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Y8CTY-0004LL-Ca
	for qemu-trivial@nongnu.org; Mon, 05 Jan 2015 13:34:00 -0500
Received: by mail-la0-f52.google.com with SMTP id hs14so18517064lab.39
	for <qemu-trivial@nongnu.org>; Mon, 05 Jan 2015 10:33:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CJmYvvgLle92QHuhmwITzwfQglwhEWw0Wu569WlHngg=;
	b=NFohqHtJhQfWQ8CRLgONQt3k+TankVlTmndMqv2+OERyiP7RIBMal7yRqRrf/OcKCx
	oAnT77GKwMwB4J1jR+8Qe1hhEHx7mxm4SqNfNBMKvBWGKEZhlUpCVBebHDI+OqKBhibr
	JwJpMteV4vEmCvEvlmTTBRWf39f1TjrL80sk5ZIqcc1EMF+9ig1AvnfKWYQsDHrsPJTb
	yji6PYLC62FPOGz5b7BK4mgrT4zT3ZjlA2KY/JorRPh+TlBundV9KZzqgg/wW/6N1jRO
	BpSx2bbPrEmWDOFZs4wcW/VGOSP/8917ZktEkMSFXfZfL5WvKsJORPFPejoXP1UAR7tn
	/5mw==
X-Gm-Message-State: ALoCoQmEdPaEcuArbKMah2GyO776SovpZOs0tElBdArtA5u/21iU4PAmjE/RdNmk1CAS9cY9K0wQ
X-Received: by 10.152.197.5 with SMTP id iq5mr94046749lac.6.1420482839625;
	Mon, 05 Jan 2015 10:33:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.52.38 with HTTP; Mon, 5 Jan 2015 10:33:39 -0800 (PST)
In-Reply-To: <CAFEAcA9RHCGaGHk4zZWMa4BAWR0OV5sAxan3AjrR=G-NaiJ58g@mail.gmail.com>
References: <1418862393-10691-1-git-send-email-dmorrison@invlim.com>
	<CAFEAcA9RHCGaGHk4zZWMa4BAWR0OV5sAxan3AjrR=G-NaiJ58g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jan 2015 18:33:39 +0000
Message-ID: <CAFEAcA_=dRz_M1hzt=NcaXNUnHdri367WituK11pd+cV-7+31g@mail.gmail.com>
To: David Morrison <dmorrison@invlim.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.52
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Ethan Hunt <proljc@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-openrisc: bugfixes
 for debugging with GDB+Qemu on OpenRISC
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
X-List-Received-Date: Mon, 05 Jan 2015 18:34:05 -0000

On 5 January 2015 at 18:15, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 18 December 2014 at 00:26, David Morrison <dmorrison@invlim.com> wrote:
>> --- a/target-openrisc/cpu.h
>> +++ b/target-openrisc/cpu.h
>> @@ -20,6 +20,7 @@
>>  #ifndef CPU_OPENRISC_H
>>  #define CPU_OPENRISC_H
>>
>> +#define TARGET_HAS_ICE
>>  #define TARGET_LONG_BITS 32
>>  #define ELF_MACHINE    EM_OPENRISC
>
> This looks like a correct change

...actually, on second thought, we should do this the other way
round and just get rid of TARGET_HAS_ICE altogether. The only
two targets which don't define it are openrisc and unicore32,
and both of those actually do have the breakpoint handling code,
so failing to define it was just a bug. I'll cook up a patch...

-- PMM

