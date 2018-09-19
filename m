Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g2ZkQ-00077E-W7
	for mharc-qemu-trivial@gnu.org; Wed, 19 Sep 2018 06:30:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g2ZkP-000772-3P
	for qemu-trivial@nongnu.org; Wed, 19 Sep 2018 06:30:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g2ZkL-0003lP-LN
	for qemu-trivial@nongnu.org; Wed, 19 Sep 2018 06:30:17 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42871)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g2ZkL-0003f6-Da; Wed, 19 Sep 2018 06:30:13 -0400
Received: by mail-wr1-x444.google.com with SMTP id v17-v6so5215972wrr.9;
	Wed, 19 Sep 2018 03:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Iz4idnKjczHFYB/lUMbvg2QcE40UoG0D98P+6QO4j7E=;
	b=Ob5WKiiYAT9/lAW1YhvdtUGM5wB9+3QTD09MYJMHmZ0fiZoWICGvCAxHQB3iXjqank
	KRVPcz0py8tH2crjxCQbQbjd1Wz9Fb4gJb41UMV6OCyYG2chpM4EgqGZgkyzNJGLyWoz
	NCslB1btKQ5onnNa9x9wx5ETdXJwL1P6AkhyOdsTtUTIZnfI4LQoVIgTwBwXx39XrnWy
	YIhEHzx+vlWPWfG7zmy8KDD6vpHVauy9ducHn2VqTLvFWqSK1ve/xPgCieBPzQjwuep0
	qwqCqck+0/g2wHA5N8IrZEkXN3rzlEhv2UDW3gp+Zjnm3B5K+mrLns54lUU1GBjYyIu4
	7/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Iz4idnKjczHFYB/lUMbvg2QcE40UoG0D98P+6QO4j7E=;
	b=Fux/mkJZWgPNFe2NC73OhNArbCH4DDgJz+PAf4twoa5jeF6pzRJ9uUUG5S35BrEFBQ
	Yut6INfsaNMITvx9l0pDg8W3f3a7UNevhG/H2toLH1Tl6TuGU7wL3jWJenUF1uSzxjSz
	gOb8NmI0qWnES7nUbeUZ3c/socJ/riJ6ccd9MKTrnvcLyBsZLXTf/x85w2Ntq8dZyLBy
	9JLhpgk84daSvftZQwCqgfni4O/UhokJ0OLuqd5g7ZC6HCrqAlOD/O0d7dT4EyJNQS7h
	z9qbmt9GP2NYRqMBSmq0Um+JNFXqPtGLLC/emZ12MQN1GlwVDcSR/9xc3qtZnyogWfPA
	p5gw==
X-Gm-Message-State: APzg51AuXDFzr8egLCxK9dzwLBv2Zb85hlEP5GBmTNiGww98jkkz9ENN
	K7i66RUOZN5xkUdLnV4ze4hqj/VT
X-Google-Smtp-Source: ANB0VdZiDlumwgoqoErgd6SR78MtlACiu6UFEh6iYwR7kkJn5fsot2lXz1TZwgdxVMBc7i86XCtVQA==
X-Received: by 2002:adf:b726:: with SMTP id
	l38-v6mr25223869wre.115.1537353012335; 
	Wed, 19 Sep 2018 03:30:12 -0700 (PDT)
Received: from [192.168.2.36] (106.red-88-7-90.staticip.rima-tde.net.
	[88.7.90.106]) by smtp.gmail.com with ESMTPSA id
	j133-v6sm7879465wmd.12.2018.09.19.03.30.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Sep 2018 03:30:11 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>, 
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180918092824.10532-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBAgA/AhsPBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJbkphvBQkm
	loU1AAoJEOPjLCzercDeTLIP/3pzTBotxvkddIREaw2j/6RoxN1lj5hnCx/XHGF7QxAlO4uV
	7eB6hcZxAqlt4AyNX5jcsSxNMfVNGnZ+u4ni6VdRRLUOw/QPXKGV8siK2E1zOG1GwZSCJ5zb
	ol7gpXNnOG/+ZXDfvkfSNnpim0ahNIPX8WAaZ/qN7I1qsPGupK2JrlCot561TfIOT7KNZFAZ
	m66Hf8MeNr8HQtn+oDk6j7g6WuIYZiqvF1MladikIZXndDMCsopXsjOikMXtoVuC/df7BlwS
	UaM+DT47onbIfXOtsWQGd2dJhu07Kxphqlz1Uh3YA7IHsFzZkX+S9waPBEzC8YB39dkZKA2E
	XbObk/ZTtCBLb39KTN2L7bv3Agm6wYO/hw3DQJQV3/07vW1EJd4fglQB5IY2A3eQ/ZSuRVm1
	E1GyFszjLXKUQIKx1938zoLrUDDdWQH7bhhSvG7JWk1BKmJrIXDTDx1tvTOW2pYZuO1PNx+p
	EhJraVuu3jtSbEfH+uPeoWtJtqSRkz1fLqp+dbha24ldPeKw4ija/YTviOem5baUlf/iNgS+
	a0s0eoRiJFrGZFCKLGKgZYoJe1rccQR6JKKd8JpoaIQuzptcHZD4+qn8W8FUlkNWGfpTQrsN
	iPLZt2EFOFkbjoZ2EoEByCs9nZ8ro91+lq7QfH9RFcldKLZfPEWwHPrchQ42
Message-ID: <c2e21ce8-f616-eef2-55d5-58b6e5d2047e@amsat.org>
Date: Wed, 19 Sep 2018 12:30:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180918092824.10532-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-trivial] [PATCH] hvf: drop unused variable
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
X-List-Received-Date: Wed, 19 Sep 2018 10:30:18 -0000

On 9/18/18 11:28 AM, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  target/i386/hvf/hvf.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index 5db167df98..9f52bc413a 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -72,7 +72,6 @@
>  #include "sysemu/sysemu.h"
>  #include "target/i386/cpu.h"
>  
> -pthread_rwlock_t mem_lock = PTHREAD_RWLOCK_INITIALIZER;
>  HVFState *hvf_state;
>  int hvf_disabled = 1;

I'm surprised we never got a warning for this...
We do use:

  -Wunused-but-set-variable
    Warn whenever a local variable is assigned to, but otherwise
    unused (aside from its declaration).  This warning is enabled
    by -Wall.

Last Travis CI build: https://travis-ci.org/qemu/qemu/jobs/429242442

ProductName:	Mac OS X
ProductVersion:	10.13.3
BuildVersion:	17D102

Target: x86_64-apple-darwin17.4.0
Thread model: posix

$ ./configure
...
KVM support       no
HAX support       yes
HVF support       yes
WHPX support      no
TCG support       yes

C compiler        clang
LDFLAGS           -framework Hypervisor -m64 -framework CoreFoundation
-framework IOKit -arch x86_64 -g
CFLAGS            -O2 -g
QEMU_CFLAGS       -I/usr/local/Cellar/pixman/0.34.0_1/include/pixman-1
-I$(SRC_PATH)/dtc/libfdt -D_REENTRANT
-I/usr/local/Cellar/glib/2.58.0_1/include/glib-2.0
-I/usr/local/Cellar/glib/2.58.0_1/lib/glib-2.0/include
-I/usr/local/opt/gettext/include -I/usr/local/Cellar/pcre/8.42/include
-m64 -mcx16 -DOS_OBJECT_USE_OBJC=0 -arch x86_64 -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
-Wredundant-decls -Wall -Wundef -Wwrite-strings -Wmissing-prototypes
-fno-strict-aliasing -fno-common -fwrapv
-Wno-error=address-of-packed-member -Wno-string-plus-int
-Wno-initializer-overrides -Wexpansion-to-defined -Wendif-labels
-Wno-shift-negative-value -Wno-missing-include-dirs -Wempty-body
-Wnested-externs -Wformat-security -Wformat-y2k -Winit-self
-Wignored-qualifiers -Wold-style-definition -Wtype-limits
-fstack-protector-strong -Wno-missing-braces
-I/usr/local/Cellar/gnutls/3.5.18/include
-I/usr/local/Cellar/nettle/3.4/include
-I/usr/local/Cellar/libtasn1/4.13/include
-I/usr/local/Cellar/p11-kit/0.23.12/include/p11-kit-1
-I/usr/local/Cellar/nettle/3.4/include
-I/usr/local/Cellar/libpng/1.6.34/include/libpng16
-I$(SRC_PATH)/capstone/include

...
  CC      x86_64-softmmu/target/i386/hax-darwin.o
  CC      x86_64-softmmu/target/i386/hvf/hvf.o
  CC      x86_64-softmmu/target/i386/hvf/x86.o
  CC      x86_64-softmmu/target/i386/hvf/x86_cpuid.o
  CC      x86_64-softmmu/target/i386/hvf/x86_decode.o
  CC      x86_64-softmmu/target/i386/hvf/x86_descr.o
  CC      x86_64-softmmu/target/i386/hvf/x86_emu.o
  CC      x86_64-softmmu/target/i386/hvf/x86_flags.o
  CC      x86_64-softmmu/target/i386/hvf/x86_mmu.o
  CC      x86_64-softmmu/target/i386/hvf/x86hvf.o
  CC      x86_64-softmmu/target/i386/hvf/x86_task.o
  LINK    x86_64-softmmu/qemu-system-x86_64
  REZ     x86_64-softmmu/qemu-system-x86_64
  SETFILE x86_64-softmmu/qemu-system-x86_64

So this code is covered.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Regards,

Phil.

