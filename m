Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eysSC-0001JK-06
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2018 01:07:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1eysS9-0001IG-RI
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 01:07:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1eysS8-0006sA-PF
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 01:07:53 -0400
Resent-Date: Thu, 22 Mar 2018 01:07:53 -0400
Resent-Message-Id: <E1eysS8-0006sA-PF@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21078)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1eysS4-0006nt-0o; Thu, 22 Mar 2018 01:07:48 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 152169525567276.38897223152367;
	Wed, 21 Mar 2018 22:07:35 -0700 (PDT)
In-Reply-To: <20180321211056.3339-1-yuval.shaia@oracle.com>
Reply-To: <qemu-devel@nongnu.org>
Message-ID: <152169525471.222.10982135661238361362@71c20359a636>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: yuval.shaia@oracle.com
Cc: famz@redhat.com, yuval.shaia@oracle.com, marcel@redhat.com,
	eblake@redhat.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 21 Mar 2018 22:07:35 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/3] hw/rdma: Fix 32-bit
 compilation
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
X-List-Received-Date: Thu, 22 Mar 2018 05:07:54 -0000

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTgwMzIxMjExMDU2LjMzMzktMS15dXZhbC5zaGFpYUBvcmFjbGUuY29tClN1
YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0ggMC8zXSBody9yZG1hOiBGaXggMzItYml0IGNvbXBp
bGF0aW9uCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCgpCQVNFPWJhc2UK
bj0xCnRvdGFsPSQoZ2l0IGxvZyAtLW9uZWxpbmUgJEJBU0UuLiB8IHdjIC1sKQpmYWlsZWQ9MAoK
Z2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwg
ZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3Rv
Z3JhbQoKY29tbWl0cz0iJChnaXQgbG9nIC0tZm9ybWF0PSVIIC0tcmV2ZXJzZSAkQkFTRS4uKSIK
Zm9yIGMgaW4gJGNvbW1pdHM7IGRvCiAgICBlY2hvICJDaGVja2luZyBQQVRDSCAkbi8kdG90YWw6
ICQoZ2l0IGxvZyAtbiAxIC0tZm9ybWF0PSVzICRjKS4uLiIKICAgIGlmICEgZ2l0IHNob3cgJGMg
LS1mb3JtYXQ9ZW1haWwgfCAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIC07IHRo
ZW4KICAgICAgICBmYWlsZWQ9MQogICAgICAgIGVjaG8KICAgIGZpCiAgICBuPSQoKG4rMSkpCmRv
bmUKCmV4aXQgJGZhaWxlZAo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1
YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApTd2l0Y2hlZCB0byBhIG5ldyBicmFu
Y2ggJ3Rlc3QnCjc5Njg0MDI1NDUgaHcvcmRtYTogRml4IDMyLWJpdCBjb21waWxhdGlvbgozOTI0
ZTA2MzVkIGh3L3JkbWE6IFVzZSBjb3JyZWN0IHByaW50IGZvcm1hdCBpbiBDSEtfQVRUUiBtYWNy
bwo5MjhlZGIwNTU0IGh3L3JkbWE6IENoYW5nZSBob3N0X3ZpcnQgdG8gdm9pZCAqCgo9PT0gT1VU
UFVUIEJFR0lOID09PQpDaGVja2luZyBQQVRDSCAxLzM6IGh3L3JkbWE6IENoYW5nZSBob3N0X3Zp
cnQgdG8gdm9pZCAqLi4uCkNoZWNraW5nIFBBVENIIDIvMzogaHcvcmRtYTogVXNlIGNvcnJlY3Qg
cHJpbnQgZm9ybWF0IGluIENIS19BVFRSIG1hY3JvLi4uCkNoZWNraW5nIFBBVENIIDMvMzogaHcv
cmRtYTogRml4IDMyLWJpdCBjb21waWxhdGlvbi4uLgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hh
cmFjdGVycwojNDA6IEZJTEU6IGh3L3JkbWEvcmRtYV9iYWNrZW5kLmM6MTgwOgorICAgICAgICAg
ICAgcHJfZGJnKCJpYnZfY3JlYXRlX2FoIGZhaWxlZCBmb3IgZ2lkIDwweCUiIFBSSXg2NCAiLCAw
eCUiIFBSSXg2NCAiPlxuIiwKCkVSUk9SOiBzcGFjZSBwcm9oaWJpdGVkIGJlZm9yZSB0aGF0IGNs
b3NlIHBhcmVudGhlc2lzICcpJwojNzg6IEZJTEU6IGh3L3JkbWEvcmRtYV9iYWNrZW5kLmM6Njcz
OgorICAgIENIS19BVFRSKGRldl9hdHRyLCBiYWNrZW5kX2Rldi0+ZGV2X2F0dHIsIG1heF9tcl9z
aXplLCAiJSIgUFJJZDY0ICk7CgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojMjQ0
OiBGSUxFOiBody9yZG1hL3Ztdy9wdnJkbWFfbWFpbi5jOjM0NToKKyAgICAgICAgcHJfZXJyKCJF
cnJvciB0cnlpbmcgdG8gc2V0IFJFRyB2YWx1ZSwgYWRkcj0weCUiIFBSSXg2NCAiLCB2YWw9MHgl
IiBQUkl4NjQgIlxuIiwKCnRvdGFsOiAxIGVycm9ycywgMiB3YXJuaW5ncywgMjQ4IGxpbmVzIGNo
ZWNrZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYg
YW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRo
ZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQg
RU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgotLS0KRW1haWwgZ2Vu
ZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcub3JnL10uClBs
ZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBmcmVlbGlzdHMub3Jn


