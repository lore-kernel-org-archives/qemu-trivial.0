Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTeuD-0005o6-TO
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jan 2017 20:19:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1cTeuB-0005mx-Ul
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 20:19:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1cTeu7-0003R6-Be
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 20:19:15 -0500
Resent-Date: Tue, 17 Jan 2017 20:19:15 -0500
Resent-Message-Id: <E1cTeu7-0003R6-Be@eggs.gnu.org>
Received: from sender163-mail.zoho.com ([74.201.84.163]:21319)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1cTeu7-0003QC-3U; Tue, 17 Jan 2017 20:19:11 -0500
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1484702341917182.56367654329574;
	Tue, 17 Jan 2017 17:19:01 -0800 (PST)
In-Reply-To: <1484702052-7900-1-git-send-email-skiver.cloud.yzy@gmail.com>
Reply-To: <qemu-devel@nongnu.org>
Message-ID: <148470234043.214.7219322137444222645@790289a7ca88>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: skiver.cloud.yzy@gmail.com
Cc: famz@redhat.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	skiver.cloud.yzy@gmail.com, pbonzini@redhat.com,
	thuth@redhat.com, yzylivezh@hotmail.com, aliguori@us.ibm.com
Date: Tue, 17 Jan 2017 17:19:01 -0800 (PST)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.201.84.163
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] gdbstub.c: fix GDB
 connection segfault caused by empty machines
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
X-List-Received-Date: Wed, 18 Jan 2017 01:19:17 -0000

SGksCgpZb3VyIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKTWVzc2FnZS1pZDogMTQ4
NDcwMjA1Mi03OTAwLTEtZ2l0LXNlbmQtZW1haWwtc2tpdmVyLmNsb3VkLnl6eUBnbWFpbC5jb20K
VHlwZTogc2VyaWVzClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0ggdjJdIGdkYnN0dWIuYzog
Zml4IEdEQiBjb25uZWN0aW9uIHNlZ2ZhdWx0IGNhdXNlZCBieSBlbXB0eSBtYWNoaW5lcwoKPT09
IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaAoKQkFTRT1iYXNlCm49MQp0b3RhbD0k
KGdpdCBsb2cgLS1vbmVsaW5lICRCQVNFLi4gfCB3YyAtbCkKZmFpbGVkPTAKCiMgVXNlZnVsIGdp
dCBvcHRpb25zCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZp
ZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCgpjb21taXRzPSIkKGdpdCBsb2cgLS1mb3JtYXQ9
JUggLS1yZXZlcnNlICRCQVNFLi4pIgpmb3IgYyBpbiAkY29tbWl0czsgZG8KICAgIGVjaG8gIkNo
ZWNraW5nIFBBVENIICRuLyR0b3RhbDogJChnaXQgbG9nIC1uIDEgLS1mb3JtYXQ9JXMgJGMpLi4u
IgogICAgaWYgISBnaXQgc2hvdyAkYyAtLWZvcm1hdD1lbWFpbCB8IC4vc2NyaXB0cy9jaGVja3Bh
dGNoLnBsIC0tbWFpbGJhY2sgLTsgdGhlbgogICAgICAgIGZhaWxlZD0xCiAgICAgICAgZWNobwog
ICAgZmkKICAgIG49JCgobisxKSkKZG9uZQoKZXhpdCAkZmFpbGVkCj09PSBURVNUIFNDUklQVCBF
TkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0
CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFn
XSAgICAgICAgIHBhdGNoZXcvMTQ4NDcwMjA1Mi03OTAwLTEtZ2l0LXNlbmQtZW1haWwtc2tpdmVy
LmNsb3VkLnl6eUBnbWFpbC5jb20gLT4gcGF0Y2hldy8xNDg0NzAyMDUyLTc5MDAtMS1naXQtc2Vu
ZC1lbWFpbC1za2l2ZXIuY2xvdWQueXp5QGdtYWlsLmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFu
Y2ggJ3Rlc3QnCjRkYWVlMTYgZ2Ric3R1Yi5jOiBmaXggR0RCIGNvbm5lY3Rpb24gc2VnZmF1bHQg
Y2F1c2VkIGJ5IGVtcHR5IG1hY2hpbmVzCgo9PT0gT1VUUFVUIEJFR0lOID09PQpDaGVja2luZyBQ
QVRDSCAxLzE6IGdkYnN0dWIuYzogZml4IEdEQiBjb25uZWN0aW9uIHNlZ2ZhdWx0IGNhdXNlZCBi
eSBlbXB0eSBtYWNoaW5lcy4uLgpFUlJPUjogRXJyb3IgbWVzc2FnZXMgc2hvdWxkIG5vdCBjb250
YWluIG5ld2xpbmVzCiM0ODogRklMRTogZ2Ric3R1Yi5jOjY0MDoKKyAgICAgICAgICAgIGVycm9y
X3JlcG9ydCgiRXJyb3I6IEJhZCBnZGIgcmVnaXN0ZXIgbnVtYmVyaW5nIGZvciAnJXMnXG4iCgpF
UlJPUjogRXJyb3IgbWVzc2FnZXMgc2hvdWxkIG5vdCBjb250YWluIG5ld2xpbmVzCiM0OTogRklM
RTogZ2Ric3R1Yi5jOjY0MToKKyAgICAgICAgICAgICAgICAgICAgICAgICAiRXhwZWN0ZWQgJWQg
Z290ICVkXG4iLCB4bWwsIGdfcG9zLCBzLT5iYXNlX3JlZyk7CgpFUlJPUjogRXJyb3IgbWVzc2Fn
ZXMgc2hvdWxkIG5vdCBjb250YWluIG5ld2xpbmVzCiM1ODogRklMRTogZ2Ric3R1Yi5jOjg5MzoK
KyAgICAgICAgZXJyb3JfcmVwb3J0KCJcblFFTVU6IFRlcm1pbmF0ZWQgdmlhIEdEQnN0dWJcbiIp
OwoKRVJST1I6IEVycm9yIG1lc3NhZ2VzIHNob3VsZCBub3QgY29udGFpbiBuZXdsaW5lcwojNjg6
IEZJTEU6IGdkYnN0dWIuYzoxMzYxOgorICAgICAgICAgICAgICAgIGVycm9yX3JlcG9ydCgiZ2Ri
c3R1YjogQmFkIHN5c2NhbGwgZm9ybWF0IHN0cmluZyAnJXMnXG4iLAoKRVJST1I6IEVycm9yIG1l
c3NhZ2VzIHNob3VsZCBub3QgY29udGFpbiBuZXdsaW5lcwojNzk6IEZJTEU6IGdkYnN0dWIuYzox
NzM3OgorICAgICAgICAgICAgICAgICAgICAgIm1hY2hpbmUgd2l0aG91dCBhbnkgQ1BVLlxuIik7
Cgp0b3RhbDogNSBlcnJvcnMsIDAgd2FybmluZ3MsIDQ3IGxpbmVzIGNoZWNrZWQKCllvdXIgcGF0
Y2ggaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVy
cm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBz
ZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBj
b21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRp
Y2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIg
ZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBmcmVlbGlzdHMub3Jn


