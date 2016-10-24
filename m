Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bybDW-0000nM-E0
	for mharc-qemu-trivial@gnu.org; Mon, 24 Oct 2016 05:06:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36713)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1bybDU-0000m2-Ni
	for qemu-trivial@nongnu.org; Mon, 24 Oct 2016 05:06:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1bybDT-00083O-ND
	for qemu-trivial@nongnu.org; Mon, 24 Oct 2016 05:06:48 -0400
Received: from mail-yw0-x241.google.com ([2607:f8b0:4002:c05::241]:36019)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <anand.indukala@gmail.com>)
	id 1bybDM-00081j-BX; Mon, 24 Oct 2016 05:06:40 -0400
Received: by mail-yw0-x241.google.com with SMTP id e5so8184075ywc.3;
	Mon, 24 Oct 2016 02:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8EQvz0s6EXnc5wIdWcqpjZ0lApPw0xF4ob/bJ2aHtCE=;
	b=izn+g4aaNMdOmMqFJonXVBREgirRrlbPnfXN8jMuYUDewMGLUZ0q57b5sqzH/hzCNE
	jOjdlQnAMIwf1+SaqUsPX7z2DiVyIvQB7Dk0S7pFmsxmLIOi/rWp44ugwn7DrH2t2F4D
	4WLr/QYVyVK7XPi7S3ioA0Ikr5eKwjOsmzEzfRXZ7q3Qj5KztmGwEtln+l1xmtVpxuto
	6Ki9x3mZvOCdHQOOS4XktFL+nTULtx91NSAyTKv/7kl/iNHcxuBgA4FcdSrb0KBZrmHx
	azhb2qYRov4F4P7Q/BqKur8St37gFIxdpR3W+8MQ1fHSBwfwWG60cmzK5+cwtRfQw1y4
	PAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8EQvz0s6EXnc5wIdWcqpjZ0lApPw0xF4ob/bJ2aHtCE=;
	b=mQDpPtr1DLcjYillbU9kh5ygfyBfkvF8EeS+0ut98nf91OYLNHoOdpmX50Xe8YDk6B
	4NNmy20i7NjKWXOhdjrLR7Csbsra37uP6SDuVJbzLjYxp11HxsyMwwott+SL7LXaf5T4
	l0s/F0t6/pEHejLKA3vrj8pjrrocwx6+2x58gLPfuBjCxr4o7DPsnvrEMWFJHiIH2iNQ
	qBdoQpgiIflTs+m8rp/oz2HDpkFlXMeB8lGvYYzBKXnzu/Mj2eb8GZ665DBb9hKxC9kO
	ILKeRsF9kiKK4Q871V5OkXaBVzZWeDWlSAsMjSDSi+L8nFLXcHJgrfNQU6WmJTgqSDSP
	U5lA==
X-Gm-Message-State: ABUngvfWuuKM19SOtj3f57eyyIqs0kWHPd/QzMFFfvNKb/NcJeO7XlkJtYmIH7Aq7sscTXB+Bo5oBi72uWehwQ==
X-Received: by 10.107.195.4 with SMTP id t4mr11521173iof.221.1477299999271;
	Mon, 24 Oct 2016 02:06:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.159.8 with HTTP; Mon, 24 Oct 2016 02:06:38 -0700 (PDT)
In-Reply-To: <1477033027-25315-1-git-send-email-anand.indukala@gmail.com>
References: <1477033027-25315-1-git-send-email-anand.indukala@gmail.com>
From: Anand J <anand.indukala@gmail.com>
Date: Mon, 24 Oct 2016 14:36:38 +0530
Message-ID: <CANDALvnZf-WwPC7uszq376s0Q8Mv9_wDcREsB7VxNdJQS7GJ5g@mail.gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>, 
	Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary=94eb2c1885deaef1cd053f98b510
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 0/2] Script changes to
 find duplicate #include entries
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
X-List-Received-Date: Mon, 24 Oct 2016 09:06:49 -0000

--94eb2c1885deaef1cd053f98b510
Content-Type: text/plain; charset=UTF-8

ping

On Fri, Oct 21, 2016 at 12:27 PM, Anand J <anand.indukala@gmail.com> wrote:

> There were some files in the code base with multiple inclusion of the same
> header files.
> Following changes are made to mitigate this issue.
>
>  1) --check-dup-head option is added to the scripts/clean-includes to
> search files and
>     find out such entries. This will help to catch redundant #includes in
> the future.
>  2) Removed most of the duplicate entries currently present in the code
> base using the
>     script.
>
> Anand J (2):
>   scripts/clean-includes: added duplicate #include check
>   clean-up: removed duplicate #includes
>
>  accel.c                             |  1 -
>  cputlb.c                            |  1 -
>  gdbstub.c                           |  1 -
>  hw/i386/acpi-build.c                |  1 -
>  hw/microblaze/boot.c                |  1 -
>  hw/mips/mips_malta.c                |  1 -
>  hw/nvram/fw_cfg.c                   |  1 -
>  hw/pci-bridge/pci_expander_bridge.c |  1 -
>  hw/ppc/ppc405_boards.c              |  1 -
>  hw/ppc/spapr.c                      |  1 -
>  hw/timer/grlib_gptimer.c            |  1 -
>  hw/tpm/tpm_tis.c                    |  1 -
>  hw/unicore32/puv3.c                 |  1 -
>  hw/usb/dev-mtp.c                    |  1 -
>  include/hw/i386/pc.h                |  1 -
>  monitor.c                           |  2 --
>  qemu-io-cmds.c                      |  1 -
>  qmp.c                               |  1 -
>  scripts/clean-includes              | 56 +++++++++++++++++++++++++++---
> -------
>  target-i386/machine.c               |  3 --
>  target-mips/machine.c               |  1 -
>  target-ppc/machine.c                |  1 -
>  target-ppc/mem_helper.c             |  1 -
>  target-sparc/machine.c              |  3 --
>  target-xtensa/translate.c           |  1 -
>  tests/crypto-tls-x509-helpers.h     |  3 --
>  tests/vhost-user-test.c             |  2 --
>  util/oslib-posix.c                  |  1 -
>  vl.c                                |  1 -
>  29 files changed, 42 insertions(+), 50 deletions(-)
>
> --
> 2.7.4
>
>

--94eb2c1885deaef1cd053f98b510
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+cGluZzxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPk9uIEZyaSwgT2N0IDIxLCAyMDE2IGF0IDEyOjI3IFBNLCBBbmFuZCBK
IDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOmFuYW5kLmluZHVrYWxhQGdtYWls
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmFuYW5kLmluZHVrYWxhQGdtYWlsLmNvbTwvYT4mZ3Q7PC9z
cGFuPiB3cm90ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFy
Z2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFl
eCI+VGhlcmUgd2VyZSBzb21lIGZpbGVzIGluIHRoZSBjb2RlIGJhc2Ugd2l0aCBtdWx0aXBsZSBp
bmNsdXNpb24gb2YgdGhlIHNhbWUgaGVhZGVyIGZpbGVzLjxicj4NCkZvbGxvd2luZyBjaGFuZ2Vz
IGFyZSBtYWRlIHRvIG1pdGlnYXRlIHRoaXMgaXNzdWUuPGJyPg0KPGJyPg0KwqAxKSAtLWNoZWNr
LWR1cC1oZWFkIG9wdGlvbiBpcyBhZGRlZCB0byB0aGUgc2NyaXB0cy9jbGVhbi1pbmNsdWRlcyB0
byBzZWFyY2ggZmlsZXMgYW5kPGJyPg0KwqAgwqAgZmluZCBvdXQgc3VjaCBlbnRyaWVzLiBUaGlz
IHdpbGwgaGVscCB0byBjYXRjaCByZWR1bmRhbnQgI2luY2x1ZGVzIGluIHRoZSBmdXR1cmUuPGJy
Pg0KwqAyKSBSZW1vdmVkIG1vc3Qgb2YgdGhlIGR1cGxpY2F0ZSBlbnRyaWVzIGN1cnJlbnRseSBw
cmVzZW50IGluIHRoZSBjb2RlIGJhc2UgdXNpbmcgdGhlPGJyPg0KwqAgwqAgc2NyaXB0Ljxicj4N
Cjxicj4NCkFuYW5kIEogKDIpOjxicj4NCsKgIHNjcmlwdHMvY2xlYW4taW5jbHVkZXM6IGFkZGVk
IGR1cGxpY2F0ZSAjaW5jbHVkZSBjaGVjazxicj4NCsKgIGNsZWFuLXVwOiByZW1vdmVkIGR1cGxp
Y2F0ZSAjaW5jbHVkZXM8YnI+DQo8YnI+DQrCoGFjY2VsLmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCAxIC08YnI+DQrCoGNwdXRsYi5jwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDEgLTxicj4NCsKgZ2Ric3R1Yi5jwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgMSAtPGJyPg0KwqBody9p
Mzg2L2FjcGktYnVpbGQuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCAxIC08YnI+DQrCoGh3
L21pY3JvYmxhemUvYm9vdC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDEgLTxicj4NCsKg
aHcvbWlwcy9taXBzX21hbHRhLmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgMSAtPGJyPg0K
wqBody9udnJhbS9md19jZmcuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIDEgLTxi
cj4NCsKgaHcvcGNpLWJyaWRnZS9wY2lfZXhwYW5kZXJfPHdicj5icmlkZ2UuYyB8wqAgMSAtPGJy
Pg0KwqBody9wcGMvcHBjNDA1X2JvYXJkcy5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDEgLTxi
cj4NCsKgaHcvcHBjL3NwYXByLmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAg
MSAtPGJyPg0KwqBody90aW1lci9ncmxpYl9ncHRpbWVyLmPCoCDCoCDCoCDCoCDCoCDCoCB8wqAg
MSAtPGJyPg0KwqBody90cG0vdHBtX3Rpcy5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
fMKgIDEgLTxicj4NCsKgaHcvdW5pY29yZTMyL3B1djMuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfMKgIDEgLTxicj4NCsKgaHcvdXNiL2Rldi1tdHAuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHzCoCAxIC08YnI+DQrCoGluY2x1ZGUvaHcvaTM4Ni9wYy5owqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgfMKgIDEgLTxicj4NCsKgbW9uaXRvci5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB8wqAgMiAtLTxicj4NCsKgcWVtdS1pby1jbWRzLmPCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgMSAtPGJyPg0KwqBxbXAuY8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIDEgLTxicj4NCsKgc2NyaXB0cy9j
bGVhbi1pbmNsdWRlc8KgIMKgIMKgIMKgIMKgIMKgIMKgIHwgNTYgKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tPHdicj4tLS0tLS0tPGJyPg0KwqB0YXJnZXQtaTM4Ni9tYWNoaW5lLmPCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHzCoCAzIC0tPGJyPg0KwqB0YXJnZXQtbWlwcy9tYWNoaW5lLmPC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCAxIC08YnI+DQrCoHRhcmdldC1wcGMvbWFjaGluZS5j
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDEgLTxicj4NCsKgdGFyZ2V0LXBwYy9tZW1faGVs
cGVyLmPCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCAxIC08YnI+DQrCoHRhcmdldC1zcGFyYy9tYWNo
aW5lLmPCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgMyAtLTxicj4NCsKgdGFyZ2V0LXh0ZW5zYS90
cmFuc2xhdGUuY8KgIMKgIMKgIMKgIMKgIMKgfMKgIDEgLTxicj4NCsKgdGVzdHMvY3J5cHRvLXRs
cy14NTA5LWhlbHBlcnMuPHdicj5owqAgwqAgwqB8wqAgMyAtLTxicj4NCsKgdGVzdHMvdmhvc3Qt
dXNlci10ZXN0LmPCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCAyIC0tPGJyPg0KwqB1dGlsL29zbGli
LXBvc2l4LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgMSAtPGJyPg0KwqB2bC5jwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDEgLTxicj4N
CsKgMjkgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgNTAgZGVsZXRpb25zKC0pPGJy
Pg0KPHNwYW4gY2xhc3M9IkhPRW5aYiI+PGZvbnQgY29sb3I9IiM4ODg4ODgiPjxicj4NCi0tPGJy
Pg0KMi43LjQ8YnI+DQo8YnI+DQo8L2ZvbnQ+PC9zcGFuPjwvYmxvY2txdW90ZT48L2Rpdj48YnI+
PC9kaXY+PC9kaXY+DQo=
--94eb2c1885deaef1cd053f98b510--

