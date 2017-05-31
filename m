Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dG3U4-00060t-0E
	for mharc-qemu-trivial@gnu.org; Wed, 31 May 2017 09:16:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dG3Tx-0005ty-DU
	for qemu-trivial@nongnu.org; Wed, 31 May 2017 09:16:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dG3Tt-00061A-D3
	for qemu-trivial@nongnu.org; Wed, 31 May 2017 09:16:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52077)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1dG3Tm-0005zI-AW; Wed, 31 May 2017 09:16:02 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 26D76C059723;
	Wed, 31 May 2017 13:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 26D76C059723
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 26D76C059723
Received: from [10.36.117.7] (ovpn-117-7.ams2.redhat.com [10.36.117.7])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0408E80E68;
	Wed, 31 May 2017 13:15:56 +0000 (UTC)
To: Greg Kurz <groug@kaod.org>, Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Cornelia Huck <cornelia.huck@de.ibm.com>, qemu-trivial@nongnu.org,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>
References: <149615665491.28067.17765793725374594694.stgit@bahia.lan>
	<e8fdae1c-9d3c-1059-509a-6b85000e83a9@de.ibm.com>
	<20170530185618.2e875ebb@bahia.ttt.fr.ibm.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <32546ddf-a725-5dd4-95cb-75a41da8e6ec@redhat.com>
Date: Wed, 31 May 2017 15:15:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170530185618.2e875ebb@bahia.ttt.fr.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 31 May 2017 13:16:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pc-bios/s390-ccw: use STRIP
 variable in Makefile
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
X-List-Received-Date: Wed, 31 May 2017 13:16:18 -0000

On 30/05/2017 18:56, Greg Kurz wrote:
> On Tue, 30 May 2017 18:34:46 +0200
> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> 
>> On 05/30/2017 05:04 PM, Greg Kurz wrote:
>>> The docker-run-test-build@debian-s390x-cross target fails with:
>>>
>>> strip --strip-unneeded s390-ccw.elf -o s390-ccw.img
>>> strip: Unable to recognise the format of the input file `s390-ccw.elf'
>>>
>>> The configure script defines a STRIP makefile variable whose default
>>> value is ${cross_prefix}strip. Let's use it.
>>>
>>> Signed-off-by: Greg Kurz <groug@kaod.org>
>>> ---
>>>  pc-bios/s390-ccw/Makefile |    2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
>>> index 79a46b67356f..7af57dad109c 100644
>>> --- a/pc-bios/s390-ccw/Makefile
>>> +++ b/pc-bios/s390-ccw/Makefile
>>> @@ -22,7 +22,7 @@ s390-ccw.elf: $(OBJECTS)
>>>  	$(call quiet-command,$(CC) $(LDFLAGS) -o $@ $(OBJECTS),"BUILD","$(TARGET_DIR)$@")
>>>
>>>  s390-ccw.img: s390-ccw.elf
>>> -	$(call quiet-command,strip --strip-unneeded $< -o $@,"STRIP","$(TARGET_DIR)$@")
>>> +	$(call quiet-command,$(STRIP) --strip-unneeded $< -o $@,"STRIP","$(TARGET_DIR)$@")
>>>
>>>  $(OBJECTS): Makefile
>>>
>>>   
>>
>> I was going to apply this, but it fails with --disable-strip like
>>
>>     /bin/sh: --strip-unneeded: command not found
>>     Makefile:25: recipe for target 's390-ccw.img' failed
>>     make[1]: *** [s390-ccw.img] Error 127
>>     Makefile:354: recipe for target 'romsubdir-s390-ccw' failed
>>     make: *** [romsubdir-s390-ccw] Error 2
>>
>> Not yet sure whats going on.
>>
> 
> configure doesn't generate STRIP when --disable-strip or --enable-debug... so
> I guess we shouldn't use it here, but rather generate a s390_cross_prefix like
> in roms/Makefile ?
> 

I experimented the problem when I played with docker, and fixed the
problem as you did (with STRIP).

But I think it's a good idea to compile s390 rom as it is done for ppc64
and ppc roms.

Laurent

