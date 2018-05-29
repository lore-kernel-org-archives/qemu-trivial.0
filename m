Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNgSU-0000PD-EF
	for mharc-qemu-trivial@gnu.org; Tue, 29 May 2018 11:22:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fNgSS-0000O4-Ab
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 11:22:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fNgSR-0005ts-7B
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 11:22:44 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:40029)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1fNgSM-0005mI-Ec; Tue, 29 May 2018 11:22:38 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue005 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0MOmRO-1fRWT82VF8-006AFL; Tue, 29 May 2018 17:22:24 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-32-f4bug@amsat.org>
	<950e1d4b-3a65-6cf5-88a7-13a986f69e0f@vivier.eu>
	<d5692df7-1647-81cb-9034-98e8a0e31f4c@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <8a77c1f2-a1c3-4c7c-7130-8a8644493e0c@vivier.eu>
Date: Tue, 29 May 2018 17:22:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <d5692df7-1647-81cb-9034-98e8a0e31f4c@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nqxasOKeXN2IeMJJdubNl9n4RW/2rUdqBfOHXekD9aZmSX2Uubn
	Biz1PbnRxkghCF8OXYykCseHZhdfiws6D8ZsjneX7NOOmzfvca7YT5x7QLQaG+Gj27Cwme6
	j8v497NW53LXTL1o8ppLfjoRRA5+rX07MQDPtzdhcg0qXqst33BP0NPs9wIFSh/JULZuP8Y
	HYj2W+evQVlA/fWWtdbYw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:70qrpGtamzg=:1n7oNEk6VqLgUL6cvXFLrt
	e/7KO+LsskKcPcXx7P6RSR6sULxxeAu8xg0rbJzQxDy3VeLR2Q0rBf6ou7+Yh8gDGszArkEv4
	WM/T+PUN840khvHqA/O3ycWlbgJCXXepdfPWvLGS23qGoEOzf+ZXT7+oILLyLnEIz/gkabnHE
	oHLkG0KFcm5hbjSSc93fkGNTR9d/IFiP7RZh2Aa0AvrYOSUNYnLwLaCd5pWqOJRC4RtFaF0sW
	/x/v+Nc1fbDFjWFm+eZUcC1svxXdiDtgBEzOskgWIL1Avk7hIiM8lXmAZ3RWKOuMu+DVxMkGs
	T89Cagq3SX5H+xh5KstM7WRajl/1EnSM0GYDSPY+mIew6+QcnLwWNuozAsHG4yifurYWKVilK
	UmWmdNhifEywi9tyn4J6YKwVhCI9UsA4tJr6ip0oBds72qAhQ5TMzvqWcRprAkMLlJOGtXI+i
	ztmJN9GsJAMT7kXvNaLyBMmMMl929M+qPPOaVXClJ/8TAfIaiy5O27bKDiwJqW/zrBQwWUIv4
	yi0rKTm6JAgieFLJLPppupdnJHJuUlyZX5RctYtoJr3gfTnAhElI05n/HYE5ctU5hzD7gBbNE
	5ujPwb2jVIYwcIbuNcI8hbO/chIrx9+qHxLcmWoJm87iJk+5ct4WmSwrd8fH773AKudPQg4zT
	S60g6llfz1wIJ22pB/Vlo3f2K4W/1YqtYK6MvIosIdxdcKsUgEYHbKDwrWgUA872OVzBsvS5f
	C70t6H4P1wTqsLcA
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-trivial] [PATCH for 2.10 31/35] syscall: replace strcpy()
 by g_strlcpy()
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
X-List-Received-Date: Tue, 29 May 2018 15:22:45 -0000

Le 29/05/2018 à 16:19, Philippe Mathieu-Daudé a écrit :
> Hi Laurent,
> 
> On 07/24/2017 04:28 PM, Laurent Vivier wrote:
>> Le 24/07/2017 à 20:27, Philippe Mathieu-Daudé a écrit :
>>> linux-user/syscall.c:9860:17: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
>>>                 strcpy (buf->machine, cpu_to_uname_machine(cpu_env));
>>>                 ^~~~~~
>>>
>>> Reported-by: Clang Static Analyzer
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  linux-user/syscall.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>> index 963b9c8f4b..847f729834 100644
>>> --- a/linux-user/syscall.c
>>> +++ b/linux-user/syscall.c
>>> @@ -9853,7 +9853,8 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
>>>              if (!is_error(ret)) {
>>>                  /* Overwrite the native machine name with whatever is being
>>>                     emulated. */
>>> -                strcpy (buf->machine, cpu_to_uname_machine(cpu_env));
>>> +                g_strlcpy(buf->machine, cpu_to_uname_machine(cpu_env),
>>> +                          sizeof(buf->machine));
>>>                  /* Allow the user to override the reported release.  */
>>>                  if (qemu_uname_release && *qemu_uname_release) {
>>>                      g_strlcpy(buf->release, qemu_uname_release,
>>>
>>
>> We should not have a problem here as cpu_to_uname_machine() is "const
>> char *" and the string is defined inside QEMU (so it should fit into
>> machine[]).
>>
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> 
> Do you mind queuing this patch in your linux-user tree?

Applied, thanks

Laurent


