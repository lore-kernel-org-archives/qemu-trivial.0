Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TfVj4-0008Uw-Ar
	for mharc-qemu-trivial@gnu.org; Mon, 03 Dec 2012 08:06:22 -0500
Received: from eggs.gnu.org ([208.118.235.92]:40906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TfViw-00085v-GR
	for qemu-trivial@nongnu.org; Mon, 03 Dec 2012 08:06:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TfVir-0003oF-Rx
	for qemu-trivial@nongnu.org; Mon, 03 Dec 2012 08:06:14 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:56839)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TfVig-0003m8-6N; Mon, 03 Dec 2012 08:05:58 -0500
Received: by mail-ee0-f45.google.com with SMTP id d49so1689222eek.4
	for <multiple recipients>; Mon, 03 Dec 2012 05:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZiLwyWHEGqXDElLPTOz479uKU6GHYctZDiCC69GLB8c=;
	b=uZ8kU1JLvzy3svLVy2SosUCOYcxzcyNJBkutLEblnKgOZqsFqTyN7VNmd7rZcN8gJF
	VxGRlK8hp/PupjZyX4epJYvK2ZRC9wXxhz3JM3gzFoy7tj2TRDGgalIqW2zWD64Xs/qG
	HO4oFVn7bLVuiJlzwFk4vVslfqEAkPYbMKzTlBtOfbJfnSjxQ9gvDYfCt6M/SNP3s9El
	WGH7Zndd6KKEg2hAMyPbUKWgaWIhgwlQJX9UPQZeWAlzai7ZO4hrsc15RBQSUsxjbtvB
	2wHAnCAnco29MsT+s1XRSPRlOjbpIuXNuatE8yXi2ufZwkjAPKMzSywHMOXjPvC6s29w
	u/dw==
Received: by 10.14.176.66 with SMTP id a42mr36118484eem.34.1354539956182;
	Mon, 03 Dec 2012 05:05:56 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id f49sm31159740eep.12.2012.12.03.05.05.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 05:05:55 -0800 (PST)
Date: Mon, 3 Dec 2012 14:05:53 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20121203130553.GG6048@stefanha-thinkpad.redhat.com>
References: <1353694338-13162-1-git-send-email-armbru@redhat.com>
	<1353694338-13162-2-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1353694338-13162-2-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, jordan.l.justen@intel.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/2] pc_sysfw: Check for qemu_find_file()
 failure
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
X-List-Received-Date: Mon, 03 Dec 2012 13:06:21 -0000

On Fri, Nov 23, 2012 at 07:12:17PM +0100, Markus Armbruster wrote:
> diff --git a/hw/pc_sysfw.c b/hw/pc_sysfw.c
> index 9d7c5f4..066c4fe 100644
> --- a/hw/pc_sysfw.c
> +++ b/hw/pc_sysfw.c
> @@ -84,6 +84,11 @@ static void pc_fw_add_pflash_drv(void)
>          bios_name = BIOS_FILENAME;
>      }
>      filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
> +    if (!filename) {
> +        error_report("Can't open BIOS image %s: %s",
> +                     bios_name, strerror(errno));

qemu_find_file() does not document that errno is set when returning
NULL.  I can't find other callers to qemu_find_file() that use errno
either.

Please add a doc comment to qemu_find_file() that errno will be set on
NULL return, otherwise we can't rely on it in the caller.

Stefan

