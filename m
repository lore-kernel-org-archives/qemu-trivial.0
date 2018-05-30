Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNu0W-0004f0-8B
	for mharc-qemu-trivial@gnu.org; Wed, 30 May 2018 01:50:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNu0T-0004dK-VA
	for qemu-trivial@nongnu.org; Wed, 30 May 2018 01:50:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNu0T-0007UN-0b
	for qemu-trivial@nongnu.org; Wed, 30 May 2018 01:50:46 -0400
Received: from mail-yb0-x244.google.com ([2607:f8b0:4002:c09::244]:42379)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNu0Q-0007Ty-Ok; Wed, 30 May 2018 01:50:42 -0400
Received: by mail-yb0-x244.google.com with SMTP id d123-v6so5947841ybh.9;
	Tue, 29 May 2018 22:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=Fmijq3sHX8cFGu9GZQS8Lzy2sjkv5Zx7SN9T/OHMke0=;
	b=qQCeG1IaiYB62mWn3A5aIGL5JvoDJVGMBShTUdtWBxYIvxLfAGFQ+WAHSlynG22PXU
	QFWM8d9sZzYTSFOkeJd0D+Cu+F1ZRz/OgBowYvjhUhvialQXIejtCS06Q65dSUuub/jk
	GlKjFChMX/s3nYdaZmlZ2+VrJsMwItfe7jZAT9sG4fbiaU7yar5qdLPrlEKTaBVyF3J7
	8z+yOadf52tN7TZuvPlabZwmlTwUEF0SNUaVMXx4o9b4cKIJK/PWIGLCM0HSbmwZWO5A
	hH+4seGJDB3wRMQNu6+ncej7Lc6FdNt4YCs/jovpW9QWMKjPEXfT68d8rMdujgbwn4im
	n8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=Fmijq3sHX8cFGu9GZQS8Lzy2sjkv5Zx7SN9T/OHMke0=;
	b=Eo/TUyYLp+0vlmNst5+DCGBbZDofasipioME5Ddcxpu7GjKydbdQ4XB9BU9jJ+VHmI
	D5Wr1Jwq92py2XdkL40vSLBaGfJD97JW5aEbHpidpvFOIUbRYZOoHhIwlJl35oLtFoCs
	fiS9eqFtpNwEOffZUL68kn/l3EFN7PoyYu4cPydVjbBZUol/1YB0tYXZZZbEDnWw1m9B
	e/2RJKRaGXfMgQoibRPnvyEaTYOtveM8StOzZEnNe6jSGPVcwYTsnEvdgzQBTek78YO7
	bSPUK4PAv8UXMEjQ2+A9VQSN6W07Xa7lW6L1eK/QDKWpz9JI+k3Jr4hxbTBbVZuGuPpa
	9u/g==
X-Gm-Message-State: APt69E2KJi5zwBULkCZtgE0byvBkOplw2TsGyyRwt2MVkk14eFsu4/1e
	MD7YuOv+UPLsoxVly7xhLSZpo1xoYpeYge4MBWE=
X-Google-Smtp-Source: ADUXVKIE0olXKeYsfJBFD+n+atKegi1mkQoMQUyrxYJYljoYC+utr/oFU0GtALrL38MpP7slEBFRMb2NJ/ZNumvByPk=
X-Received: by 2002:a25:d1c5:: with SMTP id
	i188-v6mr738478ybg.114.1527659441791; 
	Tue, 29 May 2018 22:50:41 -0700 (PDT)
MIME-Version: 1.0
Sender: philippe.mathieu.daude@gmail.com
Received: by 2002:a25:3d7:0:0:0:0:0 with HTTP;
	Tue, 29 May 2018 22:50:41 -0700 (PDT)
In-Reply-To: <20180530074026-mutt-send-email-mst@kernel.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-10-f4bug@amsat.org>
	<20180529134053.1ea9f46d.cohuck@redhat.com>
	<11289f38-6d0f-74c9-1719-83b2a3ed2d97@amsat.org>
	<20180530074026-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 30 May 2018 02:50:41 -0300
X-Google-Sender-Auth: MTQLDqEjj_pSZ-qkUhcUVkcgSOw
Message-ID: <CAAdtpL7sDOg2m+Ffsbc3f_Za6fr3in5ZfBJ2BAtGNJ1j4vbhJQ@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Michael Walle <michael@walle.cc>, Laurent Vivier <laurent@vivier.eu>, 
	Anthony Green <green@moxielogic.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Alexander Graf <agraf@suse.de>, 
	David Hildenbrand <david@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>, 
	"open list:S390" <qemu-s390x@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::244
Subject: Re: [Qemu-trivial] [PATCH v4 09/21] target: Do not include
 "exec/exec-all.h" if it is not necessary
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
X-List-Received-Date: Wed, 30 May 2018 05:50:47 -0000

On Wed, May 30, 2018 at 1:42 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
> On Wed, May 30, 2018 at 12:12:55AM -0300, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> Hi Cornelia,
>>
>> On 05/29/2018 08:40 AM, Cornelia Huck wrote:
>> > On Mon, 28 May 2018 20:27:07 -0300
>> > Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
>> >
>> >> Code change produced with:
>> >>     $ git grep '#include "exec/exec-all.h"' | \
>> >>       cut -d: -f-1 | \
>> >>       xargs egrep -L "(cpu_address_space_init|cpu_loop_|tlb_|tb_|GETP=
C|singlestep|TranslationBlock)" | \
>> >
>> > Hm, does this expression catch all files that need to include
>> > exec-all.h? The resulting patch seems fine, though.
>>
>> No, not all :/
>> I started with "(cpu_loop_|tlb_|tb_)" then kept brutebuilding until no
>> more errors appear. In 2 more steps I added "cpu_address_space_init|"
>> then "|GETPC|singlestep|TranslationBlock". Quick and dirty enough for my
>> goal than trying to build a regex to explode function/struct names from
>> headers. This is a clever way to do it for long term command reuse taken
>> from commit messages...
>
> Brutebuilding isn't a good way to find unused includes, some other header
> might pull in an include you are trying to remove for its own purposes.
> If you want to try brutebuilding you must also verify that's
> not the case - e.g. look at the dependency file generated.

Hmm you mean the .d files in the build dir?

i.e.
$ find lm32-softmmu -name \*.d -exec fgrep -L exec-all.h {} \; | sed
-e 's/.*-softmmu\/\(.*\)d$/\1c/'
dump.c
numa.c
tcg/tcg-common.c
tcg/optimize.c
tcg/tcg-op-gvec.c
tcg/tcg-op-vec.c
accel/tcg/tcg-runtime-gvec.c
accel/tcg/tcg-all.c
accel/accel.c
accel/stubs/whpx-stub.c
accel/stubs/hvf-stub.c
accel/stubs/kvm-stub.c
accel/stubs/hax-stub.c
hw/lm32/milkymist.c
hw/lm32/lm32_boards.c
hw/core/generic-loader.c
...

Then look why each .c included it?

>
>> >>       xargs sed -i.bak '/#include "exec\/exec-all.h"/d'
>> >>
>> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

