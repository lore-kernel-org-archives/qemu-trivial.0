Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e7cFO-0002CQ-Od
	for mharc-qemu-trivial@gnu.org; Thu, 26 Oct 2017 03:06:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amarnath.valluri@intel.com>) id 1e7cFL-00029l-QF
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 03:06:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amarnath.valluri@intel.com>) id 1e7cFH-0002YF-T9
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 03:06:31 -0400
Received: from mga01.intel.com ([192.55.52.88]:25885)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <amarnath.valluri@intel.com>)
	id 1e7cFD-0002VN-Jn; Thu, 26 Oct 2017 03:06:23 -0400
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Oct 2017 00:06:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,434,1503385200"; d="scan'208";a="1029573503"
Received: from irsmsx154.ger.corp.intel.com ([163.33.192.96])
	by orsmga003.jf.intel.com with ESMTP; 26 Oct 2017 00:06:20 -0700
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.8]) by
	IRSMSX154.ger.corp.intel.com ([169.254.12.83]) with mapi id
	14.03.0319.002; Thu, 26 Oct 2017 08:06:19 +0100
From: "Valluri, Amarnath" <amarnath.valluri@intel.com>
To: "f4bug@amsat.org" <f4bug@amsat.org>
CC: "dgilbert@redhat.com" <dgilbert@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, 
	"peterx@redhat.com" <peterx@redhat.com>, "marcandre.lureau@gmail.com"
	<marcandre.lureau@gmail.com>
Thread-Topic: [PATCH v2 2/4] tpm: add stubs
Thread-Index: AQHTTMKY17JQX3n3pkmdXx/CG1l8hKL1p70A
Date: Thu, 26 Oct 2017 07:06:18 +0000
Message-ID: <1509001618.3135.21.camel@intel.com>
References: <20171024122045.30072-1-f4bug@amsat.org>
	<20171024122045.30072-3-f4bug@amsat.org>
In-Reply-To: <20171024122045.30072-3-f4bug@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.68.147]
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBC91DB873F8884E8251F0DB0AE1E35F@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: Re: [Qemu-trivial] [PATCH v2 2/4] tpm: add stubs
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
X-List-Received-Date: Thu, 26 Oct 2017 07:06:32 -0000

T24gVHVlLCAyMDE3LTEwLTI0IGF0IDA5OjIwIC0wMzAwLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSB3cm90ZToNCj4gQ29tbWl0IGMzN2NhY2FiZjIyIG1vdmVkIHRwbV9jbGVhbnVwKCkgaW4gdGhl
IG1haW4gbG9vcCBleGl0LCBob3dldmVyDQo+IHRoaXMNCj4gZnVuY3Rpb24gaXMgbm90IGF2YWls
YWJsZSB3aGVuIGNvbXBpbGluZyB3aXRoIC0tZGlzYWJsZS10cG0uDQo+IA0KPiBQcm92aWRlcyBu
ZWNlc3Nhcnkgc3R1YnMgdG8ga2VlcCBjb2RlIGNsZWFuIG9mICNpZmRlZidmZXJ5Lg0KPiANCj4g
UmVwb3J0ZWQtYnk6IEJBTEFUT04gWm9sdGFuIDxiYWxhdG9uQGVpay5ibWUuaHU+DQo+IE1lc3Nh
Z2UtSWQ6IDwyMDE3MTAyMzEwMjkwMy4yNTZBRjc0NTZBMEB6ZXJvLmVpay5ibWUuaHU+DQo+IFNp
Z25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+DQo+
IFRlc3RlZC1ieTogUmljaGFyZCBXLk0uIEpvbmVzIDxyam9uZXNAcmVkaGF0LmNvbT4NCj4gLS0t
DQpSZXZpZXdlZC1ieTogQW1hcm5hdGggVmFsbHVyaSA8YW1hcm5hdGgudmFsbHVyaUBpbnRlbC5j
b20+DQo=

