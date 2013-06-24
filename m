Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UrE6v-0001yO-FI
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 17:15:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UrE6r-0001t9-Kr
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 17:15:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UrE6q-00043s-FS
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 17:15:37 -0400
Received: from mail-ea0-x22a.google.com ([2a00:1450:4013:c01::22a]:48548)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1UrE6m-00040W-N4; Mon, 24 Jun 2013 17:15:32 -0400
Received: by mail-ea0-f170.google.com with SMTP id h10so6390102eaj.29
	for <multiple recipients>; Mon, 24 Jun 2013 14:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=248/AA03PyMTcPyyDTrTVW6yHW/hrnbOBsniZqVQgWg=;
	b=z7rlog0+HRAwetL1dJPMBbgwtDTh/twcqmr/WW58epF88FFXepv19oUBzijHWDv2O3
	tsf+LW5adfGM2RVmxXp2tHtQRBt3NzJncm3mQEPhXhHHDNHq/xbjskgmdfv8AXIzcjRN
	6w8oeLcgCv2cCA8tXPfbf9L8pLgIlf88BAe0aFadCVOVjHWukZdpF97ru05Q5nQvKTT8
	t3PEUJUxUlONV5EI/rLY1nJM6OkwSi+lTxq/KamOtuyQ4UJqTGM0QD3BUZD+DDBDxmDK
	DlZvVpjfhkCe+PaS4LGCjm/i+phxyg6OMnAb250zUSYv/JeWLbpDEMpBL3a6+DGyFN/w
	aZ7A==
X-Received: by 10.14.216.73 with SMTP id f49mr26426503eep.119.1372108531588;
	Mon, 24 Jun 2013 14:15:31 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-116-217-184.cust.dsl.vodafone.it. [37.116.217.184])
	by mx.google.com with ESMTPSA id m1sm31170808eex.17.2013.06.24.14.15.29
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 24 Jun 2013 14:15:30 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <51C8B6EF.5070108@redhat.com>
Date: Mon, 24 Jun 2013 23:15:27 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Ed Maste <emaste@freebsd.org>
References: <1372101677-46175-1-git-send-email-emaste@freebsd.org>
In-Reply-To: <1372101677-46175-1-git-send-email-emaste@freebsd.org>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::22a
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] tls.h: Enable TLS on FreeBSD
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
X-List-Received-Date: Mon, 24 Jun 2013 21:15:39 -0000

Il 24/06/2013 21:21, Ed Maste ha scritto:
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
> I have had this in a local tree for some time, and it is needed by the
> BSD-user work that is now being proposed.

At this time, qemu/tls.h is really just for cpu_single_env, so I think
this patch should be applied together with the bsd-user patches that
need it.

> As an aside, an abstraction was recently proposed for Open vSwtich that
> can use any of _Thread_local, __thread, or pthread_getspecific() which
> may make a convenient reference for someone wishing to implement one of
> the TODOs: http://openvswitch.org/pipermail/dev/2013-June/028665.html

I and Stefan Hajnoczi have almost the same idea implemented in QEMU
(except that get_foo() returns a pointer to the variable).  But
pthread_get/setspecific would be too slow for cpu_single_env, so we're
just switching to __thread for cpu_single_env (for Linux in our patches,
but you can add FreeBSD too once it's needed).

Paolo

