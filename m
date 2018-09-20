Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g32w1-000628-0Q
	for mharc-qemu-trivial@gnu.org; Thu, 20 Sep 2018 13:40:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g32vx-00060V-5W
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2018 13:40:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g32vv-0000ZU-7M
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2018 13:40:09 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45523)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g32vu-0000Y5-Va
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2018 13:40:07 -0400
Received: by mail-ot1-x344.google.com with SMTP id a19-v6so10245649otl.12
	for <qemu-trivial@nongnu.org>; Thu, 20 Sep 2018 10:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZdUXcXQz2OsMlg/HAIUcBuJctXUazOhchOCurtvfZqw=;
	b=hQgoDfzN7MhSlN9MzL8wFkIEaUDANNtN97RO7lwtqYf/1tFsnWFEUKRtYjQfy7sglm
	zSim1F5pcVODHwuFO9nHyctpAt/0WNEdmqHf6Bw6Ja530rT2KWdp0kNXZrFxwjBbdEIc
	bmy7WHFcuELtCXCJd0zirpDvNSnDGG9Lxomew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZdUXcXQz2OsMlg/HAIUcBuJctXUazOhchOCurtvfZqw=;
	b=Gdz+wkjBGf4BbOr/uwZfCaK3m672w0niu3Y6HaqrU64rpLIwe3igxDJcMFgSVT05TW
	Q6GeNxC/tKVwB/jSF91x5e3wT1pVmETAQW605wdnTPOloN6JVYvHxWmDjHXz1hiY6VRI
	DUHbDBuu7WD/vNVC9Oraie+u60R/pumE5jrUx/dRvRnnWWdSN7JJld9guzVZjBzKSL5S
	Z1UuW+dBzSgipHosZZETdmW22k47rY4lf8YGOyPWsu0FI40CPY2zHzurdAHpHlHTRD6J
	lzVPDdp19+AqzykcfxcTuBimHvndkcyFCdsS6JF3HcBp3aUomCSZTQsPhtOMBwtw+UX2
	zxiw==
X-Gm-Message-State: ABuFfoj1gEOkrDl/Q3gC4aI3qJHV4rH+rU76H/pieR77SWsfDCTxB93n
	VxnpoAGIOCKWajZb1+ydbc+hu9jWQkBfWjzXbw3bvQ==
X-Google-Smtp-Source: ANB0VdautO9XHED1UVLF7U0cUuLdKkBgFs7dLHSAY2D6qUs1BE8JsgxFLEENb2RO36E46OR0t2yvIhXd4evj7+nEUYU=
X-Received: by 2002:a9d:730d:: with SMTP id
	e13-v6mr1945438otk.203.1537465205129; 
	Thu, 20 Sep 2018 10:40:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Thu, 20 Sep 2018 10:39:44
	-0700 (PDT)
In-Reply-To: <20180920173453.GP30558@habkost.net>
References: <1537441712-17177-1-git-send-email-maozhongyi@cmss.chinamobile.com>
	<20180920173453.GP30558@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Sep 2018 10:39:44 -0700
Message-ID: <CAFEAcA_9uqokbJ4mAbZ4h2_YMhLJBYx=f8u+iUcg5VherfKJLw@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>,
	Thomas Huth <thuth@redhat.com>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	"Michael S. Tsirkin" <mst@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Michael Clark <mjc@sifive.com>, 
	qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	David Gibson <david@gibson.dropbear.id.au>,
	Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Drop the "qemu:" prefix
 from error_report()
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
X-List-Received-Date: Thu, 20 Sep 2018 17:40:11 -0000

On 20 September 2018 at 10:34, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Thu, Sep 20, 2018 at 07:08:32AM -0400, Mao Zhongyi wrote:
>> error_report and friends already add a "qemu-system-xxx" prefix
>> to the string, so a "qemu:" prefix is redundant in the string.
>> Just drop it.
>>
>> Reported-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>
> Markus, do you want to merge it through your tree?
>
> If we are already touching those messages, it would be nice if we
> removed punctuation too on some cases below[1].
>
>
>> ---
>>  hw/i386/multiboot.c | 8 ++++----
>>  hw/ppc/e500.c       | 4 ++--
>>  hw/ppc/sam460ex.c   | 8 ++++----
>>  hw/riscv/sifive_e.c | 2 +-
>>  hw/riscv/sifive_u.c | 2 +-
>>  hw/riscv/spike.c    | 2 +-
>>  hw/riscv/virt.c     | 4 ++--
>>  7 files changed, 15 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
>> index d519e20..91118de 100644
>> --- a/hw/i386/multiboot.c
>> +++ b/hw/i386/multiboot.c
>> @@ -181,12 +181,12 @@ int load_multiboot(FWCfgState *fw_cfg,
>>      if (!is_multiboot)
>>          return 0; /* no multiboot */
>>
>> -    mb_debug("qemu: I believe we found a multiboot image!");
>> +    mb_debug("I believe we found a multiboot image!");
>>      memset(bootinfo, 0, sizeof(bootinfo));
>>      memset(&mbs, 0, sizeof(mbs));
>>
>>      if (flags & 0x00000004) { /* MULTIBOOT_HEADER_HAS_VBE */
>> -        error_report("qemu: multiboot knows VBE. we don't.");
>> +        error_report("multiboot knows VBE. we don't.");

Since this one is intended to be a user-facing error message
rather than just a debug note, it could also be reasonably expanded
to be a bit more user friendly, eg:
 "This multiboot image uses VBE, which QEMU does not support."

But that's a different patch.
thanks
-- PMM

