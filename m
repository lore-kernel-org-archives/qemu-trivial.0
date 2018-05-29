Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNgPZ-0007gS-PE
	for mharc-qemu-trivial@gnu.org; Tue, 29 May 2018 11:19:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fNgPW-0007eR-Il
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 11:19:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fNgPT-0002S9-Ap
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 11:19:42 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:35835)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1fNgPS-0002Qy-Vu; Tue, 29 May 2018 11:19:39 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue005 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0Mgrp6-1fjd910VBg-00M2ef; Tue, 29 May 2018 17:19:31 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@linaro.org>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-27-f4bug@amsat.org>
	<cc23ddee-ad10-74ef-874c-6ed1ef485d2e@vivier.eu>
	<811e6e16-d9d7-3b96-7d43-f9d7b6ace063@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <d93b02bd-6776-497a-2dc0-aed009be380b@vivier.eu>
Date: Tue, 29 May 2018 17:19:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <811e6e16-d9d7-3b96-7d43-f9d7b6ace063@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dxSkWDmkeaztEzFTzgciKNcK/mYVHCPzuLWj2h4cpzamCLSucwN
	kikYfxMdDFlrlCLLtpCwsqNV2v7TAGhlg14/NREglxH02/EVwpbw9vLBJNmyR0ZsCL4MxMr
	7KsxFuh1qLfWPOwYTdVoxTHvt4neVcrZiFsxUdo5282cb88eCXRuqn5fwvRVrQqC64IyjEa
	94psV796g7wUiXZERnssw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:4O7AotNpRXU=:Qw+dGBEjINjf4zKO6gjF1q
	JU8AsqYeRHLAu9vGEPgrIoBqzT9ivUJHO2tSqx6qFA4nSywA6YtGOcNUfHOG5BlsWqKGo5YSw
	IGxlNoHBsLaDDpQrkmJM4LeAVH0+Siq9bWbf/30NxXswUcMfJsbDCyV/suxG6bZov3V0JYGcr
	NNPsI8CLbfu0UnsisVaTJxG5sVMh3MsW0JarlJRWUnS5wANPjOdBXJV54XIGxGY0ubYDR0c3l
	N+/Mly0wwsZfpSE9/NN1JQZJnWqn0Xe9sJR7giG4YKUDMx/80N50jhq/ZFQ5XKmUKfgN695i6
	Hu8gdCAsyWmXGQGBySCFQJppmPBi9o9qMluEwyjgaS5PzI9Cm6Dir+w6A13JWJqWvCrXHxcB7
	VLzVYWVPZmODlG5Chl3kgoP0Lrj1qlRGed/bzAtOoU2iO9TcvMR2OKUTOFI0CLBRpSMja/kdY
	Z4eg7kMYLQhIORBg62aoQVJN2qhQ9yUTQwdVH4ZG1JqUk/aSRQ+ot9eV6gZmrfo0QvMbvPM+K
	jqqu4BsNTSDsOqw4XqZM/q8w6SZqzXr+36snV7RIF2/kv7/Gzw8pZCmJ4CmI0ezNrMFD34nzK
	7AsK+aFb+H8vrP0UTD+groiRG+BmjQuzQmMkoxt0v0ryBlImtriJYeZPj41e8uFOcgR5aVIxU
	udSxpFRuo/+wvXJbhZiYMZbhnHlyQgn+JUu8MOCD+XxAwC3SYAN8NP7u629QeREDlP6I4Y3Zl
	9Xai1kXhC9dbk5lg
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.134
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.10 26/35] linux-user:
 use is_error() to avoid warnings and make the code clearer
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
X-List-Received-Date: Tue, 29 May 2018 15:19:44 -0000

Le 29/05/2018 à 16:25, Philippe Mathieu-Daudé a écrit :
> Hi Laurent,

Hi Philippe,

> On 07/24/2017 04:16 PM, Laurent Vivier wrote:
>> Le 24/07/2017 à 20:27, Philippe Mathieu-Daudé a écrit :
>>> linux-user/flatload.c:740:9: warning: Loss of sign in implicit conversion
>>>     if (res > (unsigned long)-4096)
>>>         ^~~
>>>
>>> Reported-by: Clang Static Analyzer
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>>
>>> ---
>>>  linux-user/flatload.c | 15 +++++++++------
>>>  1 file changed, 9 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/linux-user/flatload.c b/linux-user/flatload.c
>>> index a35a560904..10c529910f 100644
>>> --- a/linux-user/flatload.c
>>> +++ b/linux-user/flatload.c
>>> @@ -224,8 +224,9 @@ static int decompress_exec(
>>>  		ret = bprm->file->f_op->read(bprm->file, buf, LBUFSIZE, &fpos);
>>>  		if (ret <= 0)
>>>  			break;
>>> -		if (ret >= (unsigned long) -4096)
>>> +                if (is_error(ret)) {
>>>  			break;
>>> +                }
>>>  		len -= ret;
>>>  
>>>  		strm.next_in = buf;
>>> @@ -283,8 +284,7 @@ calc_reloc(abi_ulong r, struct lib_info *p, int curid, int internalp)
>>>                      "in same module (%d != %d)\n",
>>>                      (unsigned) r, curid, id);
>>>              goto failed;
>>> -        } else if ( ! p[id].loaded &&
>>> -                    load_flat_shared_library(id, p) > (unsigned long) -4096) {
>>> +        } else if (!p[id].loaded && is_error(load_flat_shared_library(id, p))) {
>>>              fprintf(stderr, "BINFMT_FLAT: failed to load library %d\n", id);
>>>              goto failed;
>>>          }
>>> @@ -523,9 +523,10 @@ static int load_flat_file(struct linux_binprm * bprm,
>>>                  fpos = 0;
>>>                  result = bprm->file->f_op->read(bprm->file,
>>>                                  (char *) textpos, text_len, &fpos);
>>> -                if (result < (unsigned long) -4096)
>>> +                if (!is_error(result)) {
>>>                          result = decompress_exec(bprm, text_len, (char *) datapos,
>>>                                           data_len + (relocs * sizeof(unsigned long)), 0);
>>> +                }
>>>          }
>>>          else
>>>  #endif
>>> @@ -693,8 +694,9 @@ static int load_flat_shared_library(int id, struct lib_info *libs)
>>>  
>>>  	res = prepare_binprm(&bprm);
>>>  
>>> -	if (res <= (unsigned long)-4096)
>>> +        if (!is_error(res)) {
>>>  		res = load_flat_file(&bprm, libs, id, NULL);
>>> +        }
>>>  	if (bprm.file) {
>>>  		allow_write_access(bprm.file);
>>>  		fput(bprm.file);
>>> @@ -737,8 +739,9 @@ int load_flt_binary(struct linux_binprm *bprm, struct image_info *info)
>>>  
>>>  
>>>      res = load_flat_file(bprm, libinfo, 0, &stack_len);
>>> -    if (res > (unsigned long)-4096)
>>> +    if (is_error(res)) {
>>>              return res;
>>> +    }
>>>  
>>>      /* Update data segment pointers for all libraries */
>>>      for (i=0; i<MAX_SHARED_LIBS; i++) {
>>>
> 
> Can you take this via your linux-user tree?
> 

Applied, thanks.

Laurent



