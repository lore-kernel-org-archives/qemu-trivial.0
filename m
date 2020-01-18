Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1isjIs-0003Xp-Rv
	for mharc-qemu-trivial@gnu.org; Sat, 18 Jan 2020 03:17:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38919)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1isjIo-0003S6-Sg
 for qemu-trivial@nongnu.org; Sat, 18 Jan 2020 03:17:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1isjIm-0003iU-6T
 for qemu-trivial@nongnu.org; Sat, 18 Jan 2020 03:17:54 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56132
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1isjIm-0003i6-3A
 for qemu-trivial@nongnu.org; Sat, 18 Jan 2020 03:17:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579335471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HbD556K4Kcdc1ftNc3oZXiSb0lISAq3qhfTl3DEXZ88=;
 b=LHM+URlaEzi+IEYI9jF2FOYZZMdTlT/mWMIyWZKPQDxdfvW+UzV804F8jAkoUY/fjehnnr
 JBq3eRwYM/l8yydXsXqfxJEQXFpCPbnkv5u76RQczcdRPHilrh8QYZ/vJonXj4V8uCwrHV
 +hrUI9OXm6tBkT8IDtapxg3dG+suVnI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-xPPJ343sOpuD8jwrDHTIAw-1; Sat, 18 Jan 2020 03:17:46 -0500
Received: by mail-wr1-f70.google.com with SMTP id t3so11450230wrm.23
 for <qemu-trivial@nongnu.org>; Sat, 18 Jan 2020 00:17:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wfMI0dKcwn6eyAUiBNTts9wAGwI7Kz5Biaqg15aiOXM=;
 b=LJFpf3UUfpiD9w/2/FPZI9CuFCEOCXDM9cAV5aAe3tjZP9dK62xus9YhJo98iawMdm
 hWs5G1Q1MAD3owFvzZ1IEWu/FGwlxI3aYxHovkVIj1i3CpjK8Y2KWwrZT+r3HQ3Swelz
 HeEXmcbQ/uEkTy5h4CkTxIwlUcPJhcf2/ArvTxE7i3xCobnLb8LHvqP/tQ3cwBmAEYvT
 167v8jlCdH605R/KFi590SyvAoAE10aAnH+JCkkV/PKz3f3+3IUAnwZWv3duxzurir/f
 1YSWWeiDI8BU85BWsKhwdGlEY9D6ZYijpmI2IkAflBvRLgX3YgVc9LgZkjEloc+Hw3HW
 MAZg==
X-Gm-Message-State: APjAAAW9i/TnvA0kZaJLCS4cirkq+uT2/YmadKrsSngn9q7/YPCAUDGp
 7xKN96kGjm6WilP0U+Q48fGGMZ+qt2HElkbW9HODM49yRwwCZJuftfTstk78fbrwHkHqJDQtQYR
 BlMdRtRbKmAyBy4l6kQ==
X-Received: by 2002:adf:fd0d:: with SMTP id e13mr7354729wrr.421.1579335465364; 
 Sat, 18 Jan 2020 00:17:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqwtnV5tfZibxNxacRxv0lb1Onp18HgqdODOO3WNFcLEw58di9i2wDscw+y4QE+mHMH79hvWIA==
X-Received: by 2002:adf:fd0d:: with SMTP id e13mr7354699wrr.421.1579335464834; 
 Sat, 18 Jan 2020 00:17:44 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id n187sm13444180wme.28.2020.01.18.00.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jan 2020 00:17:44 -0800 (PST)
Subject: Re: [PATCH] mailmap: Add more entries to sanitize 'git log' output
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20191218185723.7738-1-philmd@redhat.com>
 <87h80ts0ii.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <aef8102c-23d5-7cdc-7183-673c116a44b2@redhat.com>
Date: Sat, 18 Jan 2020 09:17:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87h80ts0ii.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-MC-Unique: xPPJ343sOpuD8jwrDHTIAw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Jan 2020 08:17:57 -0000

On 1/18/20 8:10 AM, Markus Armbruster wrote:
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>=20
>> Most of these developers have the Signed-off-by tag properly
>> written, but not the author/commiter name. Fix this.
>> Also we incorrectly wrote Arei Gonglei name, update and reorder.
>>
>> git-log does not use this file by default until you specify the
>> --use-mailmap flag:
>>
>>    $ git log --use-mailmap
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>   .mailmap | 29 ++++++++++++++++++++++++++++-
>>   1 file changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/.mailmap b/.mailmap
>> index 3816e4effe..1a859d9e65 100644
>> --- a/.mailmap
>> +++ b/.mailmap
>> @@ -56,6 +56,10 @@ Aaron Lindsay <aaron@os.amperecomputing.com>
>>   Alexey Gerasimenko <x1917x@gmail.com>
>>   Alex Ivanov <void@aleksoft.net>
>>   Andreas F=C3=A4rber <afaerber@suse.de>
>> +Andreas F=C3=A4rber <andreas.faerber@web.de>
>> +Andreas F=C3=A4rber <andreas.faerber@web.de> <andreas.faerber>
>> +Arei Gonglei <arei.gonglei@huawei.com>
>> +Arei Gonglei <arei.gonglei@huawei.com> <root@ceth6.(none)>
>=20
> I can't find this one in git-log.

I was first surprised:

$ git log -1 3b08098b40
commit 3b08098b409c0fb28f85436ba1adeb1d401ec8f7
Author:     Gonglei <arei.gonglei@huawei.com>
AuthorDate: Wed Dec 3 18:25:46 2014 +0000
Commit:     root <root@ceth6.(none)>
CommitDate: Mon Dec 22 14:39:21 2014 +0800

     bootdevice: add validate check for qemu_boot_set()

     Signed-off-by: Gonglei <arei.gonglei@huawei.com>
     Reviewed-by: Markus Armbruster <armbru@redhat.com>

After thinking for a bit I remembered I once changed my default format:

$ git config format.pretty
fuller

I suppose I should add this in the commit description.

>>   Bandan Das <bsd@redhat.com>
>>   Benjamin MARSILI <mlspirat42@gmail.com>
>>   Beno=C3=AEt Canet <benoit.canet@gmail.com>
>> @@ -67,27 +71,36 @@ Brad Smith <brad@comstyle.com>
>>   Brijesh Singh <brijesh.singh@amd.com>
>>   Brilly Wu <brillywu@viatech.com.cn>
>>   C=C3=A9dric Vincent <cedric.vincent@st.com>
>> +Chai Wen <chaiw.fnst@cn.fujitsu.com>
>> +Chaojian Hu <chaojianhu@hotmail.com>
>>   CheneyLin <linzc@zju.edu.cn>
>> +Chen Fan <chen.fan.fnst@cn.fujitsu.com>
>>   Chen Gang <chengang@emindsoft.com.cn>
>>   Chen Gang <gang.chen.5i5j@gmail.com>
>>   Chen Gang <gang.chen@sunrus.com.cn>
>>   Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
>>   Christophe Lyon <christophe.lyon@st.com>
>> +Christoph Hellwig <hch@lst.de>
>>   Collin L. Walling <walling@linux.ibm.com>
>>   Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> +Disheng Su <edison@cloud.com>
>> +Dunrong Huang <riegamaths@gmail.com>
>>   Eduardo Otubo <otubo@redhat.com>
>>   Fabrice Desclaux <fabrice.desclaux@cea.fr>
>>   Fernando Luis V=C3=A1zquez Cao <fernando_b1@lab.ntt.co.jp>
>>   Fernando Luis V=C3=A1zquez Cao <fernando@oss.ntt.co.jp>
>>   Gautham R. Shenoy <ego@in.ibm.com>
>>   Gautham R. Shenoy <ego@linux.vnet.ibm.com>
>> -Gonglei (Arei) <arei.gonglei@huawei.com>
>>   Guang Wang <wang.guang55@zte.com.cn>
>>   Hailiang Zhang <zhang.zhanghailiang@huawei.com>
>>   Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>> +Hiroyuki Obinata <hiroyuki.obinata@gmail.com>
>>   Jakub Jerm=C3=A1=C5=99 <jakub@jermar.eu>
>>   Jakub Jerm=C3=A1=C5=99 <jakub.jermar@kernkonzept.com>
>> +Jay Zhou <jianjay.zhou@huawei.com>
>>   Jean-Christophe Dubois <jcd@tribudubois.net>
>> +Jean-Christophe Dubois <jcd@tribudubois.net> <jcd@jcd-laptop.(none)>
>> +Jia Lina <jialina01@baidu.com>
>>   Jind=C5=99ich Makovi=C4=8Dka <makovick@gmail.com>
>>   John Arbuckle <programmingkidx@gmail.com>
>>   Juha Riihim=C3=A4ki <juha.riihimaki@nokia.com>
>> @@ -96,9 +109,11 @@ Jun Li <junmuzi@gmail.com>
>>   Laurent Vivier <Laurent@lvivier.info>
>>   Leandro Lupori <leandro.lupori@gmail.com>
>>   Li Guang <lig.fnst@cn.fujitsu.com>
>> +Lili Huang <huanglili.huang@huawei.com>
>=20
> I can't find this one in git-log.

$ git log -1 76349f5ba8
commit 76349f5ba8f4e2f0b8c93c12ec0950a8bc77408a
Author:     Gonglei <arei.gonglei@huawei.com>
AuthorDate: Thu Jan 29 13:13:47 2015 +0000
Commit:     Lili <huanglili.huang@huawei.com>
CommitDate: Tue Mar 3 13:13:21 2015 +0800

     bootdevice: add check in restore_boot_order()

     qemu_boot_set() can't fail in restore_boot_order(),
     then simply assert it doesn't fail, by passing
     &error_abort if boot_set_handler set.

     Suggested-by: Markus Armbruster <armbru@redhat.com>
     Signed-off-by: Gonglei <arei.gonglei@huawei.com>
     Reviewed-by: Markus Armbruster <armbru@redhat.com>

>>   Liming Wang <walimisdev@gmail.com>
>>   linzhecheng <linzc@zju.edu.cn>
>>   Liran Schour <lirans@il.ibm.com>
>> +Li Tianqing <tianqing@unitedstack.com>
>>   Liu Yu <yu.liu@freescale.com>
>>   Liu Yu <Yu.Liu@freescale.com>
>>   Li Zhang <zhlcindy@gmail.com>
>> @@ -112,11 +127,14 @@ Marc Mar=C3=AD <marc.mari.barcelo@gmail.com>
>>   Marc Mar=C3=AD <markmb@redhat.com>
>>   Michael Avdienko <whitearchey@gmail.com>
>>   Michael S. Tsirkin <mst@redhat.com>
>> +Michael S. Tsirkin <mst@redhat.com> <mst@robin.(none)>
>> +Michael Tokarev <mjt@tls.msk.ru> <mjt@gandalf>
>=20
> I can't find these two in git-log.

$ git log -1 eb83c2030a
commit eb83c2030aa037b4c6037bfa3cbe181343dc6a8b
Author:     Changlong Xie <xiecl.fnst@cn.fujitsu.com>
AuthorDate: Mon Jul 25 11:48:00 2016 +0800
Commit:     Michael Tokarev <mjt@gandalf>
CommitDate: Tue Sep 13 18:12:34 2016 +0300

$ git log -1 572992eefa
commit 572992eefa74bfb92c24a28bd268de91a9311b0f
Author:     Alex Williamson <alex.williamson@redhat.com>
AuthorDate: Thu Jun 14 12:16:57 2012 -0600
Commit:     Michael S. Tsirkin <mst@robin.(none)>
CommitDate: Mon Jun 18 10:21:12 2012 +0300

>>   Munkyu Im <munkyu.im@samsung.com>
>>   Nicholas Bellinger <nab@linux-iscsi.org>
>>   Nicholas Thomas <nick@bytemark.co.uk>
>>   Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>
>>   Orit Wasserman <owasserm@redhat.com>
>> +Pan Nengyuan <pannengyuan@huawei.com>
>>   Paolo Bonzini <pbonzini@redhat.com>
>>   Pavel Dovgaluk <dovgaluk@ispras.ru>
>>   Pavel Dovgaluk <pavel.dovgaluk@gmail.com>
>> @@ -124,15 +142,23 @@ Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>
>>   Peter Crosthwaite <crosthwaite.peter@gmail.com>
>>   Peter Crosthwaite <peter.crosthwaite@petalogix.com>
>>   Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>> +Peter Maydell <peter.maydell@linaro.org> <petmay01@cam-vm-266.(none)>
>=20
> I can't find this one in git-log.

$ git log -1 0d4abda8f7
commit 0d4abda8f7328c8911c1d020bb6961650eaf7801
Author:     Peter Maydell <peter.maydell@linaro.org>
AuthorDate: Fri Jul 20 13:34:49 2012 +0100
Commit:     Peter Maydell <petmay01@cam-vm-266.(none)>
CommitDate: Fri Jul 20 13:34:49 2012 +0100

     hw/pl011.c: Avoid crash on read when no chr backend present

>>   Prasad J Pandit <pjp@fedoraproject.org>
>>   Prasad J Pandit <ppandit@redhat.com>
>>   Qiao Nuohan <qiaonuohan@cn.fujitsu.com>
>>   Reimar D=C3=B6ffinger <Reimar.Doeffinger@gmx.de>
>>   Remy Noel <remy.noel@blade-group.com>
>> +Richard Henderson <rth@twiddle.net> <rth@anchor.twiddle.home>
>>   Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>   Shin'ichiro Kawasaki <kawasaki@juno.dti.ne.jp>
>>   Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
>> +Siwei Zhuang <siwei.zhuang@data61.csiro.au>
>=20
> It's actually spelled Siwei.Zhuang@data61.csiro.au in git-log.
> Shouldn't matter.

Correct:

$ git shortlog -e 6478dd745d~..6478dd745d
Zhuang, Siwei (Data61, Kensington NSW) <Siwei.Zhuang@data61.csiro.au> (1):
       hw/riscv: Add optional symbol callback ptr to riscv_load_kernel()

$ git shortlog -e 6478dd745d~..6478dd745d
Siwei Zhuang <Siwei.Zhuang@data61.csiro.au> (1):
       hw/riscv: Add optional symbol callback ptr to riscv_load_kernel()

Thanks for caring checking all entries!

>> +Sochin Jiang <sochin@aliyun.com>
>>   Sochin Jiang <sochin.jiang@huawei.com>
>> +Stefan Berger <stefanb@linux.ibm.com> <Stefan Berger stefanb@linux.vnet=
.ibm.com>
>> +Stefan Weil <sw@weilnetz.de> <stefan@kiwi.(none)>
>> +Stefan Weil <sw@weilnetz.de> <stefan@weilnetz.de>
>> +Stefan Weil <sw@weilnetz.de> <weil@mail.berlios.de>
>>   Takashi Yoshii <takasi-y@ops.dti.ne.jp>
>>   Thomas Huth <thuth@redhat.com>
>>   Thomas Knych <thomaswk@google.com>
>> @@ -150,6 +176,7 @@ Wenshuang Ma <kevinnma@tencent.com>
>>   Xiaoqiang Zhao <zxq_yx_007@163.com>
>>   Xinhua Cao <caoxinhua@huawei.com>
>>   Xiong Zhang <xiong.y.zhang@intel.com>
>> +Ying Fang <fangying1@huawei.com>
>>   Yin Yin <yin.yin@cs2c.com.cn>
>>   yuchenlin <npes87184@gmail.com>
>>   YunQiang Su <syq@debian.org>
>


