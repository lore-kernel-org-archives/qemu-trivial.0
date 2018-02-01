Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ehBh6-0001bm-FZ
	for mharc-qemu-trivial@gnu.org; Thu, 01 Feb 2018 05:02:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1ehBgw-0001Uk-8B
	for qemu-trivial@nongnu.org; Thu, 01 Feb 2018 05:02:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1ehBgl-0000Eb-AL
	for qemu-trivial@nongnu.org; Thu, 01 Feb 2018 05:02:02 -0500
Resent-Date: Thu, 01 Feb 2018 05:02:02 -0500
Resent-Message-Id: <E1ehBgl-0000Eb-AL@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21028)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1ehBgP-0007xr-HS; Thu, 01 Feb 2018 05:01:29 -0500
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1517479274085467.54960373294887;
	Thu, 1 Feb 2018 02:01:14 -0800 (PST)
In-Reply-To: <20180201093545.33741-1-aik@ozlabs.ru>
Reply-To: <qemu-devel@nongnu.org>
Message-ID: <151747927318.1947.5058007890698507461@b81a8a9ec60f>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: aik@ozlabs.ru
Cc: famz@redhat.com, qemu-devel@nongnu.org, aik@ozlabs.ru,
	qemu-trivial@nongnu.org
Date: Thu, 1 Feb 2018 02:01:14 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH qemu] slirp/debug: Print IP
 addresses in human readable form
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
X-List-Received-Date: Thu, 01 Feb 2018 10:02:10 -0000

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTgwMjAxMDkzNTQ1LjMzNzQxLTEtYWlrQG96bGFicy5ydQpTdWJqZWN0OiBb
UWVtdS1kZXZlbF0gW1BBVENIIHFlbXVdIHNsaXJwL2RlYnVnOiBQcmludCBJUCBhZGRyZXNzZXMg
aW4gaHVtYW4gcmVhZGFibGUgZm9ybQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4v
YmFzaAoKQkFTRT1iYXNlCm49MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5lICRCQVNFLi4gfCB3
YyAtbCkKZmFpbGVkPTAKCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCgpjb21taXRzPSIkKGdpdCBsb2cgLS1m
b3JtYXQ9JUggLS1yZXZlcnNlICRCQVNFLi4pIgpmb3IgYyBpbiAkY29tbWl0czsgZG8KICAgIGVj
aG8gIkNoZWNraW5nIFBBVENIICRuLyR0b3RhbDogJChnaXQgbG9nIC1uIDEgLS1mb3JtYXQ9JXMg
JGMpLi4uIgogICAgaWYgISBnaXQgc2hvdyAkYyAtLWZvcm1hdD1lbWFpbCB8IC4vc2NyaXB0cy9j
aGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgLTsgdGhlbgogICAgICAgIGZhaWxlZD0xCiAgICAgICAg
ZWNobwogICAgZmkKICAgIG49JCgobisxKSkKZG9uZQoKZXhpdCAkZmFpbGVkCj09PSBURVNUIFND
UklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4
NzEzMzg0ClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKMmQ1YjBhOTIzZSBzbGlycC9k
ZWJ1ZzogUHJpbnQgSVAgYWRkcmVzc2VzIGluIGh1bWFuIHJlYWRhYmxlIGZvcm0KCj09PSBPVVRQ
VVQgQkVHSU4gPT09CkNoZWNraW5nIFBBVENIIDEvMTogc2xpcnAvZGVidWc6IFByaW50IElQIGFk
ZHJlc3NlcyBpbiBodW1hbiByZWFkYWJsZSBmb3JtLi4uCkVSUk9SOiBjb2RlIGluZGVudCBzaG91
bGQgbmV2ZXIgdXNlIHRhYnMKIzQzOiBGSUxFOiBzbGlycC9zb2NrZXQuYzo3MDQ6CiteSURFQlVH
X0FSRygiaGFkZHIgPSAlcyIsIGluZXRfbnRvYSgqKHN0cnVjdCBpbl9hZGRyICopJmhhZGRyKSk7
JAoKRVJST1I6IGNvZGUgaW5kZW50IHNob3VsZCBuZXZlciB1c2UgdGFicwojNDQ6IEZJTEU6IHNs
aXJwL3NvY2tldC5jOjcwNToKK15JREVCVUdfQVJHKCJocG9ydCA9ICVkIiwgbnRvaHMoaHBvcnQp
KTskCgpFUlJPUjogY29kZSBpbmRlbnQgc2hvdWxkIG5ldmVyIHVzZSB0YWJzCiM0NTogRklMRTog
c2xpcnAvc29ja2V0LmM6NzA2OgorXklERUJVR19BUkcoImxhZGRyID0gJXMiLCBpbmV0X250b2Eo
KihzdHJ1Y3QgaW5fYWRkciAqKSZsYWRkcikpOyQKCkVSUk9SOiBjb2RlIGluZGVudCBzaG91bGQg
bmV2ZXIgdXNlIHRhYnMKIzQ2OiBGSUxFOiBzbGlycC9zb2NrZXQuYzo3MDc6CiteSURFQlVHX0FS
RygibHBvcnQgPSAlZCIsIG50b2hzKGxwb3J0KSk7JAoKRVJST1I6IGNvZGUgaW5kZW50IHNob3Vs
ZCBuZXZlciB1c2UgdGFicwojNjA6IEZJTEU6IHNsaXJwL3VkcC5jOjI0NDoKK15JREVCVUdfQVJH
KCJzYWRkciA9ICVzIiwgaW5ldF9udG9hKHNhZGRyLT5zaW5fYWRkcikpOyQKCkVSUk9SOiBjb2Rl
IGluZGVudCBzaG91bGQgbmV2ZXIgdXNlIHRhYnMKIzYxOiBGSUxFOiBzbGlycC91ZHAuYzoyNDU6
CiteSURFQlVHX0FSRygiZGFkZHIgPSAlcyIsIGluZXRfbnRvYShkYWRkci0+c2luX2FkZHIpKTsk
Cgp0b3RhbDogNiBlcnJvcnMsIDAgd2FybmluZ3MsIDQwIGxpbmVzIGNoZWNrZWQKCllvdXIgcGF0
Y2ggaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVy
cm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBz
ZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBj
b21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRp
Y2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIg
ZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBmcmVlbGlzdHMub3Jn


