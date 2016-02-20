Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aWvVI-0007mi-GO
	for mharc-qemu-trivial@gnu.org; Fri, 19 Feb 2016 19:34:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aWvVF-0007jb-TV
	for qemu-trivial@nongnu.org; Fri, 19 Feb 2016 19:34:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aWvVA-0004Jc-Tx
	for qemu-trivial@nongnu.org; Fri, 19 Feb 2016 19:34:29 -0500
Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a]:36448)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>)
	id 1aWvVA-0004J6-JZ; Fri, 19 Feb 2016 19:34:24 -0500
Received: by mail-pa0-x22a.google.com with SMTP id yy13so58462638pab.3;
	Fri, 19 Feb 2016 16:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zsifSrQ5GduqUdIf7fxKJMnKRKchlg6FGcpgfDDBA1M=;
	b=mBhBeq9ilMrrOWab4YEpyoC8FidpT6P2iwrD0X2DxcxByK+fpMJeuUenpN6uFnOSeU
	WeCXDGJ5YDaloKr+pz3zsaq4RSVqBGqdNl7vo3HbNlvej0wdbpDZiL/3+U2alsjAig/e
	/r+vhHaYhZNzRzwCjbqn0pE4LusJB50zvrRD03PW2KYpVbk3klNofvu2+9McBpNrd5pM
	gE126eDre1PUql71pZKDihj5E2Gxqux0yn5HXiqQG7gbZlnyDOkbX6W8zvCzG1t0ruyO
	QazkxjbC1BIcTqgzqRmRIkUVi3KkPvNG12F1COYuhsxJ72rCFemdSMcrDBE9czeomkfy
	MYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=zsifSrQ5GduqUdIf7fxKJMnKRKchlg6FGcpgfDDBA1M=;
	b=CeP9BhgmVmKgwurJOJK1oB8wDbCEUzigwv0Ep2+Nga5fp4CYitZIFG5HdKl6gnKIid
	e0p/RuRGjNNHLXLx6ujoEpRwvEDBd/xV3xJsrtEQyJoWRSOBBd4g7FBplC7NO4PolMxW
	U0lLI7aF51cicj6nNAZmP5qfmpeH5AgV3opNaVSN+eu1P7HJAYHr/IJFi3+46T4KwqPn
	M04gfBfjGMdbOgaVgWbEi3BTw9oHtzXIBiK7ZvYbwP3hZVL/wJfslCXVJpoV4rrxzE3c
	Z/4T0GzhpA6fkEfPHrI0q/wKzU3jCf7uOEk6oW8McZS+p5p8aL7Ls6XNutqQ5M3ZQGMa
	9tag==
X-Gm-Message-State: AG10YOT562pOZPZu2fkotZwGwocMDSoI/IXkzRvqK4URCsdyN0Xil3xGLSmnytxSdZ4k/w==
X-Received: by 10.66.250.163 with SMTP id zd3mr21960723pac.119.1455928463618; 
	Fri, 19 Feb 2016 16:34:23 -0800 (PST)
Received: from localhost ([45.32.44.20]) by smtp.gmail.com with ESMTPSA id
	v29sm20294840pfa.31.2016.02.19.16.34.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Feb 2016 16:34:22 -0800 (PST)
Date: Sat, 20 Feb 2016 00:34:20 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Wei Yang <richard.weiyang@gmail.com>
Message-ID: <20160220003420.GA8484@vultr.guest>
References: <1454626230-16334-1-git-send-email-richard.weiyang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1454626230-16334-1-git-send-email-richard.weiyang@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::22a
Cc: amit.shah@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	quintela@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] migration: reorder code to make it
	symmetric
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
X-List-Received-Date: Sat, 20 Feb 2016 00:34:30 -0000

Hi, Amit

Do you like this one?

On Thu, Feb 04, 2016 at 10:50:30PM +0000, Wei Yang wrote:
>In qemu_savevm_state_complete_precopy(), it iterates on each device to add
>a json object and transfer related status to destination, while the order
>of the last two steps could be refined.
>
>Current order:
>
>    json_start_object()
>    	save_section_header()
>    	vmstate_save()
>    json_end_object()
>    	save_section_footer()
>
>After the change:
>
>    json_start_object()
>    	save_section_header()
>    	vmstate_save()
>    	save_section_footer()
>    json_end_object()
>
>This patch reorder the code to to make it symmetric. No functional change.
>
>Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>---
> migration/savevm.c |    5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>
>diff --git a/migration/savevm.c b/migration/savevm.c
>index b9caf59..42bfab4 100644
>--- a/migration/savevm.c
>+++ b/migration/savevm.c
>@@ -1088,12 +1088,11 @@ void qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only)
>         json_prop_int(vmdesc, "instance_id", se->instance_id);
> 
>         save_section_header(f, se, QEMU_VM_SECTION_FULL);
>-
>         vmstate_save(f, se, vmdesc);
>-
>-        json_end_object(vmdesc);
>         trace_savevm_section_end(se->idstr, se->section_id, 0);
>         save_section_footer(f, se);
>+
>+        json_end_object(vmdesc);
>     }
> 
>     if (!in_postcopy) {
>-- 
>1.7.9.5

-- 
Wei Yang
Help you, Help me

