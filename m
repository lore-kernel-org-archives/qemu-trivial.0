Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aW7Tk-0008Qz-7O
	for mharc-qemu-trivial@gnu.org; Wed, 17 Feb 2016 14:09:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aW7Tf-0008Hp-A3
	for qemu-trivial@nongnu.org; Wed, 17 Feb 2016 14:09:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aW7Te-0003ti-0U
	for qemu-trivial@nongnu.org; Wed, 17 Feb 2016 14:09:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53099)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aW7TW-0003sY-BD; Wed, 17 Feb 2016 14:09:22 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 023A619D239;
	Wed, 17 Feb 2016 19:09:21 +0000 (UTC)
Received: from [10.10.52.181] (unused [10.10.52.181] (may be forged))
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1HJ9KM5025302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 17 Feb 2016 14:09:20 -0500
To: Peter Maydell <peter.maydell@linaro.org>
References: <1454359775-25959-1-git-send-email-wei@redhat.com>
	<CAFEAcA8czS_7Wxw1_s_khTL8eFNKcXixRrEYuEb4==_cYbdHbg@mail.gmail.com>
	<CAFEAcA8oUBe+mZ+2Lq0RO2eq_-H+atamp=gBCnxS2OWdkyza0w@mail.gmail.com>
	<56C4AF0D.9070803@redhat.com>
	<CAFEAcA-0+HLS4vgG3DqgUqsBNEt=J3M9Fy89uOtTQAtbt5noCQ@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <56C4C55F.2050006@redhat.com>
Date: Wed, 17 Feb 2016 13:09:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-0+HLS4vgG3DqgUqsBNEt=J3M9Fy89uOtTQAtbt5noCQ@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------030104090107070100010101"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH V2 1/2] ARM: PL061: Clear PL061 device
	state after reset
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
X-List-Received-Date: Wed, 17 Feb 2016 19:09:34 -0000

This is a multi-part message in MIME format.
--------------030104090107070100010101
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 02/17/2016 11:53 AM, Peter Maydell wrote:
> On 17 February 2016 at 17:34, Wei Huang <wei@redhat.com> wrote:
>> On 02/16/2016 08:39 AM, Peter Maydell wrote:
>>> Side note: half our "PL061" behaviour is actually specific
>>> to the TI variant in the Luminary, and for our plain old PL061
>>> we ought to restrict access to the registers that are Stellaris
>>> only. But that's a different bug and not a very major one.
>>
>> Thanks for your suggestion. I was trying to fix it. The plan was to add
>> a new field rsvd_addr in "struct PL061State". Then in pl061_read() and
>> pl061_write(), we can check offset against [rsvd_addr, 0xfcc] (ignored
>> if inside).
>>
>> While I was working on it, I realized that this is a benign issue. It is
>> true that PL061 device can access Luminary registers in the reserved
>> memory area. However QEMU doesn't use these Luminary registers anywhere
>> else other than pl061_read() and pl061_write(). It basically passes the
>> read/write requests through. I don't see a malicious driver can damage
>> device state. Thoughts?
> 
> It's not a "malicious guest can do bad things" bug, it's a "modelled
> hardware doesn't behave like the real thing" bug. A non-Luminary PL061
> should act like the hardware, which means that the registers that don't
> exist should be RAZ/WI (and should log guest-errors if the guest tries
> to access them), the same way we do in the "default" case of the
> case statements for other reserved registers.

How about the attached patch? I can write a new patch based on it, or
you prefer stashing it on top of V3 I just submitted?

Thanks,
-Wei

> 
> thanks
> -- PMM
> 

--------------030104090107070100010101
Content-Type: text/plain; charset=UTF-8;
 name="pl061_boundary_check.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="pl061_boundary_check.txt"

ZGlmZiAtLWdpdCBhL2h3L2dwaW8vcGwwNjEuYyBiL2h3L2dwaW8vcGwwNjEuYwppbmRleCA1
ZWNlOGIwLi4wM2E2MzUxIDEwMDY0NAotLS0gYS9ody9ncGlvL3BsMDYxLmMKKysrIGIvaHcv
Z3Bpby9wbDA2MS5jCkBAIC02MCw2ICs2MCw3IEBAIHR5cGVkZWYgc3RydWN0IFBMMDYxU3Rh
dGUgewogICAgIHFlbXVfaXJxIGlycTsKICAgICBxZW11X2lycSBvdXRbOF07CiAgICAgY29u
c3QgdW5zaWduZWQgY2hhciAqaWQ7CisgICAgdWludDMyX3QgcnN2ZF9zdGFydDsgLyogcmVz
ZXJ2ZWQgYXJlYTogW3JzdmRfc3RhcnQsIDB4ZmNjXSAqLwogfSBQTDA2MVN0YXRlOwogCiBz
dGF0aWMgY29uc3QgVk1TdGF0ZURlc2NyaXB0aW9uIHZtc3RhdGVfcGwwNjEgPSB7CkBAIC0x
NTgsNiArMTU5LDkgQEAgc3RhdGljIHVpbnQ2NF90IHBsMDYxX3JlYWQodm9pZCAqb3BhcXVl
LCBod2FkZHIgb2Zmc2V0LAogICAgIGlmIChvZmZzZXQgPCAweDQwMCkgewogICAgICAgICBy
ZXR1cm4gcy0+ZGF0YSAmIChvZmZzZXQgPj4gMik7CiAgICAgfQorICAgIGlmIChvZmZzZXQg
Pj0gcy0+cnN2ZF9zdGFydCAmJiBvZmZzZXQgPD0gMHhmY2MpIHsKKyAgICAgICAgZ290byBl
cnJfb3V0OworICAgIH0KICAgICBzd2l0Y2ggKG9mZnNldCkgewogICAgIGNhc2UgMHg0MDA6
IC8qIERpcmVjdGlvbiAqLwogICAgICAgICByZXR1cm4gcy0+ZGlyOwpAQCAtMTk4LDEwICsy
MDIsMTIgQEAgc3RhdGljIHVpbnQ2NF90IHBsMDYxX3JlYWQodm9pZCAqb3BhcXVlLCBod2Fk
ZHIgb2Zmc2V0LAogICAgIGNhc2UgMHg1Mjg6IC8qIEFuYWxvZyBtb2RlIHNlbGVjdCAqLwog
ICAgICAgICByZXR1cm4gcy0+YW1zZWw7CiAgICAgZGVmYXVsdDoKLSAgICAgICAgcWVtdV9s
b2dfbWFzayhMT0dfR1VFU1RfRVJST1IsCi0gICAgICAgICAgICAgICAgICAgICAgInBsMDYx
X3JlYWQ6IEJhZCBvZmZzZXQgJXhcbiIsIChpbnQpb2Zmc2V0KTsKLSAgICAgICAgcmV0dXJu
IDA7CisgICAgICAgIGJyZWFrOwogICAgIH0KK2Vycl9vdXQ6CisgICAgcWVtdV9sb2dfbWFz
ayhMT0dfR1VFU1RfRVJST1IsCisgICAgICAgICAgICAgICAgICAicGwwNjFfcmVhZDogQmFk
IG9mZnNldCAleFxuIiwgKGludClvZmZzZXQpOworICAgIHJldHVybiAwOyAgICAKIH0KIAog
c3RhdGljIHZvaWQgcGwwNjFfd3JpdGUodm9pZCAqb3BhcXVlLCBod2FkZHIgb2Zmc2V0LApA
QCAtMjE2LDYgKzIyMiw5IEBAIHN0YXRpYyB2b2lkIHBsMDYxX3dyaXRlKHZvaWQgKm9wYXF1
ZSwgaHdhZGRyIG9mZnNldCwKICAgICAgICAgcGwwNjFfdXBkYXRlKHMpOwogICAgICAgICBy
ZXR1cm47CiAgICAgfQorICAgIGlmIChvZmZzZXQgPj0gcy0+cnN2ZF9zdGFydCAmJiBvZmZz
ZXQgPD0gMHhmY2MpIHsKKyAgICAgICAgZ290byBlcnJfb3V0OworICAgIH0KICAgICBzd2l0
Y2ggKG9mZnNldCkgewogICAgIGNhc2UgMHg0MDA6IC8qIERpcmVjdGlvbiAqLwogICAgICAg
ICBzLT5kaXIgPSB2YWx1ZSAmIDB4ZmY7CkBAIC0yNzQsMTAgKzI4MywxNCBAQCBzdGF0aWMg
dm9pZCBwbDA2MV93cml0ZSh2b2lkICpvcGFxdWUsIGh3YWRkciBvZmZzZXQsCiAgICAgICAg
IHMtPmFtc2VsID0gdmFsdWUgJiAweGZmOwogICAgICAgICBicmVhazsKICAgICBkZWZhdWx0
OgotICAgICAgICBxZW11X2xvZ19tYXNrKExPR19HVUVTVF9FUlJPUiwKLSAgICAgICAgICAg
ICAgICAgICAgICAicGwwNjFfd3JpdGU6IEJhZCBvZmZzZXQgJXhcbiIsIChpbnQpb2Zmc2V0
KTsKKyAgICAgICAgZ290byBlcnJfb3V0OwogICAgIH0KICAgICBwbDA2MV91cGRhdGUocyk7
CisgICAgcmV0dXJuOworCitlcnJfb3V0OgorICAgIHFlbXVfbG9nX21hc2soTE9HX0dVRVNU
X0VSUk9SLAorICAgICAgICAgICAgICAgICAgInBsMDYxX3dyaXRlOiBCYWQgb2Zmc2V0ICV4
XG4iLCAoaW50KW9mZnNldCk7CiB9CiAKIHN0YXRpYyB2b2lkIHBsMDYxX3Jlc2V0KERldmlj
ZVN0YXRlICpkZXYpCkBAIC0zNDcsNiArMzYwLDcgQEAgc3RhdGljIHZvaWQgcGwwNjFfbHVt
aW5hcnlfaW5pdChPYmplY3QgKm9iaikKICAgICBQTDA2MVN0YXRlICpzID0gUEwwNjEob2Jq
KTsKIAogICAgIHMtPmlkID0gcGwwNjFfaWRfbHVtaW5hcnk7CisgICAgcy0+cnN2ZF9zdGFy
dCA9IDB4NTJjOwogfQogCiBzdGF0aWMgdm9pZCBwbDA2MV9pbml0KE9iamVjdCAqb2JqKQpA
QCAtMzU0LDYgKzM2OCw3IEBAIHN0YXRpYyB2b2lkIHBsMDYxX2luaXQoT2JqZWN0ICpvYmop
CiAgICAgUEwwNjFTdGF0ZSAqcyA9IFBMMDYxKG9iaik7CiAKICAgICBzLT5pZCA9IHBsMDYx
X2lkOworICAgIHMtPnJzdmRfc3RhcnQgPSAweDQyNDsKIH0KIAogc3RhdGljIHZvaWQgcGww
NjFfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqa2xhc3MsIHZvaWQgKmRhdGEpCg==
--------------030104090107070100010101--

