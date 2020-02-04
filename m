Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iz3BA-0001IL-8b
	for mharc-qemu-trivial@gnu.org; Tue, 04 Feb 2020 13:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52175)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iz3B6-000168-8Z
 for qemu-trivial@nongnu.org; Tue, 04 Feb 2020 13:44:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iz3B4-0001Fi-8b
 for qemu-trivial@nongnu.org; Tue, 04 Feb 2020 13:44:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46690
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iz3B4-0001BF-3a
 for qemu-trivial@nongnu.org; Tue, 04 Feb 2020 13:44:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580841841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=msaZ0sE2Bj0NZ0bsTzY0GDVNGQxjNF3J3LnjRUgJ8TA=;
 b=gvBFUYh8Bu3d4nuYTOnAbs730EJ5+G/ybp6NL379mdOTOEDuG7rj8agdquH7lDKHm1/oWk
 jEiRIeSuusM2Rbk2rqcPelo8z7v/+0BKqrlZcj9/ip2d5UtSEbjxbS9+5sgLUsQa9MZ5y0
 GRJuOSs8D/yMGwgB2yeU8O3vCG5Tsos=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-0ioo7cvSOHG5OgLxru6UoQ-1; Tue, 04 Feb 2020 13:43:59 -0500
Received: by mail-wm1-f70.google.com with SMTP id 7so1831402wmf.9
 for <qemu-trivial@nongnu.org>; Tue, 04 Feb 2020 10:43:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b7yQ41U6FDyAIELOpak0CVYy8imSizYpuoN48Jn5zW4=;
 b=RSVsJTdGUe7kyKZhJKD8xKp89a6VacLsNJ94LPwqQSHQkAGGrVXeoamuRxIBHgMpwb
 B/kVarBwPrONy9SuPMKvse56P2065q9uiorO6QEFCxGkgp2VHMm5avd7jxWrEgtIgWJo
 DJCUfEBW71w6w4+qC6u1tpb+lUWfAZDAkWvHs3CQJ6w7vG/yZ7RDHpcmS7Ke2nvo/+a8
 RKCdQ521w42DiLNXYC9dUf/fvc+w9WUfb7W1p9KpX/Kges3V+WYtOaM0PZP122W/eZE/
 sZs6U8QPaotHwFz8R07x3WvmRVLXe81lqDow6VJ0o+PYcub9bBvXb41GWZNBfcDsRXHe
 8xKA==
X-Gm-Message-State: APjAAAXAcMQ7I1rEFEBXI+7L7hOl+nAQtVzW2/iJntou6xDDhW3u3yfQ
 tS+0FbuJNYkEQ71B3q1gI3vLzv6C+IO+4TzL6B4zhDD9aPB2zVDWfLtCgfYC6rJDVof8xl+AF+n
 ouYNioMqx5sJvqnMJjg==
X-Received: by 2002:a05:600c:291e:: with SMTP id
 i30mr444159wmd.40.1580841838202; 
 Tue, 04 Feb 2020 10:43:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqwHV/jg+jtpa93E+4Y1yGeka8ekLdezaqI6tqdbfKgAkz8W4+lgcADePFSZ9M6noyMhB840oA==
X-Received: by 2002:a05:600c:291e:: with SMTP id
 i30mr444145wmd.40.1580841837986; 
 Tue, 04 Feb 2020 10:43:57 -0800 (PST)
Received: from [192.168.1.35] (162.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.162])
 by smtp.gmail.com with ESMTPSA id y139sm4902484wmd.24.2020.02.04.10.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2020 10:43:57 -0800 (PST)
Subject: Re: [PATCH v2] mailmap: Add more entries to sanitize 'git log' output
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Marek Dolata <mkdolata@us.ibm.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20200118143202.29187-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c6d85e2c-33bc-d479-2555-668a2d55df72@redhat.com>
Date: Tue, 4 Feb 2020 19:43:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200118143202.29187-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: 0ioo7cvSOHG5OgLxru6UoQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Tue, 04 Feb 2020 18:44:06 -0000

ping?

On 1/18/20 3:32 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Most of these developers have the Signed-off-by tag properly
> written, but not the author/committer name. Fix this.
> Also we incorrectly wrote Arei Gonglei name, update and reorder.
>=20
> The committer name/email is displayed when using:
>=20
>    $ git log --format=3Dfuller
>=20
> (which can be set in git-config setting format.pretty=3Dfuller).
>=20
> Example of commits with miswritten committer email:
>    3b08098b40 76349f5ba8 eb83c2030a 572992eefa 0d4abda8f7
>=20
> Note: git-log does not use this file by default until you specify
> the --use-mailmap flag:
>=20
>    $ git log --use-mailmap
>=20
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2:
> - Added Marek Dolata (commit 5a07192a0)
> - Describe git-log --format=3Dfuller
> - Added Markus R-b
> ---
>   .mailmap | 30 +++++++++++++++++++++++++++++-
>   1 file changed, 29 insertions(+), 1 deletion(-)
>=20
> diff --git a/.mailmap b/.mailmap
> index 3816e4effe..cf981a3ec0 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -56,6 +56,10 @@ Aaron Lindsay <aaron@os.amperecomputing.com>
>   Alexey Gerasimenko <x1917x@gmail.com>
>   Alex Ivanov <void@aleksoft.net>
>   Andreas F=C3=A4rber <afaerber@suse.de>
> +Andreas F=C3=A4rber <andreas.faerber@web.de>
> +Andreas F=C3=A4rber <andreas.faerber@web.de> <andreas.faerber>
> +Arei Gonglei <arei.gonglei@huawei.com>
> +Arei Gonglei <arei.gonglei@huawei.com> <root@ceth6.(none)>
>   Bandan Das <bsd@redhat.com>
>   Benjamin MARSILI <mlspirat42@gmail.com>
>   Beno=C3=AEt Canet <benoit.canet@gmail.com>
> @@ -67,27 +71,36 @@ Brad Smith <brad@comstyle.com>
>   Brijesh Singh <brijesh.singh@amd.com>
>   Brilly Wu <brillywu@viatech.com.cn>
>   C=C3=A9dric Vincent <cedric.vincent@st.com>
> +Chai Wen <chaiw.fnst@cn.fujitsu.com>
> +Chaojian Hu <chaojianhu@hotmail.com>
>   CheneyLin <linzc@zju.edu.cn>
> +Chen Fan <chen.fan.fnst@cn.fujitsu.com>
>   Chen Gang <chengang@emindsoft.com.cn>
>   Chen Gang <gang.chen.5i5j@gmail.com>
>   Chen Gang <gang.chen@sunrus.com.cn>
>   Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
>   Christophe Lyon <christophe.lyon@st.com>
> +Christoph Hellwig <hch@lst.de>
>   Collin L. Walling <walling@linux.ibm.com>
>   Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> +Disheng Su <edison@cloud.com>
> +Dunrong Huang <riegamaths@gmail.com>
>   Eduardo Otubo <otubo@redhat.com>
>   Fabrice Desclaux <fabrice.desclaux@cea.fr>
>   Fernando Luis V=C3=A1zquez Cao <fernando_b1@lab.ntt.co.jp>
>   Fernando Luis V=C3=A1zquez Cao <fernando@oss.ntt.co.jp>
>   Gautham R. Shenoy <ego@in.ibm.com>
>   Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> -Gonglei (Arei) <arei.gonglei@huawei.com>
>   Guang Wang <wang.guang55@zte.com.cn>
>   Hailiang Zhang <zhang.zhanghailiang@huawei.com>
>   Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> +Hiroyuki Obinata <hiroyuki.obinata@gmail.com>
>   Jakub Jerm=C3=A1=C5=99 <jakub@jermar.eu>
>   Jakub Jerm=C3=A1=C5=99 <jakub.jermar@kernkonzept.com>
> +Jay Zhou <jianjay.zhou@huawei.com>
>   Jean-Christophe Dubois <jcd@tribudubois.net>
> +Jean-Christophe Dubois <jcd@tribudubois.net> <jcd@jcd-laptop.(none)>
> +Jia Lina <jialina01@baidu.com>
>   Jind=C5=99ich Makovi=C4=8Dka <makovick@gmail.com>
>   John Arbuckle <programmingkidx@gmail.com>
>   Juha Riihim=C3=A4ki <juha.riihimaki@nokia.com>
> @@ -96,9 +109,11 @@ Jun Li <junmuzi@gmail.com>
>   Laurent Vivier <Laurent@lvivier.info>
>   Leandro Lupori <leandro.lupori@gmail.com>
>   Li Guang <lig.fnst@cn.fujitsu.com>
> +Lili Huang <huanglili.huang@huawei.com>
>   Liming Wang <walimisdev@gmail.com>
>   linzhecheng <linzc@zju.edu.cn>
>   Liran Schour <lirans@il.ibm.com>
> +Li Tianqing <tianqing@unitedstack.com>
>   Liu Yu <yu.liu@freescale.com>
>   Liu Yu <Yu.Liu@freescale.com>
>   Li Zhang <zhlcindy@gmail.com>
> @@ -110,13 +125,17 @@ Luc Michel <luc.michel@git.antfield.fr>
>   Luc Michel <luc.michel@greensocs.com>
>   Marc Mar=C3=AD <marc.mari.barcelo@gmail.com>
>   Marc Mar=C3=AD <markmb@redhat.com>
> +Marek Dolata <mkdolata@us.ibm.com>
>   Michael Avdienko <whitearchey@gmail.com>
>   Michael S. Tsirkin <mst@redhat.com>
> +Michael S. Tsirkin <mst@redhat.com> <mst@robin.(none)>
> +Michael Tokarev <mjt@tls.msk.ru> <mjt@gandalf>
>   Munkyu Im <munkyu.im@samsung.com>
>   Nicholas Bellinger <nab@linux-iscsi.org>
>   Nicholas Thomas <nick@bytemark.co.uk>
>   Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>
>   Orit Wasserman <owasserm@redhat.com>
> +Pan Nengyuan <pannengyuan@huawei.com>
>   Paolo Bonzini <pbonzini@redhat.com>
>   Pavel Dovgaluk <dovgaluk@ispras.ru>
>   Pavel Dovgaluk <pavel.dovgaluk@gmail.com>
> @@ -124,15 +143,23 @@ Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>
>   Peter Crosthwaite <crosthwaite.peter@gmail.com>
>   Peter Crosthwaite <peter.crosthwaite@petalogix.com>
>   Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> +Peter Maydell <peter.maydell@linaro.org> <petmay01@cam-vm-266.(none)>
>   Prasad J Pandit <pjp@fedoraproject.org>
>   Prasad J Pandit <ppandit@redhat.com>
>   Qiao Nuohan <qiaonuohan@cn.fujitsu.com>
>   Reimar D=C3=B6ffinger <Reimar.Doeffinger@gmx.de>
>   Remy Noel <remy.noel@blade-group.com>
> +Richard Henderson <rth@twiddle.net> <rth@anchor.twiddle.home>
>   Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>   Shin'ichiro Kawasaki <kawasaki@juno.dti.ne.jp>
>   Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> +Siwei Zhuang <Siwei.Zhuang@data61.csiro.au>
> +Sochin Jiang <sochin@aliyun.com>
>   Sochin Jiang <sochin.jiang@huawei.com>
> +Stefan Berger <stefanb@linux.ibm.com> <Stefan Berger stefanb@linux.vnet.=
ibm.com>
> +Stefan Weil <sw@weilnetz.de> <stefan@kiwi.(none)>
> +Stefan Weil <sw@weilnetz.de> <stefan@weilnetz.de>
> +Stefan Weil <sw@weilnetz.de> <weil@mail.berlios.de>
>   Takashi Yoshii <takasi-y@ops.dti.ne.jp>
>   Thomas Huth <thuth@redhat.com>
>   Thomas Knych <thomaswk@google.com>
> @@ -150,6 +177,7 @@ Wenshuang Ma <kevinnma@tencent.com>
>   Xiaoqiang Zhao <zxq_yx_007@163.com>
>   Xinhua Cao <caoxinhua@huawei.com>
>   Xiong Zhang <xiong.y.zhang@intel.com>
> +Ying Fang <fangying1@huawei.com>
>   Yin Yin <yin.yin@cs2c.com.cn>
>   yuchenlin <npes87184@gmail.com>
>   YunQiang Su <syq@debian.org>
>=20


