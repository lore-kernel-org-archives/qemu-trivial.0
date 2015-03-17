Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXnBE-0008HP-Ik
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 04:48:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YXnBB-0008DY-Nt
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 04:48:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YXnBA-0008OE-PI
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 04:48:49 -0400
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233]:37428)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YXnB5-0008Mv-PJ; Tue, 17 Mar 2015 04:48:43 -0400
Received: by wixw10 with SMTP id w10so4758216wix.0;
	Tue, 17 Mar 2015 01:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=x/dBRxDU5ROAqdpBbAE4jacsDQj0i8kDBwXWPbLiAyI=;
	b=MWfxoc+WkVsGi7+k+REuOGAkTqER2YwccUAFZut2zGo6j3xi+2p2CG5/f6NwQjbopK
	S+fuUd/kUdVCg1hvWPiFvL3yfAEkr0XBZJ3wPETfG1rTHlD86jQHjmE+VxSOZE6iu8PG
	nASEmpLZda8QeHArlDP0CxpNWd4ADq12Jn67T9E3slPf/EjDskIaSqCBHlcuQnuIORNC
	dlW36H+54pX1Sl9CcHdfaw6C3FNieS4qNp0/ArnF3uNHtQ2vSYtLjdBrth+sx6i+1EHb
	ORH1IcgBDvyrasAOFOiUFUCxRqkbtfdNi0Bnj44XDeCe7TkjoIQNIk4w/Fl15wEXJOFu
	lYSQ==
X-Received: by 10.194.222.197 with SMTP id qo5mr128336945wjc.142.1426582123074;
	Tue, 17 Mar 2015 01:48:43 -0700 (PDT)
Received: from [192.168.10.150] (net-37-117-129-240.cust.vodafonedsl.it.
	[37.117.129.240]) by mx.google.com with ESMTPSA id
	i10sm18937884wja.40.2015.03.17.01.48.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Mar 2015 01:48:41 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5507EA65.6010407@redhat.com>
Date: Tue, 17 Mar 2015 09:48:37 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, 
	qemu-trivial <qemu-trivial@nongnu.org>
References: <5501776A.20202@siemens.com> <87d248t424.fsf@blackfin.pond.sub.org>
In-Reply-To: <87d248t424.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::233
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] coverity: Fix g_malloc_n-like models
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
X-List-Received-Date: Tue, 17 Mar 2015 08:48:50 -0000



On 17/03/2015 09:34, Markus Armbruster wrote:
> Jan Kiszka <jan.kiszka@siemens.com> writes:
> 
>> Allocate the calculated overall size, not only the size of a single
>> element.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> 
> I'm feeding this to Coverity locally to gauge its impact.

I got no changes.

Paolo

