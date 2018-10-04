Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g86co-0006fF-Ef
	for mharc-qemu-trivial@gnu.org; Thu, 04 Oct 2018 12:37:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1g86cl-0006dh-JX
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:37:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1g86cf-0005yH-HD
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:37:13 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:55363)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1g86cd-0005tZ-L0; Thu, 04 Oct 2018 12:37:07 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1Mo7Bb-1fNpde30eZ-00paF0; Thu, 04 Oct 2018 18:36:53 +0200
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1Mo7Bb-1fNpde30eZ-00paF0; Thu, 04 Oct 2018 18:36:53 +0200
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
	Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-7-crosa@redhat.com>
	<4f0850d2-3baa-7acc-d34b-98f074f1a2f8@vivier.eu>
	<50e4aeaa-7f4f-03b3-05ae-2a29deac9662@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <72ee2b27-cdcc-5cfd-ae71-8dfe95a595ac@vivier.eu>
Date: Thu, 4 Oct 2018 18:36:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <50e4aeaa-7f4f-03b3-05ae-2a29deac9662@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:k6LVpC63/fbyK7hr9+eUHuYQ0sRZiH9JsEYcdGksA4Y/ZdtY8tt
	vibjZhFiNgXIpQ6F+m/1Ci52WG3scb7gn+HQDf/vvlMqshikxEd7Xy8KEX7N8w5PhxAsLse
	gCUic6pYS1zmoLVSu8Igamc2POfpgF4WjQKXX5sBixJfc85xBFJnKIKDCppm29P/06ZZetp
	AHKe42eL14iUrPzKAtYQQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:xe6zJKmWNlI=:FgEsoOtBZY70A+I6KtWHmi
	Dvz0WOnTPn3TEN83Wpv34eGvbyYPYWTIYeLIF7WAt6IkiMdd3fJOZJK6vo9gTd4H661+RMjLX
	Knkh6SQzF/cpdF9TgSvQMPtJYO1JfNzDtV6h1x98oUvCJAnMifiWWtFGPr7DvXQXaMmjOvdCx
	HrmlcmpT3CrRvX5n/u1l8VZEiU3p8X0H9ChQWwRknDdZSyChmrVs+0Ik+CMzOrfZGvemQK4H3
	H/rK24q/UeWLmt5h86ncSQOH0Sk4wNSPEA+ny6Xu9i2u4/p9od7IPRPPrLFWd7KUbidLtK8Pg
	yvfTgCQPO+gldV7E9+WREPBOHecAbylNABgV7AlXCEQ2N6JmRbMANdr8JW0VShnfoPP3HdD9P
	0xyYysSEE3GZ1Jh+/X1br1s8mIgHcbYI9YwUzXZ8GYPoe4bAlIgL+SjdzBGUrVs2+/tmfIX6q
	GgKcZpQhFu9Jbd5dM+dTfhDXIyJi3Fp+CdRk4Hu8Q9sALD4SOeUhFJ8OzT5KheW6Q0wrOo1Sg
	Oaf4OcXMaZ7QeBtNYld/fzI3bQrxOWjnSyk2NJWqZftfrOUwNA1//kRtD7H25IDPaC77l2nM6
	b5NUjy12tw3pm7KYjAVPs5RaU3mgJ95czs7lM7pck1NDfAoATH7w1bGC7YZMw7QUHCr5v+iB+
	rnsCLmWpZDRKF/oCUGf4r7ejxy87m8psXdUpQoGNcgM4kdbBfuJcqEYN9Hs8JzFjW9BD4uvAG
	AsiGLWLmaiPW5Sxh
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: Re: [Qemu-trivial] [PATCH 06/10] thunk.c: clean up commented out
 definition
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
X-List-Received-Date: Thu, 04 Oct 2018 16:37:16 -0000

Le 04/10/2018 à 18:31, Cleber Rosa a écrit :
> 
> 
> On 10/4/18 12:24 PM, Laurent Vivier wrote:
>> Le 04/10/2018 à 18:18, Cleber Rosa a écrit :
>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>  thunk.c | 2 --
>>>  1 file changed, 2 deletions(-)
>>>
>>> diff --git a/thunk.c b/thunk.c
>>> index d5d8645cd4..e351ae53af 100644
>>> --- a/thunk.c
>>> +++ b/thunk.c
>>> @@ -21,8 +21,6 @@
>>>  #include "qemu.h"
>>>  #include "exec/user/thunk.h"
>>>  
>>> -//#define DEBUG
>>> -
>>
>> Generally we use that to enable easily existing debug traces.
>>
> 
> Oh, I wasn't aware that was intentional (I clearly lack some background
> here).
> 
>> In this case, if you remove the "#define" I think you should also
>> replace the "#ifdef DEBUG"s by some trace_XXXX() functions.
>>
> 
> Is that desirable? I don't want to disrupt the status quo just because
> it looked odd to me.

Yes, it's better to have trace_XXX() functions than DEBUG macros. The
change is trivial (add the format strings in ./trace-events and call
them from thunk.c with the existing parameters)

Thanks,
Laurent




