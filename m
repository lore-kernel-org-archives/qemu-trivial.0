Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXTXh-0000BU-Q2
	for mharc-qemu-trivial@gnu.org; Mon, 16 Mar 2015 07:50:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YXTXd-00007X-7Y
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 07:50:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YXTXO-0004Q6-0W
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 07:50:41 -0400
Received: from e06smtp17.uk.ibm.com ([195.75.94.113]:38267)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YXTXN-0004Pn-Hi
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 07:50:25 -0400
Received: from /spool/local
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Mon, 16 Mar 2015 11:50:23 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp17.uk.ibm.com (192.168.101.147) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 16 Mar 2015 11:50:22 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9E34717D805A; 
	Mon, 16 Mar 2015 11:50:45 +0000 (GMT)
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com
	[9.149.37.248])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2GBoLdW8847724; Mon, 16 Mar 2015 11:50:21 GMT
Received: from d06av07.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t2GBoLjm025783; Mon, 16 Mar 2015 07:50:21 -0400
Received: from oc7435384737.ibm.com (dyn-9-152-224-100.boeblingen.de.ibm.com
	[9.152.224.100])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t2GBoLaO025771; Mon, 16 Mar 2015 07:50:21 -0400
Date: Mon, 16 Mar 2015 12:50:20 +0100
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20150316125020.5da0ce16@oc7435384737.ibm.com>
In-Reply-To: <1426322228-465-1-git-send-email-sw@weilnetz.de>
References: <1426322228-465-1-git-send-email-sw@weilnetz.de>
Organization: IBM
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.23; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031611-0029-0000-0000-000003CA071D
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.113
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] elf-loader: Fix truncation
 warning from coverity
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
X-List-Received-Date: Mon, 16 Mar 2015 11:50:44 -0000

On Sat, 14 Mar 2015 09:37:08 +0100
Stefan Weil <sw@weilnetz.de> wrote:

> Coverity reports a truncation due to cast operation on operand
> reltab->sh_size from 64 bits to 32 bits for calls of load_at.
> 
> Fix the types of the function arguments to match their use in
> function load_at: the offset is used for lseek which takes an
> off_t parameter, the size is used for g_malloc and read.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/core/loader.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 76d8aca..d4c441f 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -267,7 +267,7 @@ int load_aout(const char *filename, hwaddr addr, int max_sz,
> 
>  /* ELF loader */
> 
> -static void *load_at(int fd, int offset, int size)
> +static void *load_at(int fd, off_t offset, size_t size)
>  {
>      void *ptr;
>      if (lseek(fd, offset, SEEK_SET) < 0)

Sounds reasonable.

Reviewed-by: Thomas Huth <thuth@linux.vnet.ibm.com>


