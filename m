Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1isUrz-0002rQ-ON
	for mharc-qemu-trivial@gnu.org; Fri, 17 Jan 2020 11:53:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48792)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pmathieu@redhat.com>) id 1isUru-0002kH-Mt
 for qemu-trivial@nongnu.org; Fri, 17 Jan 2020 11:53:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pmathieu@redhat.com>) id 1isUrr-0002UJ-86
 for qemu-trivial@nongnu.org; Fri, 17 Jan 2020 11:53:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41846
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1isUrr-0002Tb-4U
 for qemu-trivial@nongnu.org; Fri, 17 Jan 2020 11:53:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579279986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R0s1e3wFZuSI2imvfqdX57mYUhYsVNZnyzDn5sVcg1E=;
 b=Nae+qFWab3PVywzqwaXIHmobT9DoWQT7O646e3jIVcaqlvb8aOpil3oSJwG9aFHPD/Xt53
 Eg/z2voHKND9vyc7+7QRFSqQgx+QNwPiXHl8XYGs2V4bbSjfmgrI+SvGzBcDKjI/0eyTYG
 po47UUSzDXSy5njnzK6lS9bjrpdDbUI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-VV5Ok63oMxKsjT0GilL6eQ-1; Fri, 17 Jan 2020 11:53:04 -0500
Received: by mail-wr1-f69.google.com with SMTP id f10so10783107wro.14
 for <qemu-trivial@nongnu.org>; Fri, 17 Jan 2020 08:53:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R0s1e3wFZuSI2imvfqdX57mYUhYsVNZnyzDn5sVcg1E=;
 b=IHGIe6grG0HDIoxOgLzgHz+SM9uyO+l8CwW8itd7qimMtLkxAxjKItphEHw5X6AaOr
 C+Dt+ITVYhAxS8asTmIk+1S7TEjzgpjnCjG8rLKSV/Q9aSdlf+LqebJT/2WuYudHMbLu
 ksr2paIcVCZBoAMYPvJmun98dUdRlCxzniE3XFUztInK4XrND4aJ32vzXCMFXfVLC2FW
 9LC42y6GT82iPW68qEboJGD23NAfinxxQfs9z4TMzTqdqjE2vjERlqmPZ23b8uCYddKp
 yLfJBrvnFY5xWZBUKgTGCu4/4d0de6biPJDgf6MByMcUFQW+PG/pcKOooT9Lsg4GmyHu
 W7iw==
X-Gm-Message-State: APjAAAXBdDAfxadmR/nWr/YI6sXpHgh8a2l3OvaVRcwPh83KcjbccRqy
 KtJ7ISFyagrh5t5xue5khxliclfpK+YgkHkedXqyi43bmM2o1HvE3VrrWmAOufz1FC6g+GMJlKq
 wVTL4lU+ZMDAldhA28Nq4C03uRJM6VFGLSg==
X-Received: by 2002:adf:dd8a:: with SMTP id x10mr4244845wrl.117.1579279983281; 
 Fri, 17 Jan 2020 08:53:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqzcWtQin4vqaFBczq8lv2wKBnbOKg44p8M3NxW0ZY183aX4b1UNYq0jHC050n+rLkr84QSlvXdJrcyURQa13qU=
X-Received: by 2002:adf:dd8a:: with SMTP id x10mr4244821wrl.117.1579279983046; 
 Fri, 17 Jan 2020 08:53:03 -0800 (PST)
MIME-Version: 1.0
References: <20191218185723.7738-1-philmd@redhat.com>
In-Reply-To: <20191218185723.7738-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Fri, 17 Jan 2020 17:52:51 +0100
Message-ID: <CAP+75-UOLktsv95POJ_0_etdYGfonvJ_zub0VQv9eQA+W20o5A@mail.gmail.com>
Subject: Re: [PATCH] mailmap: Add more entries to sanitize 'git log' output
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
X-MC-Unique: VV5Ok63oMxKsjT0GilL6eQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Fri, 17 Jan 2020 16:53:14 -0000

ping?

On Wed, Dec 18, 2019 at 7:57 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Most of these developers have the Signed-off-by tag properly
> written, but not the author/commiter name. Fix this.
> Also we incorrectly wrote Arei Gonglei name, update and reorder.
>
> git-log does not use this file by default until you specify the
> --use-mailmap flag:
>
>   $ git log --use-mailmap
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  .mailmap | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/.mailmap b/.mailmap
> index 3816e4effe..1a859d9e65 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -56,6 +56,10 @@ Aaron Lindsay <aaron@os.amperecomputing.com>
>  Alexey Gerasimenko <x1917x@gmail.com>
>  Alex Ivanov <void@aleksoft.net>
>  Andreas F=C3=A4rber <afaerber@suse.de>
> +Andreas F=C3=A4rber <andreas.faerber@web.de>
> +Andreas F=C3=A4rber <andreas.faerber@web.de> <andreas.faerber>
> +Arei Gonglei <arei.gonglei@huawei.com>
> +Arei Gonglei <arei.gonglei@huawei.com> <root@ceth6.(none)>
>  Bandan Das <bsd@redhat.com>
>  Benjamin MARSILI <mlspirat42@gmail.com>
>  Beno=C3=AEt Canet <benoit.canet@gmail.com>
> @@ -67,27 +71,36 @@ Brad Smith <brad@comstyle.com>
>  Brijesh Singh <brijesh.singh@amd.com>
>  Brilly Wu <brillywu@viatech.com.cn>
>  C=C3=A9dric Vincent <cedric.vincent@st.com>
> +Chai Wen <chaiw.fnst@cn.fujitsu.com>
> +Chaojian Hu <chaojianhu@hotmail.com>
>  CheneyLin <linzc@zju.edu.cn>
> +Chen Fan <chen.fan.fnst@cn.fujitsu.com>
>  Chen Gang <chengang@emindsoft.com.cn>
>  Chen Gang <gang.chen.5i5j@gmail.com>
>  Chen Gang <gang.chen@sunrus.com.cn>
>  Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
>  Christophe Lyon <christophe.lyon@st.com>
> +Christoph Hellwig <hch@lst.de>
>  Collin L. Walling <walling@linux.ibm.com>
>  Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> +Disheng Su <edison@cloud.com>
> +Dunrong Huang <riegamaths@gmail.com>
>  Eduardo Otubo <otubo@redhat.com>
>  Fabrice Desclaux <fabrice.desclaux@cea.fr>
>  Fernando Luis V=C3=A1zquez Cao <fernando_b1@lab.ntt.co.jp>
>  Fernando Luis V=C3=A1zquez Cao <fernando@oss.ntt.co.jp>
>  Gautham R. Shenoy <ego@in.ibm.com>
>  Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> -Gonglei (Arei) <arei.gonglei@huawei.com>
>  Guang Wang <wang.guang55@zte.com.cn>
>  Hailiang Zhang <zhang.zhanghailiang@huawei.com>
>  Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> +Hiroyuki Obinata <hiroyuki.obinata@gmail.com>
>  Jakub Jerm=C3=A1=C5=99 <jakub@jermar.eu>
>  Jakub Jerm=C3=A1=C5=99 <jakub.jermar@kernkonzept.com>
> +Jay Zhou <jianjay.zhou@huawei.com>
>  Jean-Christophe Dubois <jcd@tribudubois.net>
> +Jean-Christophe Dubois <jcd@tribudubois.net> <jcd@jcd-laptop.(none)>
> +Jia Lina <jialina01@baidu.com>
>  Jind=C5=99ich Makovi=C4=8Dka <makovick@gmail.com>
>  John Arbuckle <programmingkidx@gmail.com>
>  Juha Riihim=C3=A4ki <juha.riihimaki@nokia.com>
> @@ -96,9 +109,11 @@ Jun Li <junmuzi@gmail.com>
>  Laurent Vivier <Laurent@lvivier.info>
>  Leandro Lupori <leandro.lupori@gmail.com>
>  Li Guang <lig.fnst@cn.fujitsu.com>
> +Lili Huang <huanglili.huang@huawei.com>
>  Liming Wang <walimisdev@gmail.com>
>  linzhecheng <linzc@zju.edu.cn>
>  Liran Schour <lirans@il.ibm.com>
> +Li Tianqing <tianqing@unitedstack.com>
>  Liu Yu <yu.liu@freescale.com>
>  Liu Yu <Yu.Liu@freescale.com>
>  Li Zhang <zhlcindy@gmail.com>
> @@ -112,11 +127,14 @@ Marc Mar=C3=AD <marc.mari.barcelo@gmail.com>
>  Marc Mar=C3=AD <markmb@redhat.com>
>  Michael Avdienko <whitearchey@gmail.com>
>  Michael S. Tsirkin <mst@redhat.com>
> +Michael S. Tsirkin <mst@redhat.com> <mst@robin.(none)>
> +Michael Tokarev <mjt@tls.msk.ru> <mjt@gandalf>
>  Munkyu Im <munkyu.im@samsung.com>
>  Nicholas Bellinger <nab@linux-iscsi.org>
>  Nicholas Thomas <nick@bytemark.co.uk>
>  Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>
>  Orit Wasserman <owasserm@redhat.com>
> +Pan Nengyuan <pannengyuan@huawei.com>
>  Paolo Bonzini <pbonzini@redhat.com>
>  Pavel Dovgaluk <dovgaluk@ispras.ru>
>  Pavel Dovgaluk <pavel.dovgaluk@gmail.com>
> @@ -124,15 +142,23 @@ Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>
>  Peter Crosthwaite <crosthwaite.peter@gmail.com>
>  Peter Crosthwaite <peter.crosthwaite@petalogix.com>
>  Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> +Peter Maydell <peter.maydell@linaro.org> <petmay01@cam-vm-266.(none)>
>  Prasad J Pandit <pjp@fedoraproject.org>
>  Prasad J Pandit <ppandit@redhat.com>
>  Qiao Nuohan <qiaonuohan@cn.fujitsu.com>
>  Reimar D=C3=B6ffinger <Reimar.Doeffinger@gmx.de>
>  Remy Noel <remy.noel@blade-group.com>
> +Richard Henderson <rth@twiddle.net> <rth@anchor.twiddle.home>
>  Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>  Shin'ichiro Kawasaki <kawasaki@juno.dti.ne.jp>
>  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> +Siwei Zhuang <siwei.zhuang@data61.csiro.au>
> +Sochin Jiang <sochin@aliyun.com>
>  Sochin Jiang <sochin.jiang@huawei.com>
> +Stefan Berger <stefanb@linux.ibm.com> <Stefan Berger stefanb@linux.vnet.=
ibm.com>
> +Stefan Weil <sw@weilnetz.de> <stefan@kiwi.(none)>
> +Stefan Weil <sw@weilnetz.de> <stefan@weilnetz.de>
> +Stefan Weil <sw@weilnetz.de> <weil@mail.berlios.de>
>  Takashi Yoshii <takasi-y@ops.dti.ne.jp>
>  Thomas Huth <thuth@redhat.com>
>  Thomas Knych <thomaswk@google.com>
> @@ -150,6 +176,7 @@ Wenshuang Ma <kevinnma@tencent.com>
>  Xiaoqiang Zhao <zxq_yx_007@163.com>
>  Xinhua Cao <caoxinhua@huawei.com>
>  Xiong Zhang <xiong.y.zhang@intel.com>
> +Ying Fang <fangying1@huawei.com>
>  Yin Yin <yin.yin@cs2c.com.cn>
>  yuchenlin <npes87184@gmail.com>
>  YunQiang Su <syq@debian.org>
> --
> 2.21.0
>


