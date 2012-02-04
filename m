Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RteUJ-0003QB-QF
	for mharc-qemu-trivial@gnu.org; Sat, 04 Feb 2012 07:13:03 -0500
Received: from eggs.gnu.org ([140.186.70.92]:55956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1RteUF-00039n-K2
	for qemu-trivial@nongnu.org; Sat, 04 Feb 2012 07:13:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1RteUE-0003mG-MF
	for qemu-trivial@nongnu.org; Sat, 04 Feb 2012 07:12:59 -0500
Received: from mail-iy0-f173.google.com ([209.85.210.173]:33465)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1RteUB-0003lq-Qs; Sat, 04 Feb 2012 07:12:55 -0500
Received: by iahk25 with SMTP id k25so7497749iah.4
	for <multiple recipients>; Sat, 04 Feb 2012 04:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=TW9dmH+TelzCfuuAY0EPID4+cHB59cPrJwAFkqqc8XM=;
	b=EoB5orMk0aJ61kzd94OpipWt3zlWgQlx5noOSVQujjmMxpnq5lxNlKltmpv0U8FF9Y
	khaGfOAHvlorskzsaeRIATt1Ex+O/OENFQ/iE1dbPFiVF7HcwCR0HeKkB7j21kG9mxWp
	4JxmyqEhzBVWm3X7FKN6mDwhsfuPj+eOx4HUU=
Received: by 10.42.165.135 with SMTP id k7mr12043983icy.32.1328357575111; Sat,
	04 Feb 2012 04:12:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.15.167 with HTTP; Sat, 4 Feb 2012 04:12:35 -0800 (PST)
In-Reply-To: <4F2BCCBD.8050009@siemens.com>
References: <4F2BCCBD.8050009@siemens.com>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sat, 4 Feb 2012 12:12:35 +0000
Message-ID: <CAAu8pHvB_cG6KWaq350-ZAdsAiBr+m2FCSzuAX3LAYUdDUHX5A@mail.gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Avi Kivity <avi@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] memory-region: Report if region is
	read-only on info mtree
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
X-List-Received-Date: Sat, 04 Feb 2012 12:13:00 -0000

T24gRnJpLCBGZWIgMywgMjAxMiBhdCAxMjowMiwgSmFuIEtpc3prYSA8amFuLmtpc3prYUBzaWVt
ZW5zLmNvbT4gd3JvdGU6Cj4gSGVscGZ1bCB0byB1bmRlcnN0YW5kIGd1ZXN0IGNvbmZpZ3VyYXRp
b25zIG9mIHRoaW5ncyBsaWtlIHRoZSBpNDQwRlgncwo+IFBBTS4KPgo+IFNpZ25lZC1vZmYtYnk6
IEphbiBLaXN6a2EgPGphbi5raXN6a2FAc2llbWVucy5jb20+Cj4gLS0tCj4gwqBtZW1vcnkuYyB8
IMKgIMKgNiArKysrLS0KPiDCoDEgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL21lbW9yeS5jIGIvbWVtb3J5LmMKPiBpbmRleCBl
ZTRjOThhLi5lYTRhZGRhIDEwMDY0NAo+IC0tLSBhL21lbW9yeS5jCj4gKysrIGIvbWVtb3J5LmMK
PiBAQCAtMTYwOCwyMyArMTYwOCwyNSBAQCBzdGF0aWMgdm9pZCBtdHJlZV9wcmludF9tcihmcHJp
bnRmX2Z1bmN0aW9uIG1vbl9wcmludGYsIHZvaWQgKmYsCj4gwqAgwqAgwqAgwqAgwqAgwqAgbWwt
PnByaW50ZWQgPSBmYWxzZTsKPiDCoCDCoCDCoCDCoCDCoCDCoCBRVEFJTFFfSU5TRVJUX1RBSUwo
YWxpYXNfcHJpbnRfcXVldWUsIG1sLCBxdWV1ZSk7Cj4gwqAgwqAgwqAgwqAgfQo+IC0gwqAgwqAg
wqAgwqBtb25fcHJpbnRmKGYsIFRBUkdFVF9GTVRfcGx4ICItIiBUQVJHRVRfRk1UX3BseCAiIChw
cmlvICVkKTogYWxpYXMgJXMgQCVzICIKPiArIMKgIMKgIMKgIMKgbW9uX3ByaW50ZihmLCBUQVJH
RVRfRk1UX3BseCAiLSIgVEFSR0VUX0ZNVF9wbHggIiAocHJpbyAlZCwgJXMpOiBhbGlhcyAlcyBA
JXMgIgo+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgVEFSR0VUX0ZNVF9wbHggIi0iIFRB
UkdFVF9GTVRfcGx4ICJcbiIsCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBiYXNlICsg
bXItPmFkZHIsCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBiYXNlICsgbXItPmFkZHIK
PiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCsgKHRhcmdldF9waHlzX2FkZHJfdClpbnQx
MjhfZ2V0NjQobXItPnNpemUpIC0gMSwKPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1y
LT5wcmlvcml0eSwKPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG1yLT5yZWFkb25seSA/
ICJSTyIgOiAiUlciLAoKSSB0aGluayB0aGUgcmVzZXJ2ZWQgcmVnaW9ucyB3aGljaCBhcmUgdW5y
ZWFkYWJsZSBhbmQgdW53cml0YWJsZQpzaG91bGQgYmUgc2hvd24gYXMgd2VsbC4gVGhlbiB0aGUg
b3V0cHV0IHNob3VsZCBiZSBhIGNvbWJpbmF0aW9uIG9mCidSJywgJ1cnIG9yIG5laXRoZXIgKCct
JykuCgo+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbXItPm5hbWUsCj4gwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBtci0+YWxpYXMtPm5hbWUsCj4gwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBtci0+YWxpYXNfb2Zmc2V0LAo+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgbXItPmFsaWFzX29mZnNldAo+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKyAodGFy
Z2V0X3BoeXNfYWRkcl90KWludDEyOF9nZXQ2NChtci0+c2l6ZSkgLSAxKTsKPiDCoCDCoCB9IGVs
c2Ugewo+IC0gwqAgwqAgwqAgwqBtb25fcHJpbnRmKGYsIFRBUkdFVF9GTVRfcGx4ICItIiBUQVJH
RVRfRk1UX3BseCAiIChwcmlvICVkKTogJXNcbiIsCj4gKyDCoCDCoCDCoCDCoG1vbl9wcmludGYo
ZiwgVEFSR0VUX0ZNVF9wbHggIi0iIFRBUkdFVF9GTVRfcGx4ICIgKHByaW8gJWQsICVzKTogJXNc
biIsCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBiYXNlICsgbXItPmFkZHIsCj4gwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBiYXNlICsgbXItPmFkZHIKPiDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCsgKHRhcmdldF9waHlzX2FkZHJfdClpbnQxMjhfZ2V0NjQobXItPnNp
emUpIC0gMSwKPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1yLT5wcmlvcml0eSwKPiAr
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG1yLT5yZWFkb25seSA/ICJSTyIgOiAiUlciLAo+
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbXItPm5hbWUpOwo+IMKgIMKgIH0KPgo+IC0t
Cj4gMS43LjMuNAo=

