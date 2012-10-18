Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TOqDn-0007Fw-Vt
	for mharc-qemu-trivial@gnu.org; Thu, 18 Oct 2012 09:33:11 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TOqDh-0006zd-Ty
	for qemu-trivial@nongnu.org; Thu, 18 Oct 2012 09:33:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TOqDa-0000v0-SJ
	for qemu-trivial@nongnu.org; Thu, 18 Oct 2012 09:33:05 -0400
Received: from mail-ia0-f173.google.com ([209.85.210.173]:36576)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TOqDa-0000tA-N2
	for qemu-trivial@nongnu.org; Thu, 18 Oct 2012 09:32:58 -0400
Received: by mail-ia0-f173.google.com with SMTP id m10so6258647iam.4
	for <qemu-trivial@nongnu.org>; Thu, 18 Oct 2012 06:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=Zf/P4zPfZIb3uIUyGbPD9PyWugaMDlJr1I1gUKnTEiw=;
	b=WWJhgBIKiqNBT/pi1+MXm53oBNePJUqUGcbi9rb4nSK3VtC5c6Df4yYJOKwibsHEf1
	UzHZ6FYkud66fDYeibjV4r0ZXXVgDzh4mv6HF3z9Dc4sRb2EaKeckMN82mZOEh0DQMXP
	DB4MI/36l5Swj/iLTEacSvoMOhsspV773m8iPUGEy4AhEpeeUkDzSXQhAqUzV4X+XP5G
	PxXiiQrMtbg2O6qlUwYLfzHjTKQa08msGiyj3L8SwhM72kkL86Z0/wAk6QSU57HI5mhe
	xunaQG7reGBKW9zA4PsuJdIn/EP9IHyMPWHE1Ngx6T+x383lIN1I35WAcLs+4LGH98kt
	87kA==
MIME-Version: 1.0
Received: by 10.50.187.194 with SMTP id fu2mr4810196igc.63.1350567177223; Thu,
	18 Oct 2012 06:32:57 -0700 (PDT)
Received: by 10.50.87.105 with HTTP; Thu, 18 Oct 2012 06:32:57 -0700 (PDT)
In-Reply-To: <507FDD38.2010009@redhat.com>
References: <1350220128-10140-1-git-send-email-thardeck@suse.de>
	<1350220128-10140-3-git-send-email-thardeck@suse.de>
	<507EC7FF.90603@suse.de> <1359569.y3MYGdvym5@thinktank.site>
	<507FDD38.2010009@redhat.com>
Date: Thu, 18 Oct 2012 14:32:57 +0100
Message-ID: <CAFEAcA86T1im3PMeFJCjGpQeso9oEO9LpWJ1avy=N+sm6977FQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQmkVYqasXj+w7VIoQTZ0B23UtfbDM2qYrizCSyMnHd17aZSHebZ0L3jKIiCdYW43WBYlPDB
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Tim Hardeck <thardeck@suse.de>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] qemu queue: fix
	uninitialized removals
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
X-List-Received-Date: Thu, 18 Oct 2012 13:33:10 -0000

On 18 October 2012 11:43, Kevin Wolf <kwolf@redhat.com> wrote:
> Am 17.10.2012 23:24, schrieb Tim Hardeck:
>> On Wednesday 17 October 2012 17:00:15 Andreas F=C3=A4rber wrote:
>>> Am 14.10.2012 15:08, schrieb Tim Hardeck:
>>>> When calling QTAILQ_REMOVE or QLIST_REMOVE on an unitialized list
>>>> QEMU segfaults.
>>>
>>> Can this be reproduced by a user today? Or is this just fixing the case
>>> that a developer forgot to initialize a list?
>> I am not sure but in this case it happened during an early VNC connectio=
n
>> state failure which most likely wouldn't happen to regular users.
>> I triggered it while working on the VNC connection part.
>>
>> The issue could most likely be also fixed in the VNC connection initiali=
zation
>> process but if this changes doesn't have a relevant performance impact t=
hey
>> might prevent some other/future crashes.
>
> At the same time, it could be hiding real bugs, where ignoring the
> QLIST_REMOVE() isn't the right fix. I can see your point, but I would be
> careful with making interfaces less strict.

I agree this patch doesn't seem like the right fix. All lists should
be initialised (either via the _INIT macro or statically using the
_HEAD_INITIALIZER macros) before use. If we ever try to do one of
the other operations on an uninitialised list that's a bug which
needs to be tracked down and fixed.

-- PMM

