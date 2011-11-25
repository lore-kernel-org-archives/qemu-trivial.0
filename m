Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RTraB-0005yx-KJ
	for mharc-qemu-trivial@gnu.org; Fri, 25 Nov 2011 03:56:31 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RTra8-0005yO-V8
	for qemu-trivial@nongnu.org; Fri, 25 Nov 2011 03:56:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RTra7-000491-6b
	for qemu-trivial@nongnu.org; Fri, 25 Nov 2011 03:56:28 -0500
Received: from mail-iy0-f173.google.com ([209.85.210.173]:43260)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RTra7-00048s-0X; Fri, 25 Nov 2011 03:56:27 -0500
Received: by iakk32 with SMTP id k32so4788300iak.4
	for <multiple recipients>; Fri, 25 Nov 2011 00:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:message-id:date:from:user-agent:mime-version:newsgroups:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=vA445ebnvkMHH4gfOdERM9d3Smk3GP1tlvSHt40bXS8=;
	b=Oa4hc2NZV2nufDtSAagYcLzBbMsp2WMyC+0I+PrUeKNFHY5gV2TK2u43mJ/r4GZJDV
	Z81muQCV+heYBtq3UxQR6Cn2PmN/QmgNwAQOT7um+YA2XlCVzqL6kbVBgTJYJzhKNZuc
	O3lpJfzI6tlygNGIk4W1U4kXRSk+KW7mBGlh0=
Received: by 10.50.94.231 with SMTP id df7mr10404330igb.9.1322211384710;
	Fri, 25 Nov 2011 00:56:24 -0800 (PST)
Received: from yakj.usersys.redhat.com (93-34-178-147.ip50.fastwebnet.it.
	[93.34.178.147])
	by mx.google.com with ESMTPS id eh34sm98770738ibb.5.2011.11.25.00.56.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Nov 2011 00:56:22 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <4ECF582E.9000709@redhat.com>
Date: Fri, 25 Nov 2011 09:56:14 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
Newsgroups: gmane.comp.emulators.qemu
To: Stefan Weil <sw@weilnetz.de>
References: <CAGtkxYxddRxBCJib+0xid-2BcS4WaUoxE1-Hc6FcsVwBDHVK4Q@mail.gmail.com>	<CAOfR6VHZHvcp-808F5n2NPv4E_zUjeToNBjx_2FyM+Wjb+oY5A@mail.gmail.com>
	<20111124102712.GA27170@stefanha-thinkpad.localdomain>
	<4ECE9AED.3070209@weilnetz.de>
In-Reply-To: <4ECE9AED.3070209@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, Mark <wudx05@gmail.com>,
	Zhi Hui Li <zhihuili@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] os-win32.c : fix memory leak
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
X-List-Received-Date: Fri, 25 Nov 2011 08:56:30 -0000

On 11/24/2011 08:28 PM, Stefan Weil wrote:
>
> MS claims that putenv is a POSIX function, so I also expected
> that free / f_free is not allowed.
>
> I now wrote a short test which indicates that g_free would work:
> getenv returns a pointer which is completely different from
> the one passed to putenv.

Confirmed by http://source.winehq.org/source/dlls/msvcrt/environ.c.  It 
makes a copy of the string, passes it to SetEnvironmentVariable, and 
frees the copy.  So Windows never even sees the string passed to putenv.

The reason for the dance is that: 1) the underlying Win32 APIs require 
separate arguments for the variable and value; 2) even though in the end 
Wine stores the environment as name=value 
(http://source.winehq.org/source/dlls/ntdll/env.c), it does so in a 
single consecutive block of memory, not as a char* array like POSIX 
does.  While (2) might apply only to Wine, (1) surely applies to Windows 
as well.

Stefan, can you add some of the info to the commit message?

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

