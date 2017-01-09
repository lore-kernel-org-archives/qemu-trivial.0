Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cQfLG-00016Y-4h
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2017 14:10:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1cQfLD-000154-5A
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 14:10:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1cQfLA-0005KT-G7
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 14:10:47 -0500
Resent-Date: Mon, 09 Jan 2017 14:10:47 -0500
Resent-Message-Id: <E1cQfLA-0005KT-G7@eggs.gnu.org>
Received: from sender163-mail.zoho.com ([74.201.84.163]:21399)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1cQfLA-0005K2-6j; Mon, 09 Jan 2017 14:10:44 -0500
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 148398903232057.511090912277496;
	Mon, 9 Jan 2017 11:10:32 -0800 (PST)
In-Reply-To: <1483988759-14606-1-git-send-email-peter.maydell@linaro.org>
Reply-To: <qemu-devel@nongnu.org>
Message-ID: <148398903105.208.13573655327114962163@790289a7ca88>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Cc: famz@redhat.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	edgar.iglesias@gmail.com, patches@linaro.org
Date: Mon, 9 Jan 2017 11:10:32 -0800 (PST)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.201.84.163
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] disas/cris.c: Fix Coverity
 warning about unchecked NULL
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
X-List-Received-Date: Mon, 09 Jan 2017 19:10:48 -0000

SGksCgpZb3VyIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKU3ViamVjdDogW1FlbXUt
ZGV2ZWxdIFtQQVRDSF0gZGlzYXMvY3Jpcy5jOiBGaXggQ292ZXJpdHkgd2FybmluZyBhYm91dCB1
bmNoZWNrZWQgTlVMTApUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMTQ4Mzk4ODc1OS0xNDYwNi0x
LWdpdC1zZW5kLWVtYWlsLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZwoKPT09IFRFU1QgU0NSSVBU
IEJFR0lOID09PQojIS9iaW4vYmFzaAoKQkFTRT1iYXNlCm49MQp0b3RhbD0kKGdpdCBsb2cgLS1v
bmVsaW5lICRCQVNFLi4gfCB3YyAtbCkKZmFpbGVkPTAKCiMgVXNlZnVsIGdpdCBvcHRpb25zCmdp
dCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRp
ZmYucmVuYW1lcyBUcnVlCgpjb21taXRzPSIkKGdpdCBsb2cgLS1mb3JtYXQ9JUggLS1yZXZlcnNl
ICRCQVNFLi4pIgpmb3IgYyBpbiAkY29tbWl0czsgZG8KICAgIGVjaG8gIkNoZWNraW5nIFBBVENI
ICRuLyR0b3RhbDogJChnaXQgbG9nIC1uIDEgLS1mb3JtYXQ9JXMgJGMpLi4uIgogICAgaWYgISBn
aXQgc2hvdyAkYyAtLWZvcm1hdD1lbWFpbCB8IC4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFp
bGJhY2sgLTsgdGhlbgogICAgICAgIGZhaWxlZD0xCiAgICAgICAgZWNobwogICAgZmkKICAgIG49
JCgobisxKSkKZG9uZQoKZXhpdCAkZmFpbGVkCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRh
dGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6
Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBh
dGNoZXcvMTQ4Mzk4ODc1OS0xNDYwNi0xLWdpdC1zZW5kLWVtYWlsLXBldGVyLm1heWRlbGxAbGlu
YXJvLm9yZyAtPiBwYXRjaGV3LzE0ODM5ODg3NTktMTQ2MDYtMS1naXQtc2VuZC1lbWFpbC1wZXRl
ci5tYXlkZWxsQGxpbmFyby5vcmcKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo2M2Nm
YTI2IGRpc2FzL2NyaXMuYzogRml4IENvdmVyaXR5IHdhcm5pbmcgYWJvdXQgdW5jaGVja2VkIE5V
TEwKCj09PSBPVVRQVVQgQkVHSU4gPT09CkNoZWNraW5nIFBBVENIIDEvMTogZGlzYXMvY3Jpcy5j
OiBGaXggQ292ZXJpdHkgd2FybmluZyBhYm91dCB1bmNoZWNrZWQgTlVMTC4uLgpFUlJPUjogY29k
ZSBpbmRlbnQgc2hvdWxkIG5ldmVyIHVzZSB0YWJzCiMyNDogRklMRTogZGlzYXMvY3Jpcy5jOjI0
OTM6CiteSWlmIChzcmVncCA9PSBOVUxMIHx8IHNyZWdwLT5uYW1lID09IE5VTEwpJAoKRVJST1I6
IHN1c3BlY3QgY29kZSBpbmRlbnQgZm9yIGNvbmRpdGlvbmFsIHN0YXRlbWVudHMgKDgsIDEwKQoj
MjQ6IEZJTEU6IGRpc2FzL2NyaXMuYzoyNDkzOgorCWlmIChzcmVncCA9PSBOVUxMIHx8IHNyZWdw
LT5uYW1lID09IE5VTEwpCiAJICAvKiBTaG91bGQgaGF2ZSBiZWVuIGNhdWdodCBhcyBhIG5vbi1t
YXRjaCBlYXJsaWVyLiAgKi8KCkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBmb3IgYWxs
IGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQKIzI0OiBGSUxFOiBkaXNhcy9jcmlzLmM6MjQ5MzoKKwlp
ZiAoc3JlZ3AgPT0gTlVMTCB8fCBzcmVncC0+bmFtZSA9PSBOVUxMKQpbLi4uXQoKdG90YWw6IDMg
ZXJyb3JzLCAwIHdhcm5pbmdzLCA4IGxpbmVzIGNoZWNrZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxl
IHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFs
c2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRD
SCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRl
ZCB3aXRoIGNvZGU6IDEKCgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0
Y2hldyBbaHR0cDovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8g
cGF0Y2hldy1kZXZlbEBmcmVlbGlzdHMub3Jn


