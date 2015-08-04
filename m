Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMdwD-0007m5-Vr
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 11:15:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZMdwA-0007kf-HR
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 11:15:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZMdw6-0008K7-IN
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 11:15:30 -0400
Received: from mail-vk0-f47.google.com ([209.85.213.47]:36277)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZMdw6-0008Jm-Dn
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 11:15:26 -0400
Received: by vkci6 with SMTP id i6so4818101vkc.3
	for <qemu-trivial@nongnu.org>; Tue, 04 Aug 2015 08:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=pP4XHaagR/I0QyvZmLACIhPJndsdC37Ryrs097chPkQ=;
	b=Xbx+j0cboOLXTKcesiTIizyhB52v5yEiuqZuxjLSmyJgxZzi+DdrA5Q3pG1/DR5Yek
	f2E5rT6KFPTxdE+tTixx1Gg8QM2xbzpQ1K6XGizrp6NPhSQcImNbNKu5KBTBxQ6aoNt1
	n/7fXNF8nEQtx2LoNKcFrb13sejBkNGDe4Fior+Ku0cOA+j/uEHYbl+r2OkMFrxzWjLC
	i+/88xHJL+bAiyNUGJK2j/2F7yrQYSZXKVmD9+z+Fpm0X+K5ms1XosIjoqiQ9KQMLipF
	TawyLCE3NAnb6FHi+RCsYTdwR+x8DUJd8G4ayakWTjX1WSV3nyEV+BrIYg9TB4t9Dm3T
	et0A==
X-Gm-Message-State: ALoCoQmKMkPncm3D2iUzSnmMwb+QbZiG4npdCore03vVHxceHyJEfoycZxJApCItPk2eJvfWLkUY
X-Received: by 10.52.167.105 with SMTP id zn9mr5659409vdb.83.1438701325997;
	Tue, 04 Aug 2015 08:15:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Tue, 4 Aug 2015 08:15:06 -0700 (PDT)
In-Reply-To: <87h9ofks0j.fsf@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-4-git-send-email-alex.bennee@linaro.org>
	<20150804121616.GA8192@aurel32.net> <87h9ofks0j.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Aug 2015 16:15:06 +0100
Message-ID: <CAFEAcA9o7TOHEr_Uojan-uYWhvBpniYzG9hxG6102CAg+uWiwg@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.47
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 03/11] qemu-log: correct
	help text for -d cpu
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
X-List-Received-Date: Tue, 04 Aug 2015 15:15:32 -0000

On 4 August 2015 at 16:11, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> Aurelien Jarno <aurelien@aurel32.net> writes:
>> On 2015-08-03 10:14, Alex Benn=C3=A9e wrote:
>> In practice this is not true for linked TB. Should we also disable TB
>> linking when this option is enabled?
>
> Good question. I suspect yes because if you've gone to level of wanting
> exec tracing you'll probably get confused by the chaining. Of course it
> will run a lot slower then.

Unless the bug you were trying to track down is caused by the exec
chaining, of course... But yes, I think we get more people wanting
chaining to be disableable.

Not sure we want to tie it to the 'cpu' debug option, though -- it
applies just as much to 'exec'.

-- PMM

