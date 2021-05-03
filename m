Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ldfJL-0003P2-GF
	for mharc-qemu-trivial@gnu.org; Mon, 03 May 2021 16:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ldfJH-0003Kp-Ps; Mon, 03 May 2021 16:36:56 -0400
Resent-Date: Mon, 03 May 2021 16:36:55 -0400
Resent-Message-Id: <E1ldfJH-0003Kp-Ps@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ldfJF-0003lW-FF; Mon, 03 May 2021 16:36:55 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1620074206; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OhlFBK6bkp4iu9ziarhQLtESDHG6EqvEiKM53KTMCpBVjkeYHyX0QHp8ioaT/wxAZnCH6H2Fgh7gRm5n1qesiVf5YFk5w2GX3pVkjTv0YQqxVUib9B1y9uv4TLJ6DNql5x+jgnU05h9KVz7sOUbOUdFSReqPPqSYRrwB+632Ga8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1620074206;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=IWF03PpP0icuKa9mzWqb5YEob3zDECiYMPWbXVq0Y6A=; 
 b=XCc25kxQKqGXmIm1+NeH8t+XmXYpC53cpQ1GNpvWc9fE08GZGKXjrjqexj0qecaxVq5hoAe83d2bzrqX790HI/dDmx+GY575/NpBerwwDSFpQxjFLNYvUA4E95BDWdYf2zvv83Jix/VR7AfEbBxwsSE9QCGf6SBEqamdBkpW2b4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1620074204470289.9621242860312;
 Mon, 3 May 2021 13:36:44 -0700 (PDT)
In-Reply-To: <20210503161422.15028-1-dgouttegattat@incenp.org>
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH] docs: Fix installation of man pages with Sphinx 4.x
Message-ID: <162007420340.25069.12342023070694392469@d887ba82c771>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 3 May 2021 13:36:44 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 03 May 2021 20:36:57 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUwMzE2MTQyMi4xNTAy
OC0xLWRnb3V0dGVnYXR0YXRAaW5jZW5wLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0
byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgpt
b3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNTAzMTYxNDIy
LjE1MDI4LTEtZGdvdXR0ZWdhdHRhdEBpbmNlbnAub3JnClN1YmplY3Q6IFtQQVRDSF0gZG9jczog
Rml4IGluc3RhbGxhdGlvbiBvZiBtYW4gcGFnZXMgd2l0aCBTcGhpbnggNC54Cgo9PT0gVEVTVCBT
Q1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVs
bCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29u
ZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxn
b3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2Uu
Lgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRk
MWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2pl
Y3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwNTAzMTYxNDIyLjE1MDI4
LTEtZGdvdXR0ZWdhdHRhdEBpbmNlbnAub3JnIC0+IHBhdGNoZXcvMjAyMTA1MDMxNjE0MjIuMTUw
MjgtMS1kZ291dHRlZ2F0dGF0QGluY2VucC5vcmcKIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hl
dy8yMDIxMDUwMzE3MTMwMy44MjI1MDEtMS1mNGJ1Z0BhbXNhdC5vcmcgLT4gcGF0Y2hldy8yMDIx
MDUwMzE3MTMwMy44MjI1MDEtMS1mNGJ1Z0BhbXNhdC5vcmcKU3dpdGNoZWQgdG8gYSBuZXcgYnJh
bmNoICd0ZXN0JwpmZTM0ZmIwIGRvY3M6IEZpeCBpbnN0YWxsYXRpb24gb2YgbWFuIHBhZ2VzIHdp
dGggU3BoaW54IDQueAoKPT09IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6IEF1dGhvciBlbWFpbCBh
ZGRyZXNzIGlzIG1hbmdsZWQgYnkgdGhlIG1haWxpbmcgbGlzdAojMjogCkF1dGhvcjogRGFtaWVu
IEdvdXR0ZS1HYXR0YXQgdmlhIDxxZW11LWRldmVsQG5vbmdudS5vcmc+Cgp0b3RhbDogMSBlcnJv
cnMsIDAgd2FybmluZ3MsIDcgbGluZXMgY2hlY2tlZAoKQ29tbWl0IGZlMzRmYjBmNTU0NiAoZG9j
czogRml4IGluc3RhbGxhdGlvbiBvZiBtYW4gcGFnZXMgd2l0aCBTcGhpbnggNC54KSBoYXMgc3R5
bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBm
YWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BB
VENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0
ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0
Y2hldy5vcmcvbG9ncy8yMDIxMDUwMzE2MTQyMi4xNTAyOC0xLWRnb3V0dGVnYXR0YXRAaW5jZW5w
Lm9yZy90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRl
ZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNl
IHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

