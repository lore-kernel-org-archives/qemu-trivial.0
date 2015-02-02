Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YIIMs-0000b6-2q
	for mharc-qemu-trivial@gnu.org; Mon, 02 Feb 2015 09:52:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <m.ostapenko@partner.samsung.com>) id 1YIIMm-0000Vs-Bn
	for qemu-trivial@nongnu.org; Mon, 02 Feb 2015 09:52:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <m.ostapenko@partner.samsung.com>) id 1YIIMj-000066-Iz
	for qemu-trivial@nongnu.org; Mon, 02 Feb 2015 09:52:43 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:60199)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <m.ostapenko@partner.samsung.com>)
	id 1YIIMe-0008W4-IG; Mon, 02 Feb 2015 09:52:36 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
	by mailout1.w1.samsung.com
	(Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit
	(built Nov
	17 2011)) with ESMTP id <0NJ5008Q2G6GWO50@mailout1.w1.samsung.com>; Mon,
	02 Feb 2015 14:56:40 +0000 (GMT)
X-AuditID: cbfec7f4-b7f126d000001e9a-fc-54cf8ea01d93
Received: from eusync3.samsung.com ( [203.254.199.213])
	by eucpsbgm1.samsung.com (EUCPMTA) with SMTP id CF.56.07834.0AE8FC45;
	Mon, 02 Feb 2015 14:50:08 +0000 (GMT)
Received: from [106.109.130.26] by eusync3.samsung.com
	(Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit
	(built Aug
	10 2011)) with ESMTPA id <0NJ500E3QFZKWL90@eusync3.samsung.com>; Mon,
	02 Feb 2015 14:52:33 +0000 (GMT)
Message-id: <54CF811A.1020405@partner.samsung.com>
Date: Mon, 02 Feb 2015 17:52:26 +0400
From: Maxim Ostapenko <m.ostapenko@partner.samsung.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:24.0) Gecko/20100101
	Thunderbird/24.1.0
MIME-version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <54CF336A.7080205@partner.samsung.com>
	<54CF33FD.5020003@partner.samsung.com>
	<CAFEAcA8fz+Dy3DGSWX3xne+k=egx=PznB0STrGGtbYGT0D=CPQ@mail.gmail.com>
In-reply-to: <CAFEAcA8fz+Dy3DGSWX3xne+k=egx=PznB0STrGGtbYGT0D=CPQ@mail.gmail.com>
Content-type: text/plain; charset=UTF-8; format=flowed
Content-transfer-encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGLMWRmVeSWpSXmKPExsVy+t/xq7oL+s6HGOx5qGIx58wDFovjvTtY
	LNaemctqcXLDJTaLk9t2sFoc+ryYyYHN4/DXhSwed67tYfN4cm0zk0ffllWMASxRXDYpqTmZ
	ZalF+nYJXBlvth9gK+hUqJhwoZOpgfGUVBcjB4eEgInEvJWMXYycQKaYxIV769m6GLk4hASW
	Mkos+nWNCcL5xChx9+dGsCpeASOJdw/6wWwWAVWJ/20NTCA2m4C5xIzVi9hBbFGBCImjq5+x
	QtQLSvyYfI8FxBYR0JG4cn0z2FBmgWOMEtMPzAJrFhbIkDhyt4sRYtsiRokFd04ygyQ4BYIl
	Dp66B1bELGAm8ahlHTOELS+xec1b5gmMArOQLJmFpGwWkrIFjMyrGEVTS5MLipPScw31ihNz
	i0vz0vWS83M3MULC+ssOxsXHrA4xCnAwKvHwPuA+FyLEmlhWXJl7iFGCg1lJhFfD4nyIEG9K
	YmVValF+fFFpTmrxIUYmDk6pBsbA5hvZD7irtWzN5zyf32F62Ewhvopf71/3ylPqHdMzeasf
	vI+utTq6ovFwAcfBt5NDzp6bqrpnwqLpKpElbdus93iwnm7Tfmf8rrT6S52XJqPw/dBvLM7G
	ydwf5pz/vkh0QaZRA9/yXps7iV83W3IoJeRbeT9NsJxcqdn2RZUrvHxOt9HB00osxRmJhlrM
	RcWJAJy8S2FJAgAA
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 210.118.77.11
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Slava Garbuzov <v.garbuzov@samsung.com>, Riku Voipio <riku.voipio@iki.fi>,
	Yury Gribov <y.gribov@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Fix ABI incompatibility between
 Qemu-aarch64 and Linux Kernel in signal handling.
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
X-List-Received-Date: Mon, 02 Feb 2015 14:52:45 -0000

Peter,

thank you for review and sorry for sign. I've updated the patch, is it 
ok now?

 From 5b035df58f9f17e64b35311b6b5f55097c7f8ce1 Mon Sep 17 00:00:00 2001
From: Max Ostapenko <m.ostapenko@partner.samsung.com>
Date: Mon, 2 Feb 2015 12:03:20 +0400
Subject: [PATCH] linux-user: wrong TARGET_SI_PAD_SIZE value for some 
targets.

Fix TARGET_SI_PAD_SIZE for S390X, SPARC, ALPHA and AARCH64 according to
Linux Kernel 3.19 c59c961ca511dc7ee2f4f7e9c224d16f5c76ca6e revision.
---
  linux-user/syscall_defs.h | 9 ++++++++-
  1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index ebb3be1..9ed6de8 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -655,7 +655,14 @@ typedef struct {
  #endif

  #define TARGET_SI_MAX_SIZE     128
-#define TARGET_SI_PAD_SIZE     ((TARGET_SI_MAX_SIZE/sizeof(int)) - 3)
+
+#if TARGET_ABI_BITS == 32
+#define TARGET_SI_PREAMBLE_SIZE (3 * sizeof(int))
+#else
+#define TARGET_SI_PREAMBLE_SIZE (4 * sizeof(int))
+#endif
+
+#define TARGET_SI_PAD_SIZE ((TARGET_SI_MAX_SIZE - 
TARGET_SI_PREAMBLE_SIZE) / sizeof(int))

  typedef struct target_siginfo {
  #ifdef TARGET_MIPS
-- 
Signed-off-by: Maxim Ostapenko <m.ostapenko@partner.samsung.com>
1.8.5.2.2930.gf745acb

-Maxim
On 02/02/2015 06:23 PM, Peter Maydell wrote:
> On 2 February 2015 at 08:23, Maxim Ostapenko
> <m.ostapenko@partner.samsung.com> wrote:
>> Sorry, missed ML.
> You missed qemu-devel as well :-)
>
>> On 02/02/2015 12:20 PM, Maxim Ostapenko wrote:
>>> Hi,
>>>
>>> this patch fixes https://bugs.launchpad.net/qemu/+bug/1416988.
>>>
>>> There is a small ABI incompatibility between Qemu-aarch64 and Linux Kernel
>>> 3.19 caused by wrong size of struct target_siginfo in Qemu. This tiny patch
>>> fixes the issue.
>>>
>>> -Maxim
>>>
>>>  From 1d662e325d004bce2d640cfea5b337c92c7feca2 Mon Sep 17 00:00:00 2001
>>> From: Max Ostapenko <m.ostapenko@partner.samsung.com>
>>> Date: Mon, 2 Feb 2015 12:03:20 +0400
>>> Subject: [PATCH] linux-user: wrong TARGET_SI_PAD_SIZE value for some
>>> targets.
>>>
>>> Fix TARGET_SI_PAD_SIZE for S390X, SPARC, ALPHA and AARCH64 to correspond
>>> Linux Kernel 3.19 c59c961ca511dc7ee2f4f7e9c224d16f5c76ca6e revision.
> Thanks for this patch. I'm afraid that to apply it we need a
> Signed-off-by: line from you that certifies that you're OK to
> contribute it. (This is the same as Linux kernel patches; see
> the "Patch emails must include a Signed-off-by: line" section in
> http://wiki.qemu.org/Contribute/SubmitAPatch ).
>
>>> ---
>>>   linux-user/syscall_defs.h | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
>>> index ebb3be1..b95a0b2 100644
>>> --- a/linux-user/syscall_defs.h
>>> +++ b/linux-user/syscall_defs.h
>>> @@ -655,7 +655,12 @@ typedef struct {
>>>   #endif
>>>
>>>   #define TARGET_SI_MAX_SIZE    128
>>> +#if defined(TARGET_S390X) || defined(TARGET_SPARC) \
>>> +   || defined(TARGET_ALPHA) || defined(TARGET_AARCH64)
> I don't think this ifdef is correct. For instance for sparc
> the kernel defines things differently for 32 and 64 bit.
>
> In fact as far as I can tell for all architectures the
> kernel defines __ARCH_SI_PREAMBLE_SIZE to (4 * sizeof(int))
> for 64 bit and (3 * sizeof(int)) for 32 bit.
>
>>> +#define TARGET_SI_PAD_SIZE    ((TARGET_SI_MAX_SIZE/sizeof(int)) - 4)
>>> +#else
>>>   #define TARGET_SI_PAD_SIZE    ((TARGET_SI_MAX_SIZE/sizeof(int)) - 3)
>>> +#endif
> So I would suggest
>
> #if TARGET_ABI_BITS == 32
> #define TARGET_SI_PREAMBLE_SIZE (3 * sizeof(int))
> #else
> #define TARGET_SI_PREAMBLE_SIZE (4 * sizeof(int))
> #endif
>
> #define TARGET_SI_PAD_SIZE ((TARGET_SI_MAX_SIZE -
> TARGET_SI_PREAMBLE_SIZE) / sizeof(int))
>
> which should give us the correct answer for all archs and
> configurations (including I think the 32-bit-on-64-bit
> setups like sparc32plus). It also rephrases the
> calculation to match what the kernel uses.
>
> thanks
> -- PMM
>


