Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYZoU-0008On-GS
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jul 2017 11:25:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYZoR-0008Lc-EQ
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 11:25:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYZoQ-0000UG-Ei
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 11:25:55 -0400
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:38049)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dYZoQ-0000Tj-7u
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 11:25:54 -0400
Received: by mail-wm0-x22e.google.com with SMTP id w191so17008575wmw.1
	for <qemu-trivial@nongnu.org>; Fri, 21 Jul 2017 08:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oKPAazJWgDB+VkUIyimb398Msiu1Zza1LC2gTmPvFRw=;
	b=WAoeUiEbUa9jh0wVCep7xFqI0zedY32xsFQFT0rcxmyWSriqROCbEqwDW+QzXFWrgJ
	w3rZp99Mj8HCumR8fw90bW+1JJZSW6imX+FO01JrN0BH1epoVhN6omg25VPIcvmd/H02
	256mtcxIiyiypH+PhJVbc9Sp1ojtvByU93wGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oKPAazJWgDB+VkUIyimb398Msiu1Zza1LC2gTmPvFRw=;
	b=ndpjx5rLHZA3iVlcYTChmPIJtNmoty0KXEpICs+t+bdmkaZBHlnXJ5WMGLDD5yXD8J
	sBUhrPOvR6GOZLcdVzwhVpy6IHM/QklDUM72uLse2/pjEgwVpwZ/UgbRR/prjdlKe5Xk
	kqx8VbHN6JoMFgLZajdEagqaEyalXifFMh8MVV7xWUSGZ4jZ9Rca6DQSX650hwstDpTc
	7zI5F9Nml2ymR5rXuTTxdubqGb5mrSA+QJOdbmWPHAu/qd5uTbFh7LdsRazvaOO4QeYG
	6vBhz4va5txFvZQ5+uJvrNQv3sCkegNv96Br0jxiDiu0GmKbxG0lz74l2IHfy1G4ezH+
	LEWw==
X-Gm-Message-State: AIVw111OUUcIf4/j73ydQVdvOgq5bamD2MYxxwTgIm29xOy6bKF/iqZD
	3du+m1rvgygZ6p482ZLN1L7v275w/ZMH
X-Received: by 10.28.198.206 with SMTP id w197mr4913049wmf.86.1500650753312;
	Fri, 21 Jul 2017 08:25:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Fri, 21 Jul 2017 08:25:32 -0700 (PDT)
In-Reply-To: <dabe4865-05a0-eb85-f9db-8948db3e14bf@redhat.com>
References: <1500395194-21455-1-git-send-email-peter.maydell@linaro.org>
	<1500395194-21455-5-git-send-email-peter.maydell@linaro.org>
	<b27c6322-49f7-3f73-6df3-e8f4ddae9652@redhat.com>
	<CAFEAcA9vTrpRL-cihQ-DtDj2TYAbNtzLf8b-WTAx+4Mz5xoKiA@mail.gmail.com>
	<dabe4865-05a0-eb85-f9db-8948db3e14bf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jul 2017 16:25:32 +0100
Message-ID: <CAFEAcA_T1CNZY+rnryt_r-kaffk838Q4jZOw9GogfQB7t-jFtA@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10 4/4]
 bsd-user/main.c: Fix unused variable warning
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
X-List-Received-Date: Fri, 21 Jul 2017 15:25:56 -0000

On 21 July 2017 at 13:23, Eric Blake <eblake@redhat.com> wrote:
> On 07/19/2017 03:19 AM, Peter Maydell wrote:
>> On 18 July 2017 at 23:01, Eric Blake <eblake@redhat.com> wrote:
>>> On 07/18/2017 11:26 AM, Peter Maydell wrote:
>>>> On OpenBSD the compiler warns:
>>>> bsd-user/main.c:622:21: warning: variable 'sig' set but not used [-Wunused-but-set-variable]
>>>>
>>>> This is because a lot of the signal delivery code is #if-0'd
>>>> out as unused. Reshuffle #ifdefs a bit to silence the warning.
>>>
>>> Why not just nuke the #if 0 code instead (we can always 'git revert' it
>>> later as a starting point for someone that wants to implement it).
>>
>> I went for the minimal change, especially given we know
>> that the freebsd folks have a big patchset on top of
>> us fixing a lot of bsd-user code and it didn't seem worth
>> giving them a more awkward rebase task.
>
> Perhaps worth mentioning in the commit message that keeping the #if 0 is
> intentional, then. At any rate,
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks; applied to master with an updated commit message.


-- PMM

