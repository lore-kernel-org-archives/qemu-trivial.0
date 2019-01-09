Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghAvW-0006PH-Qb
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jan 2019 05:17:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghAvS-0006LU-UA
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 05:17:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghAvH-0007QD-UP
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 05:17:23 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:36337)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ghAv2-0006vG-Mn; Wed, 09 Jan 2019 05:17:04 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1Mgf4k-1hCwtN1fGW-00h8Hz; Wed, 09 Jan 2019 11:17:01 +0100
Cc: Roman Kapl <roman.kapl@sysgo.com>, Jon Diekema <jon.diekema@gmail.com>,
	qemu-trivial@nongnu.org, Roman Kapl <rka@sysgo.com>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <CALvuzg43uSodseEHjNaRcPFBKKPTY2mcppUbYgiLL=QO9RxX_Q@mail.gmail.com>
	<e62bbdda-2ab9-b9a1-7843-0a3a40f56282@vivier.eu>
	<4cfad0f8-1b66-b6be-693e-ba439e81f171@sysgo.com>
To: David Gibson <david@gibson.dropbear.id.au>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <f36c1752-98ad-7c44-4637-7186c7511f38@vivier.eu>
Date: Wed, 9 Jan 2019 11:17:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <4cfad0f8-1b66-b6be-693e-ba439e81f171@sysgo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CUbKWG/Za5w5rRtfgK3m/sLabcJfEcgW2mpcOhJLQ5g2ihiTuyn
	xhmrk3UBRyRoBkXHt+z1y3M6NM5syskeMWRZhG6a+sQvj/8HJ3F7HU/pZqjTNZvkKEMmO+Y
	fmpo7fn680ARmLC7DfMJeHeqDARy44aAlceOYY6TaPiZQOErt2C4hb3vJJdUkUxNSa5FzML
	cEHjvgAH2xGpRZnqkZWaw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:trnoRg7bIV0=:ba+Je288jmFn6j4o282nVT
	F+E2IIwLo4Upw58KSB9vgBaubyJkEYPzG0608ByYEs6EyyKX1dRFCEWox3WhEd5Cb9QxNmCDp
	AA9G4qVP/xP9edvzfmqL2jhpSbV+EHXHgASLJgm5owR1rLDlvFsER2t1KF7pSroe0IFhNHR7K
	gjp1jMtu+XYWvPPAaqSw7K4l1NL/6hFCHR/akL6stSTcKNa6A+xMhlaeEuklTE6VUJST7rfUA
	HaUssZuYYpsb/rl2Zcqesj72xKkvtNGuFrmvKKCxSWlm9fQW+KLXruJISQPO2z3iLyfv7XzIs
	eCRib/gvLasQerNvZEOkg2Car1ts5RyGf6ZYt35J2rjBMxA3wtMcZQvwVZRTo+uLwgBGeHhHY
	NDMRn2UFlDvNXM6UTvyTPS95swnCu+ISWCWiWKqO4hxiB9MbZCh0AxooYw+6Psbw338tcsdEm
	IvZD4EAkoKsmPwxOqsT0VsnrsPxT3pjuSL40gr5ff0zeYcLOYR7zzlQ1UkON56xbXiiVvULoS
	AUOv44Rh+hOY6ml/5OYzLi1ObKPQwx9InsevtBjfHNBCmtE/GB3AVqXmVtM12leEK1CU3l0oH
	TdSDBmT/1IIqQnFTr/KTqd8FrIcxrgzrUa/xlt4mbm4dLYU4U53bXINqBiZi6Rrmunz2STZwJ
	UoqRY2To8ShNuH9Avx21Jk12ZTdwU4WOlxQGbRiD1xLlSPNVlCaLamdaGEy5kYCCXw+bp+L2I
	kgwT1ng4k9cEefZfgOzx5xO9xMC5iMqWmLH4znPV15OXP6EW+XASX+M+EI4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
Subject: Re: [Qemu-trivial] ppc: e6500 registers SPR 604 twice
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
X-List-Received-Date: Wed, 09 Jan 2019 10:17:33 -0000

David,

will you take this through your ppc branch?

Thanks,
Laurent

On 04/01/2019 11:41, Roman Kapl wrote:
>> Le 25/12/2018 à 10:50, Jon Diekema a écrit :
>>>  From f399f28441e0aa79458d68996038ca3606fcb699 Mon Sep 17 00:00:00 2001
>>> From: Jon Diekema <jon.diekema@ge.com <mailto:jon.diekema@ge.com>>
>>> Date: Tue, 25 Dec 2018 04:36:06 -0500
>>> Subject: ppc: e6500 registers SPR 604 twice
>>>
>>> When using the e6500 CPU, QEMU generates a fatal error after
>>> complaining about registering SPR 604 twice.
>>>
>>>
>>> diff --git a/target/ppc/translate_init.inc.c
>>> b/target/ppc/translate_init.inc.c
>>> index 03f1d34a97..c971a5faf7 100644
>>> --- a/target/ppc/translate_init.inc.c
>>> +++ b/target/ppc/translate_init.inc.c
>>> @@ -4947,14 +4947,6 @@ static void init_proc_e500(CPUPPCState *env, int
>>> version)
>>>       }
>>>         if (version == fsl_e6500) {
>>> -        spr_register(env, SPR_BOOKE_SPRG8, "SPRG8",
>>> -                     SPR_NOACCESS, SPR_NOACCESS,
>>> -                     &spr_read_generic, &spr_write_generic,
>>> -                     0x00000000);
>>> -        spr_register(env, SPR_BOOKE_SPRG9, "SPRG9",
>>> -                     SPR_NOACCESS, SPR_NOACCESS,
>>> -                     &spr_read_generic, &spr_write_generic,
>>> -                     0x00000000);
>>>           /* Thread identification */
>>>           spr_register(env, SPR_TIR, "TIR",
>>>                        SPR_NOACCESS, SPR_NOACCESS,
>>> -- 
>>> 2.20.1.3.gf17a2b179
>>>
>>
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>> Tested-by: Laurent Vivier <laurent@vivier.eu>
>>
> 
> Thanks Jon, I did not test with e6500. The patch fixes the issue &
> debugging still works on e5500.
> 
> Roman Kapl
> 


