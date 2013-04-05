Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UO6NK-0008F8-4N
	for mharc-qemu-trivial@gnu.org; Fri, 05 Apr 2013 09:08:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UO6N9-00080e-Ic
	for qemu-trivial@nongnu.org; Fri, 05 Apr 2013 09:08:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UO6N3-0008QR-VM
	for qemu-trivial@nongnu.org; Fri, 05 Apr 2013 09:08:03 -0400
Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b]:36049)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UO6Mt-0008MJ-G3; Fri, 05 Apr 2013 09:07:47 -0400
Received: by mail-wi0-f171.google.com with SMTP id hn17so567297wib.16
	for <multiple recipients>; Fri, 05 Apr 2013 06:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=CYKaAWIfuYFol0mfDf9ga8pXPbetxD8hsEg42UxJYwI=;
	b=gyxEf0LzoE5aXOIj1NvBj8oiHjnNCEkPKzjbnrowux43SGWIpA8dp0MZm2CBCs/J01
	0P07MC2OpsJCO4OnZbBarpvk7ixpAwhqy8ggau1hNxOlXGmiI5rzXQp0Tsb3iTxFAjlg
	JOjqzWLF9swM2/MPEsQ/wF2kO2JcBeVfGMCrIGM9yUabkqWGANWFA1f3j4hz9Z0BcJZl
	MigQCg0PiEh5SMEO2Q9iJYZzFBS8OxMQcwsj+N339qRBpMIM4rQSibVyz4vxcObAH/+N
	Jl9BQNT8xFKvECiSeqPH9X8X6yHdnyyW/Qi4FIPvJadgOabeuu3RZs4ugYB3OKV2b4WQ
	T30g==
X-Received: by 10.194.120.195 with SMTP id le3mr16303063wjb.46.1365167266625; 
	Fri, 05 Apr 2013 06:07:46 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:2d83:6a4a:ca86:7c26])
	by mx.google.com with ESMTPS id g9sm4186119wix.1.2013.04.05.06.07.44
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 06:07:45 -0700 (PDT)
Date: Fri, 5 Apr 2013 15:07:43 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Brendan Dolan-Gavitt <brendandg@gatech.edu>
Message-ID: <20130405130743.GF15818@stefanha-thinkpad.redhat.com>
References: <1365117183-23730-1-git-send-email-brendandg@gatech.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1365117183-23730-1-git-send-email-brendandg@gatech.edu>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22b
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] target-i386: fix order of checks in
 cpu_get_phys_page_debug
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
X-List-Received-Date: Fri, 05 Apr 2013 13:08:12 -0000

On Thu, Apr 04, 2013 at 07:13:03PM -0400, Brendan Dolan-Gavitt wrote:
> In target-i386 cpu_get_phys_page_debug, the CR4_PAE bit is checked
> before CR0_PG. This means that if paging is disabled but the PAE bit has
> been set in CR4, cpu_get_phys_page_debug will return the wrong result
> (it will try to translate the address as virtual rather than using it as
> a physical address). This patch fixes that by moving the CR0_PG check to
> the beginning of the function.
> 
> This shows up when booting the Linux kernel on amd64 with "-d in_asm".
> The kernel turns on the PAE bit in CR4 before turning on paging, and so
> QEMU's disassembler will fail because it will try to walk the page
> tables to fetch code even though paging is disabled. The symptom is
> incorrect disassembly and some "Disassembler disagrees with translator
> over instruction decoding" messages.
> 
> This was also reported as bug #1163065.
> 
> Signed-off-by: Brendan Dolan-Gavitt <brendandg@gatech.edu>
> ---
>  target-i386/helper.c |  121 ++++++++++++++++++++++++++------------------------
>  1 file changed, 64 insertions(+), 57 deletions(-)

Sorry, not trivial :).

Stefan

