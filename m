Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YIHvF-0006LJ-ML
	for mharc-qemu-trivial@gnu.org; Mon, 02 Feb 2015 09:24:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YIHvD-0006Gx-5z
	for qemu-trivial@nongnu.org; Mon, 02 Feb 2015 09:24:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YIHv8-0006mz-CC
	for qemu-trivial@nongnu.org; Mon, 02 Feb 2015 09:24:15 -0500
Received: from mail-la0-f45.google.com ([209.85.215.45]:40717)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YIHv8-0006mn-5Q
	for qemu-trivial@nongnu.org; Mon, 02 Feb 2015 09:24:10 -0500
Received: by mail-la0-f45.google.com with SMTP id gd6so41138552lab.4
	for <qemu-trivial@nongnu.org>; Mon, 02 Feb 2015 06:24:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5pzS4qFzw2SBoEBhdkWGKkVJ77DGUSfeE7BUUkoOYko=;
	b=Rp3iwXUy6EWcPilILocGWVAwOWlH1f/EcwEn6gA4N7eaZgYjkaCmU0QSzjwnmzOmyz
	dq/csGJoTcjv4aC2jiRkwuZxqU4MZSPuL/V1kZtoqhUy6uuttcv1bXMUDK+HvlQ7SCFe
	zZCBfvfV2MGC/+hRgSMHCF4VFxxOYuvm9ytdll0/cIQYnfea5inFJacUHjEwKB4wcNIo
	nDAE2yn4zNWoYKE7rQOQf6dUtxRXRaX2TaRrK6Ftc2qde8Ljs6kylSOR43e6YLEJ2yUM
	edl42ArXE2AMs7rPziMuTlyidljfJdo1E+4a2G38Zgf6duqf7OPT+Tt0DoNqOqhMNFks
	+c1Q==
X-Gm-Message-State: ALoCoQm5QwxA7oTIphq9oKtsw4a3QbmQ8DwxPF2VbTzwycW7Cfk6KGyj8MAhh00UG1dj5JNcTcjJ
X-Received: by 10.152.8.71 with SMTP id p7mr19517219laa.89.1422887049339; Mon,
	02 Feb 2015 06:24:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.141.97 with HTTP; Mon, 2 Feb 2015 06:23:48 -0800 (PST)
In-Reply-To: <54CF33FD.5020003@partner.samsung.com>
References: <54CF336A.7080205@partner.samsung.com>
	<54CF33FD.5020003@partner.samsung.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Feb 2015 14:23:48 +0000
Message-ID: <CAFEAcA8fz+Dy3DGSWX3xne+k=egx=PznB0STrGGtbYGT0D=CPQ@mail.gmail.com>
To: Maxim Ostapenko <m.ostapenko@partner.samsung.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.45
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
X-List-Received-Date: Mon, 02 Feb 2015 14:24:16 -0000

On 2 February 2015 at 08:23, Maxim Ostapenko
<m.ostapenko@partner.samsung.com> wrote:
> Sorry, missed ML.

You missed qemu-devel as well :-)

> On 02/02/2015 12:20 PM, Maxim Ostapenko wrote:
>>
>> Hi,
>>
>> this patch fixes https://bugs.launchpad.net/qemu/+bug/1416988.
>>
>> There is a small ABI incompatibility between Qemu-aarch64 and Linux Kernel
>> 3.19 caused by wrong size of struct target_siginfo in Qemu. This tiny patch
>> fixes the issue.
>>
>> -Maxim
>>
>> From 1d662e325d004bce2d640cfea5b337c92c7feca2 Mon Sep 17 00:00:00 2001
>> From: Max Ostapenko <m.ostapenko@partner.samsung.com>
>> Date: Mon, 2 Feb 2015 12:03:20 +0400
>> Subject: [PATCH] linux-user: wrong TARGET_SI_PAD_SIZE value for some
>> targets.
>>
>> Fix TARGET_SI_PAD_SIZE for S390X, SPARC, ALPHA and AARCH64 to correspond
>> Linux Kernel 3.19 c59c961ca511dc7ee2f4f7e9c224d16f5c76ca6e revision.

Thanks for this patch. I'm afraid that to apply it we need a
Signed-off-by: line from you that certifies that you're OK to
contribute it. (This is the same as Linux kernel patches; see
the "Patch emails must include a Signed-off-by: line" section in
http://wiki.qemu.org/Contribute/SubmitAPatch ).

>> ---
>>  linux-user/syscall_defs.h | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
>> index ebb3be1..b95a0b2 100644
>> --- a/linux-user/syscall_defs.h
>> +++ b/linux-user/syscall_defs.h
>> @@ -655,7 +655,12 @@ typedef struct {
>>  #endif
>>
>>  #define TARGET_SI_MAX_SIZE    128
>> +#if defined(TARGET_S390X) || defined(TARGET_SPARC) \
>> +   || defined(TARGET_ALPHA) || defined(TARGET_AARCH64)

I don't think this ifdef is correct. For instance for sparc
the kernel defines things differently for 32 and 64 bit.

In fact as far as I can tell for all architectures the
kernel defines __ARCH_SI_PREAMBLE_SIZE to (4 * sizeof(int))
for 64 bit and (3 * sizeof(int)) for 32 bit.

>> +#define TARGET_SI_PAD_SIZE    ((TARGET_SI_MAX_SIZE/sizeof(int)) - 4)
>> +#else
>>  #define TARGET_SI_PAD_SIZE    ((TARGET_SI_MAX_SIZE/sizeof(int)) - 3)
>> +#endif

So I would suggest

#if TARGET_ABI_BITS == 32
#define TARGET_SI_PREAMBLE_SIZE (3 * sizeof(int))
#else
#define TARGET_SI_PREAMBLE_SIZE (4 * sizeof(int))
#endif

#define TARGET_SI_PAD_SIZE ((TARGET_SI_MAX_SIZE -
TARGET_SI_PREAMBLE_SIZE) / sizeof(int))

which should give us the correct answer for all archs and
configurations (including I think the 32-bit-on-64-bit
setups like sparc32plus). It also rephrases the
calculation to match what the kernel uses.

thanks
-- PMM

