Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YcL8W-0005rB-Tj
	for mharc-qemu-trivial@gnu.org; Sun, 29 Mar 2015 17:52:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1YcL8U-0005pl-HS
	for qemu-trivial@nongnu.org; Sun, 29 Mar 2015 17:52:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1YcL8T-0005Yh-Ld
	for qemu-trivial@nongnu.org; Sun, 29 Mar 2015 17:52:50 -0400
Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c]:35882)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1YcL8T-0005YI-EE; Sun, 29 Mar 2015 17:52:49 -0400
Received: by pdcp1 with SMTP id p1so63498104pdc.3;
	Sun, 29 Mar 2015 14:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:sender:date:subject:from:to:cc:mime-version:content-type
	:content-transfer-encoding;
	bh=JQCAzlseaLnf9WANqQ9KSSEVGH86Vn6rsWMKb7XTtt0=;
	b=LIGgOxQhURDCpIr4o3xR6nFPMpGl3oDRGtQ2NbcILsM8fvX+IMk4en73OWsXyD7elg
	arHsv/yi/9ukDEDautt1hboXNuAmAupfMrmryMO8iC2kL3QOxtrFbyTNYMPQERDzWrmB
	OAhJYtFj+cYUq7747hCqYdqlrnwBJ+q1pU/Lc5DXB/N2gF3p+XVoLVr+1JpFYhRczlI1
	TQKs2vUIjT1fDmjpJhd0SuWIOW9npxBfrh6sO30naC1iSvON4vo6nuDByMNeByKeccAu
	r6XKh3Q5rmp4AA3GkM+H04o/t2vnSmpEdhXkvzCsVYFZER8ulCO0jt2GHd7uyb2xOExM
	4w9g==
X-Received: by 10.68.248.39 with SMTP id yj7mr53559780pbc.58.1427665967618;
	Sun, 29 Mar 2015 14:52:47 -0700 (PDT)
Received: from ?IPv6:2607:fb90:2c2e:4c65:c897:10e5:47a5:a7f1?
	([2607:fb90:2c2e:4c65:c897:10e5:47a5:a7f1])
	by mx.google.com with ESMTPSA id y5sm8387617pdh.21.2015.03.29.14.52.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Mar 2015 14:52:46 -0700 (PDT)
Message-ID: <5518742e.451f460a.1d9b.66ce@mx.google.com>
Sender: Richard Henderson <rth7680@gmail.com>
Date: Sun, 29 Mar 2015 14:52:42 -0700
From: Richard Henderson <rth@twiddle.net>
To: "Emilio G. Cota" <cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22c
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	=?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tcg: optimise memory layout
	of TCGTemp
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Mar 2015 21:52:51 -0000

T24gTWFyIDI3LCAyMDE1IDE0OjA5LCAiRW1pbGlvIEcuIENvdGEiIDxjb3RhQGJyYWFwLm9yZz4g
d3JvdGU6Cj4KPiBPbiBGcmksIE1hciAyNywgMjAxNSBhdCAwOTo1NTowMyArMDAwMCwgQWxleCBC
ZW5uw6llIHdyb3RlOiAKPiA+IEhhdmUgeW91IGJlZW4gYWJsZSB0byBtZWFzdXJlIGFueSBwZXJm
b3JtYW5jZSBpbXByb3ZlbWVudCB3aXRoIHRoZXNlIG5ldyAKPiA+IHN0cnVjdHVyZXM/IEluIHRo
ZW9yeSwgaWYgYWxpZ25lZCB3aXRoIGNhY2hlIGxpbmVzLCBwZXJmb3JtYW5jZSBzaG91bGQgCj4g
PiBpbXByb3ZlIGJ1dCByZWFsIG51bWJlcnMgd291bGQgYmUgbmljZS4gCj4KPiBJIGhhdmVuJ3Qg
YmVuY2htYXJrZWQgYW55dGhpbmcsIHdoaWNoIG1ha2VzIG1lIHZlcnkgdW5lYXN5LiBBbGwgCj4g
SSd2ZSBjaGVja2VkIGlzIHRoYXQgdGhlIHN5c3RlbSBib290cywgYW5kIEZXSVcgSSBhcHByZWNp
YXRlIG5vIAo+IGRpZmZlcmVuY2UgaW4gYm9vdCB0aW1lLgoKTm8gZGVjcmVhc2UgaW4gYm9vdCB0
aW1lIGlzIGdvb2QuIFdlIC9rbm93LyB3ZSdyZSBzYXZpbmcgbWVtb3J5LCBhZnRlciBhbGwuCiAK
Pgo+IElzIHRoZXJlIGEgYmVuY2htYXJrIHN1aXRlIHRvIHRlc3QgVENHIGNoYW5nZXM/IAoKTm8s
IHNvcnJ5LiAKCgpyfg==


