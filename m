Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTHGW-0004Fa-Oo
	for mharc-qemu-trivial@gnu.org; Tue, 09 Feb 2016 18:00:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aTHGT-00049V-EF
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 18:00:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aTHGS-0007vQ-5V
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 18:00:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44635)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aTHGL-0007ll-5q; Tue, 09 Feb 2016 18:00:01 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 4F8BC155DE;
	Tue,  9 Feb 2016 22:59:59 +0000 (UTC)
Received: from [10.10.51.89] (unused [10.10.51.89] (may be forged))
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u19MxvtD031449
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 9 Feb 2016 17:59:57 -0500
To: Shannon Zhao <zhaoshenglong@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<56B1A90E.3000506@msgid.tls.msk.ru>
	<CAFEAcA9RzHTZhZemvSGZ_Qpji+bu0=13wQJ0ThMbYhYdJ99w1A@mail.gmail.com>
	<56B22469.7040308@redhat.com> <56B2AD13.6030504@huawei.com>
	<56B2EB3E.2000908@redhat.com> <56B2F4E3.6010807@huawei.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <56BA6F6C.5000301@redhat.com>
Date: Tue, 9 Feb 2016 16:59:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <56B2F4E3.6010807@huawei.com>
Content-Type: multipart/mixed; boundary="------------030508020707040403010805"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH 1/1] arm: virt: change GPIO trigger
	interrupt to pulse
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
X-List-Received-Date: Tue, 09 Feb 2016 23:00:10 -0000

This is a multi-part message in MIME format.
--------------030508020707040403010805
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


On 02/04/2016 12:51 AM, Shannon Zhao wrote:
> 
> 
> On 2016/2/4 14:10, Wei Huang wrote:
>>
>> On 02/03/2016 07:44 PM, Shannon Zhao wrote:

<snip>

>> I reversed the order of edge pulling. The state is 1 according to printk
>> inside gpio_keys driver. However the reboot still failed with two
>> reboots (1 very early, 1 later).
>>
> Because to make the input work, it should call input_event twice I think.
> 
> input_event(input, type, button->code, 1) means the button pressed
> input_event(input, type, button->code, 0) means the button released
> 
> But We only see guest entering gpio_keys_gpio_report_event once.
> 
> My original purpose is like below:
> 
> call qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1) to make guest
> execute input_event(input, type, button->code, 1)
> call qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0) to make guest
> execute input_event(input, type, button->code, 0).
> 
> But even though it calls qemu_set_irq twice, it only calls pl061_update
> once in qemu.

Hi Shannon,

Assuming that we are talking about the special case you found (i.e. send
reboot very early and then send another one after guest VM fully
booted). Dug into the code further, here are my findings:

=== Why ACPI case failed? ===
QEMU pl061.c checks the current request against the new request (see
s->old_in_data ^ s->data in pl061.c file). If no change, nothing will
happen.

So two consecutive reboots will cause the following state change;
apparently the second request won't trigger VM reboot because
pl01_update() decides _not_ to inject IRQ into guest VM.

  (PL061State fields)           data   old_in_data   istate
VM boot                         0      0             0
1st ACPI reboot request         8      0             0
After VM PL061 driver ACK       8      8             0
2nd ACPI reboot request         8     no-change, no IRQ <==

To solve this problem, we have to invert PL061State->data at least once
to trigger IRQ inside VM. Two solutions:

S1: "Pulse"
static void virt_powerdown_req(Notifier *n, void *opaque)
{
    qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0);
    qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
}

S2: "Invert"
static int old_gpio_level = 0;
static void virt_powerdown_req(Notifier *n, void *opaque)
{
    /* use gpio Pin 3 for power button event */
    qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), !old_gpio_level);
    old_gpio_level = !old_gpio_level;
}

Both S1 and S2 works for ACPI. But S1 has problem with DT, which is
explained below.

=== Why DT fails with S1 ===
DT approach requires both PL061 and gpio-keys to work together. Looking
into guest kernel gpio-keys/input code, you will find that it only
reacts to both LEVEL-HI and input changes. Here is the code snip from
drivers/input/input.c file:

    /* auto-repeat bypasses state updates */
    if (value == 2) {
            disposition = INPUT_PASS_TO_HANDLERS;
            break;
    }

    if (!!test_bit(code, dev->key) != !!value) {
            __change_bit(code, dev->key);
            disposition = INPUT_PASS_TO_HANDLERS;
    }

Unless we adds gpio-keys DT property to "autorepeat", the
"!!test_bit(code, dev->key) != !!value" is always FALSE with S1. Thus
systemd won't receive any input event; and no power-switch will be
triggered.

In comparison S2 will work because value is changed very time.

=== Summary ===
1. Cleaning PL061 state is required. That means "[PATCH V2 1/2] ARM:
PL061: Clear PL061 device state after reset" is necessary.
2. S2 is better. To support S2, we needs to change GPIO IRQ polarity to
AML_ACTIVE_BOTH in ACPI description.

I attach a small patch in this email. It should work for your DT case.
Please test it and let me know your comments.

Thanks,
-Wei


> 

--------------030508020707040403010805
Content-Type: text/plain; charset=UTF-8;
 name="gpio-fix.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="gpio-fix.txt"

ZGlmZiAtLWdpdCBhL2h3L2FybS92aXJ0LWFjcGktYnVpbGQuYyBiL2h3L2FybS92aXJ0LWFj
cGktYnVpbGQuYwppbmRleCA3YjEyNGY2Li43YjFkYzVlIDEwMDY0NAotLS0gYS9ody9hcm0v
dmlydC1hY3BpLWJ1aWxkLmMKKysrIGIvaHcvYXJtL3ZpcnQtYWNwaS1idWlsZC5jCkBAIC0z
MjYsNyArMzI2LDcgQEAgc3RhdGljIHZvaWQgYWNwaV9kc2R0X2FkZF9ncGlvKEFtbCAqc2Nv
cGUsIGNvbnN0IE1lbU1hcEVudHJ5ICpncGlvX21lbW1hcCwKICAgICBBbWwgKmFlaSA9IGFt
bF9yZXNvdXJjZV90ZW1wbGF0ZSgpOwogICAgIC8qIFBpbiAzIGZvciBwb3dlciBidXR0b24g
Ki8KICAgICBjb25zdCB1aW50MzJfdCBwaW5fbGlzdFsxXSA9IHszfTsKLSAgICBhbWxfYXBw
ZW5kKGFlaSwgYW1sX2dwaW9faW50KEFNTF9DT05TVU1FUiwgQU1MX0VER0UsIEFNTF9BQ1RJ
VkVfSElHSCwKKyAgICBhbWxfYXBwZW5kKGFlaSwgYW1sX2dwaW9faW50KEFNTF9DT05TVU1F
UiwgQU1MX0VER0UsIDMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBTUxf
RVhDTFVTSVZFLCBBTUxfUFVMTF9VUCwgMCwgcGluX2xpc3QsIDEsCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiR1BPMCIsIE5VTEwsIDApKTsKICAgICBhbWxfYXBwZW5k
KGRldiwgYW1sX25hbWVfZGVjbCgiX0FFSSIsIGFlaSkpOwpkaWZmIC0tZ2l0IGEvaHcvYXJt
L3ZpcnQuYyBiL2h3L2FybS92aXJ0LmMKaW5kZXggNTY5NWU3Mi4uZWQwMmE2YyAxMDA2NDQK
LS0tIGEvaHcvYXJtL3ZpcnQuYworKysgYi9ody9hcm0vdmlydC5jCkBAIC01NDcsMTAgKzU0
NywxMiBAQCBzdGF0aWMgdm9pZCBjcmVhdGVfcnRjKGNvbnN0IFZpcnRCb2FyZEluZm8gKnZi
aSwgcWVtdV9pcnEgKnBpYykKIH0KIAogc3RhdGljIERldmljZVN0YXRlICpwbDA2MV9kZXY7
CitzdGF0aWMgaW50IG9sZF9ncGlvX2xldmVsID0gMDsKIHN0YXRpYyB2b2lkIHZpcnRfcG93
ZXJkb3duX3JlcShOb3RpZmllciAqbiwgdm9pZCAqb3BhcXVlKQogewogICAgIC8qIHVzZSBn
cGlvIFBpbiAzIGZvciBwb3dlciBidXR0b24gZXZlbnQgKi8KLSAgICBxZW11X3NldF9pcnEo
cWRldl9nZXRfZ3Bpb19pbihwbDA2MV9kZXYsIDMpLCAxKTsKKyAgICBxZW11X3NldF9pcnEo
cWRldl9nZXRfZ3Bpb19pbihwbDA2MV9kZXYsIDMpLCAhb2xkX2dwaW9fbGV2ZWwpOworICAg
IG9sZF9ncGlvX2xldmVsID0gIW9sZF9ncGlvX2xldmVsOwogfQogCiBzdGF0aWMgTm90aWZp
ZXIgdmlydF9zeXN0ZW1fcG93ZXJkb3duX25vdGlmaWVyID0gewo=
--------------030508020707040403010805--

