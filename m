Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X4XpW-00047R-E4
	for mharc-qemu-trivial@gnu.org; Tue, 08 Jul 2014 12:01:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X4Tks-000601-B2
	for qemu-trivial@nongnu.org; Tue, 08 Jul 2014 07:40:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X4Tkn-0003ES-J2
	for qemu-trivial@nongnu.org; Tue, 08 Jul 2014 07:40:14 -0400
Received: from mail-la0-f49.google.com ([209.85.215.49]:36857)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X4Tkn-0003EH-Cf
	for qemu-trivial@nongnu.org; Tue, 08 Jul 2014 07:40:09 -0400
Received: by mail-la0-f49.google.com with SMTP id gf5so3798692lab.22
	for <qemu-trivial@nongnu.org>; Tue, 08 Jul 2014 04:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=l5vM6w6VbK9NL7XXyghsEMokCx0bxyniFs2J8Nk/luE=;
	b=Blo6kCyZQ+deDZu9sX4Rb5SD5yfsa0Efznj7uh24nt7C3T27LDb/Ifhyxyo6tnxW4p
	iCMtDA8+1uV8o+JqiafgByzQpb1fJ0evCM2aoZHrr8NH6Ykp0LNCo4FoG1NhCqKcZz8m
	c6OYpnyk20TT3tSZnLn7kgLaY5rs1agBU+l1PoElJ5Ers3OTBnSgZKOVnFcky9vy3yOY
	bZJ8oyppfEJqTf3qFmcpHDiKCXivR1iC4R/EAFsZudMXnWqE9Am0gDXkQELWfWBT+QUU
	njZ47S+asyT/9dYi+gSuq6wx3xNpE6B/EoI0Sv3KGnrnrGEk3bCG+KRIfjAZ9dcXAiEP
	bzRQ==
X-Gm-Message-State: ALoCoQnTMNOriy9vVmJcMMIj3AYOGnXVPR+7xLKSnQde81vcsSPoxZQhnaK7ySwJmIA0t8JUR28N
X-Received: by 10.112.202.39 with SMTP id kf7mr26284666lbc.37.1404819608407;
	Tue, 08 Jul 2014 04:40:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Tue, 8 Jul 2014 04:39:48 -0700 (PDT)
In-Reply-To: <CAFEAcA9SAZF7kg9wJz9iQKPyML_7hA0kCm5ghjr5O+373srnzA@mail.gmail.com>
References: <1402933631-3276-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA9SAZF7kg9wJz9iQKPyML_7hA0kCm5ghjr5O+373srnzA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jul 2014 12:39:48 +0100
Message-ID: <CAFEAcA-1r0DkyT8+VuSSTRrkKX5GGQb32VzZ42KqS_-TW+0GYw@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.49
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@siemens.com>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: Give error message
 if hostfwd_add/remove for unrecognized vlan/stack
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
X-List-Received-Date: Tue, 08 Jul 2014 16:01:17 -0000

On 26 June 2014 13:35, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 16 June 2014 16:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>> If the user specified a (vlan ID, slirp stack name) tuple in a monitor
>> hostfwd_add/remove command and we can't find it, give the user an
>> error message rather than silently doing nothing.
>>
>> This brings this error case in slirp_lookup() into line with the
>> other two.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  net/slirp.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/net/slirp.c b/net/slirp.c
>> index 8fddc03..647039e 100644
>> --- a/net/slirp.c
>> +++ b/net/slirp.c
>> @@ -282,6 +282,7 @@ static SlirpState *slirp_lookup(Monitor *mon, const char *vlan,
>>          NetClientState *nc;
>>          nc = net_hub_find_client_by_name(strtol(vlan, NULL, 0), stack);
>>          if (!nc) {
>> +            monitor_printf(mon, "unrecognized (vlan-id, stackname) pair\n");
>>              return NULL;
>>          }
>>          if (strcmp(nc->model, "user")) {
>> --
>> 1.9.2
>
> Ping! (and cc trivial).

Ping again...

thanks
-- PMM

