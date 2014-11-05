Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlyLO-00059t-MB
	for mharc-qemu-trivial@gnu.org; Wed, 05 Nov 2014 06:01:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XlyLI-0004zU-At
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 06:01:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XlyLD-00005R-Cf
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 06:01:36 -0500
Received: from mail-la0-x22c.google.com ([2a00:1450:4010:c03::22c]:32958)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1XlyLD-00005J-1c; Wed, 05 Nov 2014 06:01:31 -0500
Received: by mail-la0-f44.google.com with SMTP id gf13so427387lab.31
	for <multiple recipients>; Wed, 05 Nov 2014 03:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=OHXV9rUDZkP6CW106rLnCmSGzBzrWGZRhr0Qnwqv5hI=;
	b=kVAf5lSkYjO4hClnfkSIeXqhdePCiUAe7HOn1/4jV+rHDLicTz2SMaWqzGYmJYdyxP
	P246TTB/0QSgeHZRgaIH28pN353nmdWtzDnRuCgU8cuJ3Z8JdrPLNpoMRh+6tvhoqkM7
	cbQ+wubQJ49kTnxZkTWOlJXkxF5d6B7vqsH+TSxDvSJh5WABILHEtKN/xw2qjNztXpSK
	IPi3aJHRp4bokEzK4d8oKHpaU1VLBT/qi1zcQyTtnTwc7BK80mU3PNP+qJuQ255tAZwR
	2vZ9OAJevPYZTwnZj0bU/mNJEIV4LTrLv+U/tywI76ngpdfyWLhgLe8L9wFcJAmCC58I
	HlAA==
X-Received: by 10.112.239.12 with SMTP id vo12mr67302774lbc.81.1415185289860; 
	Wed, 05 Nov 2014 03:01:29 -0800 (PST)
Received: from [192.168.10.150] (net-37-117-142-149.cust.vodafonedsl.it.
	[37.117.142.149])
	by mx.google.com with ESMTPSA id ny6sm1200436lbb.2.2014.11.05.03.01.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Nov 2014 03:01:28 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <545A0386.9030109@redhat.com>
Date: Wed, 05 Nov 2014 12:01:26 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: SeokYeon Hwang <syeon.hwang@samsung.com>, qemu-devel@nongnu.org
References: <1415002312-30827-1-git-send-email-syeon.hwang@samsung.com>
In-Reply-To: <1415002312-30827-1-git-send-email-syeon.hwang@samsung.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::22c
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2] translate-all: Marked map_exec() with
 the 'unused' attribute
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
X-List-Received-Date: Wed, 05 Nov 2014 11:01:41 -0000

On 03/11/2014 09:11, SeokYeon Hwang wrote:
> Marked map_exec() with the 'unused' attribute to avoid '-Wunused-function' on clang 3.4 or later.
> 
> Signed-off-by: SeokYeon Hwang <syeon.hwang@samsung.com>

Cc: qemu-trivial@nongnu.org
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> ---
>  translate-all.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/translate-all.c b/translate-all.c
> index ba5c840..9d150fb 100644
> --- a/translate-all.c
> +++ b/translate-all.c
> @@ -270,14 +270,14 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t retaddr)
>  }
>  
>  #ifdef _WIN32
> -static inline void map_exec(void *addr, long size)
> +static __attribute__((unused)) void map_exec(void *addr, long size)
>  {
>      DWORD old_protect;
>      VirtualProtect(addr, size,
>                     PAGE_EXECUTE_READWRITE, &old_protect);
>  }
>  #else
> -static inline void map_exec(void *addr, long size)
> +static __attribute__((unused)) void map_exec(void *addr, long size)
>  {
>      unsigned long start, end, page_size;
>  
> 

