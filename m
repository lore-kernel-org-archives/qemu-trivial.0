Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gL4U7-0000w1-Tv
	for mharc-qemu-trivial@gnu.org; Fri, 09 Nov 2018 05:57:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gL4U6-0000nv-3T
	for qemu-trivial@nongnu.org; Fri, 09 Nov 2018 05:57:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gL4U1-0004KG-Sw
	for qemu-trivial@nongnu.org; Fri, 09 Nov 2018 05:57:53 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:46337)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1gL4U1-0003wW-HB
	for qemu-trivial@nongnu.org; Fri, 09 Nov 2018 05:57:49 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1N2Dgk-1fN9rS2d9q-013g0v for <qemu-trivial@nongnu.org>; Fri, 09 Nov 2018
	11:57:36 +0100
To: qemu-trivial@nongnu.org
References: <1541751214-17515-1-git-send-email-liq3ea@gmail.com>
	<7d20734d-f43a-957c-9cb5-4644320037aa@redhat.com>
	<fc711588-581f-515a-dbf2-62faf6ff1d2f@redhat.com>
	<57a92d57-dd52-e347-b3be-e9fefb150672@redhat.com>
	<87933d44-2ae8-f5c6-cc60-04456fb2bcff@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <7832151d-3f51-520e-92ba-ccb87ee1d75b@vivier.eu>
Date: Fri, 9 Nov 2018 11:57:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87933d44-2ae8-f5c6-cc60-04456fb2bcff@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:afwmlau07iRwZZ4VjT6lrpHEvQXbN0mXmmYiN2tiYqIACxYlkoZ
	1wjenv0ETmMd/rHQx7eaFzYRRjzZKU6h69z/PgS/XGOWzx+hRoFhkJi18zepMbP9eYxedIs
	3uqxbxtNTdVU4TzMJ4foTZq0BRqD8dAN+sfKMxxgCjjOuqUcWZgUF/guZmkwrqPFQBEUnn3
	DMmPlvqb3Fj8C4d4XYn5g==
X-UI-Out-Filterresults: notjunk:1;V01:K0:lPUTFieSIPs=:gZq84c4tPf9g4YVOT/rMcF
	NC4lluwQAQX4qvAX10HOzQuVmDDjDLsTtcX9TgNvhTB8KdymQAbhoisNFXWlsOgdXqiAbJeAk
	1RN+gHi7CMe1e9N2NQHHt39zs2VBwWFE2r/uTnFXW0pH/wRoylHt8DrQbVmIwuWYmir+UM7ic
	jXhaVdb5MAaLaNA/x7R51zMAl6OTl4H21t0dGze7OMZC4J/I89FkN1HBaYeY6hWwjheKE1q7G
	mpWxG/F/8CR+9AbjVMsqtje8BucWuMbzQ683nD+UcHIKzBexXRmh7BipzEDqWKatdvizOGVPk
	rZOjnpoaal4ozAi23rNkbcrmIdSZdL8D+xGMvaw5IGRZO4eXnDP724yJ6Jhu+mAMOmb6bNuBs
	B2w2hcGMstmlYjkgaymi7JdqGAtckPGWGd6aqknOLBXujtMGfSudNOF7KO4Pi/UYw1O3ocl+n
	8UzgZuZUKFIuskYHo67Inomzuot8AVJP9Z+9pTUlifvid6zEc1hgqFADSVB04Et+DB3T0lELJ
	fkHQXZYIb52AKOG8rChflEAejLwhnlQOQZNhOpeep/3elkQ47R6jP+zaB0Ex9hIoHdP25ZHVQ
	JLT7OYgG3LOFk3VOi2OR+hmWu6lsI9J8wZag8ekmo2PgGWltip3hVYAYVaPEIRVR3tpJKgYal
	ivpVgxvP/XYGkt3kEqNduXKWNtoWsc2TMW0di0utbB+aFjHhzZ91f6aWMXn6nu27Tdjq4RvP9
	WpLcc3Qi4lkkUd/5ph7IRUnxwbBIRCPei1OVG2CKOzbx023e/k2U4JQ9OKVwPuzG3iXJWqX6L
	xw+3v41hvC/kxu5x6elhVcVCm48+A==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: Re: [Qemu-trivial] [PATCH] hw: set_netdev: remove useless code
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
X-List-Received-Date: Fri, 09 Nov 2018 10:57:54 -0000

On 09/11/2018 11:00, Paolo Bonzini wrote:
> On 09/11/2018 09:29, Laurent Vivier wrote:
>> On 09/11/2018 09:26, Thomas Huth wrote:
>>> On 2018-11-09 09:21, Laurent Vivier wrote:
>>>> On 09/11/2018 09:13, Li Qiang wrote:
>>>>> In set_netdev(), the peers[i] is initialized
>>>>> qemu_find_net_clients_except() when i is in
>>>>> 0 between 'queues' it can't be NULL.
>>>>>
>>>>> Signed-off-by: Li Qiang <liq3ea@gmail.com>
>>>>> ---
>>>>>  hw/core/qdev-properties-system.c | 4 ----
>>>>>  1 file changed, 4 deletions(-)
>>>>>
>>>>> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
>>>>> index 8b22fb5..b45a7ef 100644
>>>>> --- a/hw/core/qdev-properties-system.c
>>>>> +++ b/hw/core/qdev-properties-system.c
>>>>> @@ -288,10 +288,6 @@ static void set_netdev(Object *obj, Visitor *v, const char *name,
>>>>>      }
>>>>>  
>>>>>      for (i = 0; i < queues; i++) {
>>>>> -        if (peers[i] == NULL) {
>>>>> -            err = -ENOENT;
>>>>> -            goto out;
>>>>> -        }
>>>>>  
>>>>>          if (peers[i]->peer) {
>>>>>              err = -EEXIST;
>>>>>
>>>>
>>>> Reviewed-by: Laurent Vivier <lvivier@redhat.com>
>>>
>>> So who can pick up such patches? We don't have a maintainer for the QDEV
>>> subsystem anymore... should it go via qemu-trivial?
>>
>> It seems trivial enough to go via qemu-trivial, but it would be good to
>> have a R-b from someone else than me to confirm.
> 
> I would have expected Jason to pick it up, after all it's networking,
> but it's okay if you want to take it too.

If Jason pushes it before I do, I will remove it from my queue.
[I have the bad habit to rebase by branch before a pull request]

Thanks,
Laurent


