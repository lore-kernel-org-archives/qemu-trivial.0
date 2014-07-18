Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X80dC-0004kX-5d
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jul 2014 01:22:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X80d6-0004cx-7y
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 01:22:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X80d1-0006VZ-NQ
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 01:22:48 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38520)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1X80cs-0006Sa-HP; Fri, 18 Jul 2014 01:22:34 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6AAED437AD;
	Fri, 18 Jul 2014 09:22:24 +0400 (MSK)
Message-ID: <53C8AF0D.2060508@msgid.tls.msk.ru>
Date: Fri, 18 Jul 2014 09:22:21 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.6.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
References: <1402933631-3276-1-git-send-email-peter.maydell@linaro.org>	<CAFEAcA9SAZF7kg9wJz9iQKPyML_7hA0kCm5ghjr5O+373srnzA@mail.gmail.com>
	<CAFEAcA-1r0DkyT8+VuSSTRrkKX5GGQb32VzZ42KqS_-TW+0GYw@mail.gmail.com>
In-Reply-To: <CAFEAcA-1r0DkyT8+VuSSTRrkKX5GGQb32VzZ42KqS_-TW+0GYw@mail.gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
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
X-List-Received-Date: Fri, 18 Jul 2014 05:22:52 -0000

08.07.2014 15:39, Peter Maydell wrote:
> On 26 June 2014 13:35, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 16 June 2014 16:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> If the user specified a (vlan ID, slirp stack name) tuple in a monitor
>>> hostfwd_add/remove command and we can't find it, give the user an
>>> error message rather than silently doing nothing.
>>>
>>> This brings this error case in slirp_lookup() into line with the
>>> other two.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>  net/slirp.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/net/slirp.c b/net/slirp.c
>>> index 8fddc03..647039e 100644
>>> --- a/net/slirp.c
>>> +++ b/net/slirp.c
>>> @@ -282,6 +282,7 @@ static SlirpState *slirp_lookup(Monitor *mon, const char *vlan,
>>>          NetClientState *nc;
>>>          nc = net_hub_find_client_by_name(strtol(vlan, NULL, 0), stack);
>>>          if (!nc) {
>>> +            monitor_printf(mon, "unrecognized (vlan-id, stackname) pair\n");
>>>              return NULL;
>>>          }
>>>          if (strcmp(nc->model, "user")) {

Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>

Peter, I returned from vacation yesterday, so I weren't able to process -trivial
queue before, and due to the time constraints we have before 2.1, I'm not sure
it is a good idea to make a pull request for the -trivial tree.  I'll pick this
one up but it might be better to apply this directly.

Thanks,

/mjt

