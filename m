Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XyLTB-0006b3-AF
	for mharc-qemu-trivial@gnu.org; Tue, 09 Dec 2014 09:08:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XyLT3-0006PW-6w
	for qemu-trivial@nongnu.org; Tue, 09 Dec 2014 09:08:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XyLSx-0005xy-P5
	for qemu-trivial@nongnu.org; Tue, 09 Dec 2014 09:08:45 -0500
Received: from mail-wg0-x233.google.com ([2a00:1450:400c:c00::233]:40701)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1XyLSm-0005vv-D5; Tue, 09 Dec 2014 09:08:28 -0500
Received: by mail-wg0-f51.google.com with SMTP id x12so897392wgg.38
	for <multiple recipients>; Tue, 09 Dec 2014 06:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=RiIDDWd2cmLjSe2yIAp49ftwMtTME49dhHCTn0tj/OA=;
	b=sQNsyzfTCcSAJlcKXc7a876k1ppSrVhxoWgs0gWpyYIQWxHt4KkYuVoVE1PB91ELzi
	b8iMPo32YOK5+aS7k2LdF131kmuINDQGLS0+HUGUo2diYNI7rsHU2nHefkXPqTkCQ7fB
	L8Ew9sEf0fu/I8WEdNS2WMkdGTZy4hx8g9Cn8xp7f7PHHvR4ub7j5sg2ivlJbRZqrpfL
	MoAcTvJMDWxN/SD6P7Roi7HmL/ZbKProEWCxf0kQniWmrEzUP07Wc3K3HYTJDfNrK9qD
	pc8TSB7HLvkdSdZzCDElluzcjmviMGPYB3KgHOabbNWIFih50ExUThot65NkGr8fl3Rf
	LYvg==
X-Received: by 10.180.97.196 with SMTP id ec4mr4567995wib.71.1418134106946;
	Tue, 09 Dec 2014 06:08:26 -0800 (PST)
Received: from [192.168.10.150] (net-93-146-133-240.cust.vodafonedsl.it.
	[93.146.133.240])
	by mx.google.com with ESMTPSA id p15sm1899728wjr.18.2014.12.09.06.08.24
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 06:08:25 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <54870257.4070902@redhat.com>
Date: Tue, 09 Dec 2014 15:08:23 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
References: <1418109359-2364-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1418109359-2364-1-git-send-email-zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::233
Cc: sw@weilnetz.de, armbru@redhat.com, qemu-devel@nongnu.org, afaerber@suse.de,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH v2] vt82c686: fix coverity warning about
 out-of-bounds write
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
X-List-Received-Date: Tue, 09 Dec 2014 14:08:50 -0000



On 09/12/2014 08:15, zhanghailiang wrote:
> Refactor superio_ioport_writeb to fix the out of bounds write warning.
> 
> In addition, fix two typos: s/chage/change/
> 
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  - using bool instead of int for can_write as suggested by Stefan Weil
>  - fix two typos: s/chage/change
> ---
>  hw/isa/vt82c686.c | 41 +++++++++++++++++++----------------------
>  1 file changed, 19 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index e0c235c..6c00f22 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -50,13 +50,13 @@ typedef struct VT82C686BState {
>  static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
>                                    unsigned size)
>  {
> -    int can_write;
>      SuperIOConfig *superio_conf = opaque;
>  
>      DPRINTF("superio_ioport_writeb  address 0x%x  val 0x%x\n", addr, data);
>      if (addr == 0x3f0) {
>          superio_conf->index = data & 0xff;
>      } else {
> +        bool can_write = true;
>          /* 0x3f1 */
>          switch (superio_conf->index) {
>          case 0x00 ... 0xdf:
> @@ -68,30 +68,27 @@ static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
>          case 0xf7:
>          case 0xf9 ... 0xfb:
>          case 0xfd ... 0xff:
> -            can_write = 0;
> +            can_write = false;
>              break;
> -        default:
> -            can_write = 1;
> -
> -            if (can_write) {
> -                switch (superio_conf->index) {
> -                case 0xe7:
> -                    if ((data & 0xff) != 0xfe) {
> -                        DPRINTF("chage uart 1 base. unsupported yet\n");
> -                    }
> -                    break;
> -                case 0xe8:
> -                    if ((data & 0xff) != 0xbe) {
> -                        DPRINTF("chage uart 2 base. unsupported yet\n");
> -                    }
> -                    break;
> -
> -                default:
> -                    superio_conf->config[superio_conf->index] = data & 0xff;
> -                }
> +        case 0xe7:
> +            if ((data & 0xff) != 0xfe) {
> +                DPRINTF("change uart 1 base. unsupported yet\n");
> +                can_write = false;
> +            }
> +            break;
> +        case 0xe8:
> +            if ((data & 0xff) != 0xbe) {
> +                DPRINTF("change uart 2 base. unsupported yet\n");
> +                can_write = false;
>              }
> +            break;
> +        default:
> +            break;
> +
> +        }
> +        if (can_write == true) {

Michael, can you remove "== true" when applying this patch?

Thanks,

Paolo

> +            superio_conf->config[superio_conf->index] = data & 0xff;
>          }
> -        superio_conf->config[superio_conf->index] = data & 0xff;
>      }
>  }
>  
> 

