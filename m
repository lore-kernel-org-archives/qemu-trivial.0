Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X51kp-0006Ej-6p
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jul 2014 19:58:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X4TlD-00065U-8C
	for qemu-trivial@nongnu.org; Tue, 08 Jul 2014 07:40:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X4Tl8-0003KC-3n
	for qemu-trivial@nongnu.org; Tue, 08 Jul 2014 07:40:34 -0400
Received: from mail-lb0-f177.google.com ([209.85.217.177]:36749)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X4Tl7-0003Jh-Fn
	for qemu-trivial@nongnu.org; Tue, 08 Jul 2014 07:40:29 -0400
Received: by mail-lb0-f177.google.com with SMTP id u10so3789269lbd.22
	for <qemu-trivial@nongnu.org>; Tue, 08 Jul 2014 04:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ztshl4T2HsODLqOL5ylS6fm2mVkzRprP/tYZbkGHDKQ=;
	b=aa4QpasuFmNV/AQDO/43Ny4+3hDitWfxZFEdyCLr0+e45TyEjvKGrLLbNbNjr7D+Y4
	GTYpLsY8gciDnJ1kp43AmgglpAcz6qDm4lw9JAYfeuQSvTBYyqc5mlfMjxPzHwjqS/w6
	4gWNBw+h7fWCuGa4JSYDWV2PMizETv9gewmLUIdKlgd+Ed1mgoMEhihn6ewUAIQ019Ab
	Usp5fEJJfCRqA7lvTLkskjYHF/cqcAn2Oio2rL1/KqBonrUjgKfDzqzwkqrrUmkwKOz8
	Ig0SvzCHiOiAH9RJJGMREY4gvz0T3jhhbptFIOqMOWz94LZoKvqvWgE/w0rUNuh9GsMi
	kXjg==
X-Gm-Message-State: ALoCoQkitiJYSruWlMwQCu8N6nuB1YrpCiuoxGcZLLMAlbfwKq0Fx6gV3ojAHoimBE4s9TU/1hWg
X-Received: by 10.112.41.72 with SMTP id d8mr1723253lbl.63.1404819628574; Tue,
	08 Jul 2014 04:40:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Tue, 8 Jul 2014 04:40:08 -0700 (PDT)
In-Reply-To: <CAFEAcA8q9MAGxD+RE_fC0z4s5Cy6n43ZHmP6Jmq3_Zih-nUecg@mail.gmail.com>
References: <1402933670-3324-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA8q9MAGxD+RE_fC0z4s5Cy6n43ZHmP6Jmq3_Zih-nUecg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jul 2014 12:40:08 +0100
Message-ID: <CAFEAcA9b3urqia2Ss+1N66L5wSuCvKexcTnq4bTCEUJeEb7x4w@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.177
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
X-List-Received-Date: Wed, 09 Jul 2014 23:58:24 -0000

On 26 June 2014 13:35, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 16 June 2014 16:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>> The hostfwd_add and hostfwd_remove monitor commands allow the user
>> to optionally specify a vlan/stack tuple. hostfwd_add honours this,
>> but hostfwd_remove does not (it looks up the tuple but then ignores
>> the SlirpState it has looked up and always uses the first stack
>> in the list anyway). Correct this to honour what the user requested.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  net/slirp.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/net/slirp.c b/net/slirp.c
>> index 647039e..c171119 100644
>> --- a/net/slirp.c
>> +++ b/net/slirp.c
>> @@ -345,8 +345,7 @@ void net_slirp_hostfwd_remove(Monitor *mon, const QDict *qdict)
>>
>>      host_port = atoi(p);
>>
>> -    err = slirp_remove_hostfwd(QTAILQ_FIRST(&slirp_stacks)->slirp, is_udp,
>> -                               host_addr, host_port);
>> +    err = slirp_remove_hostfwd(s->slirp, is_udp, host_addr, host_port);
>>
>>      monitor_printf(mon, "host forwarding rule for %s %s\n", src_str,
>>                     err ? "not found" : "removed");
>> --
>> 1.9.2
>
> Ping! (and cc trivial).

Ping^2.

thanks
-- PMM

