Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YzUbU-0005Mi-1F
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2015 14:38:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YzUbQ-0005JN-5n
	for qemu-trivial@nongnu.org; Mon, 01 Jun 2015 14:38:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YzUbM-0002nl-Oc
	for qemu-trivial@nongnu.org; Mon, 01 Jun 2015 14:38:24 -0400
Received: from mail-qk0-f182.google.com ([209.85.220.182]:35764)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YzUbM-0002nZ-Le
	for qemu-trivial@nongnu.org; Mon, 01 Jun 2015 14:38:20 -0400
Received: by qkhq76 with SMTP id q76so60134716qkh.2
	for <qemu-trivial@nongnu.org>; Mon, 01 Jun 2015 11:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=J9qbeB/3xGKWI+CXLyVBuLuul0gtVB/stNRgp2O/oZQ=;
	b=C9hiWV+M3acQ6Yqfe+H0ajTa//QltNbZMUO60bZFKfEmLX27ilKJ6Aw7iLnX1xTkUf
	paVFl1102fmxqYR8WKXYHg+qrDNUKM3xvTUSD+m9+q7cbB318mjc4loMsAH3dEeYKef3
	khypBvD99T7goDv9HfsZqop2sY/5FRzkFSqoKiQ0E5Zv8DL5XeG58DSK8MXvTCGpNYm/
	qsCeosvREnz5Wg9RhKUeXurAZah2WfvQxTilIRoqRKzQSnf8EtD5fpQt6c7nHOhMwFWc
	L5jpq12IIwpexBv3a+PYyVcYiNrd/GJVfcyeRPqBLmNg8ZwdaCL9dD/KnW6mJwVVn0Yv
	mAPA==
X-Gm-Message-State: ALoCoQkt8zIFENCSrqgxdJwPkzvDZP3rOvEU8k0k54vBKYB4o8tiNGocUw51LTQQ5SY20Hc5Ba9W
MIME-Version: 1.0
X-Received: by 10.55.16.33 with SMTP id a33mr40817523qkh.51.1433183900172;
	Mon, 01 Jun 2015 11:38:20 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.96.45.2 with HTTP; Mon, 1 Jun 2015 11:38:20 -0700 (PDT)
In-Reply-To: <1433145235-13941-1-git-send-email-pbonzini@redhat.com>
References: <1433145235-13941-1-git-send-email-pbonzini@redhat.com>
Date: Mon, 1 Jun 2015 11:38:20 -0700
X-Google-Sender-Auth: y8oT251DTKoqMiPtJNWl_U2H93k
Message-ID: <CAEgOgz7fU2EgmxcT_fHu2iBAS5LcytVz8KsNw72Wf-UAOTfk8g@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.182
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] translate-all: delete
 prototype for non-existent function
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
X-List-Received-Date: Mon, 01 Jun 2015 18:38:25 -0000

On Mon, Jun 1, 2015 at 12:53 AM, Paolo Bonzini <pbonzini@redhat.com> wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

[pcrost@xsjsorenbubuntu qemu-mainline]$ git grep cpu_unlink_tb
translate-all.h:24:void cpu_unlink_tb(CPUState *cpu);

Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

> ---
>  translate-all.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/translate-all.h b/translate-all.h
> index ef9166c..0384640 100644
> --- a/translate-all.h
> +++ b/translate-all.h
> @@ -24,7 +24,6 @@ void tb_invalidate_phys_page_fast(tb_page_addr_t start, int len);
>  void tb_invalidate_phys_page_range(tb_page_addr_t start, tb_page_addr_t end,
>                                     int is_cpu_write_access);
>  void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end);
> -void cpu_unlink_tb(CPUState *cpu);
>  void tb_check_watchpoint(CPUState *cpu);
>
>  #ifdef CONFIG_USER_ONLY
> --
> 2.4.1
>
>

