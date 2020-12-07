Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmBbb-0006YA-66
	for mharc-qemu-trivial@gnu.org; Mon, 07 Dec 2020 03:10:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kmBbZ-0006WH-G8; Mon, 07 Dec 2020 03:10:45 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kmBbT-0000Gy-QD; Mon, 07 Dec 2020 03:10:45 -0500
Received: from dggemi405-hub.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4CqGDy5QtXz13R0c;
 Mon,  7 Dec 2020 16:09:38 +0800 (CST)
Received: from DGGEMI422-HUB.china.huawei.com (10.1.199.151) by
 dggemi405-hub.china.huawei.com (10.3.17.143) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Mon, 7 Dec 2020 16:10:30 +0800
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.228]) by
 dggemi422-hub.china.huawei.com ([10.1.199.151]) with mapi id 14.03.0487.000;
 Mon, 7 Dec 2020 16:10:20 +0800
From: ganqixin <ganqixin@huawei.com>
To: Cornelia Huck <cohuck@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "thuth@redhat.com" <thuth@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, Euler Robot
 <euler.robot@huawei.com>, "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>, "Richard
 Henderson" <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>
Subject: RE: [PATCH 3/3] s390x/cpu: Use timer_free() in the finalize
 function to avoid memleaks
Thread-Topic: [PATCH 3/3] s390x/cpu: Use timer_free() in the finalize
 function to avoid memleaks
Thread-Index: AQHWyhVlFFCAWnF5sUCF8CY9haDIzKnmFvuAgAU0c8A=
Date: Mon, 7 Dec 2020 08:10:19 +0000
Message-ID: <A5B86EC83C48EF4CB2BC58BEF3A2F496065E416F@DGGEMI525-MBS.china.huawei.com>
References: <20201204081209.360524-1-ganqixin@huawei.com>
 <20201204081209.360524-4-ganqixin@huawei.com>
 <20201204093659.349314af.cohuck@redhat.com>
In-Reply-To: <20201204093659.349314af.cohuck@redhat.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.159]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255; envelope-from=ganqixin@huawei.com;
 helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 07 Dec 2020 08:10:46 -0000

> -----Original Message-----
> From: Cornelia Huck [mailto:cohuck@redhat.com]
> Sent: Friday, December 4, 2020 4:37 PM
> To: ganqixin <ganqixin@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-trivial@nongnu.org;
> peter.maydell@linaro.org; thuth@redhat.com; Zhanghailiang
> <zhang.zhanghailiang@huawei.com>; Euler Robot
> <euler.robot@huawei.com>; Chenqun (kuhn)
> <kuhn.chenqun@huawei.com>; david@gibson.dropbear.id.au; Richard
> Henderson <richard.henderson@linaro.org>; David Hildenbrand
> <david@redhat.com>; qemu-s390x@nongnu.org
> Subject: Re: [PATCH 3/3] s390x/cpu: Use timer_free() in the finalize
> function to avoid memleaks
>=20
> On Fri, 4 Dec 2020 16:12:09 +0800
> Gan Qixin <ganqixin@huawei.com> wrote:
>=20
> > When running device-introspect-test, a memory leak occurred in the
> > s390_cpu_initfn function, this patch use timer_free() in the finalize
> function to fix it.
> >
> > ASAN shows memory leak stack:
> >
> > Direct leak of 3552 byte(s) in 74 object(s) allocated from:
> >     #0 0xfffeb3d4e1f0 in __interceptor_calloc
> (/lib64/libasan.so.5+0xee1f0)
> >     #1 0xfffeb36e6800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
> >     #2 0xaaad51a8f9c4 in timer_new_full
> qemu/include/qemu/timer.h:523
> >     #3 0xaaad51a8f9c4 in timer_new qemu/include/qemu/timer.h:544
> >     #4 0xaaad51a8f9c4 in timer_new_ns
> qemu/include/qemu/timer.h:562
> >     #5 0xaaad51a8f9c4 in s390_cpu_initfn
> qemu/target/s390x/cpu.c:304
> >     #6 0xaaad51e00f58 in object_init_with_type
> qemu/qom/object.c:371
> >     #7 0xaaad51e0406c in object_initialize_with_type
> qemu/qom/object.c:515
> >     #8 0xaaad51e042e0 in object_new_with_type
> qemu/qom/object.c:729
> >     #9 0xaaad51e3ff40 in qmp_device_list_properties
> qemu/qom/qom-qmp-cmds.c:153
> >     #10 0xaaad51910518 in qdev_device_help
> qemu/softmmu/qdev-monitor.c:283
> >     #11 0xaaad51911918 in qmp_device_add
> qemu/softmmu/qdev-monitor.c:801
> >     #12 0xaaad51911e48 in hmp_device_add
> > qemu/softmmu/qdev-monitor.c:916
> >
> > Reported-by: Euler Robot <euler.robot@huawei.com>
> > Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> > ---
> > Cc: Thomas Huth <thuth@redhat.com>
>=20
> [Adding missing maintainers. How did you build the cc: list?]

Oops, It's my fault. Thanks for helping me add missing maintainers. :)

Gan Qixin
>=20
> > ---
> >  target/s390x/cpu.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c index
> > 7b66718c44..8a734c2f8c 100644
> > --- a/target/s390x/cpu.c
> > +++ b/target/s390x/cpu.c
> > @@ -313,6 +313,11 @@ static void s390_cpu_finalize(Object *obj)  #if
> > !defined(CONFIG_USER_ONLY)
> >      S390CPU *cpu =3D S390_CPU(obj);
> >
> > +    timer_del(cpu->env.tod_timer);
> > +    timer_free(cpu->env.tod_timer);
> > +    timer_del(cpu->env.cpu_timer);
> > +    timer_free(cpu->env.cpu_timer);
> > +
> >      qemu_unregister_reset(s390_cpu_machine_reset_cb, cpu);
> >      g_free(cpu->irqstate);
> >  #endif
>=20
> Looks sane at first glance.


