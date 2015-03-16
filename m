Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXRrC-0008O2-F0
	for mharc-qemu-trivial@gnu.org; Mon, 16 Mar 2015 06:02:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YXRr7-0008H5-6d
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 06:02:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YXRqr-0002dn-HR
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 06:02:41 -0400
Received: from e06smtp10.uk.ibm.com ([195.75.94.106]:55322)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YXRqr-0002d9-56
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 06:02:25 -0400
Received: from /spool/local
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Mon, 16 Mar 2015 10:02:21 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 16 Mar 2015 10:02:20 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 37F1417D805A; 
	Mon, 16 Mar 2015 10:02:44 +0000 (GMT)
Received: from d06av08.portsmouth.uk.ibm.com (d06av08.portsmouth.uk.ibm.com
	[9.149.37.249])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2GA2JnJ66125840; Mon, 16 Mar 2015 10:02:19 GMT
Received: from d06av08.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t2GA2JVH009297; Mon, 16 Mar 2015 04:02:19 -0600
Received: from oc7435384737.ibm.com (dyn-9-152-224-100.boeblingen.de.ibm.com
	[9.152.224.100])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t2GA2JgE009293; Mon, 16 Mar 2015 04:02:19 -0600
Date: Mon, 16 Mar 2015 11:02:18 +0100
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20150316110218.7b754f4f@oc7435384737.ibm.com>
In-Reply-To: <1426347721-8349-1-git-send-email-sw@weilnetz.de>
References: <1426347721-8349-1-git-send-email-sw@weilnetz.de>
Organization: IBM
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.23; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031610-0041-0000-0000-000003974EE3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.106
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] elf-loader: Add missing
 error handling for call of lseek
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
X-List-Received-Date: Mon, 16 Mar 2015 10:02:45 -0000

On Sat, 14 Mar 2015 16:42:01 +0100
Stefan Weil <sw@weilnetz.de> wrote:

> This fixes a warning from Coverity.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  include/hw/elf_ops.h |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
> index 16a627b..bd71968 100644
> --- a/include/hw/elf_ops.h
> +++ b/include/hw/elf_ops.h
> @@ -315,7 +315,9 @@ static int glue(load_elf, SZ)(const char *name, int fd,
>      glue(load_symbols, SZ)(&ehdr, fd, must_swab, clear_lsb);
> 
>      size = ehdr.e_phnum * sizeof(phdr[0]);
> -    lseek(fd, ehdr.e_phoff, SEEK_SET);
> +    if (lseek(fd, ehdr.e_phoff, SEEK_SET) != ehdr.e_phoff) {
> +        goto fail;
> +    }
>      phdr = g_malloc0(size);
>      if (!phdr)
>          goto fail;

Looks good.

Reviewed-by: Thomas Huth <thuth@linux.vnet.ibm.com>


