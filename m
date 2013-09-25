Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VOrNn-00085r-50
	for mharc-qemu-trivial@gnu.org; Wed, 25 Sep 2013 11:52:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VOrNh-00081v-Gt
	for qemu-trivial@nongnu.org; Wed, 25 Sep 2013 11:52:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VOrNZ-0006Pn-Um
	for qemu-trivial@nongnu.org; Wed, 25 Sep 2013 11:52:01 -0400
Received: from mail-lb0-f175.google.com ([209.85.217.175]:50227)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VOrNZ-0006Pc-NU
	for qemu-trivial@nongnu.org; Wed, 25 Sep 2013 11:51:53 -0400
Received: by mail-lb0-f175.google.com with SMTP id y6so16192lbh.34
	for <qemu-trivial@nongnu.org>; Wed, 25 Sep 2013 08:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5FnOC/JSNCJoXW+k+tT+qk56qKZwYvAE7D5sFoGpuAk=;
	b=VlvJh47rgaMriDRvZcaKutObRc1XpFIlCWprKdmhPZUokYrv8FsiRHjeDNj4+9HvKW
	w0BBg4/+BOrer5payUfLqSy5vhmpMM8kCVcCz9aulfC8WAzj6uSxsU8hwjOt4ij9vr/J
	HkAHghcpXoSGXju2HS/Fak0Kmwh/neIX1TjcDkqZTK3p2+DeKGn8WTXMl9Xvec+KmjvJ
	9k1lFHNkVuS6QssXH7ukOwVe0sl2Sp/pPcizW0l7UGJQQKXQk8rJEGf5qvm8uFJEZkNZ
	c74m5ii1Yg0W5SLLyf0l1vlEJqXx6tX1zAA94owfr1w0Fnsc1rmY+3nOrm0CfPyJAI/Q
	PuCA==
X-Gm-Message-State: ALoCoQnNl0gdLSoqfqQj02vVYFdGvxxx3t12YSvU2u4EBodyNA4NzXJkQ5QNeDv5pUIEWzM6apuv
X-Received: by 10.112.40.110 with SMTP id w14mr10368lbk.42.1380124312406; Wed,
	25 Sep 2013 08:51:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Wed, 25 Sep 2013 08:51:32 -0700 (PDT)
In-Reply-To: <5243035D.4080200@adacore.com>
References: <1380041161-13266-1-git-send-email-chouteau@adacore.com>
	<1380041161-13266-4-git-send-email-chouteau@adacore.com>
	<CAFEAcA9A1JD7hPqZ5Y5d4UDFSa4DqJZOz_yTrjH92B7h8N-Lug@mail.gmail.com>
	<5243035D.4080200@adacore.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Sep 2013 00:51:32 +0900
Message-ID: <CAFEAcA-4hahHS57XM8Pb+SMdjNnJO9f45HRhWYtpx5Xg7dBLqQ@mail.gmail.com>
To: Fabien Chouteau <chouteau@adacore.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.175
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 3/3] Add ARM registers definitions in
	Monitor commands
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
X-List-Received-Date: Wed, 25 Sep 2013 15:52:06 -0000

On 26 September 2013 00:38, Fabien Chouteau <chouteau@adacore.com> wrote:
> On 09/25/2013 01:53 AM, Peter Maydell wrote:
>>
>> No, I really don't want to see another target #ifdef ladder, please.
>> Put a 'static const MonitorDef *monitor_defs;' into CPUClass,
>> and initialize it in each target's class init function, please.
>> (You'll need to move the appropriate sections of the current
>> static array in monitor.c plus the per-target functions that
>> it references into target-*/cpu.c.) Look at gdb_num_core_regs
>> as an example of where we made this kind of abstraction.
>>
>
> I tried already. Where whould you put the declaration of MonitorDef type?

It doesn't matter very much, but monitor.h seems the obvious
place. You probably don't want qom/cpu.h to have to drag in
monitor.h so a 'struct MonitorDef;' forward declaration in cpu.h
will let you avoid that (we do that already for a few other structs).

-- PMM

