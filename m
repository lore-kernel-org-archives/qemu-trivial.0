Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VncX7-0007OG-Bb
	for mharc-qemu-trivial@gnu.org; Mon, 02 Dec 2013 18:04:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39584)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1VncWy-0007Is-61
	for qemu-trivial@nongnu.org; Mon, 02 Dec 2013 18:04:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1VncWm-0006fV-9H
	for qemu-trivial@nongnu.org; Mon, 02 Dec 2013 18:03:56 -0500
Received: from mail-pd0-f173.google.com ([209.85.192.173]:47467)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1VncWm-0006ey-2a
	for qemu-trivial@nongnu.org; Mon, 02 Dec 2013 18:03:44 -0500
Received: by mail-pd0-f173.google.com with SMTP id p10so19170433pdj.32
	for <qemu-trivial@nongnu.org>; Mon, 02 Dec 2013 15:03:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=RXd5k22VpzC6/EGBYxgvBF7SsoqzWLjFpn9Ojs8c0c0=;
	b=OaIYTY7ZVIlEZPOd4Qpr70PURUsbPSkK+O0LLnzbteZLGdNvhNUQK2UV4D/9bNAt/o
	ER+rDKkQ/PvHtvF2uAmHNvU3i4tOpLyLlAfiQdOPs3rcWxFTibq7AFSelBx70hq/hyOn
	bVonZlNifbMIEkF395lkUydIVp2DpRwg6GGEPYnWatTptxbEZoXnmLBY1mBcZpQMuI9m
	xBBd5Qakfr/y4gJdA73mMGSd5iG4QfsmjI89HBLamFM9A27rHubM26ctLwKApeoCUNWq
	fRFZxyiOIIah4eUI3SV/Et5U2/XSLWtA/9U56DLCFygskpiuVjcX9eWA2rEQR6jajJCx
	NDXQ==
X-Gm-Message-State: ALoCoQlJ01Ry4tZbPXYEOX5rMUXnHWzQbziT+/4n6S6eNfNR9XwKWjgLzPCA3tuz3/L3WoQefuR9
X-Received: by 10.66.147.193 with SMTP id tm1mr71629342pab.56.1386025421903;
	Mon, 02 Dec 2013 15:03:41 -0800 (PST)
Received: from aik.ozlabs.ibm.com (60-242-102-4.tpgi.com.au. [60.242.102.4])
	by mx.google.com with ESMTPSA id
	bh6sm31261542pad.20.2013.12.02.15.03.35 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 02 Dec 2013 15:03:38 -0800 (PST)
Message-ID: <529D11C5.2080505@ozlabs.ru>
Date: Tue, 03 Dec 2013 10:03:33 +1100
From: Alexey Kardashevskiy <aik@ozlabs.ru>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, 
	Michael Tokarev <mjt@tls.msk.ru>
References: <1385350750-21468-1-git-send-email-aik@ozlabs.ru>
	<529CBE15.8010206@msgid.tls.msk.ru> <529D0533.7090402@suse.de>
In-Reply-To: <529D0533.7090402@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.173
Cc: qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
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
X-List-Received-Date: Mon, 02 Dec 2013 23:04:03 -0000

On 12/03/2013 09:09 AM, Andreas Färber wrote:
> Am 02.12.2013 18:06, schrieb Michael Tokarev:
>> 25.11.2013 07:39, Alexey Kardashevskiy wrote:
>>> Since modern POWER7/POWER8 chips can have more that 256 CPU threads
>>> (>2000 actually), remove this check from smp_parse.
>>>
>>> The CPUs number is still checked against machine->max_cpus and this check
>>> should be enough not to break other archs.
> 
> "should be" is not exactly the highest level of confidence for a
> "trivial" patch... :/
> 
>> []
>>> -    if (max_cpus > 255) {
>>> -        fprintf(stderr, "Unsupported number of maxcpus\n");
>>> -        exit(1);
>>> -    }
> 
> I believe Eduardo touched that code last for NUMA, so let's CC him.
> 
>> I don't know whenever this is actually safe.  Do we have any static arrays
>> of size 255 somewhere, which will be overflowed without this check? :)
> 
> s390 has the ipi_states[] array, but not fixed to that size.

s390 machines have QemuMachine::max_cpus == 255.


> x86 APIC IDs I think have or had a limitation to 255 rather than 16-bit?
> Igor?
> 
> Alexey, did you actually check that, e.g., x86 machines don't break with
> 256 or 257 CPUs now?

PC_DEFAULT_MACHINE_OPTIONS sets it to 255. And I cannot find any machine
which would not define max_cpus, have I missed any?



-- 
Alexey

