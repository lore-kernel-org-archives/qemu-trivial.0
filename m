Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b8QA2-0003Dy-Ic
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jun 2016 06:47:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1b8QA0-0003Ch-KA
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2016 06:47:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1b8Q9w-00051t-0v
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2016 06:47:32 -0400
Received: from [59.151.112.132] (port=58412 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>)
	id 1b8Q9d-0004yq-RI; Thu, 02 Jun 2016 06:47:11 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="7243526"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jun 2016 18:46:57 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 0CAE6498F583;
	Thu,  2 Jun 2016 18:46:55 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0279.002; Thu, 2 Jun 2016 18:46:54 +0800
From: "Wei, Jiangang" <weijg.fnst@cn.fujitsu.com>
To: "armbru@redhat.com" <armbru@redhat.com>
CC: "kwolf@redhat.com" <kwolf@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, 
	"qemu-block@nongnu.org" <qemu-block@nongnu.org>, "mreitz@redhat.com"
	<mreitz@redhat.com>
Thread-Topic: [Qemu-devel] [PATCH] block/raw-posix: Fix error_report of
	mounting message
Thread-Index: AQHRvKRo0PX3QPl+l0WmOCSfEetV5Z/VeHoA
Date: Thu, 2 Jun 2016 10:46:54 +0000
Message-ID: <1464864354.5185.30.camel@localhost>
References: <1464764901-8773-1-git-send-email-weijg.fnst@cn.fujitsu.com>
	<87lh2oja5g.fsf@dusky.pond.sub.org>
In-Reply-To: <87lh2oja5g.fsf@dusky.pond.sub.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.50]
Content-Type: text/plain; charset="utf-8"
Content-ID: <851C2A4381F5F8498A141E7932F687B9@fujitsu.local>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 0CAE6498F583.ACE30
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: weijg.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/raw-posix: Fix
 error_report of mounting message
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
X-List-Received-Date: Thu, 02 Jun 2016 10:47:33 -0000

T24gVGh1LCAyMDE2LTA2LTAyIGF0IDA5OjU3ICswMjAwLCBNYXJrdXMgQXJt
YnJ1c3RlciB3cm90ZToNCj4gV2VpIEppYW5nYW5nIDx3ZWlqZy5mbnN0QGNu
LmZ1aml0c3UuY29tPiB3cml0ZXM6DQo+IA0KPiA+IFVzZSBhIHNpbmdsZSBl
cnJvcl9wcmludGYgdG8gcmVwbGFjZSB0cmlwbGUgZXJyb3JfcmVwb3J0Lg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIEppYW5nYW5nIDx3ZWlqZy5m
bnN0QGNuLmZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiA+ICBibG9jay9yYXct
cG9zaXguYyB8IDEwICsrKysrLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9ibG9jay9yYXctcG9zaXguYyBiL2Jsb2NrL3Jhdy1wb3Np
eC5jDQo+ID4gaW5kZXggYTRmNWExYi4uMTQxYjAxYSAxMDA2NDQNCj4gPiAt
LS0gYS9ibG9jay9yYXctcG9zaXguYw0KPiA+ICsrKyBiL2Jsb2NrL3Jhdy1w
b3NpeC5jDQo+ID4gQEAgLTIwNjEsMTEgKzIwNjEsMTEgQEAgc3RhdGljIGJv
b2wgc2V0dXBfY2Ryb20oY2hhciAqYnNkX3BhdGgsIEVycm9yICoqZXJycCkN
Cj4gPiAgLyogUHJpbnRzIGRpcmVjdGlvbnMgb24gbW91bnRpbmcgYW5kIHVu
bW91bnRpbmcgYSBkZXZpY2UgKi8NCj4gPiAgc3RhdGljIHZvaWQgcHJpbnRf
dW5tb3VudGluZ19kaXJlY3Rpb25zKGNvbnN0IGNoYXIgKmZpbGVfbmFtZSkN
Cj4gPiAgew0KPiA+IC0gICAgZXJyb3JfcmVwb3J0KCJJZiBkZXZpY2UgJXMg
aXMgbW91bnRlZCBvbiB0aGUgZGVza3RvcCwgdW5tb3VudCINCj4gPiAtICAg
ICAgICAgICAgICAgICAiIGl0IGZpcnN0IGJlZm9yZSB1c2luZyBpdCBpbiBR
RU1VIiwgZmlsZV9uYW1lKTsNCj4gPiAtICAgIGVycm9yX3JlcG9ydCgiQ29t
bWFuZCB0byB1bm1vdW50IGRldmljZTogZGlza3V0aWwgdW5tb3VudERpc2sg
JXMiLA0KPiA+IC0gICAgICAgICAgICAgICAgIGZpbGVfbmFtZSk7DQo+ID4g
LSAgICBlcnJvcl9yZXBvcnQoIkNvbW1hbmQgdG8gbW91bnQgZGV2aWNlOiBk
aXNrdXRpbCBtb3VudERpc2sgJXMiLCBmaWxlX25hbWUpOw0KPiA+ICsgICAg
ZXJyb3JfcHJpbnRmKCJJZiBkZXZpY2UgJXMgaXMgbW91bnRlZCBvbiB0aGUg
ZGVza3RvcCwgdW5tb3VudCINCj4gPiArICAgICAgICAiIGl0IGZpcnN0IGJl
Zm9yZSB1c2luZyBpdCBpbiBRRU1VXG4iDQo+ID4gKyAgICAgICAgIkNvbW1h
bmQgdG8gdW5tb3VudCBkZXZpY2U6IGRpc2t1dGlsIHVubW91bnREaXNrICVz
XG4iDQo+ID4gKyAgICAgICAgIkNvbW1hbmQgdG8gbW91bnQgZGV2aWNlOiBk
aXNrdXRpbCBtb3VudERpc2sgJXNcbiIsDQo+ID4gKyAgICAgICAgZmlsZV9u
YW1lLCBmaWxlX25hbWUsIGZpbGVfbmFtZSk7DQo+ID4gIH0NCj4gPiAgDQo+
ID4gICNlbmRpZiAvKiBkZWZpbmVkKF9fQVBQTEVfXykgJiYgZGVmaW5lZChf
X01BQ0hfXykgKi8NCj4gDQo+IFRoaXMgaXMgbGVzcyB3cm9uZyA6KQ0KPiAN
Cj4gQmV3YXJlLCBJIGhhdmUgbm8gc3VpdGFibGUgbWFjaGluZSB0byBhY3R1
YWxseSB0ZXN0IHRoaXMsIHNvIHRoZQ0KPiBmb2xsb3dpbmcgaXMgYmFzZWQg
b24gY29kZSBpbnNwZWN0aW9uLg0KPiANCj4gcHJpbnRfdW5tb3VudGluZ19k
aXJlY3Rpb25zKCkgaXMgdXNlZCBieSBoZGV2X29wZW4oKS4gIGhkZXZfb3Bl
bigpIGlzIGENCj4gQmxvY2tEcml2ZXIgbWV0aG9kIGJkcnZfZmlsZV9vcGVu
KCksIGFuZCBhcyBzdWNoIHJldHVybnMgZXJyb3JzIHRvIGl0cw0KPiBjYWxs
ZXIgdmlhIHBhcmFtZXRlciBFcnJvciAqKmVycnAuICBUaGUgY2FsbGVyIG1h
eSBvciBtYXkgbm90IHJlcG9ydA0KPiBlcnJvcnMgaXQgZ2V0cyBmcm9tIGhk
ZXZfb3BlbigpLg0KPiANCj4gSWYgaXQgcmVwb3J0cyB0aGVtLCB0aGVuIHBy
aW50X3VubW91bnRpbmdfZGlyZWN0aW9ucygpJ3Mgb3V0cHV0DQo+ICJvdmVy
dGFrZXMiIHRoZSBlcnJvciBtZXNzYWdlLCBpLmUuIHRoZSAiSWYgZGV2aWNl
IC4uLiBpcyBtb3VudGVkIC4uLiINCj4gaGludCBpcyBwcmludGVkIGJlZm9y
ZSB0aGUgZXJyb3IgbWVzc2FnZS4gIFdyb25nLCBpdCBzaG91bGQgYmUgcHJp
bnRlZA0KPiBhZnRlciB0aGUgZXJyb3IgbWVzc2FnZS4NCj4gDQo+IElmIGl0
IGRvZXNuJ3QgcmVwb3J0IHRoZW0sIHRoZSBoaW50IGdldHMgcHJpbnRlZCBh
bnl3YXkuICBNb3JlIHdyb25nLg0KPiANCj4gSW4gYW55IGNhc2UsIHByaW50
aW5nIGVhY2ggbGluZSBvZiB0aGUgaGludCB3aXRoIGVycm9yX3JlcG9ydCgp
IGlzIGFsc28NCj4gd3JvbmcsIGJlY2F1c2UgdGhhdCBwcmVmaXhlcyBlYWNo
IGxpbmUgd2l0aCBwcm9ncmFtIG5hbWUgYW5kIGxvY2F0aW9uDQo+IGluZm9y
bWF0aW9uLiAgWW91ciBwYXRjaCBmaXhlcyB0aGlzIHBhcnQuDQo+IA0KPiBB
IG1vcmUgY29tcGxldGUgZml4IHVzZXMgZXJyb3JfYXBwZW5kX2hpbnQoZXJy
cCwgLi4uKSBpbnN0ZWFkIG9mDQo+IGVycm9yX3ByaW50ZigpLiAgaGRldl9v
cGVuKCkgbmVlZHMgdG8gcGFzcyBlcnJwIHRvDQo+IHByaW50X3VubW91bnRp
bmdfZGlyZWN0aW9ucygpIGZvciB0aGF0LiAgZXJycCBtdXN0IGhhdmUgYW4g
ZXJyb3Igc2V0LCBvcg0KPiBlbHNlIGVycm9yX2FwcGVuZF9oaW50KCkgbWFr
ZXMgbm8gc2Vuc2UuDQpJIHRoaW5rIHlvdSBnYXZlIG1lIGEgd29uZGVyZnVs
IGxlc3NvbiBhYm91dCBob3cgdG8gZGVhbCB3aXRoIGVycm9yDQpyZXBvcnQu
DQpUaGFuayB5b3UgdmVyeSBtdWNoLg0KDQpNeSBpbnRlbnRpb24gaXMgb25s
eSB0byBhdm9pZCB0aGUgb3V0cHV0IG9mIG11bHRpcGxlIGxvY2F0aW9uDQpp
bmZvcm1hdGlvbi4NCg0KSSdsbCBjaGVjayBpdCBhZ2Fpbi4NCg0KVGhhbmtz
LA0Kd2VpDQo+IA0KPiANCg0KCgo=

