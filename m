Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QpNXS-000516-3t
	for mharc-qemu-trivial@gnu.org; Fri, 05 Aug 2011 12:46:22 -0400
Received: from eggs.gnu.org ([140.186.70.92]:41159)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1QpNXN-0004p4-S2
	for qemu-trivial@nongnu.org; Fri, 05 Aug 2011 12:46:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1QpNXM-0000Bb-Uk
	for qemu-trivial@nongnu.org; Fri, 05 Aug 2011 12:46:17 -0400
Received: from mail-pz0-f42.google.com ([209.85.210.42]:33938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1QpNXJ-0000AK-Q2; Fri, 05 Aug 2011 12:46:13 -0400
Received: by pzk37 with SMTP id 37so4920688pzk.29
	for <multiple recipients>; Fri, 05 Aug 2011 09:46:12 -0700 (PDT)
Received: by 10.142.231.20 with SMTP id d20mr2138057wfh.315.1312562771995;
	Fri, 05 Aug 2011 09:46:11 -0700 (PDT)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com
	[70.123.132.139])
	by mx.google.com with ESMTPS id u6sm3356655pbh.0.2011.08.05.09.46.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Aug 2011 09:46:11 -0700 (PDT)
Message-ID: <4E3C1E51.3040003@codemonkey.ws>
Date: Fri, 05 Aug 2011 11:46:09 -0500
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: David Gibson <david@gibson.dropbear.id.au>
References: <1312181399-29841-1-git-send-email-david@gibson.dropbear.id.au>
In-Reply-To: <1312181399-29841-1-git-send-email-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.42
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Check fread() results to
	avoid gcc 4.6 warnings
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
X-List-Received-Date: Fri, 05 Aug 2011 16:46:20 -0000

On 08/01/2011 01:49 AM, David Gibson wrote:
> When compiling with gcc 4.6, some code in fw_cfg.c complains that fop_ret
> is assigned but not used (which is true).  However, it looks like the
> meaningless assignments to fop_ret were done to suppress other gcc warnings
> due to the fact that fread() is labelled as warn_unused_result in glibc.
>
> This patch avoids both errors, by actually checking the fread() result code
> and dropping out with an error message if it fails.
>
> Signed-off-by: David Gibson<david@gibson.dropbear.id.au>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
>   hw/fw_cfg.c |   13 +++++++++++++
>   1 files changed, 13 insertions(+), 0 deletions(-)
>
> diff --git a/hw/fw_cfg.c b/hw/fw_cfg.c
> index a29db90..e4847b7 100644
> --- a/hw/fw_cfg.c
> +++ b/hw/fw_cfg.c
> @@ -87,6 +87,13 @@ static FILE *probe_splashfile(char *filename, int *file_sizep, int *file_typep)
>       /* check magic ID */
>       fseek(fp, 0L, SEEK_SET);
>       fop_ret = fread(buf, 1, 2, fp);
> +    if (fop_ret != 2) {
> +        error_report("Could not read header from '%s': %s",
> +                     filename, strerror(errno));
> +        fclose(fp);
> +        fp = NULL;
> +        return fp;
> +    }
>       filehead_value = (buf[0] + (buf[1]<<  8))&  0xffff;
>       if (filehead_value == 0xd8ff) {
>           file_type = JPG_FILE;
> @@ -181,6 +188,12 @@ static void fw_cfg_bootsplash(FWCfgState *s)
>           boot_splash_filedata_size = file_size;
>           fseek(fp, 0L, SEEK_SET);
>           fop_ret = fread(boot_splash_filedata, 1, file_size, fp);
> +        if (fop_ret != file_size) {
> +            error_report("failed to read data from '%s'.",
> +                         boot_splash_filename);
> +            fclose(fp);
> +            return;
> +        }
>           fclose(fp);
>           /* insert data */
>           if (file_type == JPG_FILE) {


