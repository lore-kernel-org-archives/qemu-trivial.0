Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e7cD8-0000be-11
	for mharc-qemu-trivial@gnu.org; Thu, 26 Oct 2017 03:04:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amarnath.valluri@intel.com>) id 1e7cD5-0000ZL-8v
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 03:04:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amarnath.valluri@intel.com>) id 1e7cD4-0001aG-Bk
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 03:04:11 -0400
Received: from mga03.intel.com ([134.134.136.65]:41635)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <amarnath.valluri@intel.com>)
	id 1e7cCz-0001T6-Dq; Thu, 26 Oct 2017 03:04:05 -0400
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Oct 2017 00:04:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,434,1503385200"; d="scan'208";a="327910131"
Received: from irsmsx109.ger.corp.intel.com ([163.33.3.23])
	by fmsmga004.fm.intel.com with ESMTP; 26 Oct 2017 00:04:01 -0700
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.8]) by
	IRSMSX109.ger.corp.intel.com ([169.254.13.28]) with mapi id
	14.03.0319.002; Thu, 26 Oct 2017 08:03:59 +0100
From: "Valluri, Amarnath" <amarnath.valluri@intel.com>
To: "f4bug@amsat.org" <f4bug@amsat.org>
CC: "dgilbert@redhat.com" <dgilbert@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, 
	"peterx@redhat.com" <peterx@redhat.com>, "marcandre.lureau@gmail.com"
	<marcandre.lureau@gmail.com>
Thread-Topic: [PATCH v2 4/4] vl: remove unnecessary #ifdef CONFIG_TPM
Thread-Index: AQHTTMKmii7Sl/Gmek2UiIbebndxA6L1pxiA
Date: Thu, 26 Oct 2017 07:03:58 +0000
Message-ID: <1509001479.3135.19.camel@intel.com>
References: <20171024122045.30072-1-f4bug@amsat.org>
	<20171024122045.30072-5-f4bug@amsat.org>
In-Reply-To: <20171024122045.30072-5-f4bug@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.68.147]
Content-Type: text/plain; charset="utf-8"
Content-ID: <6817469F645DD24685CB257BEB260746@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: Re: [Qemu-trivial] [PATCH v2 4/4] vl: remove unnecessary #ifdef
 CONFIG_TPM
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
X-List-Received-Date: Thu, 26 Oct 2017 07:04:12 -0000

T24gVHVlLCAyMDE3LTEwLTI0IGF0IDA5OjIwIC0wMzAwLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSB3cm90ZToNCj4gYSBzdHViIGlzIG5vdyBwcm92aWRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+DQo+IFRlc3RlZC1ieTog
UmljaGFyZCBXLk0uIEpvbmVzIDxyam9uZXNAcmVkaGF0LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEFt
YXJuYXRoIFZhbGx1cmkgPGFtYXJuYXRoLnZhbGx1cmlAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiDC
oHZsLmMgfCAyIC0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pDQo+IFJldmll
d2VkLWJ5Og0KPiBkaWZmIC0tZ2l0IGEvdmwuYyBiL3ZsLmMNCj4gaW5kZXggMDcyMzgzNWJiZi4u
ZWMyOTkwOTlmZiAxMDA2NDQNCj4gLS0tIGEvdmwuYw0KPiArKysgYi92bC5jDQo+IEBAIC00NjI0
LDExICs0NjI0LDkgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2LCBjaGFyICoqZW52
cCkNCj4gwqDCoMKgwqDCoMKgwqDCoMKgZXhpdCgxKTsNCj4gwqDCoMKgwqDCoH0NCj4gwqANCj4g
LSNpZmRlZiBDT05GSUdfVFBNDQo+IMKgwqDCoMKgwqBpZiAodHBtX2luaXQoKSA8IDApIHsNCj4g
wqDCoMKgwqDCoMKgwqDCoMKgZXhpdCgxKTsNCj4gwqDCoMKgwqDCoH0NCj4gLSNlbmRpZg0KPiDC
oA0KPiDCoMKgwqDCoMKgLyogaW5pdCB0aGUgYmx1ZXRvb3RoIHdvcmxkICovDQo+IMKgwqDCoMKg
wqBpZiAoZm9yZWFjaF9kZXZpY2VfY29uZmlnKERFVl9CVCwgYnRfcGFyc2UpKQ==

