Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aP9eJ-0004j5-He
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jan 2016 09:03:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aP9eD-0004b2-7X
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 09:03:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aP9e8-0004SN-4V
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 09:03:37 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:35676)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aP9e7-0004Rs-TC
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 09:03:32 -0500
Received: by mail-pf0-x244.google.com with SMTP id 66so3399324pfe.2
	for <qemu-trivial@nongnu.org>; Fri, 29 Jan 2016 06:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iNBIKRqjiHHaX0ipnlgbOLYXdCl9l1HBR7ampBLLQl8=;
	b=n9sYpyJ5s1YlyG1EUgVnRJIlTBOf8SgJN3w5tlpeN3Z8KqfOtc6LfdHUKAvOF3AoL2
	JJ1qJYlrVtfIESi9FAQ+cjD1D1scRP1j+q7jF4JEyaKWTOaN93muH/iRg18XgOteIfLB
	N24C/tSQ+Zz+M3YQ2Xvs1qrKX9BMnWaa/lSb2gzW+RcecOgRXrNhJhwPXKoUH2xWq8mj
	dcN1OSujHEdmftFN6YVfMlfaQZ72x0a0BW9eFj+2tv+307wb0nrqyOWcJHOtG4EQf21m
	tcYGSDyy/Bg5MbRfZFh1tqAbmUcVUKcc60hCSpGqsWuGx08tPGkMgWByRBZ+tSIbkoin
	5p/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=iNBIKRqjiHHaX0ipnlgbOLYXdCl9l1HBR7ampBLLQl8=;
	b=E7mlPpLjaXDWKwwBvu6rYSHjggP1aIQBsdHEIks9pvKujoShkBlDwSbsqcQK52etRA
	rJa+jMusvDJNxe/4rf2J2u7iiZpxwPef0xazTajfVdxs3RfgW76zgfhLbW+FJabdgBwd
	C63dcepkXeBhIOQLuf1KHOs7R16WZg2s8TFDl6X61IFUFKhaQc55pPigBkzt63upZH0L
	nydV2YFN8FmkvMzHLXL4uHeTqHb3WfMHDtUb/0nctMv+HoeXEm2jpTOKZoZRLGuyN4+9
	Q/ohzi6FsULiqrtJbjVK9bcpnWPqiiqOC1QmNlABod6UhiG7D8Vh9gVs6dZKjElragcC
	uXqA==
X-Gm-Message-State: AG10YOTThji67swKir/QLSzI7XXg+DaMFo3nfFh4roRNju4nWL0PJcTSDqab6ZIRAg2T9w==
X-Received: by 10.98.12.21 with SMTP id u21mr13436958pfi.36.1454076210445;
	Fri, 29 Jan 2016 06:03:30 -0800 (PST)
Received: from localhost ([45.32.44.20])
	by smtp.gmail.com with ESMTPSA id 3sm7920483pfp.96.2016.01.29.06.03.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jan 2016 06:03:29 -0800 (PST)
Date: Fri, 29 Jan 2016 14:03:26 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Wei Yang <richard.weiyang@gmail.com>
Message-ID: <20160129140326.GA4544@vultr.guest>
References: <1453644598-11250-1-git-send-email-richard.weiyang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1453644598-11250-1-git-send-email-richard.weiyang@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::244
Cc: qemu-trivial@nongnu.org, amit.shah@redhat.com, quintela@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 1/2] rdma: remove check on time_spent
	when calculating mbs
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: Wei Yang <richard.weiyang@gmail.com>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jan 2016 14:03:42 -0000

Someone like these two patches? :)

On Sun, Jan 24, 2016 at 02:09:57PM +0000, Wei Yang wrote:
>Within the if statement, time_spent is assured to be non-zero.
>
>This patch just removes the check on time_spent when calculating mbs.
>
>Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>---
> migration/migration.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/migration/migration.c b/migration/migration.c
>index c842499..40b87f2 100644
>--- a/migration/migration.c
>+++ b/migration/migration.c
>@@ -1677,8 +1677,8 @@ static void *migration_thread(void *opaque)
>             double bandwidth = (double)transferred_bytes / time_spent;
>             max_size = bandwidth * migrate_max_downtime() / 1000000;
> 
>-            s->mbps = time_spent ? (((double) transferred_bytes * 8.0) /
>-                    ((double) time_spent / 1000.0)) / 1000.0 / 1000.0 : -1;
>+            s->mbps = (((double) transferred_bytes * 8.0) /
>+                    ((double) time_spent / 1000.0)) / 1000.0 / 1000.0;
> 
>             trace_migrate_transferred(transferred_bytes, time_spent,
>                                       bandwidth, max_size);
>-- 
>2.5.0

-- 
Wei Yang
Help you, Help me

