Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SvtBX-00016W-LS
	for mharc-qemu-trivial@gnu.org; Mon, 30 Jul 2012 12:51:11 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1SvtBV-00010V-IS
	for qemu-trivial@nongnu.org; Mon, 30 Jul 2012 12:51:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1SvtBU-0002Ey-KK
	for qemu-trivial@nongnu.org; Mon, 30 Jul 2012 12:51:09 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:53838)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>)
	id 1SvtBL-0002Ch-FX; Mon, 30 Jul 2012 12:50:59 -0400
Received: by lbok6 with SMTP id k6so3437929lbo.4
	for <multiple recipients>; Mon, 30 Jul 2012 09:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yWHcrm0QULK1cYR01OFXwqQbblYgJMC1P0ce6zGHsMc=;
	b=0iFbBHvpsq3bevwMmh99C2P9rjAE+ULPlaTZTrtimWS6ns7pVggnax62mIDAWAnLqr
	WCZGlZMZCpW6+l2pXTMsCMcwIuiDl+bm5PTZZ1pHhyaEuhiZCCtBlPCpTjz/V6u64Y0B
	rE7TF0EgGq4Jq37Wr6Dmyi89vKst0/673c0aUus6K9FfGxjTOdwqqwj8ZCHcl01CApRT
	+8BEOIpL+s4mbLomh/ywCpEbjz0MNtsX/iFUric5bycNsWZt+8Xm30Mg7gl5cmgPoWa7
	zwHuPopU1eEOiXDdFwJd9p1Ow6FgQO1cTxBxTgRiVOR1Ai9yGpuR/C8Tv6h+yTU2DQCM
	FVRA==
MIME-Version: 1.0
Received: by 10.152.146.163 with SMTP id td3mr12247537lab.26.1343667057274;
	Mon, 30 Jul 2012 09:50:57 -0700 (PDT)
Received: by 10.112.23.166 with HTTP; Mon, 30 Jul 2012 09:50:57 -0700 (PDT)
In-Reply-To: <CAJSP0QU9EfQimQqUa5CyffdsWj4ZS-0EgOiB4vp7vTKbcUpJcg@mail.gmail.com>
References: <1343214711-24336-1-git-send-email-riegamaths@gmail.com>
	<CAJSP0QU9EfQimQqUa5CyffdsWj4ZS-0EgOiB4vp7vTKbcUpJcg@mail.gmail.com>
Date: Tue, 31 Jul 2012 00:50:57 +0800
Message-ID: <CAOZVR5b6SWnCGbwfE-rMk2M5wuCGp_rYn9gDgNXpgMbSthWvUw@mail.gmail.com>
From: Dunrong Huang <riegamaths@gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>,
	qemu-devel <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>,
	Anthony Liguori <aliguori@us.ibm.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] vl.c: Fix max_cpus
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
X-List-Received-Date: Mon, 30 Jul 2012 16:51:10 -0000

2012/7/31 Stefan Hajnoczi <stefanha@gmail.com>:
> On Wed, Jul 25, 2012 at 12:11 PM,  <riegamaths@gmail.com> wrote:
>> From: Dunrong Huang <riegamaths@gmail.com>
>>
>> The VCPU count limit in kernel now is 254, defined by KVM_MAX_VCPUS
>> in kernel's header files. But the count limit in QEMU is 255,
>> so QEMU will failed to start if user passes "-enable-kvm" and "-smp 255"
>> to it.
>>
>> Exit QEMU with an error if KVM is enabled and number of SMP cpus requested
>> exceeds KVM_MAX_VCPUS.
>>
>> Signed-off-by: Dunrong Huang <riegamaths@gmail.com>
>> ---
>> v1 -> v2:
>> Checking if the number of smp cpus requested exceeds KVM limit count
>> if and only if kvm is enabled.
>>
>>  vl.c |   11 +++++++++++
>>  1 files changed, 11 insertions(+), 0 deletions(-)
>>
>> diff --git a/vl.c b/vl.c
>> index 8904db1..cdd1c96 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -169,6 +169,11 @@ int main(int argc, char **argv)
>>
>>  #define MAX_VIRTIO_CONSOLES 1
>>
>> +/* KVM_MAX_VCPUS defined in kernel's header files */
>> +#ifndef KVM_MAX_VCPUS
>> +#define KVM_MAX_VCPUS 254
>> +#endif
>> +
>>  static const char *data_dir;
>>  const char *bios_name = NULL;
>>  enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
>> @@ -3348,6 +3353,12 @@ int main(int argc, char **argv, char **envp)
>>
>>      configure_accelerator();
>>
>> +    if (kvm_enabled() && smp_cpus > KVM_MAX_VCPUS) {
>> +        fprintf(stderr, "Number of SMP cpus requested (%d) exceeds max cpus "
>> +                "supported by KVM (%d)\n", smp_cpus, KVM_MAX_VCPUS);
>> +        exit(1);
>> +    }
>
> After a little discussion on IRC, two points emerged:
> 1. Use KVM_CAP_MAX_VCPUS to query the max number of vcpus at runtime.
> 2. We should fail gracefully when ioctl() fails.
>
> In other words, using the KVM_MAX_VCPUS value from userspace isn't a
> good idea.  Imagine what happens when the user upgrades their kernel
> without recompiling QEMU.  If the KVM_MAX_VCPUS value increased in the
> kernel QEMU would not know.
>
> Please either drop this patch completely or at least using
> KVM_CAP_MAX_VCPUS so we fetch the maximum value at runtime.
>
> Stefan

I see. Thanks for your comments

I will send a patch based the disscussion we talked on IRC

-- 
Best Regards,

Dunrong Huang

