Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQFt6-0004dN-EX
	for mharc-qemu-trivial@gnu.org; Wed, 19 Mar 2014 08:46:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WQFsw-0004UA-5c
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 08:46:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WQFsn-00036l-O5
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 08:46:18 -0400
Received: from mail-ee0-x235.google.com ([2a00:1450:4013:c00::235]:64886)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WQFsn-00036c-Gg; Wed, 19 Mar 2014 08:46:09 -0400
Received: by mail-ee0-f53.google.com with SMTP id b57so5857107eek.26
	for <multiple recipients>; Wed, 19 Mar 2014 05:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=B88GHOrOD0b6bg9NtLWjju+/r7AN8iPQTvNsFp6D2mM=;
	b=ABs9VPnYdY0dIBzJcpUomxpboZSl9HtgQi3w8vPP2gYpZKlA+rcPzDLymuyairfxX2
	SF7ksjlPA70aJdnV5bmrDq68Ke+XjwGh5wYp8lgNeP5P2t0qtF/m26kGk08wam4mEOHH
	az7e7n+4fYUSIC/XI+OfH+yqdPW6TeDnSUdtKgwpHu6EMcu3OkeQ1xQPzOn0gWYRXo3Q
	m89Qo7f/ma2pQTRgI1Vm8+ccCEgYbLWbkRYUYUbtJ6mHgiStoQZpZjD3n+lrYCW2zR0W
	8Pv7IoNB2K0mquxP8yj/0t6bFSJKIZPvvPack+pi+yaqBTLXctTZV2VL7t4OCbJswWph
	JNfw==
X-Received: by 10.15.43.77 with SMTP id w53mr35723591eev.10.1395233168338;
	Wed, 19 Mar 2014 05:46:08 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-154-249.cust.vodafonedsl.it. [37.117.154.249])
	by mx.google.com with ESMTPSA id
	q49sm42198023eem.34.2014.03.19.05.46.05 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Mar 2014 05:46:06 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5329918C.8090403@redhat.com>
Date: Wed, 19 Mar 2014 13:46:04 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1395162223-28733-1-git-send-email-pbonzini@redhat.com>	<874n2vcpu9.fsf@blackfin.pond.sub.org>
	<53294155.8040403@redhat.com>
	<87d2hi4ktz.fsf@blackfin.pond.sub.org>
In-Reply-To: <87d2hi4ktz.fsf@blackfin.pond.sub.org>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::235
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] scripts: add sample model file for
	Coverity Scan
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
X-List-Received-Date: Wed, 19 Mar 2014 12:46:26 -0000

Il 19/03/2014 10:08, Markus Armbruster ha scritto:
>> It probably would make static analysis a bit less powerful or will
>> return more false positives.  The NULL return for realloc (in the
>> "free" case) already causes some.  So I'm undecided between a more
>> correct model and a more selective one (with a fat comment).
>
> I can't see how lying to the analyzer could make it more powerful :)
> It can, however, suppress false positives.  Scan and find out how many?

Full model (g_malloc returns NULL for 0 argument) => 750 defects

Posted model (g_malloc never returns NULL)        => 702 defects
		-59 NULL_RETURNS defects
		 -1 REVERSE_INULL defects
		+12 TAINTED_SCALAR defects

Reduced model (g_realloc never frees)             => 690 defects
		-12 NULL_RETURNS defects

Of course, silly me, I threw away the results of the analysis for the 
full model.  I'll now rerun it and look for false negatives caused by 
the reduced model.

Paolo

