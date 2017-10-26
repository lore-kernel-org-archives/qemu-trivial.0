Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e7cE1-0001Gv-PF
	for mharc-qemu-trivial@gnu.org; Thu, 26 Oct 2017 03:05:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37539)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amarnath.valluri@intel.com>) id 1e7cDu-00018n-7H
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 03:05:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amarnath.valluri@intel.com>) id 1e7cDt-0001zF-En
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 03:05:02 -0400
Received: from mga09.intel.com ([134.134.136.24]:56704)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <amarnath.valluri@intel.com>)
	id 1e7cDo-0001wx-Om; Thu, 26 Oct 2017 03:04:56 -0400
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Oct 2017 00:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,434,1503385200"; d="scan'208";a="142388497"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by orsmga004.jf.intel.com with ESMTP; 26 Oct 2017 00:04:54 -0700
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.8]) by
	IRSMSX102.ger.corp.intel.com ([169.254.2.180]) with mapi id
	14.03.0319.002; Thu, 26 Oct 2017 08:04:53 +0100
From: "Valluri, Amarnath" <amarnath.valluri@intel.com>
To: "f4bug@amsat.org" <f4bug@amsat.org>
CC: "dgilbert@redhat.com" <dgilbert@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, 
	"peterx@redhat.com" <peterx@redhat.com>, "marcandre.lureau@gmail.com"
	<marcandre.lureau@gmail.com>
Thread-Topic: [PATCH v2 3/4] tpm: remove unnecessary #ifdef CONFIG_TPM
Thread-Index: AQHTTMKjyyeVYPii10yWUiW7jh+OeKL1p1kA
Date: Thu, 26 Oct 2017 07:04:52 +0000
Message-ID: <1509001534.3135.20.camel@intel.com>
References: <20171024122045.30072-1-f4bug@amsat.org>
	<20171024122045.30072-4-f4bug@amsat.org>
In-Reply-To: <20171024122045.30072-4-f4bug@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.68.147]
Content-Type: text/plain; charset="utf-8"
Content-ID: <33F9E73C541EC54C8BA368F83404470B@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: Re: [Qemu-trivial] [PATCH v2 3/4] tpm: remove unnecessary #ifdef
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
X-List-Received-Date: Thu, 26 Oct 2017 07:05:08 -0000

T24gVHVlLCAyMDE3LTEwLTI0IGF0IDA5OjIwIC0wMzAwLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSB3cm90ZToNCj4gTWFrZWZpbGUub2JqcyBub3cgY2hlY2tzIGZvciAkKENPTkZJR19UUE0pLg0K
PiANCj4gU3VnZ2VzdGVkLWJ5OiBTdGVmYW4gQmVyZ2VyIDxzdGVmYW5iQGxpbnV4LnZuZXQuaWJt
LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFt
c2F0Lm9yZz4NCj4gLS0tDQoNClJldmlld2VkLWJ5OiBBbWFybmF0aCBWYWxsdXJpIDxhbWFybmF0
aC52YWxsdXJpQGludGVsLmNvbT4NCg0KPiDCoHRwbS5jIHwgNCAtLS0tDQo+IMKgMSBmaWxlIGNo
YW5nZWQsIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdHBtLmMgYi90cG0uYw0K
PiBpbmRleCA0NTUyMGY1NTVkLi5hYjVkMjllOTFlIDEwMDY0NA0KPiAtLS0gYS90cG0uYw0KPiAr
KysgYi90cG0uYw0KPiBAQCAtMzAsOCArMzAsNiBAQCB2b2lkIHRwbV9yZWdpc3Rlcl9tb2RlbChl
bnVtIFRwbU1vZGVsIG1vZGVsKQ0KPiDCoMKgwqDCoMKgdHBtX21vZGVsc1ttb2RlbF0gPSB0cnVl
Ow0KPiDCoH0NCj4gwqANCj4gLSNpZmRlZiBDT05GSUdfVFBNDQo+IC0NCj4gwqBzdGF0aWMgY29u
c3QgVFBNQmFja2VuZENsYXNzICoNCj4gwqB0cG1fYmVfZmluZF9ieV90eXBlKGVudW0gVHBtVHlw
ZSB0eXBlKQ0KPiDCoHsNCj4gQEAgLTE5Miw4ICsxOTAsNiBAQCBpbnQgdHBtX2NvbmZpZ19wYXJz
ZShRZW11T3B0c0xpc3QgKm9wdHNfbGlzdCwNCj4gY29uc3QgY2hhciAqb3B0YXJnKQ0KPiDCoMKg
wqDCoMKgcmV0dXJuIDA7DQo+IMKgfQ0KPiDCoA0KPiAtI2VuZGlmIC8qIENPTkZJR19UUE0gKi8N
Cj4gLQ0KPiDCoC8qDQo+IMKgICogV2FsayB0aGUgbGlzdCBvZiBhY3RpdmUgVFBNIGJhY2tlbmRz
IGFuZCBjb2xsZWN0IGluZm9ybWF0aW9uDQo+IGFib3V0IHRoZW0NCj4gwqAgKiBmb2xsb3dpbmcg
dGhlIHNjaGVtYSBkZXNjcmlwdGlvbiBpbiBxYXBpLXNjaGVtYS5qc29uLg==

