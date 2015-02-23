Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YPyxf-0002rF-04
	for mharc-qemu-trivial@gnu.org; Mon, 23 Feb 2015 14:46:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1YPyxX-0002is-Sd
	for qemu-trivial@nongnu.org; Mon, 23 Feb 2015 14:46:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1YPyxV-0000t9-6g
	for qemu-trivial@nongnu.org; Mon, 23 Feb 2015 14:46:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40941)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1YPyxU-0000s0-Vh; Mon, 23 Feb 2015 14:46:25 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1NJkHCd007675
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 23 Feb 2015 14:46:18 -0500
Received: from work-vm (ovpn-116-85.ams2.redhat.com [10.36.116.85])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1NJkDdD014634
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Mon, 23 Feb 2015 14:46:16 -0500
Date: Mon, 23 Feb 2015 19:46:13 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Message-ID: <20150223194612.GA14376@work-vm>
References: <1424701054-26192-1-git-send-email-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1424701054-26192-1-git-send-email-stefanb@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, joel.schopp@amd.com, qemu-devel@nongnu.org,
	ehabkost@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add copyright and author
	after file split
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
X-List-Received-Date: Mon, 23 Feb 2015 19:46:32 -0000

* Stefan Berger (stefanb@linux.vnet.ibm.com) wrote:
> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>

Reviewed-by:  Dr. David Alan Gilbert <dgilbert@redhat.com>

This corresponds to the discussion we had:
http://lists.gnu.org/archive/html/qemu-devel/2014-12/msg02819.html

Dave

> 
> ---
>  migration/qemu-file-buf.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/migration/qemu-file-buf.c b/migration/qemu-file-buf.c
> index e97e0bd..e56a8ad 100644
> --- a/migration/qemu-file-buf.c
> +++ b/migration/qemu-file-buf.c
> @@ -2,6 +2,10 @@
>   * QEMU System Emulator
>   *
>   * Copyright (c) 2003-2008 Fabrice Bellard
> + * Copyright (c) 2014 IBM Corp.
> + *
> + * Authors:
> + *  Stefan Berger <stefanb@linux.vnet.ibm.com>
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining a copy
>   * of this software and associated documentation files (the "Software"), to deal
> -- 
> 1.9.3
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

