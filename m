Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bvmcK-0008N1-92
	for mharc-qemu-trivial@gnu.org; Sun, 16 Oct 2016 10:40:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1bvmcI-0008Mv-BR
	for qemu-trivial@nongnu.org; Sun, 16 Oct 2016 10:40:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1bvmcD-00012q-TD
	for qemu-trivial@nongnu.org; Sun, 16 Oct 2016 10:40:46 -0400
Resent-Date: Sun, 16 Oct 2016 10:40:46 -0400
Resent-Message-Id: <E1bvmcD-00012q-TD@eggs.gnu.org>
Received: from sender163-mail.zoho.com ([74.201.84.163]:21379)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1bvmcD-0000zf-Gh; Sun, 16 Oct 2016 10:40:41 -0400
Received: from ex-std-node742.prod.rhcloud.com
	(ec2-52-6-146-230.compute-1.amazonaws.com [52.6.146.230]) by
	mx.zohomail.com with SMTPS id 1476628825553887.5965400369914;
	Sun, 16 Oct 2016 07:40:25 -0700 (PDT)
In-Reply-To: <1476628228-7425-1-git-send-email-mjt@msgid.tls.msk.ru>
Message-ID: <20161016144023.502017.66291@ex-std-node742.prod.rhcloud.com>
Reply-To: <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: mjt@tls.msk.ru
Cc: famz@redhat.com, qemu-devel@nongnu.org, danielsh@apache.org,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru
Date: Sun, 16 Oct 2016 07:40:25 -0700 (PDT)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 74.201.84.163
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] scripts/hxtool: fix
 undefined behavour of echo
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
X-List-Received-Date: Sun, 16 Oct 2016 14:40:47 -0000

SGksCgpZb3VyIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDE0NzY2MjgyMjgtNzQyNS0xLWdpdC1zZW5kLWVtYWlsLW1qdEBtc2dpZC50bHMu
bXNrLnJ1ClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0hdIHNjcmlwdHMvaHh0b29sOiBmaXgg
dW5kZWZpbmVkIGJlaGF2b3VyIG9mIGVjaG8KCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEv
YmluL2Jhc2gKCkJBU0U9YmFzZQpuPTEKdG90YWw9JChnaXQgbG9nIC0tb25lbGluZSAkQkFTRS4u
IHwgd2MgLWwpCmZhaWxlZD0wCgojIFVzZWZ1bCBnaXQgb3B0aW9ucwpnaXQgY29uZmlnIC0tbG9j
YWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1
ZQoKY29tbWl0cz0iJChnaXQgbG9nIC0tZm9ybWF0PSVIIC0tcmV2ZXJzZSAkQkFTRS4uKSIKZm9y
IGMgaW4gJGNvbW1pdHM7IGRvCiAgICBlY2hvICJDaGVja2luZyBQQVRDSCAkbi8kdG90YWw6ICQo
Z2l0IHNob3cgLS1uby1wYXRjaCAtLWZvcm1hdD0lcyAkYykuLi4iCiAgICBpZiAhIGdpdCBzaG93
ICRjIC0tZm9ybWF0PWVtYWlsIHwgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayAt
OyB0aGVuCiAgICAgICAgZmFpbGVkPTEKICAgICAgICBlY2hvCiAgICBmaQogICAgbj0kKChuKzEp
KQpkb25lCgpleGl0ICRmYWlsZWQKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNj
OGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKU3dpdGNoZWQgdG8gYSBuZXcg
YnJhbmNoICd0ZXN0JwphZjBhMTVjIHNjcmlwdHMvaHh0b29sOiBmaXggdW5kZWZpbmVkIGJlaGF2
b3VyIG9mIGVjaG8KCj09PSBPVVRQVVQgQkVHSU4gPT09CkNoZWNraW5nIFBBVENIIDEvMTogc2Ny
aXB0cy9oeHRvb2w6IGZpeCB1bmRlZmluZWQgYmVoYXZvdXIgb2YgZWNoby4uLgpFUlJPUjogVGhl
IGNvcnJlY3QgZm9ybSBpcyAiU2lnbmVkLW9mZi1ieSIKIzEwOiAKU2lnbmVkLW9mZi1CeTogTWlj
aGFlbCBUb2thcmV2IDxtanRAdGxzLm1zay5ydT4KCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5n
cywgNjggbGluZXMgY2hlY2tlZAoKWW91ciBwYXRjaCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFz
ZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVw
b3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJT
LgoKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoK
Ci0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwOi8vcGF0
Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQGZy
ZWVsaXN0cy5vcmc=


