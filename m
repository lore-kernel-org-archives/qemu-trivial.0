Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XOlSA-0000cb-3d
	for mharc-qemu-trivial@gnu.org; Tue, 02 Sep 2014 06:36:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1XOlS0-0000P7-SQ
	for qemu-trivial@nongnu.org; Tue, 02 Sep 2014 06:36:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1XOlRu-000201-W4
	for qemu-trivial@nongnu.org; Tue, 02 Sep 2014 06:36:36 -0400
Received: from goliath.siemens.de ([192.35.17.28]:51600)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1XOlRi-0001wK-KW; Tue, 02 Sep 2014 06:36:19 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.14.3/8.14.3) with ESMTP id s82AaDva008353;
	Tue, 2 Sep 2014 12:36:13 +0200
Received: from mchn199C.mchp.siemens.de (mchn199C.mchp.siemens.de
	[139.25.246.13] (may be forged))
	by mail1.siemens.de (8.14.3/8.14.3) with ESMTP id s82AaCCp020034;
	Tue, 2 Sep 2014 12:36:12 +0200
Message-ID: <54059D9C.2010603@siemens.com>
Date: Tue, 02 Sep 2014 12:36:12 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <1402933670-3324-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA8q9MAGxD+RE_fC0z4s5Cy6n43ZHmP6Jmq3_Zih-nUecg@mail.gmail.com>
	<CAFEAcA9b3urqia2Ss+1N66L5wSuCvKexcTnq4bTCEUJeEb7x4w@mail.gmail.com>
	<CAFEAcA_j6=Vpq50NHggJPTtDuFB1J3U=NWvQnfxX7k6aXwrCvA@mail.gmail.com>
In-Reply-To: <CAFEAcA_j6=Vpq50NHggJPTtDuFB1J3U=NWvQnfxX7k6aXwrCvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 192.35.17.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Patch Tracking <patches@linaro.org>
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
X-List-Received-Date: Tue, 02 Sep 2014 10:36:43 -0000

On 2014-09-02 12:33, Peter Maydell wrote:
> On 8 July 2014 12:40, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 26 June 2014 13:35, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 16 June 2014 16:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> The hostfwd_add and hostfwd_remove monitor commands allow the user
>>>> to optionally specify a vlan/stack tuple. hostfwd_add honours this,
>>>> but hostfwd_remove does not (it looks up the tuple but then ignores
>>>> the SlirpState it has looked up and always uses the first stack
>>>> in the list anyway). Correct this to honour what the user requested.
>>>>
>>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>>> ---
>>>>  net/slirp.c | 3 +--
>>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>>
>>>> diff --git a/net/slirp.c b/net/slirp.c
>>>> index 647039e..c171119 100644
>>>> --- a/net/slirp.c
>>>> +++ b/net/slirp.c
>>>> @@ -345,8 +345,7 @@ void net_slirp_hostfwd_remove(Monitor *mon, const QDict *qdict)
>>>>
>>>>      host_port = atoi(p);
>>>>
>>>> -    err = slirp_remove_hostfwd(QTAILQ_FIRST(&slirp_stacks)->slirp, is_udp,
>>>> -                               host_addr, host_port);
>>>> +    err = slirp_remove_hostfwd(s->slirp, is_udp, host_addr, host_port);
>>>>
>>>>      monitor_printf(mon, "host forwarding rule for %s %s\n", src_str,
>>>>                     err ? "not found" : "removed");
>>>> --
>>>> 1.9.2
>>>
>>> Ping! (and cc trivial).
>>
>> Ping^2.
> 
> Ping^3 :-(

Sorry, you will probably need someone else for these topics. I've
difficulties scheduling these into my todo list. :(

Jan

-- 
Siemens AG, Corporate Technology, CT RTC ITP SES-DE
Corporate Competence Center Embedded Linux

