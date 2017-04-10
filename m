Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cxbmX-0007eC-A8
	for mharc-qemu-trivial@gnu.org; Mon, 10 Apr 2017 12:03:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <herbie.robinson@stratus.com>) id 1cxbmU-0007c9-Qo
	for qemu-trivial@nongnu.org; Mon, 10 Apr 2017 12:03:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <herbie.robinson@stratus.com>) id 1cxbmS-0005ZU-Ep
	for qemu-trivial@nongnu.org; Mon, 10 Apr 2017 12:03:06 -0400
Received: from us-smtp-delivery-131.mimecast.com ([216.205.24.131]:26286)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <herbie.robinson@stratus.com>)
	id 1cxbmS-0005Yn-B7
	for qemu-trivial@nongnu.org; Mon, 10 Apr 2017 12:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=StratusTechnologies.onmicrosoft.com; s=selector1-stratus-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=SWz8qSKB2siTHjy5/fUUgrTP9HmL/XLmlyR+RXDOcrA=;
	b=H+w2kpD6IRtO3Z7U2dffbUTCuaSzmPaIhGw3tjt2LkJGbj+Dy/mbIXLivpJ+nHJHH6XQOXQnxyRIpXOY1W5WCu7NK/fTJefkK4F8hjN7kaEJiofYR24OpRepGkoEc76VnRsPPFN2gn+l9/Py8hK0nDgIccZsCUUKF15LyZEyumI=
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03lp0055.outbound.protection.outlook.com [216.32.180.55])
	(Using TLS) by us-smtp-1.mimecast.com with ESMTP id
	us-mta-73-adhSU2HqOL2uQi7eaI-9_Q-1; Mon, 10 Apr 2017 12:02:57 -0400
Received: from BN3PR0801MB0898.namprd08.prod.outlook.com (10.160.184.16) by
	BN3PR0801MB0898.namprd08.prod.outlook.com (10.160.184.16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1019.17; Mon, 10 Apr 2017 16:02:54 +0000
Received: from BN3PR0801MB0898.namprd08.prod.outlook.com ([10.160.184.16]) by
	BN3PR0801MB0898.namprd08.prod.outlook.com ([10.160.184.16]) with
	mapi id 15.01.1019.025; Mon, 10 Apr 2017 16:02:54 +0000
From: "Robinson, Herbie" <Herbie.Robinson@stratus.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, Laurent Vivier
	<lvivier@redhat.com>
Thread-Topic: ping RE: [PATCH v3] SGABIOS: fix wrong video attrs for int 10h, 
	ah==13h
Thread-Index: AdKyE6UU7AVUfQuTSjS4spg87wYRXg==
Date: Mon, 10 Apr 2017 16:02:54 +0000
Message-ID: <BN3PR0801MB0898A85B6C3C2E2AF9984C1BE6010@BN3PR0801MB0898.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [198.97.42.5]
x-microsoft-exchange-diagnostics: 1; BN3PR0801MB0898;
	7:/P2kePun/esUvVOIf2zSSLoxCeZ1yLcehMP++KwdIyovhIHVYaCaphlHbGftdvSy0MpdFH5zzF7gtlesG0lmSIlU648Xi4cBNMYZ0M7aBzgIEVgxwGRQLd21nCfVNLzlZKFYVxahtpRi8ZxrSdyQ7AuV2B22bo0XxClmtyb+1+exxbkHbzPriVGvCQmcGo9nHsOeyGZkSytd81de/i9dgT7q8DFfOaa8PDT9xb+VgN3lTsWTjBipM+2xNlHHugNkkP+zJ4TnVDIrVWRwOSneFd2DRse4cmVJO75GZ9Z0R7veazd4ofntrpgCZdRzu8OARqw5zn7u03qVAPiqt4iRdQ==;
	20:RuGvq+fwwissnJmOp5el+ymTqw3u5EkdmNKEDXsqbteCqPu38de/1Ws3d9HYdzdnqD45sGg/KoFvK1Svj1WHkBTgUJMqT0xn3M0YJPbrURk656EarlN6NRhtcVoTCOUijgTZkXTnXGxZnffvIW1Kt4lHckOrR8gqI9KeUcp1hyA=
x-ms-office365-filtering-correlation-id: d4dc70c3-719a-465c-7b2f-08d4802b0c5c
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081);
	SRVR:BN3PR0801MB0898; 
x-microsoft-antispam-prvs: <BN3PR0801MB08983E19F2CD66324AFC741BE6010@BN3PR0801MB0898.namprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(6041248)(201703131423075)(201702281528075)(201703061421075)(20161123564025)(20161123560025)(20161123555025)(20161123562025)(6072148);
	SRVR:BN3PR0801MB0898; BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0801MB0898; 
x-forefront-prvs: 027367F73D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39450400003)(39400400002)(39410400002)(39840400002)(377454003)(13464003)(24454002)(50986999)(54356999)(7736002)(305945005)(74316002)(86362001)(966004)(2900100001)(53546009)(189998001)(38730400002)(110136004)(5660300001)(122556002)(66066001)(4326008)(25786009)(53936002)(33656002)(2351001)(6436002)(6506006)(77096006)(6306002)(5640700003)(9686003)(54906002)(55016002)(99286003)(2906002)(102836003)(3846002)(6116002)(6916009)(2501003)(7696004)(3280700002)(8676002)(8936002)(81166006)(3660700001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0801MB0898;
	H:BN3PR0801MB0898.namprd08.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: stratus.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2017 16:02:54.3075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de36b473-b8ad-46ff-837f-9da16b8d1b77
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0801MB0898
X-MC-Unique: adhSU2HqOL2uQi7eaI-9_Q-1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 216.205.24.131
Subject: [Qemu-trivial] ping RE: [PATCH v3] SGABIOS: fix wrong video attrs
 for int 10h, ah==13h
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Apr 2017 16:03:08 -0000

aHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3BhdGNoLzczNzQ0Ni8NCg0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTGF1cmVudCBWaXZpZXIgW21haWx0bzpsdml2aWVyQHJl
ZGhhdC5jb21dIA0KU2VudDogRnJpZGF5LCBNYXJjaCAxMCwgMjAxNyAyOjEwIFBNDQpUbzogUm9i
aW5zb24sIEhlcmJpZSA8SGVyYmllLlJvYmluc29uQHN0cmF0dXMuY29tPjsgcWVtdS1kZXZlbEBu
b25nbnUub3JnDQpDYzogcWVtdS10cml2aWFsQG5vbmdudS5vcmcNClN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjNdIFNHQUJJT1M6IGZpeCB3cm9uZyB2aWRlbyBhdHRycyBmb3IgaW50IDEwaCwgYWg9PTEz
aA0KDQpPbiAxMC8wMy8yMDE3IDE2OjU0LCBIZXJiaWUgUm9iaW5zb24gd3JvdGU6DQo+IEZpeCBC
dWcgIzE2NzA1MDk6IHdyb25nIHZpZGVvIGF0dHJzIGZvciBpbnQgMTBoLCBhaD09MTNoIFRoZSAN
Cj4gc3Vicm91dGluZSBzZXRfY3Vyc29yX3Bvc2l0aW9uIGlzIHRyYXNoaW5nICVieC4NCj4gVW5m
b3J0dW5hdGVseSwgJWJsIGNvbnRhaW5zIHRoZSB2aWRlbyBhdHRyaWJ1dGUgZm9yIHdyaXRlX3N0
cmluZy4NCj4gDQo+IFRoZSBmaXggc2F2ZXMgJWJ4IGluIHRoZSBmdW5jdGlvbiBwcm9sb2cgYW5k
IHJlc3RvcmVzIGl0IGluIHRoZSANCj4gZXBpbG9nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSGVy
YmllIFJvYmluc29uIDxIZXJiaWUuUm9iaW5zb25Ac3RyYXR1cy5jb20+DQoNClJldmlld2VkLWJ5
OiBMYXVyZW50IFZpdmllciA8bHZpdmllckByZWRoYXQuY29tPg0KDQoNCj4gLS0tDQo+IFJlbW92
ZWQgaW5jb3JyZWN0IGNvZGUgZGVsZXRpb25zIGZyb20gc2V0X2N1cnJlbnRfY3Vyc29yLg0KPiBS
ZW1vdmVkIGV4cGxhbmF0aW9uIG9mIHNhbWUgZnJvbSB0aGUgY29tbWl0IG1lc3NhZ2UuDQo+IA0K
PiBCVFcsIEkgZGlkbid0IHNlZSBhbnkgdGVzdCBjYXNlcyBmb3IgdGhpcyBjb2RlLCBidXQgaWYg
dGhleSBleGlzdCBhbmQgDQo+IHNvbWVib2R5IHBvaW50cyBtZSBhdCB0aGVtLCBJIHNob3VsZCBi
ZSBhYmxlIHRvIGdlbmVyYXRlIGEgdmVyeSBzbWFsbCANCj4gcWNvdzIgZmlsZSB0aGF0IGRlbW9u
c3RyYXRlcyB0aGUgcHJvYmxlbS4NCj4gDQo+ICBzZ2FiaW9zLlMgfCAyICsrDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvc2dhYmlvcy5TIGIv
c2dhYmlvcy5TDQo+IGluZGV4IDI3NWQwNjMuLjk2YzRlMjMgMTAwNjQ0DQo+IC0tLSBhL3NnYWJp
b3MuUw0KPiArKysgYi9zZ2FiaW9zLlMNCj4gQEAgLTE3MjgsNiArMTcyOCw3IEBAIHdyaXRlX3N0
cmluZ190YWlsOg0KPiAgDQo+ICBzZXRfY3Vyc29yX3Bvc2l0aW9uOg0KPiAgICBwdXNodyAlYXgN
Cj4gKyAgcHVzaHcgJWJ4DQo+ICAgIHB1c2h3ICVkcw0KPiAgICBwdXNodyAkQkRBX1NFRw0KPiAg
ICBwb3B3ICVkcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogZHMgPSAweDQwICovDQo+
IEBAIC0xNzM4LDYgKzE3MzksNyBAQCBzZXRfY3Vyc29yX3Bvc2l0aW9uOg0KPiAgICBtb3Z3ICVh
eCwgJWJ4ICAgICAgICAgICAgICAgICAgICAgICAgLyogYnggPSBjdXJzb3Igc2F2ZSBvZmZzZXQg
Ki8NCj4gICAgbW92dyAlZHgsICglYngpICAgICAgICAgICAgICAgICAgICAgIC8qIHNhdmUgbmV3
IGN1cnNvciB2YWx1ZSAqLw0KPiAgICBwb3B3ICVkcw0KPiArICBwb3B3ICVieA0KPiAgICBwb3B3
ICVheA0KPiAgICByZXQNCj4gIA0KPiANCg0K


