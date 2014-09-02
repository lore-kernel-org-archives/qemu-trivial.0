Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XOlPi-0006J2-4x
	for mharc-qemu-trivial@gnu.org; Tue, 02 Sep 2014 06:34:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XOlPb-0006Af-P3
	for qemu-trivial@nongnu.org; Tue, 02 Sep 2014 06:34:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XOlPW-0000xe-O9
	for qemu-trivial@nongnu.org; Tue, 02 Sep 2014 06:34:07 -0400
Received: from mail-lb0-f172.google.com ([209.85.217.172]:64361)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XOlPW-0000xQ-Gb
	for qemu-trivial@nongnu.org; Tue, 02 Sep 2014 06:34:02 -0400
Received: by mail-lb0-f172.google.com with SMTP id 10so7396087lbg.3
	for <qemu-trivial@nongnu.org>; Tue, 02 Sep 2014 03:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=L9BVQq+Jp53U70Z50rQDFDt2MmWye47zk4G2Xn3fQTc=;
	b=AqDYwBINzvnMMi2pleUAkFHNKfnGp60fO3fW76ah3u5DujXhOHPtl4qKmP4mL7Dzc3
	JGLPCcALt1zjSIB3UVHurfbllgojXSCxIfU/O530bYpOx4sp0+eyDtnvglMgBOX6F8Ad
	TwsaSpyjW8pvv2FAnDuk5CGPmfX3OatvBeLuzuFRZtFJeka1WXtaZ5YOuJlGmP97iGvm
	QuAX2Wz7raT/rJCHY0j1ubeIrRGfYTS+6Fd5gP64PBhAMQCNE09yK0p5ZFeQ+zGw58YD
	diri/z6cqPnjeFWe33p8ZYWxBhWTvLpAKFE+h8I+SS+PN39Q51+ivSOpzZTTbQpDzzyg
	TDLA==
X-Gm-Message-State: ALoCoQm8uWyjVjdOtPziiYdmMmvH+hegPCtD8tETUpnF5NNzoJ8YzQvXSZ2GCsoN5PgsKboTRvFS
X-Received: by 10.112.50.52 with SMTP id z20mr2035918lbn.87.1409654041482;
	Tue, 02 Sep 2014 03:34:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Tue, 2 Sep 2014 03:33:41 -0700 (PDT)
In-Reply-To: <CAFEAcA9b3urqia2Ss+1N66L5wSuCvKexcTnq4bTCEUJeEb7x4w@mail.gmail.com>
References: <1402933670-3324-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA8q9MAGxD+RE_fC0z4s5Cy6n43ZHmP6Jmq3_Zih-nUecg@mail.gmail.com>
	<CAFEAcA9b3urqia2Ss+1N66L5wSuCvKexcTnq4bTCEUJeEb7x4w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Sep 2014 11:33:41 +0100
Message-ID: <CAFEAcA_j6=Vpq50NHggJPTtDuFB1J3U=NWvQnfxX7k6aXwrCvA@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.172
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@siemens.com>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: Honour vlan/stack in
	hostfwd_remove commands
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
X-List-Received-Date: Tue, 02 Sep 2014 10:34:12 -0000

On 8 July 2014 12:40, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 26 June 2014 13:35, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 16 June 2014 16:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> The hostfwd_add and hostfwd_remove monitor commands allow the user
>>> to optionally specify a vlan/stack tuple. hostfwd_add honours this,
>>> but hostfwd_remove does not (it looks up the tuple but then ignores
>>> the SlirpState it has looked up and always uses the first stack
>>> in the list anyway). Correct this to honour what the user requested.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>  net/slirp.c | 3 +--
>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/net/slirp.c b/net/slirp.c
>>> index 647039e..c171119 100644
>>> --- a/net/slirp.c
>>> +++ b/net/slirp.c
>>> @@ -345,8 +345,7 @@ void net_slirp_hostfwd_remove(Monitor *mon, const QDict *qdict)
>>>
>>>      host_port = atoi(p);
>>>
>>> -    err = slirp_remove_hostfwd(QTAILQ_FIRST(&slirp_stacks)->slirp, is_udp,
>>> -                               host_addr, host_port);
>>> +    err = slirp_remove_hostfwd(s->slirp, is_udp, host_addr, host_port);
>>>
>>>      monitor_printf(mon, "host forwarding rule for %s %s\n", src_str,
>>>                     err ? "not found" : "removed");
>>> --
>>> 1.9.2
>>
>> Ping! (and cc trivial).
>
> Ping^2.

Ping^3 :-(

-- PMM

