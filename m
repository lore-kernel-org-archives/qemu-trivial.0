Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vo5Mo-0006k7-29
	for mharc-qemu-trivial@gnu.org; Wed, 04 Dec 2013 00:51:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Vo5Mf-0006iz-0N
	for qemu-trivial@nongnu.org; Wed, 04 Dec 2013 00:51:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Vo5MX-0004tX-LS
	for qemu-trivial@nongnu.org; Wed, 04 Dec 2013 00:51:12 -0500
Received: from mail-pd0-f178.google.com ([209.85.192.178]:38576)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Vo5MX-0004tO-Fi
	for qemu-trivial@nongnu.org; Wed, 04 Dec 2013 00:51:05 -0500
Received: by mail-pd0-f178.google.com with SMTP id y10so21657085pdj.37
	for <qemu-trivial@nongnu.org>; Tue, 03 Dec 2013 21:51:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=4VivaB6WYGYoLLPNRPV0xPYEa7Qv8dmY79KNZJbXx08=;
	b=VBmtFUuAY7u+Fa4EbqcrN9pP28TmpXj5jLG+v6yrlGG0rFYp/YED/IM5GGfb9vpgk2
	l7HjeLLxS+Q10tdaAWE8MIty6Nge+dBjQIawcTP9yAj2Fpr5GbB3JkNbzJPGr5jk92Bf
	E5qpnqeLwxIaBdv068+z49rEBDR2JVOUVqBWGDuz/6hD3NGRHsH35+jcBTmNGh+q93mC
	hDK3W4wCm45LGT1yv6Vr8k5fQ5z49X4Ny3e6U1P2siQvbFd4ZWqGCl9wfmMGCNaCmhEe
	m1NTEpvQ4hhRtLNMQD1ISOKP/7hIJqRZ88u+PiSBeebBzd3PGpd/+/Wv2AlI5ttTFfuE
	JNow==
X-Gm-Message-State: ALoCoQkS8Pyx8Ljnrkl6Ub2lWkLXwUlyYW3AHY6+UAPhRKcAuCPTGwBIJx2NzRdCHuYs56z0PP5y
X-Received: by 10.68.136.105 with SMTP id pz9mr3285017pbb.100.1386136264611;
	Tue, 03 Dec 2013 21:51:04 -0800 (PST)
Received: from aik.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id
	om6sm44749038pbc.43.2013.12.03.21.51.01 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Dec 2013 21:51:03 -0800 (PST)
Message-ID: <529EC2C3.3050703@ozlabs.ru>
Date: Wed, 04 Dec 2013 16:50:59 +1100
From: Alexey Kardashevskiy <aik@ozlabs.ru>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Eduardo Habkost <ehabkost@redhat.com>, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?=
	<afaerber@suse.de>
References: <1385350750-21468-1-git-send-email-aik@ozlabs.ru>
	<529CBE15.8010206@msgid.tls.msk.ru> <529D0533.7090402@suse.de>
	<529D11C5.2080505@ozlabs.ru> <529DDD08.4030206@suse.de>
	<20131203144740.GL22837@otherpad.lan.raisama.net>
In-Reply-To: <20131203144740.GL22837@otherpad.lan.raisama.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.178
Cc: qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl: remove (max_cpus > 255)
 check from smp_parse
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
X-List-Received-Date: Wed, 04 Dec 2013 05:51:20 -0000

On 12/04/2013 01:47 AM, Eduardo Habkost wrote:
> On Tue, Dec 03, 2013 at 02:30:48PM +0100, Andreas Färber wrote:
>> Am 03.12.2013 00:03, schrieb Alexey Kardashevskiy:
>>> On 12/03/2013 09:09 AM, Andreas Färber wrote:
>>>> Am 02.12.2013 18:06, schrieb Michael Tokarev:
>>>>> 25.11.2013 07:39, Alexey Kardashevskiy wrote:
>>>>>> Since modern POWER7/POWER8 chips can have more that 256 CPU threads
>>>>>> (>2000 actually), remove this check from smp_parse.
>>>>>>
>>>>>> The CPUs number is still checked against machine->max_cpus and this check
>>>>>> should be enough not to break other archs.
>>>>
>>>> "should be" is not exactly the highest level of confidence for a
>>>> "trivial" patch... :/
>> [...]
>>>> Alexey, did you actually check that, e.g., x86 machines don't break with
>>>> 256 or 257 CPUs now?
>>>
>>> PC_DEFAULT_MACHINE_OPTIONS sets it to 255. And I cannot find any machine
>>> which would not define max_cpus, have I missed any?
>>
>> If you've actually *checked* the other machines' code then fine with me,
>> just say so in the commit message. :)
> 
> I just grepped for "max_cpus" and checked every match. The largest
> values I found were:
> 
> hw/ppc/spapr.c: 256
> s390: 255
> pc: 255
> 
> All the rest had values <= 32.
> 
> Machines with missing max_cpus value shouldn't be a problem, as
> max_cpus==0 is interpreted as 1 by the vl.c code.
> 
> But we still need to add a check for max_cpus > machine->max_cpus to
> vl.c, before we eliminate the smp_parse() check.


Since smp_parse() checks if (max_cpus >= smp_cpus), this should just work:

diff --git a/vl.c b/vl.c
index e6ed260..544165a 100644
--- a/vl.c
+++ b/vl.c
@@ -3882,9 +3882,9 @@ int main(int argc, char **argv, char **envp)
     smp_parse(qemu_opts_find(qemu_find_opts("smp-opts"), NULL));

     machine->max_cpus = machine->max_cpus ?: 1; /* Default to UP */
-    if (smp_cpus > machine->max_cpus) {
+    if (max_cpus > machine->max_cpus) {
         fprintf(stderr, "Number of SMP cpus requested (%d), exceeds max cpus "
-                "supported by machine `%s' (%d)\n", smp_cpus,  machine->name,
+                "supported by machine `%s' (%d)\n", max_cpus,  machine->name,
                 machine->max_cpus);
         exit(1);
     }


> There's also this, at main():
> 
>         if (i == nb_numa_nodes) {
>             for (i = 0; i < max_cpus; i++) {
>                 set_bit(i, node_cpumask[i % nb_numa_nodes]);
>             }
>         }
> 
> node_cpumask[] is initialized using bitmap_new(MAX_CPUMASK_BITS), and
> MAX_CPUMASK_BITS is 255. To fix this, we can initialize node_cpumask[] using
> max_cpus instead, if we initialize it after smp_parse().


Nope. At the moment when we parse -numa in vl.c, we may not know yet what
machine is going to be used and machines can have different max_cpus.

For now, I would simply change MAX_CPUMASK_BITS to something crazy, like
16384 (2KB per numa node), I hope QEMU can survive such a memory waste :)

Ok?


-- 
Alexey

