Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eE9CZ-0007fk-Fv
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 02:30:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1eE9CW-0007eV-Oy
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 02:30:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1eE9CV-0000jV-Mt
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 02:30:36 -0500
Resent-Date: Mon, 13 Nov 2017 02:30:36 -0500
Resent-Message-Id: <E1eE9CV-0000jV-Mt@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21325)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1eE9CQ-0000iE-Ib; Mon, 13 Nov 2017 02:30:30 -0500
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 15105582063561023.4967871894654;
	Sun, 12 Nov 2017 23:30:06 -0800 (PST)
Reply-To: <qemu-devel@nongnu.org>
Message-ID: <151055820537.390.14030945316491927841@bafd83ae6430>
In-Reply-To: <20171113072715.3443-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: sw@weilnetz.de
Cc: famz@redhat.com, richard.henderson@linaro.org, qemu-trivial@nongnu.org,
	sw@weilnetz.de, qemu-devel@nongnu.org
Date: Sun, 12 Nov 2017 23:30:06 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.12] disas/hppa: Fix
 compiler errors
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
X-List-Received-Date: Mon, 13 Nov 2017 07:30:38 -0000

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKU3ViamVjdDogW1FlbXUt
ZGV2ZWxdIFtQQVRDSCBmb3IgMi4xMl0gZGlzYXMvaHBwYTogRml4IGNvbXBpbGVyIGVycm9ycwpU
eXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAxNzExMTMwNzI3MTUuMzQ0My0xLXN3QHdlaWxuZXR6
LmRlCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCgpCQVNFPWJhc2UKbj0x
CnRvdGFsPSQoZ2l0IGxvZyAtLW9uZWxpbmUgJEJBU0UuLiB8IHdjIC1sKQpmYWlsZWQ9MAoKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5yZW5hbWVzIFRydWUKCmNvbW1pdHM9IiQoZ2l0IGxvZyAtLWZvcm1hdD0lSCAtLXJldmVyc2Ug
JEJBU0UuLikiCmZvciBjIGluICRjb21taXRzOyBkbwogICAgZWNobyAiQ2hlY2tpbmcgUEFUQ0gg
JG4vJHRvdGFsOiAkKGdpdCBsb2cgLW4gMSAtLWZvcm1hdD0lcyAkYykuLi4iCiAgICBpZiAhIGdp
dCBzaG93ICRjIC0tZm9ybWF0PWVtYWlsIHwgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWls
YmFjayAtOyB0aGVuCiAgICAgICAgZmFpbGVkPTEKICAgICAgICBlY2hvCiAgICBmaQogICAgbj0k
KChuKzEpKQpkb25lCgpleGl0ICRmYWlsZWQKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0
aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczov
L2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgICAg
ICAgcGF0Y2hldy8yMDE3MTExMzA3MjcxNS4zNDQzLTEtc3dAd2VpbG5ldHouZGUgLT4gcGF0Y2hl
dy8yMDE3MTExMzA3MjcxNS4zNDQzLTEtc3dAd2VpbG5ldHouZGUKU3dpdGNoZWQgdG8gYSBuZXcg
YnJhbmNoICd0ZXN0JwplMGJiZDRkNzFiIGRpc2FzL2hwcGE6IEZpeCBjb21waWxlciBlcnJvcnMK
Cj09PSBPVVRQVVQgQkVHSU4gPT09CkNoZWNraW5nIFBBVENIIDEvMTogZGlzYXMvaHBwYTogRml4
IGNvbXBpbGVyIGVycm9ycy4uLgpFUlJPUjogc3VzcGVjdCBjb2RlIGluZGVudCBmb3IgY29uZGl0
aW9uYWwgc3RhdGVtZW50cyAoMjAsIDIyKQojMjM6IEZJTEU6IGRpc2FzL2hwcGEuYzoyNzAxOgog
CQkgICAgaWYgKHNpZ24pCisJCSAgICAgIGRpc3AgPSAoVUlOVF9NQVggPDwgMTApIHwgaW1tMTA7
CgpFUlJPUjogY29kZSBpbmRlbnQgc2hvdWxkIG5ldmVyIHVzZSB0YWJzCiMyNTogRklMRTogZGlz
YXMvaHBwYS5jOjI3MDI6CiteSV5JICAgICAgZGlzcCA9IChVSU5UX01BWCA8PCAxMCkgfCBpbW0x
MDskCgpFUlJPUjogc3VzcGVjdCBjb2RlIGluZGVudCBmb3IgY29uZGl0aW9uYWwgc3RhdGVtZW50
cyAoMjAsIDIyKQojMzI6IEZJTEU6IGRpc2FzL2hwcGEuYzoyNzE3OgogCQkgICAgaWYgKHNpZ24p
CisJCSAgICAgIGRpc3AgPSAoVUlOVF9NQVggPDwgMTEpIHwgaW1tMTE7CgpFUlJPUjogY29kZSBp
bmRlbnQgc2hvdWxkIG5ldmVyIHVzZSB0YWJzCiMzNDogRklMRTogZGlzYXMvaHBwYS5jOjI3MTg6
CiteSV5JICAgICAgZGlzcCA9IChVSU5UX01BWCA8PCAxMSkgfCBpbW0xMTskCgp0b3RhbDogNCBl
cnJvcnMsIDAgd2FybmluZ3MsIDE2IGxpbmVzIGNoZWNrZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxl
IHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFs
c2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRD
SCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRl
ZCB3aXRoIGNvZGU6IDEKCgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0
Y2hldyBbaHR0cDovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8g
cGF0Y2hldy1kZXZlbEBmcmVlbGlzdHMub3Jn


