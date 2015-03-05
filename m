Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTLWS-00008p-ID
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 21:28:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YTLWP-00007m-G4
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 21:28:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YTLWM-0003Mj-86
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 21:28:21 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:59993)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YTLWJ-0003Kw-Pk; Wed, 04 Mar 2015 21:28:18 -0500
Received: from 172.24.2.119 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CKI12339; Thu, 05 Mar 2015 10:28:03 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.158.1; Thu, 5 Mar 2015
	10:26:39 +0800
Message-ID: <54F7BEC9.1060204@huawei.com>
Date: Thu, 5 Mar 2015 10:26:17 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
	<1425023419-12244-3-git-send-email-arei.gonglei@huawei.com>
	<54F705B0.8040308@msgid.tls.msk.ru>
In-Reply-To: <54F705B0.8040308@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, peter.huangpeng@huawei.com,
	armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 2/9] arm: fix memory leak
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
X-List-Received-Date: Thu, 05 Mar 2015 02:28:22 -0000

On 2015/3/4 21:16, Michael Tokarev wrote:
> 27.02.2015 10:50, arei.gonglei@huawei.com wrote:
> []
>> @@ -565,6 +565,7 @@ static void create_flash(const VirtBoardInfo *vbi)
>>              error_report("Could not load ROM image '%s'", bios_name);
>>              exit(1);
>>          }
>> +        g_free(fn);
>>      }
>>  
>>      create_one_flash("virt.flash0", flashbase, flashsize);
>>
> 
> This change introduces a compiler error:
> 
> hw/arm/virt.c: In function ‘create_flash’:
> hw/arm/virt.c:568:16: error: passing argument 1 of ‘g_free’ discards ‘const’ qualifier from pointer target type [-Werror]
>          g_free(fn);
>                 ^
> /usr/include/glib-2.0/glib/gmem.h:69:7: note: expected ‘gpointer’ but argument is of type ‘const char *’
>  void  g_free           (gpointer  mem);
>        ^
> 
> This is because just a few lines above, `fn' variable
> is declared as `const char *', which obviously should
> not be used with any *free() functions.
> 
Yes, and I found another similar problem in
 [PATCH 9/9] microblaze: fix memory leak
which you had pulled, maybe make sense wait a minuter.
Sorry for this.
> The solution is to remove `const' from the variable
> declaration.
> 
Correct.
> And a much more general solution is to actually test
> patches before submitting them.  You obviously did not
> test this series, having 3 errors in 9 patches, ie,
> 1/3 of your patches does not work...
> 
Apologize earnestly for troubling you. :(

I just thought they are so trivial, meanwhile I hadn't arm compiling environment (lack of
libfdt-dev), and assigned "--target-list=x86_64-softmmu" that moment.

Regards,
-Gonglei



