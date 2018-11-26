Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRHGl-00072M-Lt
	for mharc-qemu-trivial@gnu.org; Mon, 26 Nov 2018 08:49:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <smarkovic@wavecomp.com>) id 1gRH23-0005as-8Z
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 08:34:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <smarkovic@wavecomp.com>) id 1gRH1z-0003QV-85
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 08:34:35 -0500
Received: from mail-eopbgr770095.outbound.protection.outlook.com
	([40.107.77.95]:65117
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <smarkovic@wavecomp.com>)
	id 1gRH1z-0003Py-2m; Mon, 26 Nov 2018 08:34:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yk33XAMzz5Z5i5LXsTHtV/DNhYX/+yxnayFj6RzZEH0=;
	b=C1UmAISg+Cwoscq/QkTHDq4qhRqLUSNqLizACx4MrspS6Q0a/4anJMWxhcncsCyHOUpvlxOmemmOYhj/eRcXHBkQ7pXnoBcdWAAOHZ/rIGi7fYYwtlG1uluSlOMtNSF2aOBsh/qs506TieaTrWEOqbRL56Uy07u8q3Qo5pXg0KU=
Received: from DM5PR2201MB1497.namprd22.prod.outlook.com (10.174.187.12) by
	DM5PR2201MB1308.namprd22.prod.outlook.com (10.174.178.20) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.16; Mon, 26 Nov 2018 13:34:28 +0000
Received: from DM5PR2201MB1497.namprd22.prod.outlook.com
	([fe80::bcf5:4889:36af:68f2]) by
	DM5PR2201MB1497.namprd22.prod.outlook.com
	([fe80::bcf5:4889:36af:68f2%5]) with mapi id 15.20.1361.019;
	Mon, 26 Nov 2018 13:34:28 +0000
From: Stefan Markovic <smarkovic@wavecomp.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>, Thomas
	Huth <thuth@redhat.com>, Aleksandar Markovic <amarkovic@wavecomp.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
	<qemu-trivial@nongnu.org>
Thread-Topic: [PATCH for-3.1 07/25] MAINTAINERS: Add a missing entry for the
	Fulong 2E machine
Thread-Index: AQHUhQCyBNyPdha4f0WS9MxnmFkM3aViD4GA
Date: Mon, 26 Nov 2018 13:34:28 +0000
Message-ID: <917a0cd2-7c0e-c798-b19f-d8a1c2b22fdb@wavecomp.com>
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-8-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-8-philmd@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CWXP265CA0077.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:401:39::17) To DM5PR2201MB1497.namprd22.prod.outlook.com
	(2603:10b6:4:36::12)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=smarkovic@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [82.117.201.26]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR2201MB1308;
	6:L+f3aRmt/L2qRCEEQiFVMcVSAK2kzIaehv5r6RjKWM9OoRMxXXcUUgsvour+4hFWKDGY66DOmY0Gh6jAeSV0VmxQcR+/WfdsEjKKEwI6P8+hNJuNv677s8mzwDv5duepHCbUatbs4PceT8J0Ei6QkpIRlAOVvLYX9vQI4dGOjfcbbQ04IrpbJ27QZX3+j2rfcq6Eh859XdCUgs3opuaxaR/DeyiIO9BcM3WgcG3jqLpWWF6OqN9JloiGD4+N4bTxUu8xq4gicTuRkqWNgjbpaZeFeXeXyOLufLzs8VoogaokT03blXX+X+eIKX+TFE7TFF4PewfJ9WuaD3GU1YvsidphxN9UpYg3r9Gd4rA6PYzxOB+PQmWpiSeQ61LFlJct9gW0Y1JPRjrvBvu79GgpOHItlxlS3TYkV/DnDQsTLupCm/iiERRXxDOLrzIN9yTGf4LMdJfEvcwwaqQ9Cd30jg==;
	5:2vIFI0zfltRWqUeL7lcnoa83T9RFTXPkuf205GXIPUWoWyo11++ictrymLdUs6ZwtILnEc9VNKv2HW4L9w5wghAMlY8J7c3DCSLsj7D83M5e36UEUeq5PepaKCAdXCQUC5ht5FqRtIf9atFRGFfyvB83ZlRkFd9JUNzxW4XTX44=;
	7:jAw/oqjy3L3AEeEOvDadVZ84hYQqyXwNJVyEhaERN67gQZ32K95Igln3lfuAPGPuu3LxnpWkGf1CX82Lu2aqXO63daQ5X8qQ9YJrH2Zr5qNBY7nLetjjCfTntRZU/EK3hJQ4WyjWKO0GEdpiPZGFpw==
x-ms-office365-filtering-correlation-id: 0d32bf36-d60a-49ea-eb59-08d653a3e359
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(7168020)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR2201MB1308; 
x-ms-traffictypediagnostic: DM5PR2201MB1308:
x-microsoft-antispam-prvs: <DM5PR2201MB1308EF2C3FBEFC574E875B29D4D70@DM5PR2201MB1308.namprd22.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231443)(944501410)(52105112)(10201501046)(3002001)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(2016111802025)(20161123562045)(6043046)(201708071742011)(7699051)(76991095);
	SRVR:DM5PR2201MB1308; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR2201MB1308; 
x-forefront-prvs: 086831DFB4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(366004)(396003)(136003)(39840400004)(189003)(199004)(102836004)(97736004)(31696002)(508600001)(3846002)(186003)(6116002)(68736007)(6436002)(25786009)(7736002)(5660300001)(86362001)(229853002)(71200400001)(71190400001)(14454004)(256004)(316002)(8676002)(53936002)(4326008)(2616005)(81156014)(6636002)(386003)(6506007)(81166006)(54906003)(486006)(8936002)(36756003)(110136005)(6246003)(446003)(6512007)(11346002)(476003)(52116002)(31686004)(105586002)(76176011)(66066001)(2906002)(26005)(106356001)(6486002)(99286004)(55236004)(305945005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR2201MB1308;
	H:DM5PR2201MB1497.namprd22.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: CUKDMEzXOYmdk9FDdg+J/yt+Ipe1tYESimPDEhYNfeu75kcCjRkFxh1tYia3fxOhdNFcpyxxudZvxDb/9EguBrHtokyd+O9IfrW5PjP2ZwFqTwuChEFh+lZVHDEki5lMkamFEvZPe2kWWnFA2O3/ob3jbVzUs2EO4Sv/418aLaIQR77w74cGScHaApX+2Cn8dyf3g/XQvFp0T3w6UmOUgFSZxbnMhUQZknfcTQlRhmk3+qtV9Zk+YOpNngiDAaujqHq4IwRFQOEj2sLsJL1CFPaoX8gLlBHbPEep141dzPH38ruP7n9WkTQ3F/cppy3QwsN98k1LPYXezh1PstufQSEPDRZHxL+y5hZo4teaPG4=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3ED7F5014176F45B1295AEECE81D751@namprd22.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wavecomp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d32bf36-d60a-49ea-eb59-08d653a3e359
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2018 13:34:28.1331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR2201MB1308
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.77.95
X-Mailman-Approved-At: Mon, 26 Nov 2018 08:49:46 -0500
Subject: Re: [Qemu-trivial] [PATCH for-3.1 07/25] MAINTAINERS: Add a missing
 entry for the Fulong 2E machine
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
X-List-Received-Date: Mon, 26 Nov 2018 13:34:40 -0000

DQpPbiAyNS4xMS4xOC4gMjE6NDksIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPiBT
aWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+
DQo+IC0tLQ0KPiAgIE1BSU5UQUlORVJTIHwgMSArDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspDQoNCg0KUmV2aWV3ZWQtYnk6IFN0ZWZhbiBNYXJrb3ZpYyA8c21hcmtvdmljQHdh
dmVjb21wLmNvbT4NCg0KDQo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJT
DQo+IGluZGV4IGFhMTdlOWJiZDMuLjgxYTIyYjJjY2YgMTAwNjQ0DQo+IC0tLSBhL01BSU5UQUlO
RVJTDQo+ICsrKyBiL01BSU5UQUlORVJTDQo+IEBAIC04NjQsNiArODY0LDcgQEAgUjogU3RlZmFu
IE1hcmtvdmljIDxzbWFya292aWNAd2F2ZWNvbXAuY29tPg0KPiAgIFM6IE9kZCBGaXhlcw0KPiAg
IEY6IGh3L21pcHMvbWlwc19mdWxvbmcyZS5jDQo+ICAgRjogaHcvaXNhL3Z0ODJjNjg2LmMNCj4g
K0Y6IGh3L3BjaS1ob3N0L2Jvbml0by5jDQo+ICAgDQo+ICAgRjogaW5jbHVkZS9ody9pc2EvdnQ4
MmM2ODYuaA0KPiAgIA0K

