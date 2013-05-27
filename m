Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ugy8t-000546-1J
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 10:11:19 -0400
Received: from eggs.gnu.org ([208.118.235.92]:52692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Ugy8n-0004z5-F4
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 10:11:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Ugy8j-0005MB-Ni
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 10:11:13 -0400
Received: from mail-pb0-x234.google.com ([2607:f8b0:400e:c01::234]:33387)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Ugy8j-0005Ld-Ej
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 10:11:09 -0400
Received: by mail-pb0-f52.google.com with SMTP id um15so6830424pbc.11
	for <qemu-trivial@nongnu.org>; Mon, 27 May 2013 07:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=15XqdoVP7+8BckLyvo4IYOaX/1tgIWO68OKIqDuAOFk=;
	b=bnQnxWwFr3mzKwWlrjvvlof3B67EqvbIrnLLcmWnp5jIVR9npchae3I/7pxUDn9Fxs
	FfVUPLldSdt70tRFnhgtsoDd1RTZVV+LipgnPsatX0M3FQwbpHnfjGI2oFlkssApreAS
	DkbpHWP5uL43063muogG4mEYKQFH/GK+5xqoR+nw5shvhi2DtLKCnIg5+OWEE1/SOocH
	8gX0JzPN7DxEygQVSFptDoI5w+ZDdMgsfPVfHF8DOJWKeF8Hy3K0NNcsBriq1RX+DpsN
	dY16dFdDZK9+DKVkhJJ2KPCpEDdduD5YxzyFJh+PHAZY6EciUqbjw74HMQAKC9HA/4Mm
	Yj3g==
X-Received: by 10.66.49.104 with SMTP id t8mr27155260pan.65.1369663868489;
	Mon, 27 May 2013 07:11:08 -0700 (PDT)
Received: from aik.ozlabs.ibm.com (60-242-102-4.tpgi.com.au. [60.242.102.4])
	by mx.google.com with ESMTPSA id
	ue8sm30776259pac.14.2013.05.27.07.11.05 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 27 May 2013 07:11:07 -0700 (PDT)
Message-ID: <51A36976.80608@ozlabs.ru>
Date: Tue, 28 May 2013 00:11:02 +1000
From: Alexey Kardashevskiy <aik@ozlabs.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130402 Thunderbird/17.0.5
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1369635195-28279-1-git-send-email-aik@ozlabs.ru>
	<CAFEAcA_qOtFuVPem2mbK7TmM4rac-ZVmdn8HYRnkHPx5iiPSOg@mail.gmail.com>
In-Reply-To: <CAFEAcA_qOtFuVPem2mbK7TmM4rac-ZVmdn8HYRnkHPx5iiPSOg@mail.gmail.com>
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-Gm-Message-State: ALoCoQm4Qq7WxEAMWiaLQfEUSRSaO2aPYZJNsNKNFGCHP/zSVdDqVl+n60XitLYyb2FWDdu/b3WM
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::234
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu: fix out of tree cross
	compile
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
X-List-Received-Date: Mon, 27 May 2013 14:11:16 -0000

On 05/27/2013 08:24 PM, Peter Maydell wrote:
> On 27 May 2013 07:13, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>> QEMU uses headers from source directory, however the "asm" symlink was
>> created in the build directory what broke KVM stuff compilation.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>  configure |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configure b/configure
>> index 5ae7e4a..9c3c5e5 100755
>> --- a/configure
>> +++ b/configure
>> @@ -4135,7 +4135,7 @@ if test "$linux" = "yes" ; then
>>    esac
>>      # For non-KVM architectures we will not have asm headers
>>      if [ -e "$source_path/linux-headers/asm-$linux_arch" ]; then
>> -      symlink "$source_path/linux-headers/asm-$linux_arch" linux-headers/asm
>> +      symlink "$source_path/linux-headers/asm-$linux_arch" $source_path/linux-headers/asm
> 
> This is definitely wrong -- the asm symlink must be created
> in the build tree, because you could have two build trees
> which are building for different architectures and need
> different symlink targets. (More generally, an out of tree
> build should never create files in the source tree, because
> the point of out of tree builds is to leave the source tree
> in a pristine state.)

Ok, ok. Then I'll post another patch in a a response to this.

> What is the actual bug here? QEMU builds fine for me, because
> the build directory is also in the include path via "-I.".

Does you build directory beside inside the source tree directory? I cannot
see the other way for it to work. -I <blabla>/linux-headers must be added,
"-I." is not enough.

The actual bug is that it does not cross compile until I apply this or the
other patch.

This is how I run ./configure:
/home/alexey/pcipassthru/qemu-impreza/configure
--source-path=/home/alexey/pcipassthru/qemu-impreza
--target-list=ppc64-softmmu
--cpu=ppc64
--cross-prefix=powerpc64-linux-
--prefix=/home/alexey/pcipassthru/lib4qemu/install
--extra-ldflags=-L/home/alexey/pcipassthru/lib4qemu/usr/lib64
'--extra-cflags=--sysroot=/home/alexey/pcipassthru/lib4qemu/
-I/home/alexey/pcipassthru/lib4qemu/usr/include -D__EXCEPTIONS
-D__LONG_DOUBLE_128__ -D__NO_INLINE__ -Wno-redundant-decls
-Wno-missing-prototypes -Wmissing-include-dirs'
--disable-werror
--enable-fdt
--enable-attr
--enable-kvm
--enable-profiler
--disable-seccomp
--enable-trace-backend=stderr
--enable-debug
--disable-debug-tcg
--enable-debug-info

This is where the compilation fails on:
powerpc64-linux-gcc \
-I/home/alexey/pcipassthru/qemu-impreza/tcg
-I/home/alexey/pcipassthru/qemu-impreza/tcg/ppc64
-I/home/alexey/pcipassthru/qemu-impreza/linux-headers
-I.
-I/home/alexey/pcipassthru/qemu-impreza
-I/home/alexey/pcipassthru/qemu-impreza/include
-I/home/alexey/pcipassthru/qemu-impreza/target-ppc
-Itarget-ppc
-D_GNU_SOURCE
-D_FILE_OFFSET_BITS=64
-D_LARGEFILE_SOURCE
-Wstrict-prototypes
-Wredundant-decls -Wall
-Wundef
-Wwrite-strings
-Wmissing-prototypes
-fno-strict-aliasing
--sysroot=/home/alexey/pcipassthru/lib4qemu/
-I/home/alexey/pcipassthru/lib4qemu/usr/include
-D__EXCEPTIONS -D__LONG_DOUBLE_128__ -D__NO_INLINE__
-Wno-redundant-decls -Wno-missing-prototypes
-Wmissing-include-dirs  -Wendif-labels
-Wmissing-include-dirs -Wempty-body
-Wnested-externs -Wformat-security
-Wformat-y2k -Winit-self -Wignored-qualifiers
-Wold-style-declaration -Wold-style-definition
-Wtype-limits
-I/home/alexey/pcipassthru/lib4qemu/usr/include
-I/home/alexey/pcipassthru/lib4qemu/usr/include/p11-kit-1
-I/home/alexey/pcipassthru/lib4qemu/usr/include
-I/home/alexey/pcipassthru/lib4qemu/usr/include/libusb-1.0
-I/home/alexey/pcipassthru/lib4qemu/usr/include
-I/home/alexey/pcipassthru/lib4qemu/usr/include/pixman-1
-I../linux-headers
-I..
-I/home/alexey/pcipassthru/qemu-impreza/target-ppc
-DNEED_CPU_H
-I/home/alexey/pcipassthru/qemu-impreza/include
-pthread
-I/home/alexey/pcipassthru/lib4qemu/usr/include/glib-2.0
-I/home/alexey/pcipassthru/lib4qemu/usr/lib64/glib-2.0/include
-MMD -MP -MT target-ppc/kvm.o -MF target-ppc/kvm.d -g
-I/home/alexey/pcipassthru/lib4qemu/usr/include -c
-o target-ppc/kvm.o
/home/alexey/pcipassthru/qemu-impreza/target-ppc/kvm.c
/home/alexey/pcipassthru/qemu-impreza/hw/ppc/xics.c: In function
'icp_get_kvm_state':
/home/alexey/pcipassthru/qemu-impreza/hw/ppc/xics.c:186:15: error:
'KVM_REG_PPC_ICP_STATE' undeclared (first use in this function)
         .id = KVM_REG_PPC_ICP_STATE,
               ^
...




-- 
Alexey

