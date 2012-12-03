Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TfVjs-00012g-Q4
	for mharc-qemu-trivial@gnu.org; Mon, 03 Dec 2012 08:07:12 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TfVjl-0000h5-Du
	for qemu-trivial@nongnu.org; Mon, 03 Dec 2012 08:07:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TfVjf-0003x7-Gy
	for qemu-trivial@nongnu.org; Mon, 03 Dec 2012 08:07:05 -0500
Received: from mail-ea0-f173.google.com ([209.85.215.173]:61240)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TfVjX-0003vx-UF; Mon, 03 Dec 2012 08:06:52 -0500
Received: by mail-ea0-f173.google.com with SMTP id i13so1219827eaa.4
	for <multiple recipients>; Mon, 03 Dec 2012 05:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RPI2G6FSunI4/XQoN5Ep2egX44Cj/3V8oJq7zxIhan8=;
	b=cdLbHxOBlSSK3+1RuPRpG23b8JXYGdHsQ9hJ2MEP6rgKMv6uUKvqWt1SkXUeLLc3A6
	6rNZ8kcjHkXGJPfBytpIrxclAqy9yLmrAk+37D6U0sil5WK0kNIgq43DRuEVtPvs5AyS
	gUwLrBoY3FBiPEhwQ4zFChOOhdF146DkMxmf3dgGsqJmV4SEHIgtx1Y9ACaxrhRiljpa
	Am7slWHiJXj2ISkVaISIvYgBusd4Nilii2/56Cjt/EhZbZGu0JPMfpemJ7vgydlCBTl5
	Zpr+fDVZg27B43DOKLvoCJTqT746JDFKVxm8VgtMYAIEasnCTjswulTwsmQoqGYPMEO0
	o+tQ==
Received: by 10.14.199.5 with SMTP id w5mr10414524een.31.1354540011203;
	Mon, 03 Dec 2012 05:06:51 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id z8sm31162800eeo.11.2012.12.03.05.06.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 05:06:50 -0800 (PST)
Date: Mon, 3 Dec 2012 14:06:49 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20121203130649.GH6048@stefanha-thinkpad.redhat.com>
References: <1353694338-13162-1-git-send-email-armbru@redhat.com>
	<1353694338-13162-3-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1353694338-13162-3-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, jordan.l.justen@intel.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] pc_sysfw: Plug memory
 leak on pc_fw_add_pflash_drv() error path
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
X-List-Received-Date: Mon, 03 Dec 2012 13:07:11 -0000

On Fri, Nov 23, 2012 at 07:12:18PM +0100, Markus Armbruster wrote:
> Harmless, because we the error inevitably leads to another, fatal one
> in pc_system_flash_init(): PC system firmware (pflash) not available.
> Fix it anyway.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/pc_sysfw.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

