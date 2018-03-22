Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ez4VO-0005Nb-4R
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2018 14:00:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1ez4VL-0005L4-7u
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 14:00:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1ez4VK-0004Ve-2Z
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 13:59:59 -0400
Resent-Date: Thu, 22 Mar 2018 13:59:59 -0400
Resent-Message-Id: <E1ez4VK-0004Ve-2Z@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21050)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1ez4V8-0004IY-KW; Thu, 22 Mar 2018 13:59:46 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1521741460598621.2674785906428;
	Thu, 22 Mar 2018 10:57:40 -0700 (PDT)
In-Reply-To: <20180322161226.29796-1-lvivier@redhat.com>
Reply-To: <qemu-devel@nongnu.org>
Message-ID: <152174145840.240.3926671265619235661@71c20359a636>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: lvivier@redhat.com
Cc: famz@redhat.com, qemu-devel@nongnu.org, peter.maydell@linaro.org,
	mst@redhat.com, jasowang@redhat.com, armbru@redhat.com,
	jcmvbkbc@gmail.com, yongbok.kim@mips.com, berto@igalia.com,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org, agraf@suse.de,
	david@gibson.dropbear.id.au, lvivier@redhat.com, famz@redhat.com,
	ehabkost@redhat.com, dgilbert@redhat.com, qemu-arm@nongnu.org,
	rth@twiddle.net, kwolf@redhat.com, crosthwaite.peter@gmail.com,
	i.mitsyanko@gmail.com, mreitz@redhat.com, qemu-ppc@nongnu.org,
	pbonzini@redhat.com, aurelien@aurel32.net
Date: Thu, 22 Mar 2018 10:57:40 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] coccinelle: re-run
 scripts from scripts/coccinelle
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
X-List-Received-Date: Thu, 22 Mar 2018 18:00:00 -0000

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTgwMzIyMTYxMjI2LjI5Nzk2LTEtbHZpdmllckByZWRoYXQuY29tClN1Ympl
Y3Q6IFtRZW11LWRldmVsXSBbUEFUQ0ggMC80XSBjb2NjaW5lbGxlOiByZS1ydW4gc2NyaXB0cyBm
cm9tIHNjcmlwdHMvY29jY2luZWxsZQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4v
YmFzaAoKQkFTRT1iYXNlCm49MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5lICRCQVNFLi4gfCB3
YyAtbCkKZmFpbGVkPTAKCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LmFsZ29yaXRobSBoaXN0b2dyYW0KCmNvbW1pdHM9IiQoZ2l0IGxvZyAtLWZvcm1hdD0lSCAtLXJl
dmVyc2UgJEJBU0UuLikiCmZvciBjIGluICRjb21taXRzOyBkbwogICAgZWNobyAiQ2hlY2tpbmcg
UEFUQ0ggJG4vJHRvdGFsOiAkKGdpdCBsb2cgLW4gMSAtLWZvcm1hdD0lcyAkYykuLi4iCiAgICBp
ZiAhIGdpdCBzaG93ICRjIC0tZm9ybWF0PWVtYWlsIHwgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwg
LS1tYWlsYmFjayAtOyB0aGVuCiAgICAgICAgZmFpbGVkPTEKICAgICAgICBlY2hvCiAgICBmaQog
ICAgbj0kKChuKzEpKQpkb25lCgpleGl0ICRmYWlsZWQKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0K
ClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBo
dHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIHQgW3RhZyB1cGRhdGVdICAg
ICAgICAgICAgcGF0Y2hldy8yMDE4MDMyMTE0NDEwNy4yMjc3MC0xLWt3b2xmQHJlZGhhdC5jb20g
LT4gcGF0Y2hldy8yMDE4MDMyMTE0NDEwNy4yMjc3MC0xLWt3b2xmQHJlZGhhdC5jb20KU3dpdGNo
ZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwphMWM3Mjc1YjU3IFJlbW92ZSB1bm5lY2Vzc2FyeSB2
YXJpYWJsZXMgZm9yIGZ1bmN0aW9uIHJldHVybiB2YWx1ZQphNTMwZmE1YTcyIHFkaWN0OiByZW1v
dmUgdXNlbGVzcyBjYXN0CmMxYmZlMjZiMTEgZXJyb3I6IFJlbW92ZSBOVUxMIGNoZWNrcyBvbiBl
cnJvcl9wcm9wYWdhdGUoKSBjYWxscwpkYjNkNTVlNThlIGVycm9yOiBTdHJpcCB0cmFpbGluZyAn
XG4nIGZyb20gZXJyb3Igc3RyaW5nIGFyZ3VtZW50cyAoYWdhaW4gYWdhaW4pCgo9PT0gT1VUUFVU
IEJFR0lOID09PQpDaGVja2luZyBQQVRDSCAxLzQ6IGVycm9yOiBTdHJpcCB0cmFpbGluZyAnXG4n
IGZyb20gZXJyb3Igc3RyaW5nIGFyZ3VtZW50cyAoYWdhaW4gYWdhaW4pLi4uCkNoZWNraW5nIFBB
VENIIDIvNDogZXJyb3I6IFJlbW92ZSBOVUxMIGNoZWNrcyBvbiBlcnJvcl9wcm9wYWdhdGUoKSBj
YWxscy4uLgpDaGVja2luZyBQQVRDSCAzLzQ6IHFkaWN0OiByZW1vdmUgdXNlbGVzcyBjYXN0Li4u
CkNoZWNraW5nIFBBVENIIDQvNDogUmVtb3ZlIHVubmVjZXNzYXJ5IHZhcmlhYmxlcyBmb3IgZnVu
Y3Rpb24gcmV0dXJuIHZhbHVlLi4uCkVSUk9SOiByZXR1cm4gaXMgbm90IGEgZnVuY3Rpb24sIHBh
cmVudGhlc2VzIGFyZSBub3QgcmVxdWlyZWQKIzI1MTogRklMRTogdGFyZ2V0L21pcHMvZHNwX2hl
bHBlci5jOjMyODE6CisgICAgcmV0dXJuICh0ZW1wWzFdIDw8IDYzKSB8ICh0ZW1wWzBdID4+IDEp
OwoKRVJST1I6IHJldHVybiBpcyBub3QgYSBmdW5jdGlvbiwgcGFyZW50aGVzZXMgYXJlIG5vdCBy
ZXF1aXJlZAojMjcwOiBGSUxFOiB0YXJnZXQvbWlwcy9kc3BfaGVscGVyLmM6MzMwODoKKyAgICBy
ZXR1cm4gKHRlbXBbMV0gPDwgNjMpIHwgKHRlbXBbMF0gPj4gMSk7CgpFUlJPUjogcmV0dXJuIGlz
IG5vdCBhIGZ1bmN0aW9uLCBwYXJlbnRoZXNlcyBhcmUgbm90IHJlcXVpcmVkCiMyODk6IEZJTEU6
IHRhcmdldC9taXBzL2RzcF9oZWxwZXIuYzozMzQxOgorICAgIHJldHVybiAodGVtcFsxXSA8PCA2
MykgfCAodGVtcFswXSA+PiAxKTsKCnRvdGFsOiAzIGVycm9ycywgMCB3YXJuaW5ncywgODEzIGxp
bmVzIGNoZWNrZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3
LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVt
IHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBP
VVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgotLS0KRW1h
aWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcub3Jn
L10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBmcmVlbGlzdHMu
b3Jn


