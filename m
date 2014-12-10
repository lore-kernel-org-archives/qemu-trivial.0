Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xydel-0006Ax-Nk
	for mharc-qemu-trivial@gnu.org; Wed, 10 Dec 2014 04:34:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Xydee-0005yj-U3
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 04:34:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XydeY-0006IU-Oh
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 04:33:56 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:34445)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XydeX-0006I0-VB; Wed, 10 Dec 2014 04:33:50 -0500
Received: from 172.24.2.119 (EHLO szxeml422-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AYM43367; Wed, 10 Dec 2014 17:33:33 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml422-hub.china.huawei.com
	(10.82.67.161) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 10 Dec 2014 17:31:20 +0800
Message-ID: <548812E5.6040809@huawei.com>
Date: Wed, 10 Dec 2014 17:31:17 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, <qemu-devel@nongnu.org>
References: <1418203056-5365-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1418203056-5365-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.54881372.0034, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: fe2fe58975d0bbbe319bfdb9267cb43b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH] vt82c686: avoid out-of-bounds read
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
X-List-Received-Date: Wed, 10 Dec 2014 09:34:03 -0000

Hi paolo,

Will this change affects the migration?
I noticed that there is a member 'SuperIOConfig superio_conf' in VT82C686BState.

vt82c686 seems only to be used in mips64el target, Do we support migration for mips target?

Thanks,
zhanghailiang

On 2014/12/10 17:17, Paolo Bonzini wrote:
> superio_ioport_readb can read the 256th element of the array.
> Coverity reports an out-of-bounds write in superio_ioport_writeb,
> but it does not show the corresponding out-of-bounds read
> because it cannot prove that it can happen.  Fix the root
> cause of the problem (zhanghailang's patch instead fixes
> the logic in superio_ioport_writeb).
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hw/isa/vt82c686.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index e0c235c..a43e26d 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -36,7 +36,7 @@
>
>   typedef struct SuperIOConfig
>   {
> -    uint8_t config[0xff];
> +    uint8_t config[0x100];
>       uint8_t index;
>       uint8_t data;
>   } SuperIOConfig;
>



