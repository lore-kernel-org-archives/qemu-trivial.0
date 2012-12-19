Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TlFxz-0001pq-Th
	for mharc-qemu-trivial@gnu.org; Wed, 19 Dec 2012 04:29:31 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TlFxw-0001g0-PE
	for qemu-trivial@nongnu.org; Wed, 19 Dec 2012 04:29:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TlFxr-00036A-L2
	for qemu-trivial@nongnu.org; Wed, 19 Dec 2012 04:29:28 -0500
Received: from mail-we0-f175.google.com ([74.125.82.175]:44669)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TlFxo-00031L-2E; Wed, 19 Dec 2012 04:29:20 -0500
Received: by mail-we0-f175.google.com with SMTP id z53so818069wey.20
	for <multiple recipients>; Wed, 19 Dec 2012 01:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=XjtSCL0+J59vg+xUt3oIaYmK2cvWvUQnPG3aplE6dOE=;
	b=OKJXILG+XrEnG6RLVtq+fojZfnqoXJDUY700eXeE36Vmo2E32OJSl62YYr1CW+UG/L
	SU0iIyJIgQ14udK/FEEzAc4d6imuGenoEW9xqA7Noa6h7VTZlQ8eRJKo/05R5T8n/bq5
	bt5yEhCMjZXv3uLohBlje1XWgCWWJEk6QynSoEAn74BMXzxTCLi8JJpNzQ4C/wrG0Dkh
	LzW7QxzJOizGSvV7Vnlwu1MvckjnuRwIMVcQscxuHlxIOxMwgNEBnJVNPFR2Vn4yyUSE
	8Ha2M/vM068dTh1pPMFgYbgC+Rz38tWpp1vzGlihk034RLuPYcsHCaqvbiR22O69zETZ
	J8Kw==
X-Received: by 10.194.173.195 with SMTP id bm3mr10179594wjc.32.1355909359073; 
	Wed, 19 Dec 2012 01:29:19 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id ex6sm7022501wid.3.2012.12.19.01.29.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Dec 2012 01:29:17 -0800 (PST)
Date: Wed, 19 Dec 2012 10:29:16 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20121219092916.GA5023@stefanha-thinkpad.redhat.com>
References: <1353694338-13162-1-git-send-email-armbru@redhat.com>
	<1353694338-13162-2-git-send-email-armbru@redhat.com>
	<20121203130553.GG6048@stefanha-thinkpad.redhat.com>
	<87a9tsh8ui.fsf_-_@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a9tsh8ui.fsf_-_@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.175
Cc: qemu-trivial@nongnu.org, jordan.l.justen@intel.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 1/2] pc_sysfw: Check for
	qemu_find_file() failure
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
X-List-Received-Date: Wed, 19 Dec 2012 09:29:30 -0000

On Wed, Dec 05, 2012 at 03:28:05PM +0100, Markus Armbruster wrote:
> pc_fw_add_pflash_drv() ignores qemu_find_file() failure, and happily
> creates a drive without a medium.
> 
> When pc_system_flash_init() asks for its size, bdrv_getlength() fails
> with -ENOMEDIUM, which isn't checked either.  It fails relatively
> cleanly only because -ENOMEDIUM isn't a multiple of 4096:
> 
>     $ qemu-system-x86_64 -S -vnc :0 -bios nonexistant
>     qemu: PC system firmware (pflash) must be a multiple of 0x1000
>     [Exit 1 ]
> 
> Fix by handling the qemu_find_file() failure.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
> v2: Don't report errno, because that can produce misleading error
> messages.  For instance, when "seabios/out/bios.bin" is unreadable, we
> fall back to $data_dir/seabios/out/bios.bin, which doesn't exist, and
> then report "seabios/out/bios.bin: No such file or directory".  No other
> caller reports errno.
> 
>  hw/pc_sysfw.c | 4 ++++
>  1 file changed, 4 insertions(+)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

