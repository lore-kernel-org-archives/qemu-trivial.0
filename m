Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VOz5j-0004Ih-R7
	for mharc-qemu-trivial@gnu.org; Wed, 25 Sep 2013 20:05:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VOz5e-0004FM-4S
	for qemu-trivial@nongnu.org; Wed, 25 Sep 2013 20:05:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VOz5X-0007m5-6n
	for qemu-trivial@nongnu.org; Wed, 25 Sep 2013 20:05:54 -0400
Received: from mail-la0-f41.google.com ([209.85.215.41]:44295)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VOz5W-0007lr-V7
	for qemu-trivial@nongnu.org; Wed, 25 Sep 2013 20:05:47 -0400
Received: by mail-la0-f41.google.com with SMTP id ec20so341589lab.28
	for <qemu-trivial@nongnu.org>; Wed, 25 Sep 2013 17:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YnI7qwTFBW56y0vstEyzA9tykkBYAOxSwsOmvkYOxdc=;
	b=FQ1UgoVi/pTek8i3CuycbSbQ1Ku29nYgvQzIjsY7wGaC26Jt+8ZYkbIy4H+K/hS2/W
	pDjcwlEp41dsfOCM2/Rs6x5Z4ESnvDLhTH6pvXThFBE/VZ6H67kLtsUwKynfYyuAucq+
	eKIox80kGoAkYF9freNDoPTFBdGYoWLZR9SFB/JEg1bfdysHIx8NXrCSJ3qyXQ7vDv0M
	razZulr83b7PiPVN0k8BDjcliPWX5uOG0falU6E9sxixSQxMG6B5au3o7dbXONxWarQK
	dXk/kU3qijXbvZoqMiaTxM7ZKbevyBRuAHhJju/DjWfttY1tMuIuFXq2WLf49rje5olr
	PvWw==
X-Gm-Message-State: ALoCoQk8WnnpZsT3HXSPGFuhYkqEmsRrn0HbLfH3a4mypGMkLXn87ezWvC6Cio8AzNMR9YynjLs+
X-Received: by 10.112.128.166 with SMTP id np6mr1490433lbb.7.1380153945239;
	Wed, 25 Sep 2013 17:05:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Wed, 25 Sep 2013 17:05:25 -0700 (PDT)
In-Reply-To: <52430F79.6050202@adacore.com>
References: <1380041161-13266-1-git-send-email-chouteau@adacore.com>
	<1380041161-13266-4-git-send-email-chouteau@adacore.com>
	<CAFEAcA9A1JD7hPqZ5Y5d4UDFSa4DqJZOz_yTrjH92B7h8N-Lug@mail.gmail.com>
	<5243035D.4080200@adacore.com>
	<CAFEAcA-4hahHS57XM8Pb+SMdjNnJO9f45HRhWYtpx5Xg7dBLqQ@mail.gmail.com>
	<52430F79.6050202@adacore.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Sep 2013 09:05:25 +0900
Message-ID: <CAFEAcA8EfFnyvXyqUVcQNz3NR-sf9dgtEiiK92p4Be0nUbd_7g@mail.gmail.com>
To: Fabien Chouteau <chouteau@adacore.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.41
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
X-List-Received-Date: Thu, 26 Sep 2013 00:05:58 -0000

On 26 September 2013 01:29, Fabien Chouteau <chouteau@adacore.com> wrote:
> On 09/25/2013 05:51 PM, Peter Maydell wrote:
>> On 26 September 2013 00:38, Fabien Chouteau <chouteau@adacore.com> wrote:
>> It doesn't matter very much, but monitor.h seems the obvious
>> place. You probably don't want qom/cpu.h to have to drag in
>> monitor.h so a 'struct MonitorDef;' forward declaration in cpu.h
>> will let you avoid that (we do that already for a few other structs).
>
> I think that's what I did. I think the problem was to include
> 'monitor.h' in 'target-*/cpu.c'.

Why doesn't that work?

In any case, you just need to disentangle stuff so you can
get the right definitions and function prototypes available
to the target specific code. We could have a target-*/monitor.c
if that's an easier approach -- we already have a gdbstub.c,
for example.

-- PMM

