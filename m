Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hAnGp-0004D1-Uf
	for mharc-qemu-trivial@gnu.org; Sun, 31 Mar 2019 23:05:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hAnGn-0004Cn-Qh
	for qemu-trivial@nongnu.org; Sun, 31 Mar 2019 23:05:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hAnGm-00088X-JR
	for qemu-trivial@nongnu.org; Sun, 31 Mar 2019 23:05:57 -0400
Resent-Date: Sun, 31 Mar 2019 23:05:57 -0400
Resent-Message-Id: <E1hAnGm-00088X-JR@eggs.gnu.org>
Received: from sender4-of-o55.zoho.com ([136.143.188.55]:21569)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1hAnGm-00088F-9x
	for qemu-trivial@nongnu.org; Sun, 31 Mar 2019 23:05:56 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1554087033; cv=none; d=zoho.com; s=zohoarc; 
	b=ko1oiKrXlaS8zozK3IyZ714x3M9uNyzeIXSQ27bo0nkdOTkRHNmvupq3rdbggb7KfmzQjZkovD0FBOlbuKPiR98636krOD8DnFTNZIok28sGZl2Uzi6fWmYRaKgeZ4vivZhfwjJumh3fV17k8taqsJQ0ELcC0RJHIPR+40E4vPA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1554087033;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=psxZSmGb8ACpSyxc2c9JOt/hfYwhx4zFX1eyDWyCX3Q=; 
	b=PXmZI8ueykPjrc8bEKQwCavsLMGS3FFeBo/B600RE7zKIFdET5wawpqq51FfejVeWxWhgSNGoXk9Fg+cWaho88RSjna8a9hMtKPy2JDTqZnM6R5icfVC70SONO6YUx2YWmJ6rD7s+uSDh2IMbz23NdswGDJYKp+upG48k70Yxzw=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1554087032047481.9503293627289;
	Sun, 31 Mar 2019 19:50:32 -0700 (PDT)
Message-ID: <155408703083.12882.7004955887204402098@76452e4e88f2>
In-Reply-To: <20190401024406.10819-1-jbi.octave@gmail.com>
Reply-To: <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: jbi.octave@gmail.com
Cc: fam@euphon.net, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sun, 31 Mar 2019 19:50:32 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.55
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/2] util/readline:
 errors clean-ups
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
X-List-Received-Date: Mon, 01 Apr 2019 03:05:59 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDQwMTAyNDQwNi4xMDgx
OS0xLWpiaS5vY3RhdmVAZ21haWwuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpNZXNzYWdlLWlkOiAyMDE5MDQwMTAyNDQwNi4xMDgxOS0xLWpiaS5vY3Rh
dmVAZ21haWwuY29tClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0ggdjIgMC8yXSB1dGlsL3Jl
YWRsaW5lOiBlcnJvcnMgY2xlYW4tdXBzClR5cGU6IHNlcmllcwoKPT09IFRFU1QgU0NSSVBUIEJF
R0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhp
dCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxv
Y2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBo
aXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRF
U1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0
YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUK
ICogW25ldyB0YWddICAgICAgICAgICAgICAgcGF0Y2hldy8yMDE5MDQwMTAyNDQwNi4xMDgxOS0x
LWpiaS5vY3RhdmVAZ21haWwuY29tIC0+IHBhdGNoZXcvMjAxOTA0MDEwMjQ0MDYuMTA4MTktMS1q
Ymkub2N0YXZlQGdtYWlsLmNvbQogKiBbbmV3IHRhZ10gICAgICAgICAgICAgICBwYXRjaGV3Lzg3
eTM0djQyejAuZnNmXy1fQGR1c2t5LnBvbmQuc3ViLm9yZyAtPiBwYXRjaGV3Lzg3eTM0djQyejAu
ZnNmXy1fQGR1c2t5LnBvbmQuc3ViLm9yZwpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3Qn
CjJlNzViMjA5YWYgdXRpbDogcmVhZGxpbmU6IHJlcGxhY2UgdGFiIGluZGVudCBieSBmb3VyIHNw
YWNlcyB0byBmaXggY2hlY2twYXRjaCBlcnJvcnMKZDc5NzUyNDI3NiB1dGlsL3JlYWRsaW5lOiBh
ZGQgYSBzcGFjZSB0byBmaXggZXJyb3JzIGJ5IGNoZWNrcGF0Y2ggdG9vbAoKPT09IE9VVFBVVCBC
RUdJTiA9PT0KMS8yIENoZWNraW5nIGNvbW1pdCBkNzk3NTI0Mjc2NzAgKHV0aWwvcmVhZGxpbmU6
IGFkZCBhIHNwYWNlIHRvIGZpeCBlcnJvcnMgYnkgY2hlY2twYXRjaCB0b29sKQpFUlJPUjogYnJh
Y2VzIHt9IGFyZSBuZWNlc3NhcnkgZm9yIGFsbCBhcm1zIG9mIHRoaXMgc3RhdGVtZW50CiMzMTog
RklMRTogdXRpbC9yZWFkbGluZS5jOjU3OgorICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IGxl
bjsgaSsrKQpbLi4uXQoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAxMDkgbGluZXMgY2hl
Y2tlZAoKUGF0Y2ggMS8yIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFu
eSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUg
bWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgoyLzIgQ2hlY2tpbmcg
Y29tbWl0IDJlNzViMjA5YWY0ZiAodXRpbDogcmVhZGxpbmU6IHJlcGxhY2UgdGFiIGluZGVudCBi
eSBmb3VyIHNwYWNlcyB0byBmaXggY2hlY2twYXRjaCBlcnJvcnMpCkVSUk9SOiBicmFjZXMge30g
YXJlIG5lY2Vzc2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQKIzMyOiBGSUxFOiB1
dGlsL3JlYWRsaW5lLmM6MTg2OgorICAgICAgICAgICAgaWYgKHJzLT5oaXN0b3J5W2lkeF0gPT0g
TlVMTCkKWy4uLl0KCkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBmb3IgYWxsIGFybXMg
b2YgdGhpcyBzdGF0ZW1lbnQKIzEwMTogRklMRTogdXRpbC9yZWFkbGluZS5jOjIzMzoKKyAgICAg
ICAgaWYgKGhpc3RfZW50cnkgPT0gTlVMTCkKWy4uLl0KCkVSUk9SOiBicmFjZXMge30gYXJlIG5l
Y2Vzc2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQKIzExMTogRklMRTogdXRpbC9y
ZWFkbGluZS5jOjI0MzoKKyAgICAgICAgICAgICAgICBpZiAocnMtPmhpc3RvcnlbaWR4XSA9PSBO
VUxMKQpbLi4uXQoKdG90YWw6IDMgZXJyb3JzLCAwIHdhcm5pbmdzLCAxNDUgbGluZXMgY2hlY2tl
ZAoKUGF0Y2ggMi8yIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBv
ZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFp
bnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9
PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2
YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDE5MDQwMTAyNDQwNi4xMDgxOS0x
LWpiaS5vY3RhdmVAZ21haWwuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgot
LS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRj
aGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVk
aGF0LmNvbQ==


