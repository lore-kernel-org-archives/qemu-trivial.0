Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k69B5-0001yz-1Q
	for mharc-qemu-trivial@gnu.org; Thu, 13 Aug 2020 05:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1k69B3-0001yI-62; Thu, 13 Aug 2020 05:05:37 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2094 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1k69B0-0004Ce-CI; Thu, 13 Aug 2020 05:05:36 -0400
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id 21A0373400E79736B731;
 Thu, 13 Aug 2020 17:05:24 +0800 (CST)
Received: from DGGEMM422-HUB.china.huawei.com (10.1.198.39) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Thu, 13 Aug 2020 17:05:22 +0800
Received: from DGGEMM511-MBX.china.huawei.com ([169.254.1.170]) by
 dggemm422-hub.china.huawei.com ([10.1.198.39]) with mapi id 14.03.0487.000;
 Thu, 13 Aug 2020 17:05:15 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>
CC: Pannengyuan <pannengyuan@huawei.com>, Zhanghailiang
 <zhang.zhanghailiang@huawei.com>, Euler Robot <euler.robot@huawei.com>, Gerd
 Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH 09/11] usb/bus: Remove dead assignment in
 usb_get_fw_dev_path()
Thread-Topic: [PATCH 09/11] usb/bus: Remove dead assignment in
 usb_get_fw_dev_path()
Thread-Index: AQHWcUTHhXDTZfvtm0WvjC1m5FN5Fak1vs4w
Date: Thu, 13 Aug 2020 09:05:15 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83B8A08D8@dggemm511-mbx.china.huawei.com>
References: <20200813073712.4001404-1-kuhn.chenqun@huawei.com>
 <20200813073712.4001404-10-kuhn.chenqun@huawei.com>
In-Reply-To: <20200813073712.4001404-10-kuhn.chenqun@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.187.50]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 05:05:25
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Thu, 13 Aug 2020 09:05:37 -0000

>  hw/usb/bus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/usb/bus.c b/hw/usb/bus.c index b17bda3b29..77d3f7ddb8
> 100644
> --- a/hw/usb/bus.c
> +++ b/hw/usb/bus.c
> @@ -612,8 +612,8 @@ static char *usb_get_fw_dev_path(DeviceState *qdev)
>              in++;
>          } else {
>              /* the device itself */
> -            pos +=3D snprintf(fw_path + pos, fw_len - pos, "%s@%lx",
> -                            qdev_fw_name(qdev), nr);
> +            snprintf(fw_path + pos, fw_len - pos,
> "%s@%lx",qdev_fw_name(qdev),
Sorry, a space is missing here. I will add it later in V2.

Thanks.
> +                     nr);
>              break;
>          }
>      }
> --
> 2.23.0


