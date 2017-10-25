Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e7Brn-000190-1T
	for mharc-qemu-trivial@gnu.org; Tue, 24 Oct 2017 22:56:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1e7Brl-00017m-0f
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 22:56:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1e7Brk-0000Ch-1k
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 22:56:25 -0400
Resent-Date: Tue, 24 Oct 2017 22:56:25 -0400
Resent-Message-Id: <E1e7Brk-0000Ch-1k@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21472)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1e7Brf-0008Sn-Bq; Tue, 24 Oct 2017 22:56:19 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1508900138266980.789783106421;
	Tue, 24 Oct 2017 19:55:38 -0700 (PDT)
Reply-To: <qemu-devel@nongnu.org>
Message-ID: <150890013721.503.837236947876469970@b58463cdfd5f>
In-Reply-To: <20171024230758.31779-1-riggle@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: zachriggle@gmail.com
Cc: famz@redhat.com, qemu-trivial@nongnu.org, zachriggle@gmail.com,
	riku.voipio@iki.fi, laurent@vivier.eu, qemu-devel@nongnu.org
Date: Tue, 24 Oct 2017 19:55:38 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: fix
 is_proc_myself to check the paths via realpath
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
X-List-Received-Date: Wed, 25 Oct 2017 02:56:26 -0000

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTcxMDI0MjMwNzU4LjMxNzc5LTEtcmlnZ2xlQGdvb2dsZS5jb20KU3ViamVj
dDogW1FlbXUtZGV2ZWxdIFtQQVRDSF0gbGludXgtdXNlcjogZml4IGlzX3Byb2NfbXlzZWxmIHRv
IGNoZWNrIHRoZSBwYXRocyB2aWEgcmVhbHBhdGgKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0K
IyEvYmluL2Jhc2gKCkJBU0U9YmFzZQpuPTEKdG90YWw9JChnaXQgbG9nIC0tb25lbGluZSAkQkFT
RS4uIHwgd2MgLWwpCmZhaWxlZD0wCgpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1p
dCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQoKY29tbWl0cz0iJChnaXQg
bG9nIC0tZm9ybWF0PSVIIC0tcmV2ZXJzZSAkQkFTRS4uKSIKZm9yIGMgaW4gJGNvbW1pdHM7IGRv
CiAgICBlY2hvICJDaGVja2luZyBQQVRDSCAkbi8kdG90YWw6ICQoZ2l0IGxvZyAtbiAxIC0tZm9y
bWF0PSVzICRjKS4uLiIKICAgIGlmICEgZ2l0IHNob3cgJGMgLS1mb3JtYXQ9ZW1haWwgfCAuL3Nj
cmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIC07IHRoZW4KICAgICAgICBmYWlsZWQ9MQog
ICAgICAgIGVjaG8KICAgIGZpCiAgICBuPSQoKG4rMSkpCmRvbmUKCmV4aXQgJGZhaWxlZAo9PT0g
VEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdm
NDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVt
dQogKiBbbmV3IHRhZ10gICAgICAgICAgICAgICBwYXRjaGV3LzE1MDg4OTg1NDQtMTAzMDctMS1n
aXQtc2VuZC1lbWFpbC1zdW5kZWVwLmxrbWxAZ21haWwuY29tIC0+IHBhdGNoZXcvMTUwODg5ODU0
NC0xMDMwNy0xLWdpdC1zZW5kLWVtYWlsLXN1bmRlZXAubGttbEBnbWFpbC5jb20KU3dpdGNoZWQg
dG8gYSBuZXcgYnJhbmNoICd0ZXN0JwphMDlmYjU4NTczIGxpbnV4LXVzZXI6IGZpeCBpc19wcm9j
X215c2VsZiB0byBjaGVjayB0aGUgcGF0aHMgdmlhIHJlYWxwYXRoCgo9PT0gT1VUUFVUIEJFR0lO
ID09PQpDaGVja2luZyBQQVRDSCAxLzE6IGxpbnV4LXVzZXI6IGZpeCBpc19wcm9jX215c2VsZiB0
byBjaGVjayB0aGUgcGF0aHMgdmlhIHJlYWxwYXRoLi4uCkVSUk9SOiBsaW5lIG92ZXIgOTAgY2hh
cmFjdGVycwojNTA6IEZJTEU6IGxpbnV4LXVzZXIvc3lzY2FsbC5jOjc1MDM6CisgICAgaWYoUEFU
SF9NQVggPCBzbnByaW50Zihwcm9jX3NlbGZfZW50cnksIHNpemVvZihwcm9jX3NlbGZfZW50cnkp
LCAiL3Byb2Mvc2VsZi8lcyIsIGVudHJ5KSkgewoKRVJST1I6IHNwYWNlIHJlcXVpcmVkIGJlZm9y
ZSB0aGUgb3BlbiBwYXJlbnRoZXNpcyAnKCcKIzUwOiBGSUxFOiBsaW51eC11c2VyL3N5c2NhbGwu
Yzo3NTAzOgorICAgIGlmKFBBVEhfTUFYIDwgc25wcmludGYocHJvY19zZWxmX2VudHJ5LCBzaXpl
b2YocHJvY19zZWxmX2VudHJ5KSwgIi9wcm9jL3NlbGYvJXMiLCBlbnRyeSkpIHsKCnRvdGFsOiAy
IGVycm9ycywgMCB3YXJuaW5ncywgNTEgbGluZXMgY2hlY2tlZAoKWW91ciBwYXRjaCBoYXMgc3R5
bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBm
YWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BB
VENIIGluIE1BSU5UQUlORVJTLgoKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhp
dGVkIHdpdGggY29kZTogMQoKCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQ
YXRjaGV3IFtodHRwOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0
byBwYXRjaGV3LWRldmVsQGZyZWVsaXN0cy5vcmc=


