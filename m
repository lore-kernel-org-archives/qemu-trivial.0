Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePUky-0007r9-86
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 09:45:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frasse.iglesias@gmail.com>) id 1ePEj0-00025u-AO
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 16:37:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frasse.iglesias@gmail.com>) id 1ePEiz-0003de-6W
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 16:37:58 -0500
Received: from mail-pf0-x236.google.com ([2607:f8b0:400e:c00::236]:45531)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <frasse.iglesias@gmail.com>)
	id 1ePEiy-0003cG-V3; Wed, 13 Dec 2017 16:37:57 -0500
Received: by mail-pf0-x236.google.com with SMTP id u19so2059219pfa.12;
	Wed, 13 Dec 2017 13:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tMjFjlOhkOKl0jaWe6L0+GhHdboQYhb81gFfoAgPx5E=;
	b=TiItjzC8boWZSIXcb2fvWk+Cqpt/OeqFtWNRrOzI3Aj6cUq9/TI5K8KR9E2sEIWsEx
	uIB6ehx1R57bt2CBwUZOwH42u4KUN2uPu6MprwP/odMDt4hU8wtKM0wbg1ZVtkIeNtFX
	jNBfaKFitZiEJeHECjJ6VkrJFuAMqVpOUZvLFUB2MHmfszNzGWz3eQRDELHnwQPsIVgX
	cWxgNQKtjX6CUlugC6EBeDQ5+zeLOTGRvptHQugTAq57Zlpbook6GnSTWNWzUsRjyvdr
	FV8J8EOSAy9iMWcyRRVKHh9Qh72tR0XJpodTF8srgqmhi4OUb0lMQQuQzFbM8cBhNaHW
	agsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tMjFjlOhkOKl0jaWe6L0+GhHdboQYhb81gFfoAgPx5E=;
	b=osTdcNStwQ6zPOn8b9Uci++0654igxeskMrSBGNr349WOA+RjG6w7RY0GwKuoXyHI9
	eK1yi0AERPtr+9Mmupsb/hGJ54Rz2DY2lXzX248sHqhifUn43dFljBkzjZKBTcE/r9D9
	Zo+tz3oyo6DaRKQ7s2GpsELEd5Flle3MuJyGcOGAk6wZGObxw8JA8A1dCtL4i88mYhVi
	2/rUkl3FHsD1jJ7zB+5tK40VV8Oc3xK+2M+OtnfZFj4+mjIv0b4rrxMkFG611jXnNXM6
	7ZvpizH5z+19B+IKLU8iaY4j6r4V9FspEpftzsJmSWuX7Yaf9Tzi7TrnmdsaurWBLo8K
	mMRQ==
X-Gm-Message-State: AKGB3mKR1g15CwRuN3HZpJxdFHi9Bp7TwqGDs9FxGYbjLS9c7X4rDa59
	75gnRIrMsIeYpjswUZh5eUsIONqqfY24rDfluJU=
X-Google-Smtp-Source: ACJfBovAK0bsCclcY+/viBrv6yc+o01UjhntZb+Mx79aB60RFZ8rJB6T0dsg6AQIFsJFsr3UFsXKZde2ak2PZe9vaCQ=
X-Received: by 10.84.193.129 with SMTP id f1mr7219123pld.355.1513201075754;
	Wed, 13 Dec 2017 13:37:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.130.214 with HTTP; Wed, 13 Dec 2017 13:37:55 -0800 (PST)
In-Reply-To: <20171213051736.17755-4-f4bug@amsat.org>
References: <20171213051736.17755-1-f4bug@amsat.org>
	<20171213051736.17755-4-f4bug@amsat.org>
From: francisco iglesias <frasse.iglesias@gmail.com>
Date: Wed, 13 Dec 2017 22:37:55 +0100
Message-ID: <CAAYMZQuQv-yQA2keiq=9p95jQCSz3c=Dzjaygh=co=Q25ZKdxw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Alistair Francis <alistair.francis@xilinx.com>, 
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-trivial@nongnu.org, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="94eb2c18a36e981aca05603f9413"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::236
X-Mailman-Approved-At: Thu, 14 Dec 2017 09:45:03 -0500
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/4] hw/registerfields: add
 64-bit extract/deposit macros
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
X-List-Received-Date: Wed, 13 Dec 2017 21:37:59 -0000

--94eb2c18a36e981aca05603f9413
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 13 December 2017 at 06:17, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
wrote:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/registerfields.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
> index ad9d7a82a3..f59e7f47bd 100644
> --- a/include/hw/registerfields.h
> +++ b/include/hw/registerfields.h
> @@ -35,6 +35,9 @@
>  #define FIELD_EX32(storage, reg, field)
>  \
>      extract32((storage), R_ ## reg ## _ ## field ## _SHIFT,
>  \
>                R_ ## reg ## _ ## field ## _LENGTH)
> +#define FIELD_EX64(storage, reg, field)
>  \
> +    extract64((storage), R_ ## reg ## _ ## field ## _SHIFT,
>  \
> +              R_ ## reg ## _ ## field ## _LENGTH)
>
>  /* Extract a field from an array of registers */
>  #define ARRAY_FIELD_EX32(regs, reg, field)
> \
> @@ -52,6 +55,14 @@
>      d =3D deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,
>  \
>                    R_ ## reg ## _ ## field ## _LENGTH, v.v);
>  \
>      d; })
> +#define FIELD_DP64(storage, reg, field, val) ({
>  \
> +    struct {
> \
> +        unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;
> \
>

Hi Phiilppe,

I'm just wondering if 'v' above maybe should be uint64_t? The size of
unsigned int seems to be 'implementation defined' but I would guess 32 bits
is not unsual. Basically wouldn't a field length > 32 above be problematic?

Best regards,
Francisco


> +    } v =3D { .v =3D val };
>  \
> +    uint64_t d;
>  \
> +    d =3D deposit64((storage), R_ ## reg ## _ ## field ## _SHIFT,
>  \
> +                  R_ ## reg ## _ ## field ## _LENGTH, v.v);
>  \
> +    d; })
>
>  /* Deposit a field to array of registers.  */
>  #define ARRAY_FIELD_DP32(regs, reg, field, val)
>  \
> --
> 2.15.1
>
>
>

--94eb2c18a36e981aca05603f9413
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPk9uIDEzIERlY2VtYmVyIDIwMTcgYXQgMDY6MTcsIFBoaWxpcHBlIE1h
dGhpZXUtRGF1ZMOpIDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOmY0YnVnQGFt
c2F0Lm9yZyIgdGFyZ2V0PSJfYmxhbmsiPmY0YnVnQGFtc2F0Lm9yZzwvYT4mZ3Q7PC9zcGFuPiB3
cm90ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAg
MCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+U2ln
bmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgJmx0OzxhIGhyZWY9Im1haWx0bzpm
NGJ1Z0BhbXNhdC5vcmciPmY0YnVnQGFtc2F0Lm9yZzwvYT4mZ3Q7PGJyPg0KLS0tPGJyPg0KwqBp
bmNsdWRlL2h3L3JlZ2lzdGVyZmllbGRzLmggfCAxMSArKysrKysrKysrKzxicj4NCsKgMSBmaWxl
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyk8YnI+DQo8YnI+DQpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9ody9yZWdpc3RlcmZpZWxkcy5oIGIvaW5jbHVkZS9ody9yZWdpc3RlcmZpZWxkcy5oPGJyPg0K
aW5kZXggYWQ5ZDdhODJhMy4uZjU5ZTdmNDdiZCAxMDA2NDQ8YnI+DQotLS0gYS9pbmNsdWRlL2h3
L3JlZ2lzdGVyZmllbGRzLmg8YnI+DQorKysgYi9pbmNsdWRlL2h3L3JlZ2lzdGVyZmllbGRzLmg8
YnI+DQpAQCAtMzUsNiArMzUsOSBAQDxicj4NCsKgI2RlZmluZSBGSUVMRF9FWDMyKHN0b3JhZ2Us
IHJlZywgZmllbGQpwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBcPGJyPg0KwqAgwqAgwqBleHRyYWN0MzIoKHN0b3JhZ2UpLCBSXyAjIyByZWcgIyMg
XyAjIyBmaWVsZCAjIyBfU0hJRlQswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBSXyAjIyByZWcgIyMgXyAjIyBmaWVsZCAjIyBfTEVOR1RIKTxicj4N
CisjZGVmaW5lIEZJRUxEX0VYNjQoc3RvcmFnZSwgcmVnLCBmaWVsZCnCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQorwqAgwqAgZXh0cmFj
dDY0KChzdG9yYWdlKSwgUl8gIyMgcmVnICMjIF8gIyMgZmllbGQgIyMgX1NISUZULMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgXDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCBSXyAjIyByZWcgIyMg
XyAjIyBmaWVsZCAjIyBfTEVOR1RIKTxicj4NCjxicj4NCsKgLyogRXh0cmFjdCBhIGZpZWxkIGZy
b20gYW4gYXJyYXkgb2YgcmVnaXN0ZXJzICovPGJyPg0KwqAjZGVmaW5lIEFSUkFZX0ZJRUxEX0VY
MzIocmVncywgcmVnLCBmaWVsZCnCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBcPGJyPg0KQEAgLTUyLDYgKzU1LDE0IEBAPGJyPg0KwqAgwqAgwqBkID0gZGVw
b3NpdDMyKChzdG9yYWdlKSwgUl8gIyMgcmVnICMjIF8gIyMgZmllbGQgIyMgX1NISUZULMKgIMKg
IMKgIMKgIMKgIMKgXDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgUl8gIyMgcmVn
ICMjIF8gIyMgZmllbGQgIyMgX0xFTkdUSCwgdi52KTvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8
YnI+DQrCoCDCoCDCoGQ7IH0pPGJyPg0KKyNkZWZpbmUgRklFTERfRFA2NChzdG9yYWdlLCByZWcs
IGZpZWxkLCB2YWwpICh7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBc
PGJyPg0KK8KgIMKgIHN0cnVjdCB7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
XDxicj4NCivCoCDCoCDCoCDCoCB1bnNpZ25lZCBpbnQgdjpSXyAjIyByZWcgIyMgXyAjIyBmaWVs
ZCAjIyBfTEVOR1RIO8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+PC9ibG9ja3F1b3RlPjxk
aXY+PGJyPkhpIFBoaWlscHBlLDxicj48YnI+PC9kaXY+PGRpdj5JJiMzOTttIGp1c3Qgd29uZGVy
aW5nIGlmICYjMzk7diYjMzk7IGFib3ZlIG1heWJlIHNob3VsZCBiZSB1aW50NjRfdD8gVGhlIHNp
emUgb2YgdW5zaWduZWQgaW50IHNlZW1zIHRvIGJlICYjMzk7aW1wbGVtZW50YXRpb24gZGVmaW5l
ZCYjMzk7IGJ1dCBJIHdvdWxkIGd1ZXNzIDMyIGJpdHMgaXMgbm90IHVuc3VhbC4gQmFzaWNhbGx5
IHdvdWxkbiYjMzk7dCBhIGZpZWxkIGxlbmd0aCAmZ3Q7IDMyIGFib3ZlIGJlIHByb2JsZW1hdGlj
PyA8YnI+PGJyPjwvZGl2PjxkaXY+QmVzdCByZWdhcmRzLDxicj48L2Rpdj48ZGl2PkZyYW5jaXNj
bzxicj48L2Rpdj48ZGl2PsKgPC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBz
dHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGlu
Zy1sZWZ0OjFleCI+DQorwqAgwqAgfSB2ID0geyAudiA9IHZhbCB9O8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgXDxicj4NCivCoCDCoCB1aW50NjRfdCBkO8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgXDxicj4NCivCoCDCoCBkID0gZGVwb3NpdDY0KChzdG9yYWdlKSwgUl8gIyMgcmVnICMjIF8g
IyMgZmllbGQgIyMgX1NISUZULMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBSXyAjIyByZWcgIyMgXyAjIyBmaWVsZCAjIyBfTEVOR1RILCB2LnYpO8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCivCoCDCoCBkOyB9KTxicj4NCjxicj4NCsKgLyog
RGVwb3NpdCBhIGZpZWxkIHRvIGFycmF5IG9mIHJlZ2lzdGVycy7CoCAqLzxicj4NCsKgI2RlZmlu
ZSBBUlJBWV9GSUVMRF9EUDMyKHJlZ3MsIHJlZywgZmllbGQsIHZhbCnCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQo8c3BhbiBjbGFzcz0iSE9FblpiIj48Zm9u
dCBjb2xvcj0iIzg4ODg4OCI+LS08YnI+DQoyLjE1LjE8YnI+DQo8YnI+DQo8YnI+DQo8L2ZvbnQ+
PC9zcGFuPjwvYmxvY2txdW90ZT48L2Rpdj48YnI+PC9kaXY+PC9kaXY+DQo=
--94eb2c18a36e981aca05603f9413--

