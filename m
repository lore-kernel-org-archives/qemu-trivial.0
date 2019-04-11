Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hEfnh-00031b-3R
	for mharc-qemu-trivial@gnu.org; Thu, 11 Apr 2019 15:55:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hEfne-0002zc-IT
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 15:55:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hEfnd-0006be-Lp
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 15:55:54 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:60623)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hEfnZ-0006ZS-CY; Thu, 11 Apr 2019 15:55:49 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
	1MDN3O-1h4GDG0Z2U-00ARrr; Thu, 11 Apr 2019 21:55:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>, Max Reitz <mreitz@redhat.com>,
	Jeff Cody <codyprime@gmail.com>, John Snow <jsnow@redhat.com>
References: <20190327095634.53038-1-sgarzare@redhat.com>
	<20190327095634.53038-2-sgarzare@redhat.com>
	<9e0618f0-e889-5e37-fc4c-b44ada5fe509@vivier.eu>
Message-ID: <3e50baae-995f-c857-f733-2bdddffc9609@vivier.eu>
Date: Thu, 11 Apr 2019 21:55:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <9e0618f0-e889-5e37-fc4c-b44ada5fe509@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:9Cn57zqhuD6+RfFtq87kZYsLCDrj6Em6t3RhFxZz61aGSzGQDlq
	cP3H5NHEUACvjIMhRtCuFzDUcUUWVtB6NjIa4hvLnkYWVSxBs9ghXYLpnzDihZVdORyE9ds
	PSYUHQqUk0VnOJ14fJUgMMEvPyuzrBEI91oJSBEMy8+0PW2dQSBYP160B8x46+Sc283Ldt7
	J10FUZh3yWvu8+7eWiueg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LT9PiCbqfbQ=:Q4vjNPCPAZGL61XPGVRDmV
	URyFeTrK8GaZHHNWlYfRPiGWSWbDpUWxVkuSmnC4z77oPm0U/o0l/hMHPXwFqflQZjc18r0gh
	fNDl/K5Bcib+HMSLWOsN7WRDRavUM4X1H5XZTyyYu3FTPmFckJWWBOtHGB6Ly6+HV9hELF5RA
	Fck1IESantc6kvEGTNhJ9K5WOHEgZM9v3u4sHG7AHSQBpyMzaLolhfww8i8vj2EmtoY0GQSZg
	u2UoQNOjNJyfLLN48IlJ4Vhaonqeylj3qPSkAUhmoblKDdPNezxs5V7iL+UnQudVj5qNxA3e+
	EouCN2oBW3H8KDbGB8hobngE9fpxOej/WRMekFSayb1xlxr6G9sDnqTKCCQGNK7mxSbRlzEnJ
	KVzpdvf0fc8t54KNuJQittDsACdUWX0l/nWSBgIJKtgzSU9MC8edP8EY5IL0Fzgqpu/3CzP/G
	nVP6ONDwMevHK6Cl05rdnGT6fprsT3DgYmTehBOxfZ+MvkQNjt1N+ubL7yYaIyyyTx1E6/QqR
	GYrO7XPhYGxQ0bu/wxCN9qC9WY8sPNleAP48FEV+Dtdy9MLM67pFC2XS9QxGmLL/YMMBTBmgy
	7ytoe53GFvkYea7YZuecx5rbbo34QNlfpzGwpa6EI2KQk6refrKXkbbxKUKueqDmmdo4VfBlz
	D7GIkEjrxpAMP4giaSJuCOy+pLVsORhn/K6b5FrJCgUDS4L+mmBthGc6rR9A8njaobb1oHTAP
	iUoh0Q8aJCgVV9DV/dKDSV43s619tMJ7q09HU05j7Z25Aw4g8slokH1Jbtk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: Re: [Qemu-trivial] [PATCH v2 1/2] block/vhdx: Remove redundant IEC
 binary prefixes definition
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
X-List-Received-Date: Thu, 11 Apr 2019 19:55:55 -0000

On 11/04/2019 21:54, Laurent Vivier wrote:
> On 27/03/2019 10:56, Stefano Garzarella wrote:
>> IEC binary prefixes are already defined in "qemu/units.h",
>> so we can remove redundant definitions in "block/vhdx.h".
>>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>>  block/vhdx.c | 3 ++-
>>  block/vhdx.h | 6 +-----
>>  2 files changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/block/vhdx.c b/block/vhdx.c
>> index b785aef4b7..7cd1fc3731 100644
>> --- a/block/vhdx.c
>> +++ b/block/vhdx.c
>> @@ -1889,7 +1889,8 @@ static int coroutine_fn vhdx_co_create(BlockdevCreateOptions *opts,
>>          return -EINVAL;
>>      }
>>      if (block_size > VHDX_BLOCK_SIZE_MAX) {
>> -        error_setg(errp, "Block size must not exceed %d", VHDX_BLOCK_SIZE_MAX);
>> +        error_setg(errp, "Block size must not exceed %" PRId64,
>> +                   VHDX_BLOCK_SIZE_MAX);
>>          return -EINVAL;
>>      }
>>  
>> diff --git a/block/vhdx.h b/block/vhdx.h
>> index 1bfb4e4f73..bf72090c8f 100644
>> --- a/block/vhdx.h
>> +++ b/block/vhdx.h
>> @@ -17,11 +17,7 @@
>>  
>>  #ifndef BLOCK_VHDX_H
>>  #define BLOCK_VHDX_H
>> -
>> -#define KiB              (1 * 1024)
>> -#define MiB            (KiB * 1024)
>> -#define GiB            (MiB * 1024)
>> -#define TiB ((uint64_t) GiB * 1024)
>> +#include "qemu/units.h"
>>  
>>  #define DEFAULT_LOG_SIZE 1048576 /* 1MiB */
>>  /* Structures and fields present in the VHDX file */
>>
> 
> Applied to my trivial-patches branch.

Removed as Kevin already applied it to block-next.

Thanks,
Laurent


