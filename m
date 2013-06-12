Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmjES-00082w-Sc
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 07:28:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UmjEO-0007yo-8J
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 07:28:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UmjEL-0003n6-0f
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 07:28:48 -0400
Received: from mail-pd0-f182.google.com ([209.85.192.182]:65126)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UmjEK-0003mX-R1
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 07:28:44 -0400
Received: by mail-pd0-f182.google.com with SMTP id r10so3612867pdi.41
	for <qemu-trivial@nongnu.org>; Wed, 12 Jun 2013 04:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=6NypkRSW1DLIp4ZvKFpCTbVNgtofkWXEoYqCyzBe9Bo=;
	b=PMl+tpBHwE7gpZUQyvWf1e9S7oRTiFhMECtxrzd4yPP+i3De02sRQYFZKJ0jBU5loJ
	MstS+/mSA6i/g6wEC88xy8ZFBBJrYDCBhOH+Cz097VeaeO6Y/SqlfTR+8dS8gG2tQFdN
	71LN1mIFfdi/FktzIUbJL8HPl7Ov7iQfjLCQQmQ4v+paIMzeMjJOBNoMXqUIq66j/Jtj
	ZcwYqNR6zN1gInqLYW2rm3CtnGwJJl+EzviEguurN3uSDqhUZF/tk3UtFGQouk4HRUEz
	ikGhRwn0q2ttQ+wPdYov3YN4ukK14QH8Me92i6ADSDaOaB+gAQV2dV0De8JlbLOLZQcb
	ttvA==
X-Received: by 10.66.216.136 with SMTP id oq8mr23146956pac.161.1371036523909; 
	Wed, 12 Jun 2013 04:28:43 -0700 (PDT)
Received: from aik.ozlabs.ibm.com (60-242-102-4.tpgi.com.au. [60.242.102.4])
	by mx.google.com with ESMTPSA id xz1sm24519870pab.5.2013.06.12.04.28.37
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 04:28:42 -0700 (PDT)
Message-ID: <51B85B62.4090906@ozlabs.ru>
Date: Wed, 12 Jun 2013 21:28:34 +1000
From: Alexey Kardashevskiy <aik@ozlabs.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1371022015-7576-1-git-send-email-aik@ozlabs.ru>
	<51B83EEE.9030403@msgid.tls.msk.ru>
In-Reply-To: <51B83EEE.9030403@msgid.tls.msk.ru>
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-Gm-Message-State: ALoCoQlrjEqIkICAJhsOyxndTOzYKL0kXLDMjR50n0nagNTqdbkTevfntockQ9yqPyGMVnaePOyg
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.182
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [PATCH 0/4 v2] header update request
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
X-List-Received-Date: Wed, 12 Jun 2013 11:28:50 -0000

On 06/12/2013 07:27 PM, Michael Tokarev wrote:
> 12.06.2013 11:26, Alexey Kardashevskiy wrote:
>> We need new headers for live migration and in-kernel interrupt controller support.
>>
>> However just copying new headers breaks at least PPC so dummy kvm_arch_init_irq_routing()
>> is required as well.
>>
>> Changes since v1:
>> * added dummy functions for ARM and S390 as they are supposed to get broken after
>> the headers update;
>> * now headers are from v3.10-rc5 (the previous try was for rc4).
> 
> Thank you, applied to the trivial patches queue.
> 
> Some notes:
> 
> 1. I haven't tried to build it on neither PPC nor ARM nor S390,
>    so I've no idea if that will work or not... ;)

All I can try is building fully emulated versions on x86, this passes :)


> 
> 2. the difference between -rc4 and rc5 is wihin mips kvm.h,
>    which introduced a bunch of definitions in there.  And whole
>    patchset introduces kvm definitions for mips for the first
>    time.  JFYI.

I noticed but as I noticed, commit messages of linux headers update are not
very detailed and do not include what exactly changed in kernel headers. Or
do they?


> 
> /mjt
> 


-- 
Alexey

