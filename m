Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kf1Dt-0000Yl-El
	for mharc-qemu-trivial@gnu.org; Tue, 17 Nov 2020 08:40:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kf1Ds-0000XS-AM; Tue, 17 Nov 2020 08:40:40 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kf1Dq-0007kP-48; Tue, 17 Nov 2020 08:40:39 -0500
Received: from dggemi405-hub.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Cb6Wk0FJRzQkRp;
 Tue, 17 Nov 2020 21:40:18 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.162]) by
 dggemi405-hub.china.huawei.com ([10.3.17.143]) with mapi id 14.03.0487.000;
 Tue, 17 Nov 2020 21:40:23 +0800
From: ganqixin <ganqixin@huawei.com>
To: Gerd Hoffmann <kraxel@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>, =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?=
 <philmd@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>, "Chenqun (kuhn)"
 <kuhn.chenqun@huawei.com>, Zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: RE: [PATCH 09/13] u2f-passthru: put it into the 'usb' category
Thread-Topic: [PATCH 09/13] u2f-passthru: put it into the 'usb' category
Thread-Index: AQHWu/oMyb2Urt3Gu0q8d02Pkq8oI6nKRNcAgAEbOICAAPWhwA==
Date: Tue, 17 Nov 2020 13:40:23 +0000
Message-ID: <A5B86EC83C48EF4CB2BC58BEF3A2F496065C37E3@DGGEMI525-MBS.china.huawei.com>
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-10-ganqixin@huawei.com>
 <49d4e8e3-7138-18cf-3972-c18e8275d3be@redhat.com>
 <20201117065833.l3gsr4tryrg5dudn@sirius.home.kraxel.org>
In-Reply-To: <20201117065833.l3gsr4tryrg5dudn@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.159]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=ganqixin@huawei.com;
 helo=szxga02-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 08:40:32
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 17 Nov 2020 13:40:40 -0000

> -----Original Message-----
> From: Gerd Hoffmann [mailto:kraxel@redhat.com]
> Sent: Tuesday, November 17, 2020 2:59 PM
> To: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Cc: ganqixin <ganqixin@huawei.com>; qemu-devel@nongnu.org;
> qemu-trivial@nongnu.org; Marc-Andr=E9 Lureau
> <marcandre.lureau@redhat.com>; thuth@redhat.com; Chenqun (kuhn)
> <kuhn.chenqun@huawei.com>; Zhanghailiang
> <zhang.zhanghailiang@huawei.com>; Eduardo Habkost
> <ehabkost@redhat.com>
> Subject: Re: [PATCH 09/13] u2f-passthru: put it into the 'usb' category
>=20
> On Mon, Nov 16, 2020 at 03:04:52PM +0100, Philippe Mathieu-Daud=C3=A9
> wrote:
> > On 11/15/20 7:48 PM, Gan Qixin wrote:
> > > The category of the u2f-passthru device is not set, put it into the '=
usb'
> > > category.
> >
> > I guess we discussed this with Thomas 1 or 2 years ago but I don't
> > remember. I think it was about using set_bits() so devices can appear
> > in multiple categories.
> >
> > Gerd, do you know what is the point of the "usb" category for
> > management apps? This is a bus accepting multiple better categorized
> > devices (display, storage, input, network, sound).
>=20
> Right now we have the host adapters collected in the usb category.
> Maybe we should rename the category to make that clear.
>=20
> And, yes, tagging the u2f devices as "usb" doesn't look useful.
>=20
> > Unrelated but multiple devices are related to SECURITY.
> > Maybe it is time to introduce the DEVICE_CATEGORY_SECURITY?
>=20
> Either that, or place it in the "misc" category.

Thanks for your advice, I will put it into 'misc' category.

Gan Qixin

