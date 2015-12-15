Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a8qal-0000Wr-Jc
	for mharc-qemu-trivial@gnu.org; Tue, 15 Dec 2015 09:28:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qhjin_dev@163.com>) id 1a8qai-0000R4-PC
	for qemu-trivial@nongnu.org; Tue, 15 Dec 2015 09:28:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <qhjin_dev@163.com>) id 1a8qaf-0005Wu-ED
	for qemu-trivial@nongnu.org; Tue, 15 Dec 2015 09:28:36 -0500
Received: from m12-15.163.com ([220.181.12.15]:45150)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qhjin_dev@163.com>)
	id 1a8qae-0005Wk-Iv; Tue, 15 Dec 2015 09:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=fJbS7
	0iCEDxxKGIQEApdseH2Dt2hY+QnGGR0Cz/UAtM=; b=TLfO4YB11nGgfHR5p0/lk
	2NTPWZPMPnYYehGsEy8HrVSPC87DJdgqZ27iar5kUQCAdYoJdvGl8ab9NN/pae53
	IrDz7tTP0oeZJyBER/SUTt2s1ZuKBXY+p9JhvsTL9LZ1CUJWvyhafSvsI4hRf1m8
	ju2jXaFLrp4lzsMv7VgQ6E=
Received: from qhjin_dev$163.com ( [222.65.122.231] ) by
	ajax-webmail-wmsvr58 (Coremail) ; Tue, 15 Dec 2015 22:12:35 +0800 (CST)
X-Originating-IP: [222.65.122.231]
Date: Tue, 15 Dec 2015 22:12:35 +0800 (CST)
From: "Qinghua Jin" <qhjin_dev@163.com>
To: "Stefan Hajnoczi" <stefanha@redhat.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version SP_ntes V3.5 build
	20150911(74783.7961) Copyright (c) 2002-2015 www.mailtech.cn 163com
In-Reply-To: <20151214122134.GF5027@stefanha-x1.localdomain>
References: <6aa1b449.fb8b.1518fdc8641.Coremail.qhjin_dev@163.com>
	<20151214122134.GF5027@stefanha-x1.localdomain>
X-CM-CTRLDATA: M1GHE2Zvb3Rlcl9odG09OTA5OjU2
Content-Type: multipart/alternative; 
	boundary="----=_Part_481870_83465605.1450188755688"
MIME-Version: 1.0
Message-ID: <8ab6a76.1d192.151a5fc52e9.Coremail.qhjin_dev@163.com>
X-CM-TRANSID: OsGowAD3dMzUH3BWn9MSAA--.3025W
X-CM-SenderInfo: ptkmx0hbgh4qqrwthudrp/1tbi8ArRHFUL5mwZwgACs6
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] trace: reflect the file name change
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
X-List-Received-Date: Tue, 15 Dec 2015 14:28:38 -0000

------=_Part_481870_83465605.1450188755688
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

VGhhbmtzIGZvciBoZWxwaW5nIG1lLCBpJ2xsIHVzZSBpdCBuZXh0IHRpbWUuCgoKCgoKCgoKQXQg
MjAxNS0xMi0xNSAxMTowMzoxMiwgIlN0ZWZhbiBIYWpub2N6aSIgPHN0ZWZhbmhhQHJlZGhhdC5j
b20+IHdyb3RlOgo+T24gRnJpLCBEZWMgMTEsIDIwMTUgYXQgMDM6MDY6MTJQTSArMDgwMCwgUWlu
Z2h1YSBKaW4gd3JvdGU6Cj4+IFNvbWUgZnVuY3Rpb25zIHdhcyBtb3ZlZCBmcm9tIGJsb2NrLmMg
dG8gYmxvY2svaW8uYywgc28gdGhlIHRyYWNlLWV2ZW50cyBmaWxlIHNob3VsZCByZWZsZWN0IHRo
YXQgY2hhbmdlLgo+PiAKPj4gCj4+IFNpZ25lZC1vZmYtYnk6IFFpbmdodWEgSmluIDxxaGppbl9k
ZXZAMTYzLmNvbT4KPj4gLS0tCj4+ICB0cmFjZS1ldmVudHMgfCA0ICsrKy0KPj4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+UGxlYXNlIHVzZSBnaXQt
c2VuZC1lbWFpbCgxKSBpbiB0aGUgZnV0dXJlLiAgSSBoYWQgdG8gbWFudWFsbHkgYXBwbHkKPnlv
dXIgcGF0Y2guCj4KPgo+VGhhbmtzLCBhcHBsaWVkIHRvIG15IHRyYWNpbmctbmV4dCB0cmVlOgo+
aHR0cHM6Ly9naXRodWIuY29tL3N0ZWZhbmhhL3FlbXUvY29tbWl0cy90cmFjaW5nLW5leHQKPgo+
U3RlZmFuCg==
------=_Part_481870_83465605.1450188755688
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPlRoYW5rcyBmb3IgaGVscGluZyBtZSwgaSdsbCB1c2UgaXQgbmV4
dCB0aW1lLjxicj48YnI+PGJyPjxicj48YnI+PGRpdiBzdHlsZT0icG9zaXRpb246cmVsYXRpdmU7
em9vbToxIj48L2Rpdj48ZGl2IGlkPSJkaXZOZXRlYXNlTWFpbENhcmQiPjwvZGl2Pjxicj48cHJl
Pjxicj5BdCAyMDE1LTEyLTE1IDExOjAzOjEyLCAiU3RlZmFuIEhham5vY3ppIiAmbHQ7c3RlZmFu
aGFAcmVkaGF0LmNvbSZndDsgd3JvdGU6CiZndDtPbiBGcmksIERlYyAxMSwgMjAxNSBhdCAwMzow
NjoxMlBNICswODAwLCBRaW5naHVhIEppbiB3cm90ZToKJmd0OyZndDsgU29tZSBmdW5jdGlvbnMg
d2FzIG1vdmVkIGZyb20gYmxvY2suYyB0byBibG9jay9pby5jLCBzbyB0aGUgdHJhY2UtZXZlbnRz
IGZpbGUgc2hvdWxkIHJlZmxlY3QgdGhhdCBjaGFuZ2UuCiZndDsmZ3Q7IAomZ3Q7Jmd0OyAKJmd0
OyZndDsgU2lnbmVkLW9mZi1ieTogUWluZ2h1YSBKaW4gJmx0O3FoamluX2RldkAxNjMuY29tJmd0
OwomZ3Q7Jmd0OyAtLS0KJmd0OyZndDsgIHRyYWNlLWV2ZW50cyB8IDQgKysrLQomZ3Q7Jmd0OyAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQomZ3Q7CiZndDtQ
bGVhc2UgdXNlIGdpdC1zZW5kLWVtYWlsKDEpIGluIHRoZSBmdXR1cmUuICBJIGhhZCB0byBtYW51
YWxseSBhcHBseQomZ3Q7eW91ciBwYXRjaC4KJmd0OwomZ3Q7CiZndDtUaGFua3MsIGFwcGxpZWQg
dG8gbXkgdHJhY2luZy1uZXh0IHRyZWU6CiZndDtodHRwczovL2dpdGh1Yi5jb20vc3RlZmFuaGEv
cWVtdS9jb21taXRzL3RyYWNpbmctbmV4dAomZ3Q7CiZndDtTdGVmYW4KPC9wcmU+PC9kaXY+PGJy
Pjxicj48c3BhbiB0aXRsZT0ibmV0ZWFzZWZvb3RlciI+PHA+Jm5ic3A7PC9wPjwvc3Bhbj4=
------=_Part_481870_83465605.1450188755688--


