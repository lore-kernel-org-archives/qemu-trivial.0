Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XX8YV-0003LA-Gu
	for mharc-qemu-trivial@gnu.org; Thu, 25 Sep 2014 08:53:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XX8YP-0003Kn-4l
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 08:53:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XX8YK-0003mu-L0
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 08:53:49 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:50212)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XX8YJ-0003dZ-Pn; Thu, 25 Sep 2014 08:53:44 -0400
Received: from 172.24.2.119 (EHLO SZXEMA402-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BZY60653; Thu, 25 Sep 2014 20:53:27 +0800 (CST)
Received: from SZXEMA503-MBS.china.huawei.com ([169.254.6.188]) by
	SZXEMA402-HUB.china.huawei.com ([10.82.72.34]) with mapi id
	14.03.0158.001; Thu, 25 Sep 2014 20:53:21 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Eric Blake <eblake@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH 1/4] os-posix/win32: convert
	fprintf/perror to error_report
Thread-Index: AQHP2KWdxdEs7HWY8U232yFVqYKoh5wRQoaAgACJUdA=
Date: Thu, 25 Sep 2014 12:53:20 +0000
Message-ID: <33183CC9F5247A488A2544077AF1902086DDB32F@SZXEMA503-MBS.china.huawei.com>
References: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>
	<1411638384-5844-2-git-send-email-arei.gonglei@huawei.com>
	<54240BB1.8020908@redhat.com>
In-Reply-To: <54240BB1.8020908@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: Bfx1 DRkk PXId RHB0 Y3Rj a8rE h8M6 kEXZ uqdi 0enX 54AF
	6+Lk +yH2 ABBMFg== ABtJeQ== AF1ysA==; 7;
	YQByAG0AYgByAHUAQAByAGUAZABoAGEAdAAuAGMAbwBtADsAZQBiAGwAYQBrAGUAQAByAGUAZABoAGEAdAAuAGMAbwBtADsAbQBqAHQAQAB0AGwAcwAuAG0AcwBrAC4AcgB1ADsAcABiAG8AbgB6AGkAbgBpAEAAcgBlAGQAaABhAHQALgBjAG8AbQA7AHAAZQB0AGUAcgAuAG0AYQB5AGQAZQBsAGwAQABsAGkAbgBhAHIAbwAuAG8AcgBnADsAcQBlAG0AdQAtAGQAZQB2AGUAbABAAG4AbwBuAGcAbgB1AC4AbwByAGcAOwBxAGUAbQB1AC0AdAByAGkAdgBpAGEAbABAAG4AbwBuAGcAbgB1AC4AbwByAGcA;
	Sosha1_v1; 7; {4649A1B3-6767-4CDF-8D4A-ED0AC21E99E6};
	YQByAGUAaQAuAGcAbwBuAGcAbABlAGkAQABoAHUAYQB3AGUAaQAuAGMAbwBtAA==;
	Thu, 25 Sep 2014 12:53:03 GMT;
	UgBFADoAIABbAFEAZQBtAHUALQBkAGUAdgBlAGwAXQAgAFsAUABBAFQAQwBIACAAMQAvADQAXQAgAG8AcwAtAHAAbwBzAGkAeAAvAHcAaQBuADMAMgA6ACAAYwBvAG4AdgBlAHIAdAAgAGYAcAByAGkAbgB0AGYALwBwAGUAcgByAG8AcgAgAHQAbwAgAGUAcgByAG8AcgBfAHIAZQBwAG8AcgB0AA==
x-cr-puzzleid: {4649A1B3-6767-4CDF-8D4A-ED0AC21E99E6}
x-originating-ip: [10.177.19.102]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"Huangweidong \(C\)" <weidong.huang@huawei.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Luonengjun <luonengjun@huawei.com>, "mjt@tls.msk.ru" <mjt@tls.msk.ru>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/4] os-posix/win32: convert
 fprintf/perror to error_report
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
X-List-Received-Date: Thu, 25 Sep 2014 12:53:54 -0000

PiBTdWJqZWN0OiBSZTogW1FlbXUtZGV2ZWxdIFtQQVRDSCAxLzRdIG9zLXBvc2l4L3dpbjMyOiBj
b252ZXJ0IGZwcmludGYvcGVycm9yIHRvDQo+IGVycm9yX3JlcG9ydA0KPiANCj4gT24gMDkvMjUv
MjAxNCAwMzo0NiBBTSwgYXJlaS5nb25nbGVpQGh1YXdlaS5jb20gd3JvdGU6DQo+ID4gRnJvbTog
R29uZ2xlaSA8YXJlaS5nb25nbGVpQGh1YXdlaS5jb20+DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBHb25nbGVpIDxhcmVpLmdvbmdsZWlAaHVhd2VpLmNvbT4NCj4gPiAtLS0NCj4gPiAgb3MtcG9z
aXguYyB8IDM0ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgb3Mtd2lu
MzIuYyB8ICAzICsrLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDE3
IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL29zLXBvc2l4LmMgYi9vcy1wb3Np
eC5jDQo+ID4gaW5kZXggY2IyYTdmNy4uOWQ1YWU3MCAxMDA2NDQNCj4gPiAtLS0gYS9vcy1wb3Np
eC5jDQo+ID4gKysrIGIvb3MtcG9zaXguYw0KPiA+IEBAIC0zOSw2ICszOSw3IEBADQo+ID4gICNp
bmNsdWRlICJzeXNlbXUvc3lzZW11LmgiDQo+ID4gICNpbmNsdWRlICJuZXQvc2xpcnAuaCINCj4g
PiAgI2luY2x1ZGUgInFlbXUtb3B0aW9ucy5oIg0KPiA+ICsjaW5jbHVkZSAicWVtdS9lcnJvci1y
ZXBvcnQuaCINCj4gPg0KPiA+ICAjaWZkZWYgQ09ORklHX0xJTlVYDQo+ID4gICNpbmNsdWRlIDxz
eXMvcHJjdGwuaD4NCj4gPiBAQCAtMTIwLDExICsxMjEsMTEgQEAgdm9pZCBvc19zZXRfcHJvY19u
YW1lKGNvbnN0IGNoYXIgKnMpDQo+ID4gICAgICAvKiBDb3VsZCByZXdyaXRlIGFyZ3ZbMF0gdG9v
LCBidXQgdGhhdCdzIGEgYml0IG1vcmUgY29tcGxpY2F0ZWQuDQo+ID4gICAgICAgICBUaGlzIHNp
bXBsZSB3YXkgaXMgZW5vdWdoIGZvciBgdG9wJy4gKi8NCj4gPiAgICAgIGlmIChwcmN0bChQUl9T
RVRfTkFNRSwgbmFtZSkpIHsNCj4gPiAtICAgICAgICBwZXJyb3IoInVuYWJsZSB0byBjaGFuZ2Ug
cHJvY2VzcyBuYW1lIik7DQo+ID4gKyAgICAgICAgZXJyb3JfcmVwb3J0KCJ1bmFibGUgdG8gY2hh
bmdlIHByb2Nlc3MgbmFtZSIpOw0KPiANCj4gVGhpcyBsb3NlcyB0aGUgdmFsdWUgb2YgZXJybm8g
dGhhdCBwZXJyb3Igd291bGQgaGF2ZSBkaXNwbGF5ZWQuICBJcyB0aGF0DQo+IHJlZHVjdGlvbiBp
biBlcnJvciBtZXNzYWdlIHF1YWxpdHkgaW50ZW50aW9uYWw/ICANCg0KT2YgY291cnNlIG5vdC4g
OikNCg0KPiBJZiBub3QsIHRoZW4gdGhpcyBpcw0KPiBub3QgYSB0cml2aWFsIGNvbnZlcnNpb247
IGlmIGl0IGlzLCB0aGVuIHlvdXIgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIGNhbGwNCj4gaXQgb3V0
Lg0KPiANCg0KSSBhZ3JlZSB3aXRoIHlvdS4gQWN0dWFsbHkgSSBtaXNzZWQgdGhlIHVzYWdlIG9m
IHBlcnJvcigpLCB0aGFua3MgZm9yIA0KeW91ciBwb2ludC4gTWF5YmUgSSBzaG91bGQgcmVtb3Zl
IHRoZSBjaGFuZ2VzIGFib3V0IHBlcnJvcigpIGluIA0KbmV4dCB2ZXJzaW9uLg0KDQo+ID4gQEAg
LTE2NywyMCArMTY4LDIwIEBAIHN0YXRpYyB2b2lkIGNoYW5nZV9wcm9jZXNzX3VpZCh2b2lkKQ0K
PiA+ICB7DQo+ID4gICAgICBpZiAodXNlcl9wd2QpIHsNCj4gPiAgICAgICAgICBpZiAoc2V0Z2lk
KHVzZXJfcHdkLT5wd19naWQpIDwgMCkgew0KPiA+IC0gICAgICAgICAgICBmcHJpbnRmKHN0ZGVy
ciwgIkZhaWxlZCB0byBzZXRnaWQoJWQpXG4iLCB1c2VyX3B3ZC0+cHdfZ2lkKTsNCj4gPiArICAg
ICAgICAgICAgZXJyb3JfcmVwb3J0KCJGYWlsZWQgdG8gc2V0Z2lkKCVkKVxuIiwgdXNlcl9wd2Qt
PnB3X2dpZCk7DQo+IA0KPiBObyB0cmFpbGluZyBcbiBmb3IgZXJyb3JfcmVwb3J0LCBwbGVhc2Uu
IChZb3UgZ290IGl0IHJpZ2h0IGluIG1vc3Qgb2YNCj4geW91ciBjb252ZXJzaW9ucykNCj4gDQoN
CkhtbSwgeWVzLg0KDQo+IA0KPiA+IEBAIC0xOTAsMTEgKzE5MSwxMSBAQCBzdGF0aWMgdm9pZCBj
aGFuZ2Vfcm9vdCh2b2lkKQ0KPiA+ICB7DQo+ID4gICAgICBpZiAoY2hyb290X2Rpcikgew0KPiA+
ICAgICAgICAgIGlmIChjaHJvb3QoY2hyb290X2RpcikgPCAwKSB7DQo+ID4gLSAgICAgICAgICAg
IGZwcmludGYoc3RkZXJyLCAiY2hyb290IGZhaWxlZFxuIik7DQo+ID4gKyAgICAgICAgICAgIGVy
cm9yX3JlcG9ydCgiY2hyb290IGZhaWxlZCIpOw0KPiA+ICAgICAgICAgICAgICBleGl0KDEpOw0K
PiA+ICAgICAgICAgIH0NCj4gPiAgICAgICAgICBpZiAoY2hkaXIoIi8iKSkgew0KPiA+IC0gICAg
ICAgICAgICBwZXJyb3IoIm5vdCBhYmxlIHRvIGNoZGlyIHRvIC8iKTsNCj4gPiArICAgICAgICAg
ICAgZXJyb3JfcmVwb3J0KCJub3QgYWJsZSB0byBjaGRpciB0byAvIik7DQo+IA0KPiBBbm90aGVy
IGxvc3Mgb2YgZXJybm8gdmFsdWUgZnJvbSBwZXJyb3IuDQo+IA0KPiA+ICAgICAgICAgICAgICBl
eGl0KDEpOw0KPiA+ICAgICAgICAgIH0NCj4gPiAgICAgIH0NCj4gPiBAQCAtMjI0LDcgKzIyNSw3
IEBAIHZvaWQgb3NfZGFlbW9uaXplKHZvaWQpDQo+ID4gICAgICAgICAgICAgIGlmIChsZW4gIT0g
MSkNCj4gPiAgICAgICAgICAgICAgICAgIGV4aXQoMSk7DQo+ID4gICAgICAgICAgICAgIGVsc2Ug
aWYgKHN0YXR1cyA9PSAxKSB7DQo+ID4gLSAgICAgICAgICAgICAgICBmcHJpbnRmKHN0ZGVyciwg
IkNvdWxkIG5vdCBhY3F1aXJlIHBpZGZpbGU6ICVzXG4iLA0KPiBzdHJlcnJvcihlcnJubykpOw0K
PiA+ICsgICAgICAgICAgICAgICAgZXJyb3JfcmVwb3J0KCJDb3VsZCBub3QgYWNxdWlyZSBwaWRm
aWxlOiAlcyIsDQo+IHN0cmVycm9yKGVycm5vKSk7DQo+IA0KPiBUaGlzIGNvZGUgaXMgYnJva2Vu
LiAgVGhlIGVhcmxpZXIgJ2lmIChsZW4gIT0gMSknIGZhaWxzIHRvIHByaW50IGENCj4gbWVzc2Fn
ZSBiZWZvcmUgZXhpdGluZyAobm90IHRvIG1lbnRpb24gaXQgdmlvbGF0ZXMgY29kaW5nIHN0eWxl
IGJ5DQo+IG9taXR0aW5nIHt9KS4gIFRoZW4sIGlmIHdlIGdldCBpbnNpZGUgdGhlICdlbHNlIGlm
IChzdGF0dXMgPT0gMSknDQo+IGNvbmRpdGlvbmFsLCB0aGVuIHdlIEtOT1cgdGhhdCByZWFkKCkg
c3VjY2VlZGVkLCBhbmQgdGhlcmVmb3JlIGVycm5vIGlzDQo+IHVuc3BlY2lmaWVkLiAgUHJpbnRp
bmcgc3RyZXJyb3IoZXJybm8pIG9uIGEgcmFuZG9tIHZhbHVlIGlzIE5PVCBoZWxwZnVsLg0KPiAN
Cg0KR29vZCBjYXRjaCEgV2lsbCBmaXggdGhvc2UuIDopICAgIFRoYW5rcyBmb3IgeW91ciByZXZp
ZXdpbmchIEVyaWMuDQoNCkJlc3QgcmVnYXJkcywNCi1Hb25nbGVpDQoNCj4gDQo+ID4gQEAgLTI2
Nyw3ICsyNjgsNyBAQCB2b2lkIG9zX3NldHVwX3Bvc3Qodm9pZCkNCj4gPiAgCSAgICBleGl0KDEp
Ow0KPiA+DQo+ID4gICAgICAgICAgaWYgKGNoZGlyKCIvIikpIHsNCj4gPiAtICAgICAgICAgICAg
cGVycm9yKCJub3QgYWJsZSB0byBjaGRpciB0byAvIik7DQo+ID4gKyAgICAgICAgICAgIGVycm9y
X3JlcG9ydCgibm90IGFibGUgdG8gY2hkaXIgdG8gLyIpOw0KPiANCj4gQW5vdGhlciBsb3NzIG9m
IGVycm5vIHJlcG9ydGluZy4NCj4gDQo+ID4gICAgICAgICAgICAgIGV4aXQoMSk7DQo+ID4gICAg
ICAgICAgfQ0KPiA+ICAJVEZSKGZkID0gcWVtdV9vcGVuKCIvZGV2L251bGwiLCBPX1JEV1IpKTsN
Cj4gPiBAQCAtMjkyLDEwICsyOTMsMTEgQEAgdm9pZCBvc19waWRmaWxlX2Vycm9yKHZvaWQpDQo+
ID4gICAgICBpZiAoZGFlbW9uaXplKSB7DQo+ID4gICAgICAgICAgdWludDhfdCBzdGF0dXMgPSAx
Ow0KPiA+ICAgICAgICAgIGlmICh3cml0ZShmZHNbMV0sICZzdGF0dXMsIDEpICE9IDEpIHsNCj4g
PiAtICAgICAgICAgICAgcGVycm9yKCJkYWVtb25pemUuIFdyaXRpbmcgdG8gcGlwZVxuIik7DQo+
ID4gKyAgICAgICAgICAgIGVycm9yX3JlcG9ydCgiZGFlbW9uaXplLiBXcml0aW5nIHRvIHBpcGUi
KTsNCj4gDQo+IGFuZCBhbm90aGVyLg0KPiANCj4gPiBAQCAtMzM4LDcgKzM0MCw3IEBAIGludCBv
c19tbG9jayh2b2lkKQ0KPiA+DQo+ID4gICAgICByZXQgPSBtbG9ja2FsbChNQ0xfQ1VSUkVOVCB8
IE1DTF9GVVRVUkUpOw0KPiA+ICAgICAgaWYgKHJldCA8IDApIHsNCj4gPiAtICAgICAgICBwZXJy
b3IoIm1sb2NrYWxsIik7DQo+ID4gKyAgICAgICAgZXJyb3JfcmVwb3J0KCJtbG9ja2FsbCIpOw0K
PiANCj4gYW5kIGFub3RoZXIuDQo+IA0KPiAtLQ0KPiBFcmljIEJsYWtlICAgZWJsYWtlIHJlZGhh
dCBjb20gICAgKzEtOTE5LTMwMS0zMjY2DQo+IExpYnZpcnQgdmlydHVhbGl6YXRpb24gbGlicmFy
eSBodHRwOi8vbGlidmlydC5vcmcNCg0K

