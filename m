Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UsZxD-0003IJ-IL
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2013 10:47:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UsZxA-0003HP-KF
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 10:47:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UsZx9-00043C-8k
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 10:47:12 -0400
Received: from mail-qa0-x232.google.com ([2607:f8b0:400d:c00::232]:46629)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1UsZx9-000435-3S; Fri, 28 Jun 2013 10:47:11 -0400
Received: by mail-qa0-f50.google.com with SMTP id l18so621697qak.2
	for <multiple recipients>; Fri, 28 Jun 2013 07:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=dDYUBoybT9/yDSnTJ0WHgzcSOU+B5XGdSRD8AIrI2ZU=;
	b=ss7M6V4ybdGdXfrtbRrQWal+6cDUo1Wmc2qK3yzB0PajOXw8GSKcW4evEhTI5/wPEN
	9efcQO1pwSfbeJqeEC0dReSafM7S2T5mpX8YAwTerIocWnAA6rAgOCyyUa0RL+b8H04k
	xvf7V1Hu1OQju5R4AFt7naj/+bUghrFoBgECZ9JH0vM4xML77uOKwGmywyWcaeitoCr3
	ZsFJj60FQ/zGeNAEChg3VMot07wZ5NZzeZEUYE20rolPJ3floEB8J2HBCilStu+6nXWL
	klO3MW+GVsfYelQm0ZBHjfryYXteeWMzN6Inc8HviZliun4Tbq7Vm+tRKsynOxQuXs3B
	VU8g==
X-Received: by 10.49.130.8 with SMTP id oa8mr17563239qeb.87.1372430830529;
	Fri, 28 Jun 2013 07:47:10 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-116-217-184.cust.dsl.vodafone.it. [37.116.217.184])
	by mx.google.com with ESMTPSA id 2sm8886604qap.7.2013.06.28.07.47.07
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 07:47:09 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <51CDA1E7.9000100@redhat.com>
Date: Fri, 28 Jun 2013 16:47:03 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1372101677-46175-1-git-send-email-emaste@freebsd.org>
	<51CD669A.1010100@msgid.tls.msk.ru>
	<CAPyFy2Bzh-nK7zkc3JwvPEd4AYH0CriA1vu_kGqoCXdaAk0i1A@mail.gmail.com>
	<51CD8985.6020401@redhat.com>
	<CAFEAcA-M9RnRv8TZjcY8C1KgRj+2k8JT1QKrtHhfo6BafNQQWQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-M9RnRv8TZjcY8C1KgRj+2k8JT1QKrtHhfo6BafNQQWQ@mail.gmail.com>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c00::232
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel <qemu-devel@nongnu.org>
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
X-List-Received-Date: Fri, 28 Jun 2013 14:47:14 -0000

Il 28/06/2013 15:05, Peter Maydell ha scritto:
>>> >> An objection seemed to be that it is not really needed yet, but as
>>> >> pointed out by Peter this isn't really the case.  This patch brings us
>>> >> (FreeBSD) in line with per-thread data semantics on Linux and is used
>>> >> by qemu system emulation as well.
>> >
>> > It brings it in line with Linux, even though FreeBSD has the same need
>> > for TLS as OpenBSD and Windows (i.e. none).  In other words, we go from
>> > two cases (need TLS and uses it, has no TLS and doesn't need it) to
>> > three (we add "uses TLS with no need for it").
> I don't understand what you mean by "no need for it". We are
> already multithreaded in system mode, so this is simply
> making FreeBSD do the same thing as Linux. 

cpu_single_env is protected by the BQL unless you're running on KVM.

Paolo

