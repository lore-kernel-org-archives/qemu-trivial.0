Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRHGl-00072A-Fs
	for mharc-qemu-trivial@gnu.org; Mon, 26 Nov 2018 08:49:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <smarkovic@wavecomp.com>) id 1gRGza-0004nC-CQ
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 08:32:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <smarkovic@wavecomp.com>) id 1gRGzW-0001Y9-BD
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 08:32:02 -0500
Received: from mail-eopbgr710095.outbound.protection.outlook.com
	([40.107.71.95]:6373
	helo=NAM05-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <smarkovic@wavecomp.com>)
	id 1gRGzW-0001SI-0x; Mon, 26 Nov 2018 08:31:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=F8zYDOHh0BJzELpgof0b7JUZj23A5LS2k2LUHviXuWE=;
	b=bOP+CCjSlQw00+uaaRv5hzs+1xrCLR5NLgyw2nVWhd0cEQsLZW+/sSGMdlKhYTMyxPlYMp280xs7EuczKKN3cTRsx3VAMwZ/GCLaUSHy2RodHpRykENDraIcOMrP0Z5P5MBv5Qn8lDzESZD+sHfjFAWz8dzZOQs3/qOGJ6poveY=
Received: from DM5PR2201MB1497.namprd22.prod.outlook.com (10.174.187.12) by
	DM5PR2201MB1145.namprd22.prod.outlook.com (10.174.186.138) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.19; Mon, 26 Nov 2018 13:31:53 +0000
Received: from DM5PR2201MB1497.namprd22.prod.outlook.com
	([fe80::bcf5:4889:36af:68f2]) by
	DM5PR2201MB1497.namprd22.prod.outlook.com
	([fe80::bcf5:4889:36af:68f2%5]) with mapi id 15.20.1361.019;
	Mon, 26 Nov 2018 13:31:53 +0000
From: Stefan Markovic <smarkovic@wavecomp.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>, Thomas
	Huth <thuth@redhat.com>, =?utf-8?B?SGVydsOpIFBvdXNzaW5lYXU=?=
	<hpoussin@reactos.org>, Aleksandar Markovic <amarkovic@wavecomp.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
	<qemu-trivial@nongnu.org>
Thread-Topic: [PATCH for-3.1 05/25] MAINTAINERS: Add missing entries for the
	Jazz machine
Thread-Index: AQHUhQCtcfNOdiMQk0qnBmY6Zp+HcaViDsqA
Date: Mon, 26 Nov 2018 13:31:53 +0000
Message-ID: <044693ca-c792-ee04-bfec-3394428f0d63@wavecomp.com>
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-6-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-6-philmd@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CWXP265CA0066.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:400:2c::30) To DM5PR2201MB1497.namprd22.prod.outlook.com
	(2603:10b6:4:36::12)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=smarkovic@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [82.117.201.26]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR2201MB1145;
	6:PbQ/gA9q9UwnXQ2STonfCs8OHUVN5yaMhvntiwhTh8egbdA+rd02Zlp0BOkj/DrA5IlSs5oRTn6WYmYW+ggCYpDPe7qk6E4wO8/W33nc7s+8sYGR393C+ku19c3Cw1TFAvyiNvbgKwVWzo7MestJ2OGlUOsmNNy0dRALm03CyWV2bK0Tca0aj7H4csN4vmdzFtjFVIRhThVk7xpfLKeYjvP7gkDIJLy5vlh9vp1TIWlVMCVLN2n9cyYmcD9KdWa6nJtzaYdeZUvCLEnoWToMDK22dc9S3xgXxP0Ff3GZjhJrCF4wWzuH5r0qpFaUCqfMcFg+wt/qAS7GKZRtjjx4xvJFa+3SjsXenNPioArK/6QJ653C0EW9i1bMA2lakgQc+HKQLYrKdIn5S7q+SaIhOAQxmiLU6ec60TAVYmCojxS3AKej9A/LVANSwqbsmqAodjYraKCt+8kUOZrS9q1ZNg==;
	5:efktiNjVBO1kl9QzO07F+b1kXzgENxvsWzj7s177/F4+9EIwZtXuTM/MCy4FC9IQMPE4CJ9RFGtm+T4lI8cvvJgbBdZlH6488U8VKmFFCfRSgpQYgVzLi6P1ecOPaMEZvKRKPZLQFXrBNdyuuSB/XvfUaiSGqJIRg35P5S6HI4o=;
	7:E2SRJNRMYlgiBZZ0/h1UXrRdtkMO/l4VoUQ0I+8w8kSd1VsjtKmERolnYBIv95gGSrd0HXEdrZ6TnHyoN9ZTZEWC0YtmeQQNNM9QIrsHzQIpAECMi8rT2p4YHIOV05oWpaiW/64h5JvWyTK/LsBiVQ==
x-ms-office365-filtering-correlation-id: 3f804855-b6bf-499f-e4b9-08d653a386fe
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(7021145)(8989299)(5600074)(711020)(4534185)(7022145)(4603075)(7168020)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR2201MB1145; 
x-ms-traffictypediagnostic: DM5PR2201MB1145:
x-microsoft-antispam-prvs: <DM5PR2201MB114514A0470BD0D910FDA486D4D70@DM5PR2201MB1145.namprd22.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(3231443)(944501410)(52105112)(10201501046)(93006095)(93001095)(148016)(149066)(150057)(6041310)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(2016111802025)(6043046)(201708071742011)(7699051)(76991095);
	SRVR:DM5PR2201MB1145; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR2201MB1145; 
x-forefront-prvs: 086831DFB4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(346002)(366004)(376002)(136003)(39840400004)(199004)(189003)(99286004)(31696002)(186003)(305945005)(7736002)(71200400001)(71190400001)(97736004)(3846002)(6116002)(86362001)(31686004)(68736007)(54906003)(110136005)(316002)(81156014)(105586002)(5660300001)(106356001)(66066001)(4326008)(2616005)(6512007)(53936002)(6246003)(6636002)(76176011)(486006)(476003)(6506007)(11346002)(14454004)(25786009)(386003)(6436002)(102836004)(256004)(229853002)(446003)(8676002)(52116002)(55236004)(508600001)(36756003)(81166006)(26005)(2906002)(6486002)(8936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR2201MB1145;
	H:DM5PR2201MB1497.namprd22.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: xvVSy1WWMSb6M6hTX8h9VUz8NDzw2qbnTzsoNMmCFbXaJWQ3zt5HNGSo21XNvyW4Mbn7gaA7iEneP5ykIHJFdSLanuYz9Ba5ir/A2zZDjyn9hpgJQzKO94e3pSHyfEV0cTD3oLXrkb/vSWcz5c/4ySstgC9Yf6bmBXKczmuicefJDJZfD0oWndA2mdz8J2XLmSOpYVbFkJFRYpz/Mdt+dzQVKZYSXhnp4LtEFlQcMrmA4KgzMas6Pe/e3y2z1eDiCc5Qpqbi6mBNSA+t+Jk6o+Mp6UkmWhFA5+yzMf8xRPaEGr7RVZiiM6cKMA1kCQPBTv/U8LnIgcuZzQBVt4x8Fiiqgr3OVuaWblw6TBHSgws=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <555507E1B6A4CB41B4179601E6099BED@namprd22.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wavecomp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f804855-b6bf-499f-e4b9-08d653a386fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2018 13:31:53.6695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR2201MB1145
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.71.95
X-Mailman-Approved-At: Mon, 26 Nov 2018 08:49:46 -0500
Subject: Re: [Qemu-trivial] [PATCH for-3.1 05/25] MAINTAINERS: Add missing
 entries for the Jazz machine
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
X-List-Received-Date: Mon, 26 Nov 2018 13:32:03 -0000

DQpPbiAyNS4xMS4xOC4gMjE6NDksIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPiBT
aWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+
DQo+IC0tLQ0KPiAgIE1BSU5UQUlORVJTIHwgMiArKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykNCg0KDQpSZXZpZXdlZC1ieTogU3RlZmFuIE1hcmtvdmljIDxzbWFya292aWNA
d2F2ZWNvbXAuY29tPg0KDQoNCj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5F
UlMNCj4gaW5kZXggMDA3Zjg5ZjEyNi4uNGUzOTZjYmU3MSAxMDA2NDQNCj4gLS0tIGEvTUFJTlRB
SU5FUlMNCj4gKysrIGIvTUFJTlRBSU5FUlMNCj4gQEAgLTgzNSw2ICs4MzUsOCBAQCBNOiBIZXJ2
w6kgUG91c3NpbmVhdSA8aHBvdXNzaW5AcmVhY3Rvcy5vcmc+DQo+ICAgUjogU3RlZmFuIE1hcmtv
dmljIDxzbWFya292aWNAd2F2ZWNvbXAuY29tPg0KPiAgIFM6IE1haW50YWluZWQNCj4gICBGOiBo
dy9taXBzL21pcHNfamF6ei5jDQo+ICtGOiBody9kaXNwbGF5L2phenpfbGVkLmMNCj4gK0Y6IGh3
L2RtYS9yYzQwMzAuYw0KPiAgIA0KPiAgIE1hbHRhDQo+ICAgTTogQXVyZWxpZW4gSmFybm8gPGF1
cmVsaWVuQGF1cmVsMzIubmV0Pg0K

