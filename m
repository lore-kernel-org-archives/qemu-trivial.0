Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XEux1-0000re-1F
	for mharc-qemu-trivial@gnu.org; Wed, 06 Aug 2014 02:43:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XEpz4-0003HF-Gx
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 21:25:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XEpyy-00010j-OQ
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 21:25:42 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:30870)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XEpyy-0000yy-6M; Tue, 05 Aug 2014 21:25:36 -0400
Received: from 172.24.2.119 (EHLO SZXEMA401-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id ASN46986; Wed, 06 Aug 2014 09:25:25 +0800 (CST)
Received: from SZXEMA503-MBS.china.huawei.com ([169.254.6.21]) by
	SZXEMA401-HUB.china.huawei.com ([10.82.72.33]) with mapi id
	14.03.0158.001; Wed, 6 Aug 2014 09:25:16 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Eric Blake <eblake@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [PATCH v4 0/8] don't use Yoda conditions
Thread-Index: AQHPr8VLrvxBpnJP7EKjdueQpvVqKpvBdQ2AgAFVsQA=
Date: Wed, 6 Aug 2014 01:25:15 +0000
Message-ID: <33183CC9F5247A488A2544077AF1902086C277DA@SZXEMA503-MBS.china.huawei.com>
References: <1407143992-9248-1-git-send-email-arei.gonglei@huawei.com>
	<53E0D5A1.1060801@redhat.com>
In-Reply-To: <53E0D5A1.1060801@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.177.19.102]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.53E18406.00FE,ss=1,re=0.000,fgs=0,
	ip=169.254.6.21, so=2013-05-26 15:14:31,
	dmn=2011-05-27 18:58:46
X-Mirapoint-Loop-Id: 2a5e21064f8eeb968754906681bef7b1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
X-Mailman-Approved-At: Wed, 06 Aug 2014 02:43:53 -0400
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"peter.crosthwaite@xilinx.com" <peter.crosthwaite@xilinx.com>,
	"Huangweidong \(C\)" <weidong.huang@huawei.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	"marcel.a@redhat.com" <marcel.a@redhat.com>,
	Luonengjun <luonengjun@huawei.com>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"lcapitulino@redhat.com" <lcapitulino@redhat.com>,
	"av1474@comtv.ru" <av1474@comtv.ru>,
	"kraxel@redhat.com" <kraxel@redhat.com>,
	"aliguori@amazon.com" <aliguori@amazon.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"dmitry@daynix.com" <dmitry@daynix.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	"afaerber@suse.de" <afaerber@suse.de>,
	"dgilbert@redhat.com" <dgilbert@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v4 0/8] don't use Yoda conditions
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
X-List-Received-Date: Wed, 06 Aug 2014 01:25:47 -0000

SGksDQoNCj4gPg0KPiA+ICRXSEFURVZFUjogZG9uJ3QgdXNlICdZb2RhIGNvbmRpdGlvbnMnDQo+
ID4NCj4gPiAnWW9kYSBjb25kaXRpb25zJyBhcmUgbm90IHBhcnQgb2YgaWRpb21hdGljIFFFTVUg
Y29kaW5nDQo+ID4gc3R5bGUsIHNvIHJld3JpdGUgdGhlbSBpbiB0aGUgbW9yZSB1c3VhbCBvcmRl
ci4NCj4gPg0KPiA+IHY0Og0KPiA+ICAtIHRyaXZpYWwgdHlwbyBmb3IgcGF0Y2ggMS84IHN1Z2dl
c3RlZCBieSBFcmljLCB0aGFua3MuDQo+IA0KPiBTZXJpZXM6IFJldmlld2VkLWJ5OiBFcmljIEJs
YWtlIDxlYmxha2VAcmVkaGF0LmNvbT4NCj4gDQo+IEFkZGluZyBxZW11LXRyaXZpYWwgaW4gY2Mu
DQo+IA0KVGhhbmtzIGZvciByZXZpZXcsIEVyaWMuDQoNCj4gPiBHb25nbGVpICg4KToNCj4gPiAg
IENPRElOR19TVFlMRTogU2VjdGlvbiBhYm91dCBjb25kaXRpb25hbCBzdGF0ZW1lbnQNCj4gPiAg
IHVzYjogZG9uJ3QgdXNlICdZb2RhIGNvbmRpdGlvbnMnDQo+ID4gICBhdWRpbzogZG9uJ3QgdXNl
ICdZb2RhIGNvbmRpdGlvbnMnDQo+ID4gICBpc2EtYnVzOiBkb24ndCB1c2UgJ1lvZGEgY29uZGl0
aW9ucycNCj4gPiAgIGRvbid0IHVzZSAnWW9kYSBjb25kaXRpb25zJw0KPiA+ICAgc3BpY2U6IGRv
bid0IHVzZSAnWW9kYSBjb25kaXRpb25zJw0KPiA+ICAgdmw6IGRvbid0IHVzZSAnWW9kYSBjb25k
aXRpb25zJw0KPiA+ICAgdm14bmV0MzogZG9uJ3QgdXNlICdZb2RhIGNvbmRpdGlvbnMnDQo+ID4N
Cj4gDQo+IA0KPiAtLQ0KPiBFcmljIEJsYWtlICAgZWJsYWtlIHJlZGhhdCBjb20gICAgKzEtOTE5
LTMwMS0zMjY2DQo+IExpYnZpcnQgdmlydHVhbGl6YXRpb24gbGlicmFyeSBodHRwOi8vbGlidmly
dC5vcmcNCg0KQmVzdCByZWdhcmRzLA0KLUdvbmdsZWkNCg==

