Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6Epx-0004bl-NF
	for mharc-qemu-trivial@gnu.org; Thu, 13 Aug 2020 11:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1k6Epu-0004at-BQ; Thu, 13 Aug 2020 11:08:10 -0400
Resent-Date: Thu, 13 Aug 2020 11:08:10 -0400
Resent-Message-Id: <E1k6Epu-0004at-BQ@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1k6Epq-0007bQ-PY; Thu, 13 Aug 2020 11:08:10 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1597331275; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WQD4Av4eqmQlxwDUtp24dE7JV//NANAYk+geBDNcGZsGgP3CvIGpmzxnQ9uDEM2bVGi9tLin7f2oe7uysLu7rDpdkXwMfrC++UhgwX8yI6/D3PLx13uepAkcS+zNH0TE64EVFaxMsAxBXlEiTXh4fIxSvAqkz+mLBTeR9U9oStI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1597331275;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=KNIXA/fWIYH5IxhzwKMlvafo8F6klOtjCaF4eWrrf1o=; 
 b=h/csD8W2EsRnW3B7yVH1POc/9vtDOtTXNvU6UiNS0FCSu9rxbQdXhitDctia/JAtfVA4aoYG6FvCVDC9uQax71zPfQY8+vHr16TUy3Dw31cF+mT/OxLPhH8UAfptOvR9hIvuz8elBcREl3xUPDilUEhh5qssv0LgAFBdbALw0wA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1597331270483557.0210603655494;
 Thu, 13 Aug 2020 08:07:50 -0700 (PDT)
Subject: Re: [PATCH] docs/system/target-avr: Improve the AVR docs and add to
 MAINTAINERS
Message-ID: <159733126931.15736.4125159469500224021@66eaa9a8a123>
Reply-To: <qemu-devel@nongnu.org>
In-Reply-To: <20200812155304.18016-1-huth@tuxfamily.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: huth@tuxfamily.org
Cc: qemu-devel@nongnu.org, mrolnik@gmail.com, f4bug@amsat.org,
 qemu-trivial@nongnu.org, S.E.Harris@kent.ac.uk
Date: Thu, 13 Aug 2020 08:07:50 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 10:17:15
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 13 Aug 2020 15:08:11 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDgxMjE1NTMwNC4xODAx
Ni0xLWh1dGhAdHV4ZmFtaWx5Lm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZl
IHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGlu
Zm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjAwODEyMTU1MzA0LjE4MDE2
LTEtaHV0aEB0dXhmYW1pbHkub3JnClN1YmplY3Q6IFtQQVRDSF0gZG9jcy9zeXN0ZW0vdGFyZ2V0
LWF2cjogSW1wcm92ZSB0aGUgQVZSIGRvY3MgYW5kIGFkZCB0byBNQUlOVEFJTkVSUwoKPT09IFRF
U1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2
L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBi
YXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAn
dGVzdCcKMjJmYmY4YiBkb2NzL3N5c3RlbS90YXJnZXQtYXZyOiBJbXByb3ZlIHRoZSBBVlIgZG9j
cyBhbmQgYWRkIHRvIE1BSU5UQUlORVJTCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogdHJh
aWxpbmcgd2hpdGVzcGFjZQojNTc6IEZJTEU6IGRvY3Mvc3lzdGVtL3RhcmdldC1hdnIucnN0OjI3
OgorICAgICAgICAgICAgICAgICAgIC1zZXJpYWwgdGNwOjo1Njc4LHNlcnZlcixub3dhaXQgJAoK
dG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCA1NCBsaW5lcyBjaGVja2VkCgpDb21taXQgMjJm
YmY4YmU5OTE5IChkb2NzL3N5c3RlbS90YXJnZXQtYXZyOiBJbXByb3ZlIHRoZSBBVlIgZG9jcyBh
bmQgYWRkIHRvIE1BSU5UQUlORVJTKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcu
ICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0g
dG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VU
UFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwg
bG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMDgxMjE1NTMw
NC4xODAxNi0xLWh1dGhAdHV4ZmFtaWx5Lm9yZy90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVz
c2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBz
Oi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRl
dmVsQHJlZGhhdC5jb20=

