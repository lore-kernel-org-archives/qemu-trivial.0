Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i167q-0000lq-Si
	for mharc-qemu-trivial@gnu.org; Fri, 23 Aug 2019 05:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54919)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i167n-0000lW-Iy
 for qemu-trivial@nongnu.org; Fri, 23 Aug 2019 05:44:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i167k-0004Jx-5J
 for qemu-trivial@nongnu.org; Fri, 23 Aug 2019 05:44:51 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:43811)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1i167j-0004JZ-Uf; Fri, 23 Aug 2019 05:44:48 -0400
Received: by mail-oi1-x241.google.com with SMTP id y8so6549390oih.10;
 Fri, 23 Aug 2019 02:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=5khhwLdTUzd4zj+bV+ZHTZ6XOoMItgHvmQkOqcekUPU=;
 b=ccY1tJ01PcA8T8iH/0rdM/FZzYkzShwy8Kf2YWssrAKyYJRIs1nONOwi9wqK0Usfxc
 9a6VxWZm5Wo94S/BmRJWrRo2bwk945CEcNPQAqtYKfTjYerO2qghnKY5k62iCl+u4qAs
 6TvM0QFVvDmHY+Yt1HkSsqJu+ghVY4NTnWMkL3Q/jezohmzkzw42AfK1m9ZjFOwnkpV3
 eqWNd9tX/9AGkILkcKomfniKp8M5UiPCZUaIAZty94Fdw5Y2GpXaTFugQYnbjV42QtF8
 URNYjGlLAFRgqTlUnzlfYHF+ael28cwgtA4fBckCnLRP/uu2KyaUf24FD4HRZB0atwDR
 Ibrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=5khhwLdTUzd4zj+bV+ZHTZ6XOoMItgHvmQkOqcekUPU=;
 b=UmWOr8Xb1ZPztsxQN7zm/kt6tzyItfcfn5/WOeuIPIFygFcDOoh8XQxybUZTa0wAcv
 asD7I9qrDqg9RzWqO2TZVYgcZ9A/Ckyi4fprPb/0vsx+uMynLI4WZ1ltCWQYrSnu7Zfn
 6uax95oVmM9rOVyvgTV+wAT/BvVOBGrAm58IDjILrR5wVR0TPjFwbW490z59R/fWxyjt
 9gTpPTuRKjKSNNaQuG6wY48ipDmvLUlnsXX29pQwgjnNjFistq78Wwq/ubeGDqKsHMxK
 fdz8IEqx9kley8s+1McOo5lHg7tOks/D4qBEAt1NOxq9pDGcTXpGwzvG/8t8Mxj9WoDH
 e9qw==
X-Gm-Message-State: APjAAAV9+FYoQuqMUZTi74HZXJFENyuKB6gStgwKljRkSXLa8Itx9Y1E
 +bzuhyZUt9Pe1o9eeCxHzmvFNI73SPDxDQHz0VQ=
X-Google-Smtp-Source: APXvYqyCwcKf0qBaCmWgTief56/pgGOVuNo0Xp3TjK6+9BTHH1ziiYjDSGCbLuGX+WwCPnAbvaVrc6E4bkHfPW1C6tk=
X-Received: by 2002:aca:4083:: with SMTP id n125mr2365844oia.106.1566553487181; 
 Fri, 23 Aug 2019 02:44:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Fri, 23 Aug 2019 02:44:46
 -0700 (PDT)
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Fri, 23 Aug 2019 02:44:46
 -0700 (PDT)
In-Reply-To: <20190822230916.576-4-philmd@redhat.com>
References: <20190822230916.576-1-philmd@redhat.com>
 <20190822230916.576-4-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 23 Aug 2019 11:44:46 +0200
Message-ID: <CAL1e-=hypCsXVMhU5nC8O7JuDHN89huaMSe5RrJ27YB9W+AK_g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000200d110590c5a860"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/3] mailmap: Add many
 entries to improve 'git shortlog' statistics
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
X-List-Received-Date: Fri, 23 Aug 2019 09:44:53 -0000

--000000000000200d110590c5a860
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

23.08.2019. 01.10, "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com> =D1=98=
=D0=B5
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> All of these emails have a least 1 commit with utf8/latin1 encoding
> issue, or one with no author name.
> When there are multiple commits, keep the author name the most used.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>

Out of the scope of this patch, what about the cases like Mateja
Marjanovic, who contributed with both Mateja.Marjanovic@rt-rk.com and
mateja.marjanovic@rt-rk.com ?

>  .mailmap | 105 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
>
> diff --git a/.mailmap b/.mailmap
> index e68ddd26e6..d0fc1d793c 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -37,5 +37,110 @@ Yongbok Kim <yongbok.kim@mips.com> <
yongbok.kim@imgtec.com>
>
>  # Also list preferred name forms where people have changed their
>  # git author config, or had utf8/latin1 encoding issues.
> +Aaron Lindsay <aaron@os.amperecomputing.com>
> +Alexey Gerasimenko <x1917x@gmail.com>
> +Alex Ivanov <void@aleksoft.net>
> +Andreas F=C3=A4rber <afaerber@suse.de>
> +Bandan Das <bsd@redhat.com>
> +Benjamin MARSILI <mlspirat42@gmail.com>
> +Beno=C3=AEt Canet <benoit.canet@gmail.com>
> +Beno=C3=AEt Canet <benoit.canet@irqsave.net>
> +Beno=C3=AEt Canet <benoit.canet@nodalink.com>
> +Boqun Feng <boqun.feng@gmail.com>
> +Boqun Feng <boqun.feng@intel.com>
> +Brad Smith <brad@comstyle.com>
> +Brijesh Singh <brijesh.singh@amd.com>
> +Brilly Wu <brillywu@viatech.com.cn>
> +C=C3=A9dric Vincent <cedric.vincent@st.com>
> +CheneyLin <linzc@zju.edu.cn>
> +Chen Gang <chengang@emindsoft.com.cn>
> +Chen Gang <gang.chen.5i5j@gmail.com>
> +Chen Gang <gang.chen@sunrus.com.cn>
> +Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
> +Christophe Lyon <christophe.lyon@st.com>
> +Collin L. Walling <walling@linux.ibm.com>
>  Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> +Eduardo Otubo <otubo@redhat.com>
> +Fabrice Desclaux <fabrice.desclaux@cea.fr>
> +Fernando Luis V=C3=A1zquez Cao <fernando_b1@lab.ntt.co.jp>
> +Fernando Luis V=C3=A1zquez Cao <fernando@oss.ntt.co.jp>
> +Gautham R. Shenoy <ego@in.ibm.com>
> +Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> +Gonglei (Arei) <arei.gonglei@huawei.com>
> +Guang Wang <wang.guang55@zte.com.cn>
> +Hailiang Zhang <zhang.zhanghailiang@huawei.com>
> +Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> +Jakub Jerm=C3=A1=C5=99 <jakub@jermar.eu>
> +Jakub Jerm=C3=A1=C5=99 <jakub.jermar@kernkonzept.com>
> +Jean-Christophe Dubois <jcd@tribudubois.net>
> +Jind=C5=99ich Makovi=C4=8Dka <makovick@gmail.com>
> +John Arbuckle <programmingkidx@gmail.com>
> +Juha Riihim=C3=A4ki <juha.riihimaki@nokia.com>
> +Juha Riihim=C3=A4ki <Juha.Riihimaki@nokia.com>
> +Jun Li <junmuzi@gmail.com>
> +Laurent Vivier <Laurent@lvivier.info>
> +Leandro Lupori <leandro.lupori@gmail.com>
> +Li Guang <lig.fnst@cn.fujitsu.com>
> +Liming Wang <walimisdev@gmail.com>
> +linzhecheng <linzc@zju.edu.cn>
> +Liran Schour <lirans@il.ibm.com>
> +Liu Yu <yu.liu@freescale.com>
> +Liu Yu <Yu.Liu@freescale.com>
> +Li Zhang <zhlcindy@gmail.com>
> +Li Zhang <zhlcindy@linux.vnet.ibm.com>
> +Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
> +Llu=C3=ADs Vilanova <xscript@gmx.net>
> +Longpeng (Mike) <longpeng2@huawei.com>
> +Luc Michel <luc.michel@git.antfield.fr>
> +Luc Michel <luc.michel@greensocs.com>
> +Marc Mar=C3=AD <marc.mari.barcelo@gmail.com>
> +Marc Mar=C3=AD <markmb@redhat.com>
> +Michael Avdienko <whitearchey@gmail.com>
> +Michael S. Tsirkin <mst@redhat.com>
> +Munkyu Im <munkyu.im@samsung.com>
> +Nicholas Bellinger <nab@linux-iscsi.org>
> +Nicholas Thomas <nick@bytemark.co.uk>
> +Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>
> +Orit Wasserman <owasserm@redhat.com>
> +Paolo Bonzini <pbonzini@redhat.com>
> +Pavel Dovgaluk <dovgaluk@ispras.ru>
> +Pavel Dovgaluk <pavel.dovgaluk@gmail.com>
> +Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>
> +Peter Crosthwaite <crosthwaite.peter@gmail.com>
> +Peter Crosthwaite <peter.crosthwaite@petalogix.com>
> +Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> +Prasad J Pandit <pjp@fedoraproject.org>
> +Prasad J Pandit <ppandit@redhat.com>
> +Qiao Nuohan <qiaonuohan@cn.fujitsu.com>
>  Reimar D=C3=B6ffinger <Reimar.Doeffinger@gmx.de>
> +Remy Noel <remy.noel@blade-group.com>
> +Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> +Shin'ichiro Kawasaki <kawasaki@juno.dti.ne.jp>
> +Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> +Sochin Jiang <sochin.jiang@huawei.com>
> +Takashi Yoshii <takasi-y@ops.dti.ne.jp>
> +Thomas Huth <thuth@redhat.com>
> +Thomas Knych <thomaswk@google.com>
> +Timothy Baldwin <T.E.Baldwin99@members.leeds.ac.uk>
> +Tony Nguyen <tony.nguyen@bt.com>
> +Venkateswararao Jujjuri <jvrao@linux.vnet.ibm.com>
> +Vibi Sreenivasan <vibi_sreenivasan@cms.com>
> +Vijaya Kumar K <vijayak@cavium.com>
> +Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> +Vijay Kumar <vijaykumar@bravegnu.org>
> +Vijay Kumar <vijaykumar@zilogic.com>
> +Wang Guang <wang.guang55@zte.com.cn>
> +Wenchao Xia <xiawenc@linux.vnet.ibm.com>
> +Wenshuang Ma <kevinnma@tencent.com>
> +Xiaoqiang Zhao <zxq_yx_007@163.com>
> +Xinhua Cao <caoxinhua@huawei.com>
> +Xiong Zhang <xiong.y.zhang@intel.com>
> +Yin Yin <yin.yin@cs2c.com.cn>
> +yuchenlin <npes87184@gmail.com>
> +YunQiang Su <syq@debian.org>
> +YunQiang Su <ysu@wavecomp.com>
> +Yuri Pudgorodskiy <yur@virtuozzo.com>
> +Zhengui Li <lizhengui@huawei.com>
> +Zhenwei Pi <pizhenwei@bytedance.com>
> +Zhenwei Pi <zhenwei.pi@youruncloud.com>
> +Zhuang Yanying <ann.zhuangyanying@huawei.com>
> --
> 2.20.1
>
>

--000000000000200d110590c5a860
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
23.08.2019. 01.10, &quot;Philippe Mathieu-Daud=C3=A9&quot; &lt;<a href=3D"m=
ailto:philmd@redhat.com">philmd@redhat.com</a>&gt; =D1=98=D0=B5 =D0=BD=D0=
=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt;<br>
&gt; All of these emails have a least 1 commit with utf8/latin1 encoding<br=
>
&gt; issue, or one with no author name.<br>
&gt; When there are multiple commits, keep the author name the most used.<b=
r>
&gt;<br>
&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philm=
d@redhat.com">philmd@redhat.com</a>&gt;<br>
&gt; ---</p>
<p dir=3D"ltr">Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:amark=
ovic@wavecomp.com">amarkovic@wavecomp.com</a>&gt;</p>
<p dir=3D"ltr">Out of the scope of this patch, what about the cases like Ma=
teja Marjanovic, who contributed with both <a href=3D"mailto:Mateja.Marjano=
vic@rt-rk.com">Mateja.Marjanovic@rt-rk.com</a> and <a href=3D"mailto:mateja=
.marjanovic@rt-rk.com">mateja.marjanovic@rt-rk.com</a> ?<br></p>
<p dir=3D"ltr">&gt; =C2=A0.mailmap | 105 ++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++<br>
&gt; =C2=A01 file changed, 105 insertions(+)<br>
&gt;<br>
&gt; diff --git a/.mailmap b/.mailmap<br>
&gt; index e68ddd26e6..d0fc1d793c 100644<br>
&gt; --- a/.mailmap<br>
&gt; +++ b/.mailmap<br>
&gt; @@ -37,5 +37,110 @@ Yongbok Kim &lt;<a href=3D"mailto:yongbok.kim@mips=
.com">yongbok.kim@mips.com</a>&gt; &lt;<a href=3D"mailto:yongbok.kim@imgtec=
.com">yongbok.kim@imgtec.com</a>&gt;<br>
&gt;<br>
&gt; =C2=A0# Also list preferred name forms where people have changed their=
<br>
&gt; =C2=A0# git author config, or had utf8/latin1 encoding issues.<br>
&gt; +Aaron Lindsay &lt;<a href=3D"mailto:aaron@os.amperecomputing.com">aar=
on@os.amperecomputing.com</a>&gt;<br>
&gt; +Alexey Gerasimenko &lt;<a href=3D"mailto:x1917x@gmail.com">x1917x@gma=
il.com</a>&gt;<br>
&gt; +Alex Ivanov &lt;<a href=3D"mailto:void@aleksoft.net">void@aleksoft.ne=
t</a>&gt;<br>
&gt; +Andreas F=C3=A4rber &lt;<a href=3D"mailto:afaerber@suse.de">afaerber@=
suse.de</a>&gt;<br>
&gt; +Bandan Das &lt;<a href=3D"mailto:bsd@redhat.com">bsd@redhat.com</a>&g=
t;<br>
&gt; +Benjamin MARSILI &lt;<a href=3D"mailto:mlspirat42@gmail.com">mlspirat=
42@gmail.com</a>&gt;<br>
&gt; +Beno=C3=AEt Canet &lt;<a href=3D"mailto:benoit.canet@gmail.com">benoi=
t.canet@gmail.com</a>&gt;<br>
&gt; +Beno=C3=AEt Canet &lt;<a href=3D"mailto:benoit.canet@irqsave.net">ben=
oit.canet@irqsave.net</a>&gt;<br>
&gt; +Beno=C3=AEt Canet &lt;<a href=3D"mailto:benoit.canet@nodalink.com">be=
noit.canet@nodalink.com</a>&gt;<br>
&gt; +Boqun Feng &lt;<a href=3D"mailto:boqun.feng@gmail.com">boqun.feng@gma=
il.com</a>&gt;<br>
&gt; +Boqun Feng &lt;<a href=3D"mailto:boqun.feng@intel.com">boqun.feng@int=
el.com</a>&gt;<br>
&gt; +Brad Smith &lt;<a href=3D"mailto:brad@comstyle.com">brad@comstyle.com=
</a>&gt;<br>
&gt; +Brijesh Singh &lt;<a href=3D"mailto:brijesh.singh@amd.com">brijesh.si=
ngh@amd.com</a>&gt;<br>
&gt; +Brilly Wu &lt;<a href=3D"mailto:brillywu@viatech.com.cn">brillywu@via=
tech.com.cn</a>&gt;<br>
&gt; +C=C3=A9dric Vincent &lt;<a href=3D"mailto:cedric.vincent@st.com">cedr=
ic.vincent@st.com</a>&gt;<br>
&gt; +CheneyLin &lt;<a href=3D"mailto:linzc@zju.edu.cn">linzc@zju.edu.cn</a=
>&gt;<br>
&gt; +Chen Gang &lt;<a href=3D"mailto:chengang@emindsoft.com.cn">chengang@e=
mindsoft.com.cn</a>&gt;<br>
&gt; +Chen Gang &lt;<a href=3D"mailto:gang.chen.5i5j@gmail.com">gang.chen.5=
i5j@gmail.com</a>&gt;<br>
&gt; +Chen Gang &lt;<a href=3D"mailto:gang.chen@sunrus.com.cn">gang.chen@su=
nrus.com.cn</a>&gt;<br>
&gt; +Chen Wei-Ren &lt;<a href=3D"mailto:chenwj@iis.sinica.edu.tw">chenwj@i=
is.sinica.edu.tw</a>&gt;<br>
&gt; +Christophe Lyon &lt;<a href=3D"mailto:christophe.lyon@st.com">christo=
phe.lyon@st.com</a>&gt;<br>
&gt; +Collin L. Walling &lt;<a href=3D"mailto:walling@linux.ibm.com">wallin=
g@linux.ibm.com</a>&gt;<br>
&gt; =C2=A0Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.co=
m">berrange@redhat.com</a>&gt;<br>
&gt; +Eduardo Otubo &lt;<a href=3D"mailto:otubo@redhat.com">otubo@redhat.co=
m</a>&gt;<br>
&gt; +Fabrice Desclaux &lt;<a href=3D"mailto:fabrice.desclaux@cea.fr">fabri=
ce.desclaux@cea.fr</a>&gt;<br>
&gt; +Fernando Luis V=C3=A1zquez Cao &lt;<a href=3D"mailto:fernando_b1@lab.=
ntt.co.jp">fernando_b1@lab.ntt.co.jp</a>&gt;<br>
&gt; +Fernando Luis V=C3=A1zquez Cao &lt;<a href=3D"mailto:fernando@oss.ntt=
.co.jp">fernando@oss.ntt.co.jp</a>&gt;<br>
&gt; +Gautham R. Shenoy &lt;<a href=3D"mailto:ego@in.ibm.com">ego@in.ibm.co=
m</a>&gt;<br>
&gt; +Gautham R. Shenoy &lt;<a href=3D"mailto:ego@linux.vnet.ibm.com">ego@l=
inux.vnet.ibm.com</a>&gt;<br>
&gt; +Gonglei (Arei) &lt;<a href=3D"mailto:arei.gonglei@huawei.com">arei.go=
nglei@huawei.com</a>&gt;<br>
&gt; +Guang Wang &lt;<a href=3D"mailto:wang.guang55@zte.com.cn">wang.guang5=
5@zte.com.cn</a>&gt;<br>
&gt; +Hailiang Zhang &lt;<a href=3D"mailto:zhang.zhanghailiang@huawei.com">=
zhang.zhanghailiang@huawei.com</a>&gt;<br>
&gt; +Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpoussin@reactos.org">hpo=
ussin@reactos.org</a>&gt;<br>
&gt; +Jakub Jerm=C3=A1=C5=99 &lt;<a href=3D"mailto:jakub@jermar.eu">jakub@j=
ermar.eu</a>&gt;<br>
&gt; +Jakub Jerm=C3=A1=C5=99 &lt;<a href=3D"mailto:jakub.jermar@kernkonzept=
.com">jakub.jermar@kernkonzept.com</a>&gt;<br>
&gt; +Jean-Christophe Dubois &lt;<a href=3D"mailto:jcd@tribudubois.net">jcd=
@tribudubois.net</a>&gt;<br>
&gt; +Jind=C5=99ich Makovi=C4=8Dka &lt;<a href=3D"mailto:makovick@gmail.com=
">makovick@gmail.com</a>&gt;<br>
&gt; +John Arbuckle &lt;<a href=3D"mailto:programmingkidx@gmail.com">progra=
mmingkidx@gmail.com</a>&gt;<br>
&gt; +Juha Riihim=C3=A4ki &lt;<a href=3D"mailto:juha.riihimaki@nokia.com">j=
uha.riihimaki@nokia.com</a>&gt;<br>
&gt; +Juha Riihim=C3=A4ki &lt;<a href=3D"mailto:Juha.Riihimaki@nokia.com">J=
uha.Riihimaki@nokia.com</a>&gt;<br>
&gt; +Jun Li &lt;<a href=3D"mailto:junmuzi@gmail.com">junmuzi@gmail.com</a>=
&gt;<br>
&gt; +Laurent Vivier &lt;<a href=3D"mailto:Laurent@lvivier.info">Laurent@lv=
ivier.info</a>&gt;<br>
&gt; +Leandro Lupori &lt;<a href=3D"mailto:leandro.lupori@gmail.com">leandr=
o.lupori@gmail.com</a>&gt;<br>
&gt; +Li Guang &lt;<a href=3D"mailto:lig.fnst@cn.fujitsu.com">lig.fnst@cn.f=
ujitsu.com</a>&gt;<br>
&gt; +Liming Wang &lt;<a href=3D"mailto:walimisdev@gmail.com">walimisdev@gm=
ail.com</a>&gt;<br>
&gt; +linzhecheng &lt;<a href=3D"mailto:linzc@zju.edu.cn">linzc@zju.edu.cn<=
/a>&gt;<br>
&gt; +Liran Schour &lt;<a href=3D"mailto:lirans@il.ibm.com">lirans@il.ibm.c=
om</a>&gt;<br>
&gt; +Liu Yu &lt;<a href=3D"mailto:yu.liu@freescale.com">yu.liu@freescale.c=
om</a>&gt;<br>
&gt; +Liu Yu &lt;<a href=3D"mailto:Yu.Liu@freescale.com">Yu.Liu@freescale.c=
om</a>&gt;<br>
&gt; +Li Zhang &lt;<a href=3D"mailto:zhlcindy@gmail.com">zhlcindy@gmail.com=
</a>&gt;<br>
&gt; +Li Zhang &lt;<a href=3D"mailto:zhlcindy@linux.vnet.ibm.com">zhlcindy@=
linux.vnet.ibm.com</a>&gt;<br>
&gt; +Llu=C3=ADs Vilanova &lt;<a href=3D"mailto:vilanova@ac.upc.edu">vilano=
va@ac.upc.edu</a>&gt;<br>
&gt; +Llu=C3=ADs Vilanova &lt;<a href=3D"mailto:xscript@gmx.net">xscript@gm=
x.net</a>&gt;<br>
&gt; +Longpeng (Mike) &lt;<a href=3D"mailto:longpeng2@huawei.com">longpeng2=
@huawei.com</a>&gt;<br>
&gt; +Luc Michel &lt;<a href=3D"mailto:luc.michel@git.antfield.fr">luc.mich=
el@git.antfield.fr</a>&gt;<br>
&gt; +Luc Michel &lt;<a href=3D"mailto:luc.michel@greensocs.com">luc.michel=
@greensocs.com</a>&gt;<br>
&gt; +Marc Mar=C3=AD &lt;<a href=3D"mailto:marc.mari.barcelo@gmail.com">mar=
c.mari.barcelo@gmail.com</a>&gt;<br>
&gt; +Marc Mar=C3=AD &lt;<a href=3D"mailto:markmb@redhat.com">markmb@redhat=
.com</a>&gt;<br>
&gt; +Michael Avdienko &lt;<a href=3D"mailto:whitearchey@gmail.com">whitear=
chey@gmail.com</a>&gt;<br>
&gt; +Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.c=
om</a>&gt;<br>
&gt; +Munkyu Im &lt;<a href=3D"mailto:munkyu.im@samsung.com">munkyu.im@sams=
ung.com</a>&gt;<br>
&gt; +Nicholas Bellinger &lt;<a href=3D"mailto:nab@linux-iscsi.org">nab@lin=
ux-iscsi.org</a>&gt;<br>
&gt; +Nicholas Thomas &lt;<a href=3D"mailto:nick@bytemark.co.uk">nick@bytem=
ark.co.uk</a>&gt;<br>
&gt; +Nikunj A Dadhania &lt;<a href=3D"mailto:nikunj@linux.vnet.ibm.com">ni=
kunj@linux.vnet.ibm.com</a>&gt;<br>
&gt; +Orit Wasserman &lt;<a href=3D"mailto:owasserm@redhat.com">owasserm@re=
dhat.com</a>&gt;<br>
&gt; +Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@red=
hat.com</a>&gt;<br>
&gt; +Pavel Dovgaluk &lt;<a href=3D"mailto:dovgaluk@ispras.ru">dovgaluk@isp=
ras.ru</a>&gt;<br>
&gt; +Pavel Dovgaluk &lt;<a href=3D"mailto:pavel.dovgaluk@gmail.com">pavel.=
dovgaluk@gmail.com</a>&gt;<br>
&gt; +Pavel Dovgaluk &lt;<a href=3D"mailto:Pavel.Dovgaluk@ispras.ru">Pavel.=
Dovgaluk@ispras.ru</a>&gt;<br>
&gt; +Peter Crosthwaite &lt;<a href=3D"mailto:crosthwaite.peter@gmail.com">=
crosthwaite.peter@gmail.com</a>&gt;<br>
&gt; +Peter Crosthwaite &lt;<a href=3D"mailto:peter.crosthwaite@petalogix.c=
om">peter.crosthwaite@petalogix.com</a>&gt;<br>
&gt; +Peter Crosthwaite &lt;<a href=3D"mailto:peter.crosthwaite@xilinx.com"=
>peter.crosthwaite@xilinx.com</a>&gt;<br>
&gt; +Prasad J Pandit &lt;<a href=3D"mailto:pjp@fedoraproject.org">pjp@fedo=
raproject.org</a>&gt;<br>
&gt; +Prasad J Pandit &lt;<a href=3D"mailto:ppandit@redhat.com">ppandit@red=
hat.com</a>&gt;<br>
&gt; +Qiao Nuohan &lt;<a href=3D"mailto:qiaonuohan@cn.fujitsu.com">qiaonuoh=
an@cn.fujitsu.com</a>&gt;<br>
&gt; =C2=A0Reimar D=C3=B6ffinger &lt;<a href=3D"mailto:Reimar.Doeffinger@gm=
x.de">Reimar.Doeffinger@gmx.de</a>&gt;<br>
&gt; +Remy Noel &lt;<a href=3D"mailto:remy.noel@blade-group.com">remy.noel@=
blade-group.com</a>&gt;<br>
&gt; +Roger Pau Monn=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.com">roge=
r.pau@citrix.com</a>&gt;<br>
&gt; +Shin&#39;ichiro Kawasaki &lt;<a href=3D"mailto:kawasaki@juno.dti.ne.j=
p">kawasaki@juno.dti.ne.jp</a>&gt;<br>
&gt; +Shin&#39;ichiro Kawasaki &lt;<a href=3D"mailto:shinichiro.kawasaki@wd=
c.com">shinichiro.kawasaki@wdc.com</a>&gt;<br>
&gt; +Sochin Jiang &lt;<a href=3D"mailto:sochin.jiang@huawei.com">sochin.ji=
ang@huawei.com</a>&gt;<br>
&gt; +Takashi Yoshii &lt;<a href=3D"mailto:takasi-y@ops.dti.ne.jp">takasi-y=
@ops.dti.ne.jp</a>&gt;<br>
&gt; +Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com<=
/a>&gt;<br>
&gt; +Thomas Knych &lt;<a href=3D"mailto:thomaswk@google.com">thomaswk@goog=
le.com</a>&gt;<br>
&gt; +Timothy Baldwin &lt;<a href=3D"mailto:T.E.Baldwin99@members.leeds.ac.=
uk">T.E.Baldwin99@members.leeds.ac.uk</a>&gt;<br>
&gt; +Tony Nguyen &lt;<a href=3D"mailto:tony.nguyen@bt.com">tony.nguyen@bt.=
com</a>&gt;<br>
&gt; +Venkateswararao Jujjuri &lt;<a href=3D"mailto:jvrao@linux.vnet.ibm.co=
m">jvrao@linux.vnet.ibm.com</a>&gt;<br>
&gt; +Vibi Sreenivasan &lt;<a href=3D"mailto:vibi_sreenivasan@cms.com">vibi=
_sreenivasan@cms.com</a>&gt;<br>
&gt; +Vijaya Kumar K &lt;<a href=3D"mailto:vijayak@cavium.com">vijayak@cavi=
um.com</a>&gt;<br>
&gt; +Vijaya Kumar K &lt;<a href=3D"mailto:Vijaya.Kumar@cavium.com">Vijaya.=
Kumar@cavium.com</a>&gt;<br>
&gt; +Vijay Kumar &lt;<a href=3D"mailto:vijaykumar@bravegnu.org">vijaykumar=
@bravegnu.org</a>&gt;<br>
&gt; +Vijay Kumar &lt;<a href=3D"mailto:vijaykumar@zilogic.com">vijaykumar@=
zilogic.com</a>&gt;<br>
&gt; +Wang Guang &lt;<a href=3D"mailto:wang.guang55@zte.com.cn">wang.guang5=
5@zte.com.cn</a>&gt;<br>
&gt; +Wenchao Xia &lt;<a href=3D"mailto:xiawenc@linux.vnet.ibm.com">xiawenc=
@linux.vnet.ibm.com</a>&gt;<br>
&gt; +Wenshuang Ma &lt;<a href=3D"mailto:kevinnma@tencent.com">kevinnma@ten=
cent.com</a>&gt;<br>
&gt; +Xiaoqiang Zhao &lt;<a href=3D"mailto:zxq_yx_007@163.com">zxq_yx_007@1=
63.com</a>&gt;<br>
&gt; +Xinhua Cao &lt;<a href=3D"mailto:caoxinhua@huawei.com">caoxinhua@huaw=
ei.com</a>&gt;<br>
&gt; +Xiong Zhang &lt;<a href=3D"mailto:xiong.y.zhang@intel.com">xiong.y.zh=
ang@intel.com</a>&gt;<br>
&gt; +Yin Yin &lt;<a href=3D"mailto:yin.yin@cs2c.com.cn">yin.yin@cs2c.com.c=
n</a>&gt;<br>
&gt; +yuchenlin &lt;<a href=3D"mailto:npes87184@gmail.com">npes87184@gmail.=
com</a>&gt;<br>
&gt; +YunQiang Su &lt;<a href=3D"mailto:syq@debian.org">syq@debian.org</a>&=
gt;<br>
&gt; +YunQiang Su &lt;<a href=3D"mailto:ysu@wavecomp.com">ysu@wavecomp.com<=
/a>&gt;<br>
&gt; +Yuri Pudgorodskiy &lt;<a href=3D"mailto:yur@virtuozzo.com">yur@virtuo=
zzo.com</a>&gt;<br>
&gt; +Zhengui Li &lt;<a href=3D"mailto:lizhengui@huawei.com">lizhengui@huaw=
ei.com</a>&gt;<br>
&gt; +Zhenwei Pi &lt;<a href=3D"mailto:pizhenwei@bytedance.com">pizhenwei@b=
ytedance.com</a>&gt;<br>
&gt; +Zhenwei Pi &lt;<a href=3D"mailto:zhenwei.pi@youruncloud.com">zhenwei.=
pi@youruncloud.com</a>&gt;<br>
&gt; +Zhuang Yanying &lt;<a href=3D"mailto:ann.zhuangyanying@huawei.com">an=
n.zhuangyanying@huawei.com</a>&gt;<br>
&gt; -- <br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
</p>

--000000000000200d110590c5a860--

